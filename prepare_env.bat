set WORKSPACE=c:\workdir\thymio
c:\
mkdir %WORKSPACE%
cd %WORKSPACE%

REM Create Python Env
python -m venv %WORKSPACE%
cd %WORKSPACE%
REM Activate the Thymio environment
call %WORKSPACE%\Scripts\Activate.bat

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
python download_models.py

REM Follow steps under "Prepare environment to detect hand gesture" in README.md
Call MSG %USERNAME% Follow steps under "Prepare environment to detect hand gesture" in README.md