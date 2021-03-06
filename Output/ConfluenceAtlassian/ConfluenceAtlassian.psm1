function Get-CAContext {
    [CmdletBinding(HelpUri = 'https://github.com/itfranck/ConfluenceAtlassian/blob/main/Help/Get-CAContext.md')]
    param ()
    return $Script:CAContext 
}
function Get-CADocument {
    [CmdletBinding(HelpUri = 'https://github.com/itfranck/ConfluenceAtlassian/blob/main/Help/Get-CADocument.md')]
    param (
        [Int]$Id,
        [Switch]$ContextOnly
    )

    $Body = @{}
    if (!$ContextOnly) {
        $Body = @{Body = (@{'expand' = @('body.storage', 'version', 'space') -join ',' }  )}
    }


    $Document = Invoke-CAApi -Path "/content/$Id" @Body
    $Output = [CADocument]::New()
    $Output.Id = $Document.Id
    $Output.Body = $Document.Body.Storage.Value 
    $Output.Title = $Document.Title 
    $Output.Version = $Document.Version.Number
    $Output.Url = "$($Document._links.base)$($Document._links.webui)"
    $Output.Space = $Document.space.name
    $Output.Object = $Document

    
    # Default display set
    $defaultDisplaySet = 'Title', 'Space','Version','Url'
    $defaultDisplayPropertySet = New-Object System.Management.Automation.PSPropertySet('DefaultDisplayPropertySet', [string[]]$defaultDisplaySet)
    $Output | Add-Member MemberSet PSStandardMembers ([System.Management.Automation.PSMemberInfo[]]@($defaultDisplayPropertySet))
    return $Output
    
    return $Output
    
    

    
}
function Get-CATable {
    [CmdletBinding(HelpUri = 'https://github.com/itfranck/ConfluenceAtlassian/blob/main/Help/Get-CATable.md')]
    param (
        [CADocument]$Document, [String]$Title,
        [String]$TitleTag = 'h2'
    )
    
    $TablePattern = "<$TitleTag>$Title</$TitleTag>\s(?:<ac:.*?</ac:structured-macro>)?.*?<table>.*?</table>"
    [regex]::Matches($Document.body, $TablePattern , [System.Text.RegularExpressions.RegexOptions]::Singleline)
}
function Invoke-CAApi {
    [CmdletBinding(HelpUri = 'https://github.com/itfranck/ConfluenceAtlassian/blob/main/Help/Invoke-CAApi.md')]
    param (
        [Microsoft.PowerShell.Commands.WebRequestMethod]$Method = [Microsoft.PowerShell.Commands.WebRequestMethod]::Get,
        [String]$Path,
        [Parameter()]
        [ValidateSet('application/x-www-form-urlencoded','application/json')]
        [String]$ContentType = 'application/json',
        [System.Collections.IDictionary]$Headers,
        $Body
    )
    if (!$Path.StartsWith('/')) {$Path = "/$Path"}
    
    if ($null -ne $Headers) {
        $Headers.Authorization =  $Script:CAContext.Headers.Authorization
    } else {
        $Headers = @{Authorization = $Script:CAContext.Headers.Authorization }
    }

    $Params = @{
        Method = $Method
        Uri =  "$($Script:CAContext.ApiUrl)$Path"
        Headers = $Headers
        Body = $Body 
        ContentType = $ContentType
    }

    
    Invoke-RestMethod @Params
 
}

