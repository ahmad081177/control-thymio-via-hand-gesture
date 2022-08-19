# Control Thymio Robot thru Hand Gestures. 
### YOLO! Detect my hand gesture to control my Thymio robot.

## Abstract
This proof of concept is combining a wireless Thymio II with a python software on computer to control the movements of the robot via hand gestures. Python software based on YOLOV5 is running on the computer to detect hand gestures via a camera. Once the python application recognizes new hand gesture, the python script decides what command to send to the Thymio robot. For exmaple, hand gesture of one means "move forward", hand gesture of "five" means "stop", hand gesture of "fist" means "speed up", and so on. For all commands, refer to __cmd_map memeber in thymio.py file in this repository.

## Setup
* Install python v3 from https://www.python.org/downloads/
* Install the Thymio Suite from https://www.thymio.org/download-thymio-suite/
* Prepare new python environment:
  * In your command shell, run: ```python -m venv c:\work\thymio```
  * Activate the environment by typing in the command shell: ```c:\work\thymio\Scripts\Activate.bat```
  * Download YOLOV5 of Ultralytics from GitHub - https://github.com/ultralytics/yolov5
  * Copy the Ultralytics folder to: c:\work\thymio\src\yolov5-control-thymio\yolov5
  * In your command shell, from yolov5 folder type: ```(thymio) c:\work\thymio\src\yolov5-control-thymio\yolov5> pip install -r requirements.txt```
  * Either download this repository to your local disk, say, c:\work\thymio\src\yolov5-control-thymio
  * Or: in your shell type: ```(thymio) c:\work\thymio\src\yolov5-control-thymio> git clone https://github.com/ahmad081177/control-thymio-via-hand-gesture src```
  * Copy (or move) download_models.py from c:\work\thymio\src\yolov5-control-thymio into yolov5 subfolder
  * From your shell run: ```(thymio) c:\work\thymio\src\yolov5-control-thymio\yolov5> python download_models.py```
  * In case you want to train the model on your end, run the: ```(thymio) c:\work\thymio\src\yolov5-control-thymio> run_train.bat```
  * Prepare for detect:
    * copy thymio.py into yolov5 subfolder
    * Locate detect.py in yolov5 subfolder and modify it as following:
      * Add the following lines at the beginning - before anything else.
        ```
        import os, sys
        #https://github.com/opencv/opencv/issues/17687
        os.environ["OPENCV_VIDEOIO_MSMF_ENABLE_HW_TRANSFORMS"] = "0"
        ```
      * After all imports of the file, add the following code:
        ```
        from thymio import Thymio
        ```
      * Locate run method, after "Load model" and before "Dataloader" place the following code:
        ```
        _thymio = None
        print('start creating new Thymio interface')
        _thymio = Thymio()
        r = _thymio.start()
        if r==True:
            print('Thymio interface has been started successfully')
        else:
            _thymio=None
            print('Thymio interface could not be started')

        ```
      * Locate "Print results" comment, and inside the loop, new the code should be:
        ```
        for c in det[:, -1].unique():
            #Start Modify - Ahmad
            if _thymio is not None: 
                print('Thymio on command: ', int(c), ' (',names[int(c)],')')
                _thymio.on_command(names[int(c)])#int(c))
            #End Modify - Ahmad
            n = (det[:, -1] == c).sum()  # detections per class
            s += f"{n} {names[int(c)]}{'s' * (n > 1)}, "  # add to string

        ```

### Run the software:
  * Make sure you camera is connected
  * Make sure the Thymio robot is tunred on and the wireless dongle is pluged in to the computer
  * In your shell, type: ```(thymio) c:\work\thymio\src\yolov5-control-thymio>run_detect.bat```
  
### For more details, refer to the [documentation](Control%20Thymio%20Robot%20via%20Hand%20Gestures.docx)

## DEMO
[Control Thymio by Hand Gesture](https://youtube.com/shorts/no3g03PY0nw "Control Thymio by Hand Gesture")
