*** Settings ***
Documentation   Paint App Keywords
Library    RPA.Windows
Library    OperatingSystem


*** Keywords ***
Open Paint Application
    [Arguments]    ${PAINT_EXECUTABLE}
    Log    Open Paint Desktop application.
    Windows Run    mspaint.exe
    Control Window    Unbenannt - Paint
    Sleep    2s

Import Image
    [Arguments]    ${image_path}
    # Importing the image in Paint Desktop app
    Log    Import Image1 into paint application.
    File Should Exist    ${image_path}
    Control Window    Unbenannt - Paint
    #Open paint file menu
    RPA.Windows.Send Keys    keys={LAlt}f
    #Open paint file menu -> importfile
    RPA.Windows.Send Keys    keys={Down}
    RPA.Windows.Send Keys    keys={Down}
    RPA.Windows.Send Keys    keys={Right}
    RPA.Windows.Send Keys    keys={Enter}
    # Set the path to the image file in the Open dialog and open it
    Log To Console  ${image_path}
    Control Window    Einfügen aus
    RPA.Windows.Send Keys    keys={Enter}
    RPA.Windows.Send Keys    keys={LAlt}n
    RPA.Windows.Send Keys    keys=${image_path}
    RPA.Windows.Send Keys    keys={Tab}
    RPA.Windows.Send Keys    keys={Tab}
    RPA.Windows.Send Keys    keys={Enter}


Export Image
    [Arguments]    ${exported_image_path}    ${ExportedImageName}    ${imageFormat}=png
    # Exporting the image in Paint in jpeg format
    Log    Export Image from paint application and save as ExportedImage
    Control Window    Unbenannt - Paint
    #Open paint file menu
    RPA.Windows.Send Keys    keys={LAlt}f
    #Open paint file menu -> importfile
    RPA.Windows.Send Keys    keys={Down}
    RPA.Windows.Send Keys    keys={Down}
    RPA.Windows.Send Keys    keys={Down}
    RPA.Windows.Send Keys    keys={Down}
    RPA.Windows.Send Keys    keys={Down}
    RPA.Windows.Send Keys    keys={Right}
    IF    ($imageFormat == 'jpg')
        RPA.Windows.Send Keys    keys={Down}
    END
    RPA.Windows.Send Keys    keys={Enter}
    RPA.Windows.Send Keys    keys=${exported_image_path}
    RPA.Windows.Send Keys    keys={Enter}
    #TODO Improve code logic (below two lines) to click on Ja only when the pop up window appears
    Control Window    Speichern unter bestätigen
    RPA.Windows.Send Keys    keys={LAlt}J
    Control Window    ${ExportedImageName} - Paint

Close Paint Application
    [Arguments]    ${paintApp_Title}=Unbenannt
    # Implement steps to close Paint app
    Control Window    ${paintApp_Title} - Paint
    Close Window    ${paintApp_Title} - Paint


