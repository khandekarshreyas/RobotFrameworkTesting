*** Settings ***
Library    SeleniumLibrary
Library     RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    ../PageObjects/TaxReliefCalculation.py
Resource    ../PageObjects/HomePage.robot
Resource    ../Resources/Config.robot


*** Variables ***


*** Test Cases ***
Dispense Now Functionality

    Start UI TestCase
    HomePage.Verify PageTitle
    Scroll Till Page End

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
    #${rgb}=     find_element_by_class_name("bar").value_of_css_property('background-color')
    #${background_color}=  Execute Javascript  return (document.getElementByXPath("//a[@href="dispense"]").style.backgroundColor);
    #HomePage.Verify Dispense Now button colour

    HomePage.Click Dispense Now button

    HomePage.Verify Cash Dispensed Message

    close browser