# RobotFrameworkDesktopAppTestProj
Sample Desktop App testing using Robot Framework. Here Windows Paint application is tested for image validations


## Pre conditions
- Make sure we are running the script in windows 11 os and with os system lanague set to German. Windows system has by default mapaint.exe installed, in this project script are created with Paint 11.2311.29.0. This script can be further developed for handling multiple od and languages (this might dependent on AUT compatibility and its version as well). But for now it is created only on this perticular pre-condition
- Python 3.10.12 and above should be installed and 'pip' 23.2.1 and above should be installed
- git bash/git is installed

## Usecase of this project
Test Script1:
- Start any Image Editing application for desktop that can import & export images with different formats (ex. Paint)
- Import Image: IMAGE_1
- Verify with image comparison that the imported Image looks correctly in the Image Editor


Test Script2:
- Repeat the import image part from Testcase1
- Export the image in in different format (Imported image is png and exported image is jpg format)
- Verify that the exported image exists
- Verify with image comparison whether the exported image is equal to IMAGE_2 (to be failed)
- Generate an error report 

Note: Main Test Script Path: .\tests\tasksWithFunctions.robot which contains these two testcases

## Steps to run this project
- Download the project from github:: git clone https://github.com/swamipasam/RobotFrameworkDesktopAppTestProj.git
- Move to the project directory:: cd RobotFrameworkDesktopAppTestProj
- run setupVirtualEnv.bat file:: .\setupVirtualEnv.bat


- run runTest.bat file:: .\runTest.bat


- As the command window will close after test run, we can't see logs. The commands in those bat files can be run from jenkins as well, which will give jenkin console logs to see, but in current case, as we have executed from command line, the commanline will get close after successful test execution

- See the test report in the project directory, by double clicking on report.html. This will be open in a default browser if its not open already

- Optional Step: Once the report.html was seen, if you wanted to close all paint windows automaticalls instead of manually, run the bat file :: .\closeAllWindows.bat
Note: As of now this close command close all windows and terminates program not in an intended way. Need to log issue on this.



## Further Possible Improvements
- Multiple language support, and multi OS support (this might dependent on AUT compatibility and its version as well)
- Enhhacing Framework for multiple paint version and language handling (Based on paint App version the menu options also might vary and hence script as of its not compatible with multiple versions of Paint AUT)
- Enhhacing Framework for Image comparision logic and any other type of image validation in paint application with visual comaparisons 
- Enhhacing Framework for Jenkins integration, docker image support etc




# Additional Information
## Project Template: Robot Framework - Minimal

This is the simplest template to start from.

- Get started from a simple task template in `tasks.robot`.
  - Uses [Robot Framework](https://robocorp.com/docs/languages-and-frameworks/robot-framework/basics) syntax.
- You can configure your robot `robot.yaml`.
- You can configure dependencies in `conda.yaml`.
