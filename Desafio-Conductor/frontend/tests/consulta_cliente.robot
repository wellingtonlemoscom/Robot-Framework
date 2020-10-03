*** Settings ***
Documentation       Consulta de Cliente
...     Sendo um administrador da página
...     Quero consultar o(s) cliente(s) cadastrado(s)
...     Para que eu possa gerenciar meus clientes

Resource        ../resources/actions.robot

Suite Setup      Login Session
Suite Teardown   Close Session

*** Test Cases ***
Consulta cliente pelo nome
    Dado que eu tenha um cliente "cliente04.json" cadastrado
    Quando eu faço uma consulta desse cliente
    Então devo vê-lo na lista

Consulta informações do cliente
    Dado que eu tenha um cliente "cliente05.json" cadastrado
    Quando eu faço uma consulta desse cliente
    E solicito uma busca
    Então devo ver a mensagem       Visualizar Cliente

# Exclua um cliente específico
#     Dado que eu tenha um cliente "cliente09.json" cadastrado
#     Quando eu faço uma consulta desse cliente
#     E solicito uma exclusão
#     Então devo ver a mensagem "Cliente excluído com sucesso

# Exclua a base de dados
#     Dado que eu tenha um cliente "cliente10.json" cadastrado
#     Quando faço a exclusão da base de dados
#     Então devo ver a mensagem       Base Limpa com sucesso


