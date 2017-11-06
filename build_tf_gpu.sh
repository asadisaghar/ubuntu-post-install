# install bazel
sudo apt-get install openjdk-8-jdk
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update && sudo apt-get install -y oracle-java8-installer
echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install bazel
sudo apt-get -y upgrade bazel

#clone tensorflow and configure it
git clone https://github.com/tensorflow/tensorflow.git
./configure
#answer questions!
export flags=” — config=opt — config=cuda -k”

# install numpy
sudo pip2 install numpy

# follow this - https://github.com/yaroslavvb/tensorflow-community-wheels
tmux new-session -s bazel -n 0
cd ~/tensorflow
source activate bazel-tensorflow

export LD_LIBRARY_PATH="/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH"
export flags="--config=opt --config=cuda -k"
export tag=xlamem
export date=feb22

bazel build $flags -k //tensorflow/tools/pip_package:build_pip_package
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
mkdir -p ~/tfbins/$date.$tag
cp `find /tmp/tensorflow_pkg -type f ` ~/tfbins/$date.$tag
bazel test $flags //tensorflow/...
