docker pull eassbhhtgu/baget:latest
if (!$?) { exit 1; }

if ($env:NuGetServerApiKey -eq $null) {
	$env:NuGetServerApiKey = ( -join (((48..57) + (65..90) + (97..122)) * 10 | `
	Get-Random -Count 128 | `
	% {[char]$_}) )
}

docker stack deploy --compose-file .\docker-compose.yml baget
if (!$?) { exit 1; }
