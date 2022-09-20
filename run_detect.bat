REM --source 0 means, detect from the camera
REM --nosave means don't save prediction results
REM --max-det 1 means detect only one hand from the video/camera
python detect.py --weights runs/train/thymio_exp/weights/best.pt --img 416 --source 0 --nosave --max-det 1
