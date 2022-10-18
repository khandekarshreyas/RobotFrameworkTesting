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
Upload_CSV_File_And_Verify_Tax_Relief_Calculation
    create session    mysession   ${base_url}

    ${file_name}=   get file for streaming upload    ${CURDIR}/Book1.csv
   
    ${files}=    CREATE DICTIONARY    file    ${file_name}

    ${Header}     create dictionary     accept=application/json
    ${resp}    POST ON SESSION    mysession    /calculator/uploadLargeFileForInsertionToDatabase    headers=${Header}    files=${files}

    log to console    ${resp.content}
    sleep    3s
    #Verification of Successfully Uploaded
    ${content}=  convert to string    ${resp.content}
    should be equal     ${content}  Successfully uploaded

    #Opening Application to check whether CSV data reflected or not
    open browser    ${base_url}     ${browser}
    sleep    5s
    maximize browser window
    HomePage.Verify PageTitle
    execute javascript    window.scrollTo(0,500)
    Click Refresh Tax Button
    sleep    3s
    Verify Table First Column Data
    Verify Table Second Column Data

    #USER STORY 4
    #Verifying Tax Releif Calculation
    Verify Tax Relief Calculation for All Heroes
    close browser



