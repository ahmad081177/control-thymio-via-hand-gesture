REM yolov5 is the subfolder includes yolov5 repository from https://github.com/ultralytics/yolov5
cd yolov5
REM --source 0 means, detect from the camera
REM --nosave means don't save prediction results
REM --max-det 1 means detect only one hand from the video/camera
REM --thymio 1 means to send results to Thymio robot thru thymio.py
python detect.py --weights runs/train/thymio_exp/weights/best.pt --img 416 --source 0 --nosave --max-det 1 --thymio 1
