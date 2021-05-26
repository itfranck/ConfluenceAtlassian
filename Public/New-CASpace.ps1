function New-CASpace {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({ $_.length -le 200})]
        [String]$Name, 
        [Parameter(Mandatory = $true)]
        [ValidateScript( { $_ -match '^\w{1,255}$' })]
        [String]$Key, 
        [String]$Description = '',
        [Switch]$Private
    )

    $PrivateSuffix = ''
    if ($Private) { $PrivateSuffix = '/_private' }

    $Body = @{
        key         = $Key
        name        = $Name
        description = @{'plain' = $Description }
    } | ConvertTo-Json

    try {
        $Result = Invoke-CAApi -Method Post -Path "/space$PrivateSuffix" -Body $Body -ContentType application/json  -ErrorAction Stop
        return New-Object -TypeName CASpace -Property @{
            Id          = $Result.id
            Key         = $Result.key
            Name        = $Result.name
            Type        = $Result.type
            Status      = $Result.status
            BaseObject  = $Result
            Description = $Result.description.plain.value
            Url         = "$($Script:CAContext.BaseUrl)$($Result._links.webui)"
        }
    }
    catch {
        Write-Error $_
    }

}