FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 433

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY /src .
RUN dotnet restore BaGet --source https://api.nuget.org/v3/index.json
RUN dotnet build BaGet -c Release -o /app

FROM build AS publish
RUN dotnet publish BaGet -c Release -o /app

FROM base AS final
LABEL org.opencontainers.image.source="https://github.com/loic-sharma/BaGet"
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "BaGet.dll"]
