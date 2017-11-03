# make a new virtualenv
mkvirtualenv dl4cv -p python3
workon dl4cv

#clone OpenCV and OpenCV-contrib
cd ~
wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.3.0.zip
wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/3.3.0.zip

unzip opencv.zip
unzip opencv_contrib.zip

#run CMake
cd ~/opencv-3.3.0/
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D WITH_CUDA=OFF \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.3.0/modules \
    -D BUILD_EXAMPLES=ON ..
    
#compile OpenCV
make -j4 #or whatever number of cores available

#install OpenCV
sudo make install
sudo ldconfig
cd ~

# symlink OpenCV to the virtualenv
cd ~/.virtualenvs/dl4cv/lib/python3.5/site-packages/
ln -s /usr/local/lib/python3.5/site-packages/cv2.cpython-35m-x86_64-linux-gnu.so cv2.so
cd ~
