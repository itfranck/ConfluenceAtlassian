function Set-CADocument {
    [CmdletBinding()]
    param (
        [Parameter(ParameterSetName = 'Document',Mandatory=$true)]
        [ValidateNotNull()]
        [CADocument]$Document,
        [Parameter(ParameterSetName = 'DocumentId',Mandatory=$true)]
        [Int]$DocumentId,
        [String]$Title,
        [String]$Body
    )
   
    if ($PSCmdlet.ParameterSetName -eq 'DocumentId') {
        $Document = Get-CADocument -Id $DocumentId -ContextOnly
    }

       if ([String]::IsNullOrEmpty($Title)) { $Title = $Document.Title }
        if ($null -eq $Body) { $Body = $Document.Body }
    
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


