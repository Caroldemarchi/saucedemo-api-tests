# 🛒 SauceDemo — API Test Suite

> Suíte de testes de API para o SauceDemo, cobrindo fluxos de autenticação, usuários e produtos com **Postman + Newman** e integração contínua via **GitHub Actions**.

![CI Status](https://github.com/SEU_USUARIO/saucedemo-api-tests/actions/workflows/api-tests.yml/badge.svg)
![Testes](https://img.shields.io/badge/testes-18%20casos-brightgreen)
![Ferramenta](https://img.shields.io/badge/ferramenta-Postman%20%2B%20Newman-orange)
![Linguagem](https://img.shields.io/badge/linguagem-JavaScript-yellow)

---

## 📋 Sobre o Projeto

Este projeto simula uma suíte real de testes de API para um e-commerce (SauceDemo), utilizando a API pública do **ReqRes.in** como backend de referência. O objetivo é demonstrar boas práticas de QA, incluindo:

- Testes de **cenários positivos e negativos**
- **Validação de contratos** de API (estrutura JSON, tipos de dados)
- **Encadeamento de variáveis** entre requisições
- **Relatórios HTML** automatizados
- Pipeline de **CI/CD** com GitHub Actions

---

## 🗂️ Estrutura do Projeto

```
saucedemo-api-tests/
├── .github/
│   └── workflows/
│       └── api-tests.yml        # Pipeline CI/CD
├── collections/
│   └── saucedemo_collection.json  # Coleção Postman com todos os testes
├── environments/
│   └── saucedemo_env.json         # Variáveis de ambiente
├── reports/                       # Relatórios HTML gerados (gitignore)
├── scripts/
│   └── run-tests.sh               # Script para rodar localmente
└── README.md
```

---

## ✅ Casos de Teste Cobertos

### 🔐 Autenticação (3 casos)
| # | Cenário | Tipo | Esperado |
|---|---------|------|----------|
| 1 | Login com credenciais válidas | Positivo | 200 + token |
| 2 | Login com credenciais inválidas | Negativo | 400 + mensagem de erro |
| 3 | Login com campos vazios | Negativo | 400 + "Missing password" |

### 👤 Usuários (6 casos)
| # | Cenário | Tipo | Esperado |
|---|---------|------|----------|
| 4 | Listar usuários com paginação | Positivo | 200 + estrutura correta |
| 5 | Validar campos obrigatórios de cada usuário | Positivo | id, email, first_name, last_name, avatar |
| 6 | Validar formato de e-mail | Positivo | Regex de email válido |
| 7 | Buscar usuário por ID válido | Positivo | 200 + dados do usuário |
| 8 | Buscar usuário com ID inexistente | Negativo | 404 |
| 9 | Criar novo usuário | Positivo | 201 + id + createdAt |
| 10 | Atualizar usuário (PUT) | Positivo | 200 + updatedAt |
| 11 | Deletar usuário | Positivo | 204 + corpo vazio |

### 🛒 Produtos (4 casos)
| # | Cenário | Tipo | Esperado |
|---|---------|------|----------|
| 12 | Listar todos os produtos | Positivo | 200 + array não vazio |
| 13 | Validar tempo de resposta < 3000ms | Não-funcional | Performance ok |
| 14 | Buscar produto por ID | Positivo | 200 + campos obrigatórios |
| 15 | Validar formato hexadecimal da cor | Positivo | Regex #RRGGBB |

---

## 🚀 Como Executar

### Pré-requisitos
- [Node.js](https://nodejs.org/) 18+
- [Newman](https://github.com/postmanlabs/newman): `npm install -g newman newman-reporter-htmlextra`

### Opção 1 — Via script (recomendado)
```bash
# Clone o repositório
git clone https://github.com/SEU_USUARIO/saucedemo-api-tests.git
cd saucedemo-api-tests

# Dê permissão e execute
chmod +x scripts/run-tests.sh
./scripts/run-tests.sh
```

### Opção 2 — Newman direto
```bash
newman run collections/saucedemo_collection.json \
  --environment environments/saucedemo_env.json \
  --reporters cli,htmlextra \
  --reporter-htmlextra-export reports/report.html
```

### Opção 3 — Postman (interface gráfica)
1. Abra o Postman
2. **Import** → selecione `collections/saucedemo_collection.json`
3. **Import** → selecione `environments/saucedemo_env.json`
4. Ative o environment **SauceDemo - Environment**
5. Clique em **Run Collection**

---

## 📊 Exemplo de Relatório

Após a execução, o relatório HTML é gerado em `reports/report_YYYYMMDD_HHMMSS.html` com:

- ✅ Total de testes passados / falhos
- ⏱️ Tempo de resposta por requisição
- 📋 Detalhes de cada asserção
- 🌙 Tema escuro

---

## 🔄 CI/CD — GitHub Actions

A pipeline executa automaticamente:
- A cada **push** nas branches `main` e `develop`
- A cada **pull request** para `main`
- **Todo dia às 05h BRT** (scheduled)

O relatório HTML é salvo como artefato de cada execução e fica disponível por 30 dias.

---

## 🛠️ Tecnologias

| Ferramenta | Versão | Uso |
|-----------|--------|-----|
| Postman | Latest | Criação e edição da coleção |
| Newman | 6.x | Execução via CLI |
| newman-reporter-htmlextra | Latest | Relatório HTML |
| GitHub Actions | — | CI/CD |
| ReqRes.in | — | API de teste pública |

---

## 📚 O que aprendi com este projeto

- Como estruturar uma coleção Postman profissional com pastas e variáveis de ambiente
- Criação de testes automatizados com `pm.test()` e asserções com Chai.js
- Encadeamento de variáveis entre requisições (salvar token, userId, etc.)
- Diferença entre testes positivos, negativos e não-funcionais (performance)
- Como configurar um pipeline de CI/CD com GitHub Actions para testes de API
- Geração de relatórios HTML com Newman HTMLExtra

---

## 👤 Autor

**Seu Nome**
- LinkedIn: [linkedin.com/in/seuperfil](https://linkedin.com/in/seuperfil)
- GitHub: [@seuusuario](https://github.com/seuusuario)

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
