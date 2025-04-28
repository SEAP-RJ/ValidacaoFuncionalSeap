# Usar a imagem base do ASP.NET
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base

# Definir o diretório de trabalho
WORKDIR /app

# Copiar os binários da aplicação para o contêiner
COPY ./src/ .

# Expor a porta 3333
EXPOSE 5000

# Definir o ponto de entrada para a aplicação
ENTRYPOINT ["dotnet", "ValidacaoFuncionalSeap.dll", "--urls=http://0.0.0.0:5000"]