param(
    [string]$websitename="TestSite"
)
New-Item -ItemType directory "D:\$websitename" -force
New-WebAppPool -Name $websitename -force
New-WebSite -Name TestSite -Port 82 -HostHeader * -PhysicalPath "D:\$websitename" -ApplicationPool $websitename -force
Copy-Item -Path "\\localhost\c$\Users\ninad.pantane\Azure DevOps\Agent\vsts-agent-win-x64-2.153.1\_work\1\s\SampleApp\obj\Release\netcoreapp3.1\PubTmp\Out\" -Destination "\\localhost\d$\$websitename" -Recurse