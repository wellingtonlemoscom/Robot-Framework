*** Settings ***
Documentation       Cadastro de produtos
...     Sendo um administrador de catálogo
...     Quero cadastrar produtos
...     Para que eu possa disponibiliza-los na loja virtual

Library     SeleniumLibrary

Resource    ../resources/actions.robot

Suite Setup         Product Form Session
Suite Teardown      Close Session

Test Setup          Reload Page     #Gato
Test Teardown       After Test
Test Template       Tentativa de cadastro

*** Keywords ***
Tentativa de cadastro
    [Arguments]     ${file_name}        ${expect_message}

    Dado que eu tenho um novo produto       ${file_name}
    Quando eu tento cadastrar o produto
    Então devo ver uma mensagem informativa     ${expect_message}

*** Test Cases ***          produto             saida
Nome não informado          alexkidd.json       Oops - Informe o nome do produto!
Categoria não selecionada   kidchameleon.json   Oops - Selecione uma categoria!
Preço não informado         shinobi.json        Oops - Informe o preço também!
