*** Settings ***
Resource          CommonVariables.robot

*** Keywords ***
Open My Browser
    [Arguments]    ${url}    ${browser}=chrome
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --start-maximized
    ${options}    Call Method    ${chrome_options}    to_capabilities
    Open Browser    ${url}    ${browser}    desired_capabilities=${options}
    Set Selenium Speed    0.2s

Wait And Click Element
    [Arguments]    ${xpath}
    Wait Until Keyword Succeeds    10x    3 seconds    Click Element    ${xpath}

Wait And Get Text
    [Arguments]    ${xpath}
    ${text}=    Wait Until Keyword Succeeds    10x    3 seconds    Get Text    ${xpath}
    [Return]    ${text}

Wait And Check If Element exists
    [Arguments]    ${xpath}
    Wait Until Keyword Succeeds    10x    3 seconds    Element Should Be Visible    ${xpath}
