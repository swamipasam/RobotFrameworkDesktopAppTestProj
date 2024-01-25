# RobotFrameworkDesktopAppTestProj
Sample Desktop App testing using Robot Framework. Here Windows Paint application is tested for image validations


## Pre conditions
- Make sure we are running the script in windows os and with os system lanague set to German. Windows system has by default mapaint.exe installed
- Python 3.10.12 and above should be installed and 'pip' 23.2.1 and above should be installed
- git bash/git is installed

## Steps to use this project
- Download the project from github:: git clone https://github.com/swamipasam/RobotFrameworkDesktopAppTestProj.git
- Move to the project directory:: cd RobotFrameworkDesktopAppTestProj
- run setupVirtualEnv.bat file:: .\setupVirtualEnv.bat


- run runTest.bat file:: .\runTest.bat


- As the command window will close after test run, we can't see logs. The commands in those bat files can be run from jenkins as well, which will give jenkin console logs to see, but in current case, as we have executed from command line, the commanline will get close after successful test execution

- See the test report in the project directory, by double clicking on report.html. This will be open in a default browser if its not open already

- Optional Step: Once the report.html was seen, if you wanted to close all paint windows automaticalls instead of manually, run the bat file :: .\closeAllWindows.bat
Note: As of now this close command close all windows and terminates program not in an intended way. Need to log issue on this.








# Additional Information
## Project Template: Robot Framework - Minimal

This is the simplest template to start from.

- Get started from a simple task template in `tasks.robot`.
  - Uses [Robot Framework](https://robocorp.com/docs/languages-and-frameworks/robot-framework/basics) syntax.
- You can configure your robot `robot.yaml`.
- You can configure dependencies in `conda.yaml`.
