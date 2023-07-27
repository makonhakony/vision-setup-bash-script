#!/bin/bash

# Set the color variables
# TODO

sudo apt update && sudo apt upgrade -y

sudo apt install python3
echo "Python Version: "
python --version

echo "Install coral necessary package"
echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | sudo tee /etc/apt/sources.list.d/coral-edgetpu.list

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo apt-get update

sudo apt-get install libedgetpu1-std

sudo apt-get install python3-pycoral

# vision packages
# - pip packages
sudo pip install tensorflow -y
sudo pip install pillow -y
sudo pip install matplotlib -y
sudo pip install tensorflow-hub -y

# - apt packages
sudo apt-get install python3-picamera2 -y

cat <<EOF > vision_version.py
import tensorflow as tf
import numpy as np

print("Tensorflow Version: ",tf.__version__)
print("Numpy Version: ", np.__version__)
EOF

python vision_version.py

sudo apt-get install libcamera-dev libcamera-utils libcamera-tests
echo "Test camera"
libcamera-hello

echo "That is all, have fun"
