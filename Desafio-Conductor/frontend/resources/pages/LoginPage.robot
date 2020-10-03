*** Settings ***
Documentation       Este arquivo implementa funções e elementos da página de login

*** Variables ***
${LOG_USER}         class:page-title
${ALERT_ERROR}      css:label

${msg_aut}          Bem vindo ao Desafio
${msg_error}        Credenciais inválidas

*** Keywords ***
Login With      #Keyword criada para realizar o login na aplicação
    [Arguments]     ${user}     ${pass}

    Input Text      name:username       ${user}
    Input Text      name:password       ${pass}
    Click Element   class:btn