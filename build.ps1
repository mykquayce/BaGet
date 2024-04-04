docker pull mcr.microsoft.com/dotnet/aspnet:8.0
if (!$?) { exit 1; }

docker pull mcr.microsoft.com/dotnet/sdk:8.0
if (!$?) { exit 1; }

docker build --tag eassbhhtgu/baget:latest .
if (!$?) { exit 1; }

docker push eassbhhtgu/baget:latest
if (!$?) { exit 1; }
