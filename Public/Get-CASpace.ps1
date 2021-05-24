function Get-CASpace {
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateSet('Global', 'Personal')]
        [String]$Type,
        [Parameter()]
        [ValidateSet('Current', 'Archived')]
        [String]$Status,
        [parameter(ParameterSetName='ByKey')]
        [String[]]$Key,
        [parameter(ParameterSetName = 'ById')]
        [Int[]]$Id,
        [parameter(ParameterSetName = 'All')]
        [Switch]$All,
        [String[]]
        $Expand
    )

    $Body = @{'expand' = 'description.plain' }
    $AdditionalQueryParameters = [System.Text.StringBuilder]::new()
        
    if ('' -ne $Type) { $Body.type = $Type.ToLower() }
    if ('' -ne $Status) { $Body.status = $Status.ToLower() }
    if ($null -ne $Key) { $Key | % { [Void]$AdditionalQueryParameters.Append("&spaceKey=$_") } }
    if ($null -ne $Id) { $Id | % { [Void]$AdditionalQueryParameters.Append("&spaceId=$_") } }
    if ($null -ne $Expand) {
        # Include plain description automatically 
        if (!$Expand.Contains('description.plain')) { $Expand += 'description.plain' }
        $Body.expand = $Expand -join ','
    }
        
    $Limitstr = '?limit=25'
    if ($All.IsPresent -and $All -eq $true) { $Limitstr = '?limit=1000' }
 
        $Link = "space$Limitstr$($AdditionalQueryParameters.ToString())"
        
do {
        $Query = Invoke-CAApi -Path $Link -body $Body
        $Link = $Query._links.Next
        foreach ($Space in $Query.results) {
            if ($null -ne $Expand) {
                $ExpandOutput = @{}
                foreach ($item in $Expand) {
                    if ($item -eq 'description.plain') {continue}
                    $ExpandOutput.$item = $Space.$item 
                }
            }
            New-Object -TypeName CASpace -Property @{
                Id          = $Space.id
                Description = $Space.description.plain.value
                Key         = $Space.key
                Name        = $Space.name
                Type        = $Space.type
                Status      = $Space.status
                BaseObject  = $Space
                Expand      = $ExpandOutput
            }
        }
    
} until ($Query.size -lt $Query.limit)
    
  
}


$CaSpaceExpandArgsCompleter = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    $Values = @{
        'settings'            = 'returns the settings for the space, similar to Get space settings.'
        'metadata.labels'   = 'returns the space labels, which are used to categorize the space.'
        'operations'        = 'returns the operations for a space, which are used when setting permissions.'
        'lookAndFeel'       = 'returns information about the look and feel of the space, including the color scheme.'
        'permissions'       = 'returns the permissions for the space. Note that this may return permissions for deleted groups, because deleting a group doesn''t remove associated space permissions.'
        'icon'              = 'returns information about space icon.'
        # Included by default
        #'description.plain' = 'returns the description of the space.' 
        'description.view'  = 'returns the description of the space.'
        'theme'             = 'returns information about the space theme.'
        'homepage'          = 'returns information about the space homepage.'
    }

    $pvalue = [System.Management.Automation.CompletionResultType]::ParameterValue
    $Values.Keys | % { [System.Management.Automation.CompletionResult]::new($_,$_,$pvalue,$Values[$_]) }
      
}

        Register-ArgumentCompleter -CommandName Get-CASpace -ParameterName Expand -ScriptBlock $CaSpaceExpandArgsCompleter

