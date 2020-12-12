echo ===================================
echo Starting Hacking Jetson Nano (Author: Wenhao Huang)
echo ===================================
sleep(3)
echo ==========INSTALL TENSORFLOW==========
sleep(3)
sudo apt-get install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev
sudo apt-get install python3-pip
sudo pip3 install -U pip
sudo pip3 install Cython
sudo pip3 install -U numpy grpcio absl-py py-cpuinfo psutil portpicker six mock requests gast h5py astor termcolor protobuf keras-applications keras-preprocessing wrapt google-pasta
# TF-2.x
sudo pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v43 tensorflow==2.1.0+nv20.3

# TF-1.15
#sudo pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v43 tensorflow==1.15.2+nv20.3

echo ==========INSTALL JETSON TOP============
sleep(3)
sudo pip3 install jetson-stats
sudo systemctl restart jetson_stats.service

echo ==========INSTALL CUDA PATH============
sleep(3)
cd ~
echo export PATH=/usr/local/cuda/bin:$PATH >> .bashrc
echo export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH >> .bashrc
echo export CUDA_ROOT=/usr/local/cuda >> .bashrc
source .bashrc
sleep(3)
echo CUDA TEST
nvcc -V

sleep(3)
echo ===========INSTALL 6G SWAP==============
git clone https://github.com/JetsonHacksNano/installSwapfile
./installSwapfile/installSwapfile.sh

sleep(3)
echo ===========INSTALL OTHER APP=============
sudo apt-get install emacs
sudo apt-get install vlc

echo ===WARNING!!!!!!___WILL REBOOT IN 10 SECONDS===
sleep(10)
reboot

