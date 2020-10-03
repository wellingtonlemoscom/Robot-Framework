Documentation       Este arquivo implementa funções e elementos da página de Inclusão de Venda

*** Variables ***
${DROP_NAME}        name:cliente
${DROP_VALUE}       name:valorTransacao
${BUTTON_INCLUD}    id:botaoSalvar


*** Keywords ***
Go To Transaction Form      #Acessa página de inclusão de venda
    Click Element       xpath://span[text()='QA']
    Click Element       xpath://span[text()='Transações']
    Click Element       xpath://li/a[@title='Dashboard']/span[text()='Incluir']

    Wait Until Element Is Visible       xpath://label[text()='Incluir Transacao']
    