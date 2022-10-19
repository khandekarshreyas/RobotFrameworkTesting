*** Settings ***
Library     RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${base_url}     http://localhost:8080

*** Test Cases ***
Insert_MultiPersons
    create session    mysession   ${base_url}
    ${body1}=   create dictionary    birthday=04112014    gender=F    name=Aadya    natid=201445    salary=100010   tax=23122
    ${body2}=   create dictionary    birthday=13101986    gender=M    name=Shreyas    natid=1986    salary=200000   tax=50000
    ${body3}=   create dictionary    birthday=24061987    gender=F    name=Chitkla    natid=1986    salary=200000   tax=50000
    ${body}=    Create List     ${body1}    ${body2}    ${body3}
    log to console   ${body}

    ${header}=  create dictionary    Content-Type=application/json
    ${response}=    post request    mysession    /calculator/insertMultiple    data=${body}     headers=${header}

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
    should contain  ${res_body}    2014$$
    should contain  ${res_body}    77388.00
    should contain  ${res_body}    Chitkla
    should contain  ${res_body}    Shreyas