Documentation       Este arquivo implementa funções e elementos da página de Consulta de Venda

*** Variables ***
${DROP_CLIENT}              id:cliente
${BUTTON_SEARCH_TRANS}      name:j_idt20


*** Keywords ***
Go To Transaction List      #Acessa página de consulta de venda
    Click Element       xpath://span[text()='QA']
    Click Element       xpath://a[@title='Transações']/span[text()='Transações']
    Click Element       xpath://a[@title='Dashboard']/span[text()='Listar']

    Wait Until Element Contains       class:page-title    Listar Transações