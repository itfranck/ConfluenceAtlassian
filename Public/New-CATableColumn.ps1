function New-CATableColumn {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [String]$Name,
        [String]$Text,
        [Int]$Width = 0
    )

    if ($null -eq $Text) {$Text = $Name}
    return [CATableColumn]::new($Name,$Text,$Width)

}