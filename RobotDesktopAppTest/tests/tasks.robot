*** Settings ***
Documentation       Draft example suite for initial script development only.
Library    RPA.Windows
Library    OperatingSystem


*** Variables ***
${PAINT_EXECUTABLE}    mspaint.exe
${IMAGE_PATH_1}       ${EXECDIR}\\Resources\\Data\\Image1.png
${IMAGE_PATH_2}       ${EXECDIR}\\Resources\\Data\\Image2.jpg
${ExportedImageName}    Image2


*** Tasks ***
Open Paint Desktop App
    Log    Open Paint Desktop application.
    Windows Run    mspaint.exe
    Control Window    Unbenannt - Paint
   

Import Image to Paint Desktop App
    Log    Import Image1 into paint application.
    File Should Exist    ${IMAGE_PATH_1}
    Control Window    Unbenannt - Paint
    #Open paint file menu
    #RPA.Windows.Click    name:Datei
    RPA.Windows.Send Keys    keys={LAlt}f
    #Open paint file menu -> importfile
    #RPA.Windows.Click    name:In Zeichenbereich importieren
    RPA.Windows.Send Keys    keys={Down}
    RPA.Windows.Send Keys    keys={Down}
    RPA.Windows.Send Keys    keys={Right}
    RPA.Windows.Send Keys    keys={Enter}
    # Set the path to the image file in the Open dialog and open it
    Log To Console  ${IMAGE_PATH_1}
    Control Window    Einfügen aus
    RPA.Windows.Send Keys    keys={Enter}
    RPA.Windows.Send Keys    keys={LAlt}n
    RPA.Windows.Send Keys    keys=${IMAGE_PATH_1}
    RPA.Windows.Send Keys    keys={Tab}
    #RPA.Windows.Send Keys    keys={Down}
    #RPA.Windows.Send Keys    keys=j
    #RPA.Windows.Send Keys    keys={Enter}
    RPA.Windows.Send Keys    keys={Tab}
    RPA.Windows.Send Keys    keys={Enter}


    
Export Image from Paint Desktop App
    Log    Export Image from paint application and save as ExportedImage
    Control Window    Unbenannt - Paint
    #Open paint file menu
    #RPA.Windows.Click    name:Datei
    RPA.Windows.Send Keys    keys={LAlt}f
    #Open paint file menu -> importfile
    #RPA.Windows.Click    name:In Zeichenbereich importieren
    RPA.Windows.Send Keys    keys={Down}
    RPA.Windows.Send Keys    keys={Down}
    RPA.Windows.Send Keys    keys={Down}
    RPA.Windows.Send Keys    keys={Down}
    RPA.Windows.Send Keys    keys={Down}
    RPA.Windows.Send Keys    keys={Right}
    RPA.Windows.Send Keys    keys={Down}
    RPA.Windows.Send Keys    keys={Enter}
    RPA.Windows.Send Keys    keys=${IMAGE_PATH_2}
    RPA.Windows.Send Keys    keys={Enter}
    Control Window    Speichern unter bestätigen
    RPA.Windows.Send Keys    keys={LAlt}J
    Control Window    ${ExportedImageName} - Paint
    #Close the paint application
    Close Window    ${ExportedImageName} - Paint
     


    

