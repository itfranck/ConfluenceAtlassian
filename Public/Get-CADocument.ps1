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
