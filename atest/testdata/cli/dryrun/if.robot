*** Settings ***
Resource        resource.robot

*** Test Cases ***
IF is not executed in dry run
    Recursive if  call again
    This is validated

ELSE IF is not executed in dry run
    Recursive else if  call again
    This is validated

ELSE is not executed in dry run
    Recursive else  call again
    This is validated

*** Keywords ***
Recursive if
    [Arguments]  ${arg}
    IF  '${arg}' == 'call again'
      Recursive if  call no more
    ELSE IF  '${arg}' == 'call sometimes'
      Log  no more calls
    ELSE
      Log  no more calls
    END

Recursive else if
    [Arguments]  ${arg}
    IF  '${arg}' == 'call no more'
      Log  no more calls
    ELSE IF  '${arg}' == 'call again'
      Recursive else if  call no more
    ELSE
      Log  no more calls
    END

Recursive else
    [Arguments]  ${arg}
    IF  '${arg}' == 'call no more'
      Log  no more calls
    ELSE IF  '${arg}' == 'call sometimes'
      Log  no more calls
    ELSE
      Recursive else  call no more
    END