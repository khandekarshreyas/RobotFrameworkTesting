*** Settings ***
Library     SeleniumLibrary
Library    ../PageObjects/TaxReliefCalculation.py

*** Variables ***
${chooseFile_Field}     xpath://input[@type='file']
${DispenseNow_button}   xpath://a[@href="dispense"]
${Cash_Dispensed_Field}   //*[contains(@class,'display-4')]
${Refresh_Tax_button}   //button[@class='btn btn-primary']
${table_First_Column}   //table//td[1]
${table_Second_Column}   //table//td[2]
${Tax_Relief_First}   //td[text()='1234']/following-sibling::td
${Tax_Relief_Second}   //td[text()='1235']/following-sibling::td
${Tax_Relief_Third}   //td[text()='1236']/following-sibling::td

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
    #${STYLE}=    Get Element Attribute    css:style    ${DispenseNow_button}
    #${STYLE}=    TaxReliefCalculation.getBackgroundColour
    #log to console    ${STYLE}

Verify Dispense Now button Text
    Element Text Should Be    ${DispenseNow_button}    Dispense Now

Verify Cash Dispensed Message
    Element Text Should Be    ${Cash_Dispensed_Field}    Cash dispensed

#Get CSS colour of Dispense now button
    #find_element_by_class_name("bar").value_of_css_property('background-color')
Click Refresh Tax Button
    click element    ${Refresh_Tax_button}


Verify Table First Column Data
    ${firstColumnData}    get text    ${table_First_Column}
    log to console   ${firstColumnData}
    should contain  ${firstColumnData}    1234

Verify Table Second Column Data
    ${secondColumnData}    get text    ${table_Second_Column}
    should contain  ${secondColumnData}    16000.00

Verify Tax Relief Calculation for All Heroes
    ${TaxReliefFor1234}    get text    ${Tax_Relief_First}
    ${TaxReliefFor1235}    get text    ${Tax_Relief_Second}
    ${TaxReliefFor1236}    get text    ${Tax_Relief_Third}
    ${Result1}=    TaxReliefCalculation.getTaxReliefValue    25000    5000    12091950    M
    ${Result2}=    TaxReliefCalculation.getTaxReliefValue    23000    10000    12111990    F
    ${Result3}=    TaxReliefCalculation.getTaxReliefValue    1687458    3658    12061985    F
    log to console    AppValueFirst ${TaxReliefFor1234}
    log to console      CalculatedFirst ${Result1}
    log to console    AppValueSecond ${TaxReliefFor1235}
    log to console      CalculatedSecond ${Result2}
    log to console    AppValueThird ${TaxReliefFor1236}
    log to console      CalculatedThird ${Result3}
    should be equal    ${Result1}    ${TaxReliefFor1234}
    should be equal    ${Result2}    ${TaxReliefFor1235}
    should be equal    ${Result3}    ${TaxReliefFor1236}