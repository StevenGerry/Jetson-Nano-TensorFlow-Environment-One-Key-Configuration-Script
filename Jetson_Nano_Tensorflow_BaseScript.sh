#!/bin/sh
echo ===================================
echo Starting Hacking Jetson Nano Author: Wenhao Huang
echo ===================================
sleep 3
echo ==========INSTALL TENSORFLOW==========
sleep 3
output=$(sudo apt-get install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran)
output=$(sudo apt-get install python3-pip)
output=$(sudo pip3 install -U pip)
output=$(sudo pip3 install -U pip testresources setuptools numpy==1.16.1 future==0.17.1 mock==3.0.5 h5py==2.9.0 keras_preprocessing==1.0.5 keras_applications==1.0.8 gast==0.2.2 futures protobuf pybind11)
# TF-2.x
#sudo pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v44 tensorflow==2.3.1+nv20.11
# TF-1.15
output=$(sudo pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v44 "tensorflow<2")

echo ==========INSTALL JETSON TOP============
sleep 3
output=$(sudo pip3 install jetson-stats)
output=$(sudo systemctl restart jetson_stats.service)

echo ==========INSTALL CUDA PATH============
sleep 3
cd ~
echo export PATH=/usr/local/cuda/bin:$PATH >> .bashrc
echo export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH >> .bashrc
echo export CUDA_ROOT=/usr/local/cuda >> .bashrc
source .bashrc
sleep 3
echo CUDA TEST
nvcc -V

sleep 3
echo ===========INSTALL 6G SWAP==============
output=$(git clone https://github.com/JetsonHacksNano/installSwapfile)
output=$(./installSwapfile/installSwapfile.sh)

sleep 3
echo ===========INSTALL OTHER APP=============
output=$(sudo apt-get install emacs)
output=$(sudo apt-get install vlc)
output=$(pip install pillow)
output=$(pip install matplotlib)
output=$(pip install configparser)

touch JetSetup.log
echo output >> JetSetup.log

echo ===WARNING!!!!!!___WILL REBOOT IN 10 SECONDS===
sleep 10
reboot
