function Get-CATable {
    [CmdletBinding(HelpUri = 'https://github.com/itfranck/ConfluenceAtlassian/blob/main/Help/Get-CATable.md')]
    param (
        [CADocument]$Document, [String]$Title,
        [String]$TitleTag = 'h2'
    )
    
    $TablePattern = "<$TitleTag>$Title</$TitleTag>\s(?:<ac:.*?</ac:structured-macro>)?.*?<table>.*?</table>"
    [regex]::Matches($Document.body, $TablePattern , [System.Text.RegularExpressions.RegexOptions]::Singleline)
}