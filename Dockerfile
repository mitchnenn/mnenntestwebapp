FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Debug -o out

# Build runtime image
FROM mnennillumina/dotnet-debug-container:1.0
WORKDIR /app

COPY --from=build-env /app/out .

COPY ./StartSSHAndApp.sh .
RUN chmod +x StartSSHAndApp.sh

ENTRYPOINT ["/app/StartSSHAndApp.sh"]
