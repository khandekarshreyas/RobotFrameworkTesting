*** Settings ***
Library     SeleniumLibrary
*** Variables ***
${chooseFile_Field}     xpath://input[@type='file']
${DispenseNow_button}   xpath://a[@href="dispense"]
${Cash_Dispensed_Field}   //*[contains(@class,'display-4')]

#background-color: #dc3545;

*** Keywords ***
Verify PageTitle
    title should be    Technical Challenge for CDS

Click Choose File Field
    press keys    ${chooseFile_Field}    RETURN

Click Dispense Now button
    Element Should Be Enabled   ${DispenseNow_button}
    click element    ${DispenseNow_button}

Verify Dispense Now button colour
    #${DispenseNow_button}   value_of_css_property
    ${STYLE}=    Get Element Attribute    css:style    ${DispenseNow_button}

Verify Dispense Now button Text
    Element Text Should Be    ${DispenseNow_button}    Dispense Now

Verify Cash Dispensed Message
    Element Text Should Be    ${Cash_Dispensed_Field}    Cash dispensed

Get CSS colour of Dispense now button
    find_element_by_class_name("bar").value_of_css_property('background-color')