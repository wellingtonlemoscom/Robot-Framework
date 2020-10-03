*** Settings ***
Documentation       Consulta Venda
...     Sendo um administrador da página que possui vendas realizadas
...     Quero poder consultar-las
...     Para que eu possa ficar atualizado

Resource        ../resources/actions.robot

Suite Setup      Login Session
Suite Teardown   Close Session

*** Test Cases ***
Consulta vendas por cliente
    Dado que eu tenha um cliente "cliente07.json" cadastrado
    Quando eu incluo uma transação
    E faço uma consulta dessa transação
    Então devo vê-lo na lista


