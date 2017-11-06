apt-get update
apt-get -y upgrade

#first things first
apt-get install -y emacs
apt-get install -y chromium-browser

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
