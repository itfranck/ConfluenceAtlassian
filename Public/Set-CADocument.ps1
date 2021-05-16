function Set-CADocument {
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateNotNull()]
        [CADocument]$Document,
        [String]$Title,
        [String]$Body
    )
   
    
    try {
        $Result = Invoke-CAApi -Method Put -Path "/content/$($Document.ID)" -ContentType application/json -Body (@{
                version = @{number = $Document.Version + 1 }
                title   = $title
                type    = 'page'
                body    = @{
                    storage = @{
                        value          = $Body
                        representation = 'storage'
                    }
                }
            } | ConvertTo-Json) 
            
            $Document.Version = $Result.Version.number
    }
    catch {
        Write-Error $_ 
    }


   
   
}


