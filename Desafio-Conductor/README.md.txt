# Desafio Conductor

Toda a automação Web e API foram realizadas em Robot Framework e estão divididas entre backend (API) e frontend (WEB).
Para realizar a execução do projeto basta acessar as pastas backend ou frontend e executar o comando:
```robot -d ./logs tests\```

---

### Automação

1. Todo o projeto está organizado entre logs, resources e tests, onde:
**logs** contém todo o resultado da execução dos testes rodados,
**resources** contém todos os recursos utilizados no projeto, que são: a massa de testes, as implementações e a automação, e
**tests** contém toda a documentação dos testes realizados.
2. Foi utilizado o padrão Page Object, com o objetivo de encapsular cada página com suas respectivas implementações.
3. Houve o cuidado em manter a independência entre cada cenário de teste. Porém, alguns pontos poderiam ser melhor implementados, caso tivesse acesso ao banco de dados(p.e apagar os dados inseridos ao final de cada teste).

---

### Bugs Encontrados e Possíveis Melhorias

- Não é possível listar transações por cliente, nenhum resultado é apresentado na tabela;
- Não é possível excluir um cliente específico, o site apenas salva o cliente.
- Não há uma verificação de duplicidade de informação.
- As opções de "Ativo" e "Saldo", da página Incluir Cliente, e "Data Validade", da página Listar Clientes, não são identificados como opção obrigatória. Mesmo havendo o * em seus respectivos campos.
- Ao incluir uma transação vazia, ou seja, sem inserir nenhum dado, a opção de salvar é desabilitada e nenhuma mensagem é apresentada. E mesmo após inserir seus dados, o botão permanece desabilitado, impossibilitando a inclusão de uma transação.
- Ao tentar ver as informações específicas de uma transação, não é possível ver o nome do cliente daquela respectiva transação.

*Obs: Nem todos os cenários foram possíveis de serem implementados (por conta do tempo), porém, foram encontrados algumas inconsistências ao longo do planejamento e execução dos testes.*
