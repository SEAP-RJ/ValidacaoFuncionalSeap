<p align="center">
  <img src="docs/logo.png" alt="Polícia Penal RJ" width="200">
</p>

# Sistema de Validação Funcional SEAP

Este `Dockerfile` é utilizado para criar uma imagem Docker para a aplicação de validação funcional do **SEAP** (Secretaria de Estado de Administração Penitenciária do Rio de Janeiro). 

A aplicação foi desenvolvida pela **Equipe Montreal/Detran** com **.NET 8.0** e expõe uma API que pode ser acessada via HTTP. Essa API acessa o webservice **SIPEN-Servidor** para validar o **QRCODE** impresso na carteira funcional.

---

## Exemplo de Dockerfile

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

---

## 🚀 Passos para construir e executar o contêiner

### 1️⃣ Preparar os binários da aplicação
- Certifique-se de que os binários da aplicação estão disponíveis no diretório `src/`. 
- Este diretório deve conter:
  - O arquivo `ValidacaoFuncionalSeap.dll`.
  - Todas as dependências necessárias.

### 2️⃣ Construir a imagem Docker
- Navegue até o diretório onde está o seu `Dockerfile` e execute o seguinte comando:

   ```bash
   docker build -t validacao-funcional .
   ```

### 3️⃣ Executar o contêiner
- Após a imagem ser construída, execute o contêiner e mapeie a porta 5000 do contêiner para a porta 5000 da sua máquina local:

   ```bash
   docker run -d -p 5000:5000 --name validacao-funcional --restart always validacao-funcional
   ```

---

## 🌐 Acessar a aplicação

Agora, você pode acessar sua aplicação .NET no navegador ou em uma ferramenta de API, usando o seguinte endereço:

```
http://sti.seap.rj.gov.br:5000/IUValidacaoFuncional?SRG=xxxyyyzzz
```

- Substitua `xxxyyyzzz` pelo **RG** a ser verificado (ignorar pontos e traços).

---

## ⚠️ Observações

- Certifique-se de que o nome do arquivo DLL (`ValidacaoFuncionalSeap.dll`) no `ENTRYPOINT` corresponde ao nome do seu arquivo DLL gerado.
- Se precisar expor outra porta ou ajustar configurações, atualize o `Dockerfile` e os comandos de execução conforme necessário.
- Caso esteja utilizando o **Azure** ou outro serviço de nuvem, ajuste as configurações de rede e portas para atender às necessidades do ambiente.

---

## 🔧 Comandos úteis

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

---

## 📚 Referências

- [Documentação oficial do Docker](https://docs.docker.com/)
- [Documentação do .NET](https://learn.microsoft.com/pt-br/dotnet/)
