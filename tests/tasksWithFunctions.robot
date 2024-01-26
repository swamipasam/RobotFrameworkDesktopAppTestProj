*** Settings ***
Documentation       Main test suite for paint application.
Library    RPA.Windows
Library    OperatingSystem
Resource    ../Resources/Keywords/paintApp.robot
Resource    ../Resources/Keywords/ImageFileOperations.robot

*** Variables ***
${PAINT_EXECUTABLE}    mspaint.exe
${IMAGE_PATH_1}       ${EXECDIR}\\Resources\\Data\\IMAGE_1.png
${IMAGE_PATH_2}       ${EXECDIR}\\Resources\\Data\\IMAGE_2.png
${IMAGE_PATH_Exported}       ${EXECDIR}\\Resources\\Data\\ExportedImage.jpg
${ExportedImageName}    ExportedImage
${CapturedImageFromPaintAppPath}       ${EXECDIR}\\Resources\\Data\\CapturedImage.png
${CapturedImageName}    CapturedImage
${output_report4import_path}    ${EXECDIR}\\Resources\\Data\\ComparisonReportForImport.txt
${output_report4export_path}    ${EXECDIR}\\Resources\\Data\\ComparisonReportForExport.txt

*** Test Cases ***
Test Paint Application - Import Image
    Open Paint Application    ${PAINT_EXECUTABLE}
    Import Image    ${IMAGE_PATH_1}
    Export Image    ${CapturedImageFromPaintAppPath}    ${CapturedImageName}    png
    # Comparison Method I - Pass the test cases if the images are identical
    Compare HashImages And Generate Report    ${IMAGE_PATH_1}    ${CapturedImageFromPaintAppPath}    ${output_report4import_path}    Images are identical
    # Comparison Method II - Pass the test cases if the images are identical
    #Compare Images And Generate Report    ${IMAGE_PATH_1}    ${CapturedImageFromPaintAppPath}    Images are identical
    #Close Paint Application    ${CapturedImageName}

Test Paint Application - Export Image
    Open Paint Application    ${PAINT_EXECUTABLE}
    Import Image    ${IMAGE_PATH_1}
    Export Image    ${IMAGE_PATH_Exported}    ${ExportedImageName}    jpg
    #Close Paint Application    ${ExportedImageName}
    # Comparison Method I - Pass the test cases if the images are different, and it comaparison fails, this test case is treated as success
    Compare HashImages And Generate Report    ${IMAGE_PATH_Exported}    ${IMAGE_PATH_2}    ${output_report4export_path}    Images are different
    # Comparison Method II - Pass the test cases if the images are different, and it comaparison fails, this test case is treated as success
    #Compare Images And Generate Report    ${IMAGE_PATH_Exported}    ${IMAGE_PATH_2}    Images are different