*** Settings ***
Library    SeleniumLibrary
Library     RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource    ../PageObjects/HomePage.robot

*** Variables ***
${browser}      chrome
${base_url}     http://localhost:8080
#${chooseFile_Field}     xpath://input[@type='file']

*** Test Cases ***
Upload_CSV_File
    create session    mysession   ${base_url}
    log to console    firstlog
    ${file_name}=   get file for streaming upload    ${CURDIR}/Book1.csv
   
    ${files}=    CREATE DICTIONARY    file    ${file_name}

    ${Header}     create dictionary     accept=application/json
    ${resp}    POST ON SESSION    mysession    /calculator/uploadLargeFileForInsertionToDatabase    headers=${Header}    files=${files}

    log to console    SK${resp.content}
