# Robot-Framework

O Robot Framework é um framework genérico de automação de código aberto. Ele pode ser usado para automação de teste e automação de processo robótico (RPA). Ele possui uma sintaxe fácil, utilizando palavras-chave legíveis por humanos. Seus recursos podem ser estendidos por bibliotecas implementadas com Python ou Java. A estrutura possui um rico ecossistema ao seu redor, consistindo em bibliotecas e ferramentas desenvolvidas como projetos separados.

By [Documentação Robot-Framework](https://robotframework.org/#documentation)

### Seções Básicas

`*** Settings ***`        = Seção que contém todas as configurações do teste

`*** Test Cases ***`      = Seção que contém os casos de testes

`*** Variables ***`       = Seção que contém as variáveis

`*** Keywords ***`       = Seção que contém as Keywords criadas

### Algumas Keywords Prontas

- `Log To Console ELEMENTO` = Exibi uma mensagem no console
- `Should Be Equal ELEMENTO1 ELEMENTO2` = Compara dois parâmetros
- `Open Browser URL NAVEGADOR` = Abri o navegador na url determinada
- `Title Should Be TITULO` = Valida se o argumento é um título
- `Close Browser` = Fecha o navegador na url determinada
- `Go To URL` = Acessa uma URL
- `${VARIÁVEL} CONTÉUDO` = Cria uma variável no Robot
- `Select checkboxes LOCALICADOR` = Busca e marca um checkbox
- `Checkbox Should Be Selected LOCALIZADOR` = Busca e marca um checkbox
- `Sheep SEGUNDOS` = Pausa o teste durante os segundos determinado
- `[tags] NOME` = Cria tags
- `Test Setup` = Define tudo que será executado antes de cada cenário de teste
- `Test Teardown` = Define tudo que será executado após cada cenário de teste
- `Capture Page Screenshot` = Realiza uma screenshot da tela e anexo aos logs
- `Select Radio Button GRUPORADIO LOCALIZADOR` = Seleciona uma opção de radio
- `Radio Button Should Be Set To GRUPORADIO LOCALIZADOR` = Analisa se a opção radio está marcada
- `Select From List By Label GRUPOLIST LABEL` = Seleciona um elemento de um dropdown pelo label
- `Select From List By Value GRUPLIST VALUE` = Seleciona um elemento de um dropdown pelo valor
- `Get Selected List Value LOCALIZADOR` = Armazena o valor do elemento selecionado no dropdown
- `Table Row Should Contain TABELA LINHA VALOR` = Verifica se valor está em uma determinada linha da tabela
- `Get WebElement` = Busca um elemento qualquer e salvar nele próprio
- `Log ELEMENTO` = Grava nos reports o valor do elemento
- `Log Console ELEMENTO` = Grava no console o valor do elemento
- `Input Text LOCALIZADOR ENTRADA` = Inseri um conteúdo no campo formulário
