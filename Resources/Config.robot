*** Settings ***
Library     SeleniumLibrary
Library     RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${base_url}     http://localhost:8080
${browser}      chrome

*** Keywords ***

Start UI TestCase
    open browser    ${base_url}     ${browser}
    sleep    10s
    maximize browser window

Start API TestCase
    create session    mysession   ${base_url}