function New-CAInfoPanel {
    [CmdletBinding(HelpUri = 'https://github.com/itfranck/ConfluenceAtlassian/blob/main/Help/New-CAInfoPanel.md')]
    param (
        $Message
    )
    
    return @'
<ac:structured-macro ac:name="info" ac:schema-version="1">
    <ac:rich-text-body>
       <p>{0}</p>
    </ac:rich-text-body>
</ac:structured-macro>
'@ -f [System.Web.HttpUtility]::HtmlEncode($Message)
}
function New-CATable {
    [CmdletBinding(HelpUri = 'https://github.com/itfranck/ConfluenceAtlassian/blob/main/Help/New-CATable.md')]
    param (
        [String]$Title,
        [String]$TitleTag = 'h2',
        [String]$InfoMessage,
        [Object[]]$Columns,
        [Object[]]$Rows,
        [Switch]$Numbered,
        [Parameter()]
        [ValidateSet('Row', 'Column', 'RowColumn')]
        [String]$HeaderStyle = 'Column',
        [Parameter()]
        [ValidateSet('Default','Wrapped','Wide')]
        [String]$Style = 'Default'
    )
    
    $StyleString = ''
    if ($Style -ne 'Default' ) {$StyleString = " class=`"$($Style.ToLower())`""}

    
    if (![String]::IsNullOrWhiteSpace($Title)) { $Title = "<$TitleTag>$([System.Web.HttpUtility]::HtmlEncode($Title))</$TitleTag>`n" }
    if (![String]::IsNullOrWhiteSpace($Description)) { $Description = "<p>$([System.Web.HttpUtility]::HtmlEncode($Description))</p>`n" }
    if (![String]::IsNullOrWhiteSpace($InfoMessage)) {$InfoMessage = New-CAInfoPanel -Message $InfoMessage}
    $ColumnsString = [System.Text.StringBuilder]::new()

  

    foreach ($col in $Columns) {
        $colStyle = ''
        if ($Col.Width -gt 0) { $colStyle = " style=`"width: $($Col.Width).0px; `"" }
        $ColumnsString.AppendFormat("`n        <col{0}/>",$colStyle) | Out-Null
    }

    $RowsString = [System.Text.StringBuilder]::new()
    
    $RowsString.AppendFormat("`n        <tr>") | Out-Null
    foreach ($col in $Columns) {
        $ColObject = $col 
        if ($col -is [String]) {$ColObject = New-CATableColumn -Name $col -Text $col}

        $RowsString.Append("`n            <th>") | Out-Null
        $RowsString.AppendFormat("<p>{0}</p>", [System.Web.HttpUtility]::HtmlEncode($ColObject.Text)) | Out-Null
        $RowsString.Append("`n            </th>") | Out-Null
    }
    $RowsString.AppendFormat("`n        </tr>") | Out-Null
    
    foreach ($item in $Rows) {
        $RowsString.AppendFormat("`n        <tr>") | Out-Null
        foreach ($col in $Columns) {
            $ColObject = $col 
            if ($col -is [String]) { $ColObject = New-CATableColumn -Name $col -Text $col }
            $RowsString.Append("`n            <td>") | Out-Null
            $RowsString.AppendFormat("<p>{0}</p>", [System.Web.HttpUtility]::HtmlEncode($item."$($ColObject.Name)")) | Out-Null
            $RowsString.Append("`n            </td>") | Out-Null
        }
        $RowsString.AppendFormat("`n        </tr>") | Out-Null
    }



    #class="wrapped"
    $Template = @'
{0}{1}<table{2}>
    <colgroup>{3}
    </colgroup>
    <tbody>
        {4}
    </tbody>
</table>
'@ -f $Title, $InfoMessage, $StyleString, $ColumnsString.ToString(), $RowsString 


return $Template

}
function New-CATableColumn {
    [CmdletBinding(HelpUri = 'https://github.com/itfranck/ConfluenceAtlassian/blob/main/Help/New-CATableColumn.md')]
    param (
        [Parameter(Mandatory=$true)]
        [String]$Name,
        [String]$Text,
        [Int]$Width = 0
    )

    if ($null -eq $Text) {$Text = $Name}
    return [CATableColumn]::new($Name,$Text,$Width)

}
function Set-CAContext {
    [CmdletBinding(HelpUri = 'https://github.com/itfranck/ConfluenceAtlassian/blob/main/Help/Set-CAContext.md')]
    param (
        # Specifies the user account credentials to use when performing this task.
        [Parameter()]
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential = [System.Management.Automation.PSCredential]::Empty,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $InstanceName
    )
    

    $Script:CAContext = [CAContext]::New($InstanceName, $Credential)
    

    
}
function Set-CADocument {
    [CmdletBinding(HelpUri = 'https://github.com/itfranck/ConfluenceAtlassian/blob/main/Help/Set-CADocument.md')]
    param (
        [Parameter(ParameterSetName = 'Document',Mandatory=$true)]
        [ValidateNotNull()]
        [CADocument]$Document,
        [Parameter(ParameterSetName = 'DocumentId',Mandatory=$true)]
        [Int]$DocumentId,
        [String]$Title,
        [String]$Body
    )
   
    if ($PSCmdlet.ParameterSetName -eq 'DocumentId') {
        $Document = Get-CADocument -Id $DocumentId -ContextOnly
    }

       if ([String]::IsNullOrEmpty($Title)) { $Title = $Document.Title }
        if ($null -eq $Body) { $Body = $Document.Body }
    
    try {
        $Result = Invoke-CAApi -Method Put -Path "/content/$($Document.ID)" -ContentType application/json -Body (@{
                version = @{number = $Document.Version + 1 }
                title   = $title
                type    = 'page'
                body    = @{
                    storage = @{
                        value          = $Body
                        representation = 'storage'
                    }
                }
            } | ConvertTo-Json) 
            
            $Document.Version = $Result.Version.number
    }
    catch {
        Write-Error $_ 
    }


   
   
}


function Update-CATable {
    [CmdletBinding(HelpUri = 'https://github.com/itfranck/ConfluenceAtlassian/blob/main/Help/Update-CATable.md')]
    param (
        [CADocument]$Document, [String]$Title,
        [String]$TitleTag = 'h2',
        $NewContent
    )
    
    $TablePattern = "<$TitleTag>$Title</$TitleTag>\s(?:<ac:.*?</ac:structured-macro>)?.*?<table>.*?</table>"
    if ([regex]::Matches($Document.body, $TablePattern , [System.Text.RegularExpressions.RegexOptions]::Singleline).count -gt 0) {
        $Document.Body = [regex]::Replace($Document.body, $TablePattern, $NewContent, [System.Text.RegularExpressions.RegexOptions]::Singleline)
        return $true
    }
    return $False
    
}
class CAContext {
    [String]$InstanceName
    [String]$ApiUrl
    [PSCredential]$Credential
    [Hashtable]$Headers
    

    CAContext($InstanceName,$Credential){
        $this.ApiUrl = "https://$InstanceName.atlassian.net/wiki/rest/api"
        $this.InstanceName = $InstanceName
        $this.Credential = $Credential
        $this.Headers = @{Authorization = "Basic $([System.Convert]::ToBase64String([char[]]"$($Credential.UserName):$($Credential.GetNetworkCredential().password)"))" } 
    }
}

class CADocument {
    [Int]$Id
    [String]$Title
    [Int]$Version
    [String]$Body
   [Object]$Object
   [String]$Url
   [String]$Space
}

class CATableColumn {
    [String]$Name
    [String]$Text
    [Int]$Width

    CATableColumn([String]$Name) {
        $this.Name = $Name
        $this.Text = $Name
    }

    CATableColumn($Name, $Text) {
        $this.Name = $Name
        if ([String]::IsNullOrEmpty($Text)) {
            $this.Text = $Name
        } else {
            $this.Text = $Text
        }
    }

    CATableColumn($Name, $Text,$Width = 0) {
        $this.Name = $Name
        if ([String]::IsNullOrEmpty($Text)) {
            $this.Text = $Name
        }
        else {
            $this.Text = $Text
        }
        $this.Width = $Width
    }
}

