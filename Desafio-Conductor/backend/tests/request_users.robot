*** Settings ***
Documentation       Reqres API / Users

Resource        ../resources/services.robot

*** Test Cases ***
Post Create User
    ${payload}=             Get Json        user01.json
    ${resp}=                Post User       ${payload}
    Status Should Be        201             ${resp}

Put Update User
    ${payload}=             Get Json        user02.json
    ${resp}=                Put User        2           ${payload}
    Status Should Be        200             ${resp}

Get List User
    ${resp}=                Get User        2
    Status Should Be        200             ${resp}

Get List User 404
    ${resp}=                Get User        23
    Status Should Be        404             ${resp}

Get List Users
    ${resp}=                Get User        ?page=2
    Status Should Be        200             ${resp}

Delete User
    ${resp}=                Delete User     2
    Status Should Be        204             ${resp}
