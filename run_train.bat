REM yolov5 is the subfolder includes yolov5 repository from https://github.com/ultralytics/yolov5
cd yolov5
python train.py --data ../dataset.yaml --cfg yolov5m.yaml --weights yolov5m.pt --batch-size 32