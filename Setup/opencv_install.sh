### Remove all old opencv stuffs installed by JetPack (or OpenCV4Tegra)
$ sudo apt-get purge libopencv*

### I prefer using newer version of numpy (installed with pip), so
### I'd remove this python-numpy apt package as well
$ sudo apt-get purge python-numpy

### Remove other unused apt packages
$ sudo apt autoremove

### Upgrade all installed apt packages to the latest versions (optional)
$ sudo apt-get update
$ sudo apt-get dist-upgrade

### Update gcc apt package to the latest version (highly recommended)
$ sudo apt-get install g++-5 cpp-5 gcc-5

### Install dependencies based on the Jetson Installing OpenCV Guide
$ sudo apt-get install build-essential make cmake cmake-curses-gui \
                       g++ libavformat-dev libavutil-dev \
                       libswscale-dev libv4l-dev libeigen3-dev \
                       libglew-dev libgtk2.0-dev

### Install dependencies for gstreamer stuffs
$ sudo apt-get install libdc1394-22-dev libxine2-dev \
                       libgstreamer1.0-dev \
                       libgstreamer-plugins-base1.0-dev

### Install additional dependencies according to the pyimageresearch
### article
$ sudo apt-get install libjpeg8-dev libjpeg-turbo8-dev libtiff5-dev \
                       libjasper-dev libpng12-dev libavcodec-dev
$ sudo apt-get install libxvidcore-dev libx264-dev libgtk-3-dev \
                       libatlas-base-dev gfortran
$ sudo apt-get install libopenblas-dev liblapack-dev liblapacke-dev

### Install Qt5 dependencies
$ sudo apt-get install qt5-default

### Install dependencies for python3
$ sudo apt-get install python3-dev python3-pip python3-tk

# Download OpenCV 3.4.6 for installation
cd ~
mkdir OpenCV
cd OpenCV
wget -O opencv.zip https://github.com/opencv/opencv/archive/3.4.6.zip
wget -O opencv_contrib.zip  https://github.com/opencv/opencv_contrib/archive/3.4.6.zip

unzip opencv.zip
unzip opencv_contrib.zip
rm -rf opencv.zip
rm -rf opencv_contrib.zip
mv opencv-3.4.6 opencv
mv opencv_contrib-3.4.6 opencv_contrib

# change to venv directory and activate
cd ~/Documents/Venvs/
source wimss/bin/activate

# install packages for opencv
pip install numpy
pip install matplotlib

# setup build for opencv
cd ~/OpenCV/opencv
mkdir build
cd build

PREFIX_MAIN='/home/jetson/Documents/Venvs/wimss'
PREFIX='/home/jetson/.pyenv/versions/3.7.4'
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX="$PREFIX_MAIN" \
	-D PYTHON3_EXECUTABLE="$PREFIX"/bin/python3.7 \
	-D PYTHON3_PACKAGES_PATH="$PREFIX"/lib/python3.7/site-packages \
	-D PYTHON3_LIBRARY="$PREFIX"/lib/libpython3.7m.a \
	-D PYTHON3_INCLUDE_DIR="$PREFIX"/include/python3.7m \
	-D PYTHON3_NUMPY_INCLUDE_DIRS="$PREFIX_MAIN"/lib/python3.7/site-packages/numpy/core/include \
	-D INSTALL_PYTHON_EXAMPLES=OFF \
	-D BUILD_opencv_python3=ON \
	-D PYTHON_DEFAULT_EXECUTABLE="$PREFIX"/bin/python3.7 \
	-D INSTALL_C_EXAMPLES=OFF \
	-D WITH_CUDA=ON \
	-D CUDA_ARCH_BIN="6.2" \
	-D CUDA_ARCH_PTX="" \
	-D WITH_CUBLAS=ON \
	-D ENABLE_FAST_MATH=ON \
	-D CUDA_FAST_MATH=ON \
	-D WITH_LIBV4L=ON \
	-D BUILD_EXAMPLES=OFF ..

#	-D OPENCV_ENABLE_NONFREE=OFF \
#	-D OPENCV_EXTRA_MODULES_PATH=~/OpenCV/opencv_contrib/modules \

make -j3
sudo make install
sudo ldconfig








