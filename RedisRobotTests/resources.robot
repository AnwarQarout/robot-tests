*** Variables ***
${host}           localhost
${port}           6379
${inputFile}      keys.txt
${key}            mykey
${value}          myvalue

*** Keywords ***
Custom Setup
    establish connection    ${host}    ${port}
    clean database

Custom Teardown
    clean database
