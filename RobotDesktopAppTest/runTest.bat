
pip install --no-cache-dir -r Resources\requirements.txt


robot tests\taskswithfunctions.robot
timeout /t 60 /nobreak > NUL

start .\report.html

timeout /t 600 /nobreak > NUL