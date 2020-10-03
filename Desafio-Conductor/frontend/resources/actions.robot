*** Settings ***
Documentation       Actions é o arquivo que contém toda a automação presente no projeto
...                 (OBS: Por conter uma pequena quantidade de testes, mantive todos em um único arquivo, o actions)

Library     SeleniumLibrary
Library     OperatingSystem

Resource    pages/BasePage.robot
Resource    pages/LoginPage.robot
Resource    pages/CadClientePage.robot
Resource    pages/ConClientePage.robot
Resource    pages/incVendaPage.robot
Resource    pages/conVendaPage.robot


*** Keywords ***
#### Helpers

Get Client Json     #Transforma qualquer arquivo json em uma variável que é reconhecedia pelo Robot
    [Arguments]     ${file}

    ${file}=        Get file        resources/fixtures/${file}
    ${json}=        Evaluate        json.loads($file)       json

    [return]       ${json}

#### LOGIN 

Dado que eu acesso a página de Login        #Acessa a página inicial
    Go To      ${base_url}/login

Quando eu submeto minhas credenciais "${user}" e "${pass}"      #Inseri as credenciais do usuário
    Login With      ${user}     ${pass}

Então devo ser autenticado      #Valida a autenticação
    Wait Until Element Is Visible       ${LOG_USER}
    Element Text Should Be              ${LOG_USER}        ${msg_aut} 

Então devo ver a mensagem de erro   #Válida mensagem de erro no login
    [Arguments]     ${messenger}

    Wait Until Element Contains     ${ALERT_ERROR}       ${msg_error}

#### CADASTRO

Dado que eu tenha um novo cliente       #Prepara a massa de dados e disponibiliza para as demais Keywords
    [Arguments]     ${file}

    ${json}=                Get Client Json     ${file}
    Set Test Variable       ${json}

Quando eu faço o cadastro desse cliente     #Realiza o cadastro do cliente
    Go To Client Form
    Create new Client       ${json}

Então devo ver a mensagem de erro no nome "${messenger_error}"      #Valida mensagem de erro no campo nome
    Wait Until Element Contains       ${ALERT_ERROR_NAME}       ${messenger_error}

Então devo ver a mensagem de erro no cpf "${messenger_error}"       #Valida mensagem de erro no campo CPF
    Wait Until Element Contains      ${ALERT_ERROR_CPF}      ${messenger_error}

Então devo ver a mensagem "${messenger}"        #Valida mensagem de cliente cadastrado
    Wait Until Element Contains       ${USER_SAVE}      ${messenger}

#### CONSULTA CLIENTE

Dado que eu tenha um cliente "${file}" cadastrado       #Realiza o cadastro do cliente que será consultado
    ${json}=                Get Client Json     ${file}
    Go To Client Form
    Create new Client       ${json}
    Então devo ver a mensagem "Cliente salvo com sucesso"
    Set Test Variable       ${json}

Quando eu faço uma consulta desse cliente       #Realiza a consulta do cliente já cadastrado
    Go To Client List
    Input Text      ${FIELD_NAME}        ${json['nome']}
    Click Element   ${BUTTON_SAVE}

E solicito uma busca        #Realiza a busca de informação do cliente já cadastrado
    Table Should Contain        ${TABLE}         ${json['nome']}
    Click Element               ${BUTTON_SEARCH}

Então devo vê-lo na lista       #Valida que cliente está cadastrado
    Table Should Contain        ${TABLE}     ${json['nome']}

Então devo ver a mensagem       #Valida que está na página de informações do cliente
    [Arguments]     ${messenger}
    Wait Until Element Contains     ${INFO_USER}       ${messenger}

#### INCLUI VENDA

Quando eu incluo uma transação      #Realiza a inclusão de uma venda
    Go To Transaction Form
    Click Element       ${DROP_NAME}
    Click Element       xpath://select/option[text()='${json['nome']}']
    Input Text          ${DROP_VALUE}     ${json['saldo']}
    Click Element       ${BUTTON_INCLUD}
    Então devo ver a mensagem "Venda realizada com sucesso"

##### CONSULTA VENDA

E faço uma consulta dessa transação     #Realiza a consulta de uma venda
    Go To Transaction List
    Click Element       ${DROP_CLIENT}
    Click Element       xpath://select/option[text()='${json['nome']}']
    Click Element       ${BUTTON_SEARCH_TRANS} 