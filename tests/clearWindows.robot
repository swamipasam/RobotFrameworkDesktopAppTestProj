*** Settings ***
Documentation       Main test suite for paint application.
Library    RPA.Windows
Library    OperatingSystem
Resource    ../Resources/Keywords/paintApp.robot


*** Variables ***
${PAINT_EXECUTABLE}    mspaint.exe
${IMAGE_PATH_1}       ${EXECDIR}\\Resources\\Data\\Image1.png
${IMAGE_PATH_2}       ${EXECDIR}\\Resources\\Data\\Image2.jpg
${ExportedImageName}    Image2
${CapturedImageFromPaintAppPath}       ${EXECDIR}\\Resources\\Data\\CapturedImage.png
${CapturedImageName}    CapturedImage

*** Test Cases ***
Close All Paint Application Windows
    Close Paint Application    ${ExportedImageName}
    
