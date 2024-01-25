*** Settings ***
Documentation       Main test suite for paint application.
Library    RPA.Windows
Library    OperatingSystem
Resource    ../Resources/Keywords/paintApp.robot
Resource    ../Resources/Keywords/ImageFileOperations.robot

*** Variables ***
${PAINT_EXECUTABLE}    mspaint.exe
${IMAGE_PATH_1}       ${EXECDIR}\\Resources\\Data\\Image1.png
${IMAGE_PATH_2}       ${EXECDIR}\\Resources\\Data\\Image2.jpg
${ExportedImageName}    Image2
${CapturedImageFromPaintAppPath}       ${EXECDIR}\\Resources\\Data\\CapturedImage.png
${CapturedImageName}    CapturedImage

*** Test Cases ***
Test Paint Application - Import Image
    Open Paint Application    ${PAINT_EXECUTABLE}
    Import Image    ${IMAGE_PATH_1}
    Export Image    ${CapturedImageFromPaintAppPath}    ${CapturedImageName}    png
    # Pass the test cases if the images are identical
    Compare Images And Generate Report    ${IMAGE_PATH_1}    ${CapturedImageFromPaintAppPath}    Images are identical
    Close Paint Application    ${CapturedImageName}

Test Paint Application - Export Image
    Open Paint Application    ${PAINT_EXECUTABLE}
    Import Image    ${IMAGE_PATH_1}
    Export Image    ${IMAGE_PATH_2}    ${ExportedImageName}    jpg
    Close Paint Application    ${ExportedImageName}
    # Pass the test cases if the images are different, and it comaparison fails, this test case is treated as success
    Compare Images And Generate Report    ${IMAGE_PATH_1}    ${IMAGE_PATH_2}    Images are different
