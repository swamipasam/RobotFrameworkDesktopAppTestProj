
pip install --no-cache-dir -r Resources\requirements.txt


robot tests\taskswithfunctions.robot
timeout /t 10 /nobreak > NUL

start .\report.html

timeout /t 30 /nobreak > NUL