# Installation procedure

install qt 6.6
(online installer)
I'm using qt 6.6.2

install with Webassembly enabled (which is included per default in when you just check the whole qt 6.6.2 package



git clone https://github.com/emscripten-core/emsdk.git#
cd emsdk

./emsdk install 3.1.37
./emsdk activate 3.1.37

on mac make emsdk availabe

for the current shell:
source /path/to/emsdk/emsdk_env.sh

forever:
echo 'source "/Users/psch/dev/emsdk/emsdk_env.sh"' >> $HOME/.zprofile


in Qt Creator set up emsdk path
-> go to Qt Creator's preferences -> devices -> webassembly -> choose emsdk folder


