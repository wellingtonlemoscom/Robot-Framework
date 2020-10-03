*** Settings ***
Documentation       Cadastro de Cliente
...     Sendo um administrador da página
...     Quero cadastrar clientes
...     Para que eu possa realizar transações

Resource        ../resources/actions.robot

Suite Setup      Login Session
Suite Teardown   Close Session

*** Test Cases ***
Cadastro de cliente com sucesso
    Dado que eu tenha um novo cliente       cliente01.json
    Quando eu faço o cadastro desse cliente
    Então devo ver a mensagem "Cliente salvo com sucesso"
        
Cadastro de cliente sem nome
    Dado que eu tenha um novo cliente       cliente02.json
    Quando eu faço o cadastro desse cliente
    Então devo ver a mensagem de erro no nome "Campo Obrigatório"

Cadastro de cliente sem cpf
    Dado que eu tenha um novo cliente       cliente03.json
    Quando eu faço o cadastro desse cliente
    Então devo ver a mensagem de erro no cpf "Campo Obrigatório"