*** Settings ***
Library     RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${base_url}     http://localhost:8080

*** Test Cases ***
Insert_Person
    create session    mysession   ${base_url}
    ${body}=    create dictionary   birthday=04112014    gender=F    name=Aadya    natid=2014    salary=100000   tax=8000  birthday=24061987    gender=F    name=Chitkla    natid=1987    salary=800000   tax=24000    birthday=13101987    gender=M    name=Shreyas    natid=1986    salary=600000   tax=36000
    log to console   ${body}

    ${header}=  create dictionary    Content-Type=application/json
    ${response}=    post request    mysession    /calculator/insert     data=${body}     headers=${header}

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
    should be equal    ${status_code}    200
    should contain  ${res_body}    Aadya
    should contain  ${res_body}    Chitkla
    should contain  ${res_body}    Shreyas
    should contain  ${res_body}    62010.00
    should contain  ${res_body}    62010.00