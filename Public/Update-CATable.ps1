function Update-CATable {
    [CmdletBinding()]
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