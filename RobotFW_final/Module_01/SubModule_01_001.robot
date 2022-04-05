*** Settings ***
Suite Setup       This Suite Setup
Suite Teardown    This Suite Teardown
Resource          ..${/}Resources${/}SeleniumKeywords.robot

*** Variables ***
${testdatapath}    ${CURDIR}${/}SubModule_01_001_testdata${/}

*** Test Cases ***
WP-number Add two most expansive items from a given category to the shopping cart
    [Documentation]    [https://<jira-site>/WP-number|Open in Jira]
    [Tags]    Release1
    Select Category Notebooks For Home And Office
    Sort Items From Most Expensive
    @{names}=    Add Two Most Expensive Items And Return Their Names
    Check Cart If It Contains Selected Items By Name    @{names}

*** Keywords ***
Sort Items From Most Expensive
    Wait And Click Element    //button/span[contains(.,'Najdrahšie')]

Select Category Notebooks For Home And Office
    Wait And Click Element    //a[@title='Notebooky']
    Wait And Click Element    //a[contains(.,'Domácnosť a kancelária')]

Add Two Most Expensive Items And Return Their Names
    ${list_of_names}=    Create List
    FOR    ${counter}    IN RANGE    1    3
        Run Keyword And Continue On Failure    Wait And Click Element    //div[@class='prodbox'][${counter}]//a[@title='Kúpiť']
        ${name}=    Wait And Get Text    //div[@class='prodbox'][${counter}]//h2
        Append To List    ${list_of_names}    ${name}
    END
    [Return]    @{list_of_names}

Check Cart If It Contains Selected Items By Name
    [Arguments]    @{names}
    Wait And Click Element    //div[@id='bsktcont']
    FOR    ${element}    IN    @{names}
        Log    ${element}
        Run keyword and continue on failure    Wait And Check If Element Exists    //table[@class='stitab']//td[@class='name']//a[contains(.,'${element}')]
    END

This Suite Setup
    Set Our Global Variables
    Open My Browser    ${START_URL}

This Suite Teardown
    Close all Browsers
