Documentation       Este arquivo implementa funções e elementos da página de Consulta do Cliente

*** Variables ***
${FIELD_NAME}       name:j_idt17
${BUTTON_SAVE}      name:j_idt20
${TABLE}            class:table
${BUTTON_SEARCH}    class:fa-search
${INFO_USER}        xpath://h1/label


*** Keywords ***
Go To Client List       #Acessa página de Consulta de Cliente
    Click Element       xpath://span[text()='QA']
    Click Element       xpath://span[text()='Clientes']
    Click Element       xpath://li/a[@title='Listar']/span[text()='Listar']

    Wait Until Element Contains       class:page-title    Listar Clientes