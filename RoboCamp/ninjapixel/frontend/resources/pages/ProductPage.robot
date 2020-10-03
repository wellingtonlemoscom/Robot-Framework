*** Settings ***
Documentation       Este arquivo implementa funções e elementos da página Produtos

*** Keywords ***
Go To Product Form
    Click Element                       class:product-add
    Wait Until Element Is Visible       id:create-product

Create New Product
    [Arguments]     ${product_json}
       
    Input Text          css:input[name=title]       ${product_json['name']}

    Run Keyword if      "${product_json['cat']}"
    ...     Select Category     ${product_json['cat']}  #Keyword Criada
    Input Text          css:input[name=price]       ${product_json['price']}

    Input producers      ${product_json['producers']}   #Keyword Criada
    Input Text           css:textarea[name=description]      ${product_json['desc']}

    Run Keyword if      "${product_json['image']}"
    ...     Uplod Photo         ${product_json['image']}    #Keyword Criada   

    Click Element       id:create-product

Uplod Photo
    [Arguments]     ${image}

    ${file}         Set Variable        ${EXECDIR}/resources/fixtures/images/${image}
    Choose File     id:upcover          ${file}
    
Select Category
    [Arguments]     ${cat}

    Wait Until Element Is Visible       css:input[placeholder=Gategoria]    #Código inserido
    Click Element       css:input[placeholder=Gategoria]

    Wait Until Element Is Visible       class:el-select-dropdown__list
    Click Element       xpath://li/span[text()='${cat}']

Input producers
    [Arguments]     ${producers}

    : FOR       ${item}     IN      @{producers}
    \       Log       ${item}
    \       Input Text      class:producers     ${item}
    \       Press Keys       class:producers     TAB