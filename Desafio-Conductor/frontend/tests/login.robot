*** Settings ***
Documentation       Login
...     Sendo um administrador da página
...     Quero me autenticar no sitema
...     Para que eu possa gerenciar os clientes e as transações

Resource        ../resources/actions.robot

Suite Setup      Open Session       #Executado no inicio de todos os testes
Suite Teardown   Close Session      #Executado ao final de todos os testes


*** Test Cases ***
Login com sucesso
    Dado que eu acesso a página de Login
    Quando eu submeto minhas credenciais "admin" e "admin"
    Então devo ser autenticado

Login com usuário incorreto
    [Template]      Login com credenciais inválidas
    incorreto       admin      Credenciais inválidas

Login com senha incorreta
    [Template]      Login com credenciais inválidas
    admin           incorreto      Credenciais inválidas

Login com campos vazios
    [Template]      Login com credenciais inválidas
    ${EMPTY}        ${EMPTY}      Credenciais inválidas


*** Keywords ***
Login com credenciais inválidas
    [Arguments]     ${user}     ${pass}     ${messenger}

    Dado que eu acesso a página de Login
    Quando eu submeto minhas credenciais "${user}" e "${pass}"
    Então devo ver a mensagem de erro       ${messenger}
