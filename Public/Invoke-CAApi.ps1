function Invoke-CAApi {
    [CmdletBinding()]
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

