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