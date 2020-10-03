*** Settings ***
Documentation       Arquivo usado para encapsular algumas chamadas da reqres API
...                 https://reqres.in/

Library         RequestsLibrary
Library         Collections
Library         OperatingSystem

*** Keywords ***

#### HELPERS

Get Json    #Transforma qualquer arquivo json em uma variável que é reconhecedia pelo Robot
    [Arguments]     ${json_file}

    ${file}=        Get File        ${EXECDIR}/resources/fixtures/${json_file} 
    ${json}=        evaluate        json.loads($file)   json

    [return]        ${json}

#### KEYWORDS

Get User    #Realiza qualquer requisição GET na rota users
    [Arguments]         ${id}

    Create Session      reqres          https://reqres.in/api
    ${resp}=            Get Request     reqres      users/${id}

    [return]            ${resp}

Put User    #Realiza qualquer requisição PUT na rota users
    [Arguments]         ${id}       ${payload}

    Create Session      reqres          https://reqres.in/api
    ${resp}=            Put Request     reqres      users/${id}     ${payload}

    [return]            ${resp}

Post User   #Realiza qualquer requisição POST na rota users
    [Arguments]         ${payload}

    Create Session      reqres          https://reqres.in/api
    ${resp}=            Post Request     reqres      users/     ${payload}

    [return]            ${resp}

Delete User     #Realiza requisição DELETE na rota users
    [Arguments]         ${id}

    Create Session      reqres          https://reqres.in/api
    ${resp}=            Delete Request     reqres      users/${id}

    [return]            ${resp}

Get Resources   #Realiza requisição GET na rota unknow
    [Arguments]         ${id}

    Create Session      reqres          https://reqres.in/api
    ${resp}=            Get Request     reqres      unknown/${id}

    [return]            ${resp}