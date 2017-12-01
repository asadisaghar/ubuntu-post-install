apt-get update
apt-get -y upgrade

#first things first
apt-get install -y emacs chromium-browser curl xclip gimp

# setup the work env
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 5
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 5

#install some necessary development tools, image/video I/O, GUI operations etc.
apt-get install build-essential cmake git unzip pkg-config
apt-get install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev
apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
apt-get install libxvidcore-dev libx264-dev
apt-get install libgtk-3-dev
apt-get install libhdf5-serial-dev graphviz
apt-get install libopenblas-dev libatlas-base-dev gfortran
apt-get install python-tk python3-tk python-imaging-tk

#install both python2 and python3
apt-get install python2.7-dev python3-dev

#install pip
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
python3 get-pip.py

#install virtualenv and virtualenvwrapper
pip install virtualenv virtualenvwrapper
rm -rf ~/.cache/pip get-pip.py
echo '# virtualenv and virtualenvwrapper' >> ~/.bashrc
echo 'export WORKON_HOME=$HOME/.virtualenvs' >> ~/.bashrc
echo 'export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3' >> ~/.bashrc
echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc
source ~/.bashrc

#install OpenCV
# Build tools:
sudo apt-get install -y build-essential cmake
# GUI (if you want to use GTK instead of Qt, replace 'qt5-default' with 'libgtkglext1-dev' and remove '-DWITH_QT=ON' option in CMake):
sudo apt-get install -y qt5-default libvtk6-dev
# Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev
# Video I/O:
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev
# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev
# Python:
sudo apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy
# Java:
sudo apt-get install -y ant default-jdk
# Documentation:
sudo apt-get install -y doxygen
sudo apt-get install -y unzip wget
wget https://github.com/opencv/opencv/archive/3.3.0.zip
unzip 3.3.0.zip
rm 3.3.0.zip
mv opencv-3.3.0 OpenCV
cd OpenCV
mkdir build
cd build
cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON -DENABLE_PRECOMPILED_HEADERS=OFF ..
make -j4
sudo make install
sudo ldconfig
