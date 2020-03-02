param(
    [string]$websitename="TestSite"
)
New-Item -ItemType directory "D:\AzureDevOpsPOC\$websitename" -force

try{
	$test=Get-WebAppPoolState $websitename
}
catch {
	write-host "doesn't exist"
}

if($test.value -ne "Started"){
	New-WebAppPool -Name $websitename -force
}
New-WebSite -Name TestSite -Port 82 -HostHeader * -PhysicalPath "D:\AzureDevOpsPOC\$websitename" -ApplicationPool $websitename -force
Copy-Item -Path "\\localhost\c$\Users\lokesh.yadav\Desktop\Agent\_work\2\s\testwebapp\obj\Release\Package\PackageTmp" -Destination "\\localhost\d$\AzureDevOpsPOC\$websitename" -Recurse