*** Settings ***
Documentation       Login
...     Sendo um administrador de catálogo
...     Quero me autenticar no sistema
...     Para que eu possa gerenciar o catálogo de produtos

Resource    ../resources/actions.robot

Suite Setup         Open Session
Suite Teardown      Close Session

Test Teardown       After Test

*** Test Cases ***
Login com sucesso
    [Tags]      login
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "papito@ninjapixel.com" e "pwd123"
    Entao devo ser autenticado

    [Teardown]      After Test WCLS

Senha incorreta
    [Template]      Tentantiva de login com mensagem de erro
    papito@ninjapixel.com       abc123      Usuário e/ou senha inválidos

Email não existe
    [Template]      Tentantiva de login com mensagem de erro
    404@ninjapixel.com       pwd123      Usuário e/ou senha inválidos

Email Obrigatório
    [Template]      Tentantiva de login com mensagem de informativa
    ${EMPTY}       abc123      Opps. Informe o seu email!

Senha Obrigatório
   [Template]      Tentantiva de login com mensagem de informativa
   papito@ninjapixel.com       ${EMPTY}      Opps. Informe a sua senha!


*** Keywords ***
Tentantiva de login com mensagem de erro
    [Arguments]     ${email}        ${pass}     ${saida}

    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "${email}" e "${pass}"
    Então devo ver uma mensagem de erro     ${saida}

Tentantiva de login com mensagem de informativa
    [Arguments]     ${email}        ${pass}     ${saida}

    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "${email}" e "${pass}"
    Então devo ver uma mensagem informativa     ${saida}