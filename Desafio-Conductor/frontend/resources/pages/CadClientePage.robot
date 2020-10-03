Documentation       Este arquivo implementa funções e elementos da página de Cadastro do Cliente

*** Variables ***
${ALERT_ERROR_NAME}     xpath://div[label//text()='Nome: ']//small
${ALERT_ERROR_CPF}      xpath://div[label//text()='CPF: ']//small
${USER_SAVE}            xpath://div/strong


*** Keywords ***
Go To Client Form       #Acessa página de Cadastro de Cliente
    Click Element       xpath://span[text()='QA']
    Click Element       xpath://span[text()='Clientes']
    Click Element       xpath://li/a[@title='Incluir']/span[text()='Incluir']

    Wait Until Element Is Visible       xpath://label[text()='Incluir Cliente']

Create new Client       #Realiza o cadastro de um novo cliente
    [Arguments]         ${json}

    Input Text      css:input[name=nome]            ${json['nome']}
    Input Text      css:input[name=cpf]             ${json['cpf']}

    Click Element   id:status
    Click Element   xpath://option[text()='${json['ativo']}']

    Input Text      css:input[name=saldoCliente]    ${json['saldo']}

    Click Element   id:botaoSalvar