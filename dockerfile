# Use the official .NET 7 SDK image as the base image
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env

# Set the working directory to /app
WORKDIR /app

# Copy the project file and restore dependencies
COPY ["BlazorApp.sln", "BlazorApp.sln"]
COPY ["BlazorApp/Client/BlazorApp.Client.csproj", "BlazorApp/Client/"]
COPY ["BlazorApp/Server/BlazorApp.Server.csproj", "BlazorApp/Server/"]
COPY ["BlazorApp/Shared/BlazorApp.Shared.csproj", "BlazorApp/Shared/"]
RUN dotnet restore

# Copy the rest of the application code
COPY . ./

# Publish the application to a self-contained executable
RUN dotnet publish -c Release -o out

# Use a lightweight runtime image as the base image
FROM mcr.microsoft.com/dotnet/aspnet:7.0-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the published application from the build environment
COPY --from=build-env /app/out .

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start the application
ENTRYPOINT ["dotnet", "BlazorApp.Server.dll"]