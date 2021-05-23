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