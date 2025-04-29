### Exemplo de Dockerfile

```dockerfile
# Usar a imagem base do ASP.NET
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base

# Definir o diretório de trabalho
WORKDIR /app

# Copiar os binários da aplicação para o contêiner
COPY ./src/ .

# Expor a porta 5000
EXPOSE 5000

# Definir o ponto de entrada para a aplicação
ENTRYPOINT ["dotnet", "ValidacaoFuncionalSeap.dll", "--urls=http://0.0.0.0:5000"]
```

### Passos para construir e executar o contêiner

1. **Preparar os binários da aplicação**: Certifique-se de que os binários da aplicação estão disponíveis no diretório `src/`. Este diretório deve conter o arquivo `ValidacaoFuncionalSeap.dll` e todas as dependências necessárias.

2. **Construir a imagem Docker**: Navegue até o diretório onde está o seu `Dockerfile` e execute o seguinte comando para construir a imagem Docker:

   ```bash
   docker build -t validacao-funcional .
   ```

3. **Executar o contêiner**: Após a imagem ser construída, você pode executar o contêiner e mapear a porta 5000 do contêiner para a porta 5000 da sua máquina local:

   ```bash
   docker run -d -p 5000:5000 --name validacao-funcional validacao-funcional
   ```

### Acessar a aplicação

Agora, você pode acessar sua aplicação .NET no navegador ou em uma ferramenta de API, usando o endereço `http://sti.seap.rj.gov.br:5000/IUValidacaoFuncional?SRG=xxxyyyzzz`.  Substitua `xxxyyyzzz` pelo RG a ser verificado, ignorar os pontos e traços.

### Observações

- Certifique-se de que o nome do arquivo DLL (`ValidacaoFuncionalSeap.dll`) no `ENTRYPOINT` corresponde ao nome do seu arquivo DLL gerado.
- Se você precisar expor outra porta ou ajustar configurações, atualize o `Dockerfile` e os comandos de execução conforme necessário.
- Caso esteja utilizando o Azure ou outro serviço de nuvem, ajuste as configurações de rede e portas para atender às necessidades do ambiente.

### Comandos úteis

- **Parar o contêiner**:
  ```bash
  docker stop validacao-funcional
  ```

- **Remover o contêiner**:
  ```bash
  docker rm validacao-funcional
  ```

- **Verificar logs do contêiner**:
  ```bash
  docker logs validacao-funcional
  ```
