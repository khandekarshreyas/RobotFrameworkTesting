*** Settings ***
Library     RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource    ../Resources/Config.robot

*** Variables ***


*** Test Cases ***
Insert_Person_NegativeScenario
    Start API TestCase
    # Passing Nat Id field Blank to test negative scenario
    ${body}=    create dictionary   birthday=24061987    gender=F    name=Aadya    natid=    salary=100010   tax=23122
    log to console   ${body}

    ${header}=  create dictionary    Content-Type=application/json
    ${response}=    post request    mysession    /calculator/insert     data=${body}     headers=${header}
    #${response}=    post on session     mysession    /calculator/insert    data=${body}    headers=${header}    expected_status=any
    log to console    ${response.status_code}
    log to console    ${response.content}

    #Validations
    ${status_code}=  convert to string    ${response.status_code}
    ${res_body}=    convert to string    ${response.content}
    should contain  ${res_body}    Alright
    should be equal    ${status_code}    202

    ${response1}=    get request    mysession    /calculator/taxRelief
    log to console    ${response1.content}

    #Validations
    ${status_code}=  convert to string    ${response1.status_code}
    ${res_body}=    convert to string    ${response1.content}
    should be equal    ${status_code}    500
    should contain  ${res_body}    Internal Server Error