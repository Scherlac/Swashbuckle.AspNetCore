#!/bin/bash

docker run -i --rm -u "$(id -u):$(id -g)" -e "HOME=/tmp" -v "$(pwd):/src" mcr.microsoft.com/dotnet/sdk:8.0-jammy /bin/bash <<EOF
cd /src
rm -Rf /src/publish
cd /src/src/Swashbuckle.AspNetCore
dotnet build -c Release -f net8.0
dotnet publish -c Release -f net8.0 -o /src/publish
cd /src/src/Swashbuckle.AspNetCore.Newtonsoft
dotnet build -c Release -f net8.0
dotnet publish -c Release -f net8.0 -o /src/publish

EOF

