*** Settings ***
Test Setup        Custom Setup
Test Teardown     Custom Teardown
Resource          resources.robot
Library           TestRedis.py

*** Test Cases ***
Create keys which are read from file
    ${output}    list all keys
    create keys from file    ${inputFile}
    ${output2}    list all keys
    Should Not Be Equal    ${output}    ${output2}
    Should Contain    ${output2}    hello
    Should Contain    ${output2}    my
    Should Contain    ${output2}    is
    ${output}    get key value    hello
    Should Be Equal    ${output}    hi

delete key
    create key    ${key}    ${value}
    ${output}    list all keys
    delete key    ${key}
    ${output2}    list all keys
    Should Not Be Equal    ${output}    ${output2}
    Should Not Contain    ${output2}    ${key}

create key
    ${output}    list all keys
    Should Not Contain    ${output}    ${key}
    create key    ${key}    ${value}
    ${output2}    list all keys
    Should Not Be Equal    ${output}    ${output2}
    Should Contain    ${output2}    ${key}

create key again
    ${output}    list all keys
    Should Not Contain    ${output}    ${key}
    create key    ${key}    ${value}
    ${output2}    list all keys
    Should Not Be Equal    ${output}    ${output2}
    Should Contain    ${output2}    ${key}
