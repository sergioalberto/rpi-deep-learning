# Raspberry Pi Lab related to ML/DL

This is a little laboratory with some libraries about Machine Learning and Deep Learning running on a Raspberry Pi.

## Build image
```sh
docker-compose build
```

## Start container
``` sh
docker run -it -p 6006:6006 -v "$(pwd)":/app sergiogq/rpi-lab bash
```

## Run some example
```sh
cd examples/image_classification
pip3 install -r requirements.txt
python3 classify.py --filename banana.jpeg --model_path mobilenet_v1_1.0_224_quant.tflite --label_path labels_mobilenet_quant_v1_224.txt
```

