*** Settings ***
Documentation       Login
...     Sendo um administrador de terminais físicos
...     Quero me autenticar no sistema
...     Para que eu possa gerenciar meus terminais físicos

Library     SeleniumLibrary

*** Test Cases ***
Login com sucesso
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "Gestor" e "123Mudar"
    Entao devo ser autenticado

Login com senha incorreta
    Dado que eu acesso a página de login
    Quando eu submeto minhas credenciais "Gestor" e "123456"
    Então devo ver uma mensagem de erro     "Senha incorreta"


*** Keywords ***
Dado que eu acesso a página de login
    Go To       192.168.1.124:8080/login

Quando eu submeto minhas credenciais "${user}" e "${pass}"
    Input Text      id:emailId      ${email}
    Input Text      id:passId       ${pass}
    Click Element   class:btn

Entao devo ser autenticado
    Element Text Should Be      css:.user .info span        Gestor

Então devo ver uma mensagem de erro
    [Arguments]     ${expect_message}
    Wait Until Element Contains     class:alert-danger        ${expect_message}
