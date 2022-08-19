REM Prepare Env
REM See https://wandb.ai/onlineinference/YOLO/reports/YOLOv5-Object-Detection-on-Windows-Step-By-Step-Tutorial---VmlldzoxMDQwNzk4

set MAIN_FOLDER=c:\work

set ENV_DIR=%MAIN_FOLDER%\thymio
python -m venv %ENV_DIR%
call %ENV_DIR%\Scripts\Activate.bat

set PROJ_DIR=%MAIN_FOLDER%\src
mkdir %PROJ_DIR%
cd %PROJ_DIR%
REM Clone the yolov5 of ultralytics locally to yolov5 folder
git clone https://github.com/ultralytics/yolov5 yolov5
cd yolov5
call pip install -r requirements.txt

copy ..\download_models.py .
call python download_models.py

REM Then run the run_train.bat