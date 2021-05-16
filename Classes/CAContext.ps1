class CAContext {
    [String]$InstanceName
    [String]$ApiUrl
    [PSCredential]$Credential
    [Hashtable]$Headers
    

    CAContext($InstanceName,$Credential){
        $this.ApiUrl = "https://$InstanceName.atlassian.net/wiki/rest/api"
        $this.InstanceName = $InstanceName
        $this.Credential = $Credential
        $this.Headers = @{Authorization = "Basic $([System.Convert]::ToBase64String([char[]]"$($Credential.UserName):$($Credential.GetNetworkCredential().password)"))" } 
    }
}

