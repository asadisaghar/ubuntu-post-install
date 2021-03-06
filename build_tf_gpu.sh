#The libcupti-dev library, which is the NVIDIA CUDA Profile Tools Interface. 
#This library provides advanced profiling support. 
sudo apt-get install -y libcupti-dev

# install bazel
sudo apt-get install openjdk-8-jdk
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update && sudo apt-get install -y oracle-java8-installer
echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install bazel
sudo apt-get -y upgrade bazel

# install python dependencies
sudo apt-get install -y python-numpy python-dev python-pip python-wheel

#clone tensorflow and configure it
git clone https://github.com/tensorflow/tensorflow.git
./configure
#answer questions!

bazel build --config=opt --config=cuda --cxxopt="-D_GLIBCXX_USE_CXX11_ABI=0" //tensorflow/tools/pip_package:build_pip_package
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
sudo pip2 install /tmp/tensorflow_pkg/tensorflow-1.4.0rc1-cp27-cp27mu-linux_x86_64.whl

