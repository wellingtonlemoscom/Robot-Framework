*** Settings ***
Documentation       Este arquivo encapsula todas implementações referentes a abertura e fechamento de sessão

*** Variables ***
${base_url}     http://provaqa.marketpay.com.br:9083/desafioqa


*** Keywords ***
Open Session        #Acessa a página inicial e define algumas configurações
    Open Browser        ${base_url}/login       chrome      options=add_experimental_option('excludeSwitches', ['enable-logging'])
    Set Selenium Implicit Wait      5
    Set Window Size     1280        700

Close Session       #Define o fechamento do navegador e realiza uma screenshot
    Capture Page Screenshot
    Close Browser

Login Session       #Define o inicio da aplicação e realiza o login
    Open Session
    Login With  admin  admin