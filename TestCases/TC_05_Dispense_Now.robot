*** Settings ***
Library    SeleniumLibrary
Library     RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource    ../PageObjects/HomePage.robot

*** Variables ***
${browser}      chrome
${base_url}     http://localhost:8080
${chooseFile_Field}     xpath://input[@type='file']
${DispenseNow_button}   xpath://a[@href="dispense"]

*** Test Cases ***
Dispense Now Functionality

    open browser    ${base_url}     ${browser}
    sleep    10s
    maximize browser window
    HomePage.Verify PageTitle
    execute javascript    window.scrollTo(0,1500)
    sleep    3s
    #AC2
    #Element Text Should Be    ${DispenseNow_button}    Dispense Now
    HomePage.Verify Dispense Now button Text

    #${STYLE}=    Get Element Attribute    ${DispenseNow_button}    css:Styles.background-color
    #get el
    #log to console    SK2${STYLE}

    #${elem}=    Execute Javascript    return document.getElementById('table-row');
    #${bg color}=    Call Method    ${DispenseNow_button}    value_of_css_property    background-color
   # ${background_color}=  Execute Javascript  return window.getComputedStyle(document._getElementsByXPath("//a[@href="dispense"]")[0]).getPropertyValue('background-color');
#log  ${background_color}
    ${rgb}=     find_element_by_class_name("bar").value_of_css_property('background-color')
    ${background_color}=  Execute Javascript  return (document.getElementByXPath("//a[@href="dispense"]").style.backgroundColor);
    log to console    SKColour${background_color}

    HomePage.Click Dispense Now button
    sleep    5s
    HomePage.Verify Cash Dispensed Message

    #close browser