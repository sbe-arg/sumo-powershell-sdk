<#
.SYNOPSIS
    Source
.DESCRIPTION
    Remove sources.
.EXAMPLE
    Remove-Source
#>

function Remove-Source {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
    param(
    $Session = $Script:sumoSession,
    [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
    [long]$CollectorId,
    [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
    [alias("id")]
    [long]$SourcId,
    [switch]$Force
    )
    process {
        $SourcId | ForEach-Object {
            if ($Force -or $pscmdlet.ShouldProcess("Collector[$CollectorId] Source[$_]")) {
                invokeSumoRestMethod -session $Session -method Delete -function "collectors/$CollectorId/sources/$_"
            }
        }
    }
}
