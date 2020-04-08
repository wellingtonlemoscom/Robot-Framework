
*** Settings ***
Library     app.py

*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result}=          Welcome     Wellington Lemos
    Should Be Equal     ${result}   Olá Wellington Lemos, bem vindo ao Curso Básico de Robot Framework!
