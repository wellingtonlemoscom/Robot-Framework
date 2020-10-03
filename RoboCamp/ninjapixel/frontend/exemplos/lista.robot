
*** Variables ***
@{Nomes}      Papito      João        Well


*** Test Cases ***
Testando uma Lista
    : FOR       ${nome}     IN      @{nomes}
    \       Log To Console      ${nome}