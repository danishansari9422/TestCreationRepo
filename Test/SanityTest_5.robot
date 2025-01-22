*** Settings ***

Library    ../../salesforce_common_functions.py
Suite Setup       Initialize browser and log in to salesforce
Suite Teardown    Log out from the salesforce and close browser

*** Variables ***

${account_creation_data}        ${CURDIR}/account_creation_data.json
${accounts_records_id_data}        ${CURDIR}/account_records_id.json

*** Test Cases ***

TC1
    Create Account Record

TC2
    Update Account Record By Record Id
    Fetch Details of Records

