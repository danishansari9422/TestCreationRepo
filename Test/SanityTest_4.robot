*** Settings ***

Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../Create_Update_Fetch_Delete_keywords.robot
Library    ../salesforce_common_functions.py
Suite Setup       Log in to salesforce keyword
Suite Teardown    Log out from the salesforce and close browser


*** Variables ***

${GLOBAL_DRIVER}
${YAML FILE}        ${CURDIR}/properties.yml
# Please update the respective json file in the Resources folder
${account_creation_data}        ${CURDIR}/account_creation_data.json
${accounts_records_id_data}        ${CURDIR}/account_records_id.json


*** Test Cases ***

Create Account Record
    [Documentation]    Create a new Account record using specified data.
    [Tags]    Create Account
    ${records_id}=    Create Accounts    ${account_creation_data}
    ${records_id_str}=    Convert To String    ${records_id}
    Log    Created Account Records with IDs: ${records_id_str}

Update Account Record By Record Id
    [Documentation]    Update an existing Account record with new data.
    [Tags]    Update Account
    Update Accounts    ${account_creation_data}    ${accounts_records_id_data}

Fetch Details of Records
    [Documentation]    Fetch details of records based on their IDs.
    [Tags]    Fetch Records
    Fetch Accounts    ${accounts_records_id_data}    5

Delete Records
    [Documentation]    Delete records based on their IDs.
    [Tags]     Delete Records
    Delete Accounts    ${accounts_records_id_data}

