*** Settings ***
Documentation       Incluir Venda
...     Sendo um administrador da página que possui clientes cadastrados
...     Quero poder Incluir transações realizadas pelos meus clientes cadastrados
...     Para que eu possa manter o site atualizado

Resource        ../resources/actions.robot

Suite Setup      Login Session
Suite Teardown   Close Session

*** Test Cases ***
Incluir vendas com sucesso
    Dado que eu tenha um cliente "cliente06.json" cadastrado
    Quando eu incluo uma transação
    Então devo ver a mensagem "Venda realizada com sucesso"

