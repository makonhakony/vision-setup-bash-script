#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install python3
echo "Python Version: "
python --version

pip install virtualenv
virtualenv robotenv
source robotenv/bin/activate

pip install tensorflow

cat <<EOF > vision_version.py
import tensorflow as tf
import numpy as np

print("Tensorflow Version: ",tf.__version__)
print("Numpy Version: ", np.__version__)
EOF

python vision_version.py
