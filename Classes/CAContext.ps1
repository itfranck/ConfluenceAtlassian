class CAContext {
    [String]$InstanceName
    [String]$ApiUrl
    [String]$BaseUrl
    [PSCredential]$Credential
    [Hashtable]$Headers
    

    CAContext($InstanceName,$Credential){
        $this.ApiUrl = "https://$InstanceName.atlassian.net/wiki/rest/api"
        $this.BaseUrl = "https://$InstanceName.atlassian.net/wiki"
        $this.InstanceName = $InstanceName
        $this.Credential = $Credential
        $this.Headers = @{Authorization = "Basic $([System.Convert]::ToBase64String([char[]]"$($Credential.UserName):$($Credential.GetNetworkCredential().password)"))" } 
    }
}

