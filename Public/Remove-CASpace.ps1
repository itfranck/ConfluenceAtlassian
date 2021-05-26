function Remove-CASpace {
    [CmdletBinding()]
    param (
        [ValidateNotNull()]
        [ValidateScript( { ![String]::IsNullOrWhiteSpace($_.Key) })]
        [Parameter(ParameterSetName = 'BySpace', Mandatory = $true)]
        [CASpace]$Space,
        [Parameter(ParameterSetName = 'ByKey', Mandatory = $true)]
        [String]$Key

    )

    
    if ($PSCmdlet.ParameterSetName -eq 'BySpace') {$Key = $Space.Key}
      Invoke-CAApi -Method Delete -Path "/space/$Key" -Body $Body -ContentType application/json 

}