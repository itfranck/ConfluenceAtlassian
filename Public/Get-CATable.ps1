function Get-CATable {
    [CmdletBinding()]
    param (
        [CADocument]$Document, [String]$Title,
        [String]$TitleTag = 'h2'
    )
    
    $TablePattern = "<$TitleTag>$Title</$TitleTag>\s(?:<ac:.*?</ac:structured-macro>)?.*?<table>.*?</table>"
    [regex]::Matches($Document.body, $TablePattern , [System.Text.RegularExpressions.RegexOptions]::Singleline)
}