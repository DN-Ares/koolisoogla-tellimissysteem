<#
  Loob GitHubi issue'd, sildid ja verstapostid failist backlog/backlog.csv.
  Eeldused: GitHub CLI (gh) on installitud ja sisse logitud (gh auth login),
  käivita repositooriumi juurkaustast: .\scripts\create-github-issues.ps1
#>
$ErrorActionPreference = 'Stop'
$items = Import-Csv -Path "$PSScriptRoot\..\backlog\backlog.csv" -Encoding UTF8

# Sildid
$labels = @{
  'must'   = 'b60205'; 'should' = 'd93f0b'; 'could' = 'fbca04'; 'wont' = 'cccccc'
  'story'  = '0e8a16'; 'tech'   = '1d76db'
}
foreach ($name in $labels.Keys) { gh label create $name --color $labels[$name] --force | Out-Null }

# Verstapostid (sprindid)
foreach ($m in ($items.sprint | Sort-Object -Unique)) {
  gh api repos/:owner/:repo/milestones -f title="$m" 2>$null | Out-Null
}

foreach ($i in $items) {
  $prio = ($i.priority -replace "'", '' -split ' ')[0].ToLower()
  $kind = if ($i.id -like 'T-*') { 'tech' } else { 'story' }
  $criteria = ($i.acceptance -split ' \| ' | ForEach-Object { "- [ ] $_" }) -join "`n"
  $body = "$($i.story)`n`n**Prioriteet:** $($i.priority)  `n**Hinnang:** $($i.points) punkti`n`n### Vastuvõtukriteeriumid`n$criteria"
  gh issue create --title "$($i.id): $($i.title)" --body $body `
     --label "$prio,$kind" --milestone "$($i.sprint)"
}
Write-Host "Valmis. Lisa issue'd GitHub Projects tahvlile."
