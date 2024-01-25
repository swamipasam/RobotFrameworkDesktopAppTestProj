*** Settings ***
Documentation   Paint App Keywords
Library  ../../Resources/PythonLibExt/ImageComparison.py



*** Keywords ***
Compare Images And Generate Report
    [Arguments]    ${imageFile1}    ${imageFile2}    ${validationText}
    # Implement steps to verify the exported image in Paint
    Log    Comparing the images
    Log To Console  Comparing the images
    ${report} =  Compare Images  ${imageFile1}  ${imageFile2}
    Log  ${report}
    Log To Console  ${report}
    #[return]  ${report}
    Should Contain  ${report}  ${validationText}
