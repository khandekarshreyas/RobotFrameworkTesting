*** Settings ***
Library    SeleniumLibrary
Library     RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource    ../PageObjects/HomePage.robot
Resource    ../Resources/Config.robot

*** Variables ***


*** Test Cases ***
Upload_CSV_File_And_Verify_Tax_Relief_Calculation
    Start API TestCase
    ${file_name}=   get file for streaming upload    ${CURDIR}/Book1.csv
    ${files}=    CREATE DICTIONARY    file     ${file_name}
    ${Header}     create dictionary     accept=application/json
    ${resp}    POST ON SESSION    mysession    /calculator/uploadLargeFileForInsertionToDatabase    headers=${Header}    files=${files}

    log to console    ${resp.content}

    #Verification of Successfully Uploaded
    ${content}=  convert to string    ${resp.content}
    should be equal     ${content}  Successfully uploaded

    #Opening Application to check whether CSV data reflected or not
    Start UI TestCase
    HomePage.Verify PageTitle
    Scroll Till Page End
    Click Refresh Tax Button


    #USER STORY 4
    #Verifying Tax Releif Calculation
    Verify Tax Relief Calculation for All Heroes
    close browser



