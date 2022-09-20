set WORKSPACE=c:\workdir\thymio
c:\
mkdir %WORKSPACE%
cd %WORKSPACE%

REM Create Python Env
REM Uncomment below 3 lines in case you want to work with Python env.
REM python -m venv %WORKSPACE%
REM cd %WORKSPACE%
REM call %WORKSPACE%\Scripts\Activate.bat

REM Download Yolov5
call git clone https://github.com/ultralytics/yolov5 yolov5
cd yolov5
REM install requirements
call pip install -r requirements.txt

REM Download Control Thymio via Hand Gesture
cd %WORKSPACE%
call git clone https://github.com/ahmad081177/control-thymio-via-hand-gesture %WORKSPACE%\control-thymio-via-hand-gesture
xcopy /E /Y /C %WORKSPACE%\control-thymio-via-hand-gesture\* %WORKSPACE%\yolov5\.

REM Download Yolov5 models
cd %WORKSPACE%\yolov5
call pip install -r thymio_req.txt
python download_models.py

call MSG %USERNAME% Environment is ready. To run the software, double click: %WORKSPACE%\yolov5\run_detect.bat
call explorer.exe /select,%WORKSPACE%\yolov5\run_detect.bat