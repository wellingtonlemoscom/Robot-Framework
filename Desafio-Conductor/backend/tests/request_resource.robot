*** Settings ***
Documentation       Reqres API / Resources

Resource        ../resources/services.robot

*** Test Cases ***
Get List
    ${resp}=            Get Resources   ${EMPTY}
    Status Should Be    200             ${resp}

Get Single
    ${resp}=            Get Resources   2
    Status Should Be    200             ${resp}

Get Single 404
    ${resp}=            Get Resources   23
    Status Should Be    404             ${resp}
