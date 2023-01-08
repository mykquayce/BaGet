docker pull mcr.microsoft.com/dotnet/aspnet:7.0
docker pull mcr.microsoft.com/dotnet/sdk:7.0
docker pull eassbhhtgu/baget:latest

$base1 = docker image inspect --format '{{.Created}}' mcr.microsoft.com/dotnet/aspnet:7.0
$base2 = docker image inspect --format '{{.Created}}' mcr.microsoft.com/dotnet/sdk:7.0
$target = docker image inspect --format '{{.Created}}' eassbhhtgu/baget:latest

if ($base1 -gt $target -or $base2 -gt $target) {

	docker build --tag eassbhhtgu/baget:latest .
	if (!$?) { exit 1; }

	docker push eassbhhtgu/baget:latest
	if (!$?) { exit 1; }
}
