*** Settings ***
Documentation   Image Comparison keywords
Library    ../../Resources/PythonLibExt/ImageComparison.py
#Resource  ../../Resources/PythonLibExt/ImageComparisonReport.py
Library    ../../Resources/PythonLibExt/ImgaeDiff.py



*** Keywords ***
Compare Images And Generate Report
    [Arguments]    ${imageFile1}    ${imageFile2}    ${validationText}
    # Implement steps to verify the exported image in Paint
    Log    Comparing the images
    Log To Console  Comparing the images
    ${report} =  compare_images  ${imageFile1}  ${imageFile2}
    Log  ${report}
    Log To Console  ${report}
    #[return]  ${report}
    Should Contain  ${report}  ${validationText}


Compare HashImages And Generate Report
    [Arguments]    ${imageFile1}    ${imageFile2}    ${output_report_path}    ${validationText}
    # Implement steps to verify the exported image in Paint
    Log    Comparing the images
    Log To Console  Comparing the images
    ${report} =  generate_imagehash_compare_report  ${imageFile1}  ${imageFile2}    ${output_report_path}
    Log  ${report}
    Log To Console  ${report}
    #[return]  ${report}
    Should Contain  ${report}  ${validationText}