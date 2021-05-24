function Invoke-CAApi {
    [CmdletBinding(HelpUri = 'https://github.com/itfranck/ConfluenceAtlassian/blob/main/Help/Invoke-CAApi.md')]
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

    # Trim rest/api from the path if present since already in the api url
    # Some confluence links (eg: Next) will contains the /rest/api bit.
    # Removing it allow to use the "Next" type of links directly in Invoke-CAApi
    $path = $Path -replace '^/rest/api', ''

    $Params = @{
        Method = $Method
        Uri =  "$($Script:CAContext.ApiUrl)$Path"
        Headers = $Headers
        Body = $Body 
        ContentType = $ContentType
    }

    
    Invoke-RestMethod @Params
 
}

