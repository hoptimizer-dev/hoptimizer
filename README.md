# Hoptiwasm [WIP]

**WIP** not finished yet but it is basically working.

[![WASM Build](https://github.com/hoptimizer-dev/hoptimizer/actions/workflows/build-wasm.yaml/badge.svg)](https://github.com/hoptimizer-dev/hoptimizer/actions/workflows/build-wasm.yaml)

this is a test example to showcase Webassembly in combination with Qt/qml

## Installation procedure

install qt 6.6
(online installer)
I'm using qt 6.6.2 at the momentt

https://www.qt.io/download


install with Webassembly enabled (which is included per default when you just check the whole qt 6.6.2 package

```
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
```
Each Qt version requires a specific version of the emsdk: https://doc.qt.io/qt-6/wasm.html . For Qt 6.6 this version is right. 
```
./emsdk install 3.1.37
./emsdk activate 3.1.37
```
on mac make emsdk availabe in the terminal.

*for the current shell:*

`source /path/to/emsdk/emsdk_env.sh`

*forever (assuming you are using zsh):*

```echo 'source "/Users/psch/dev/emsdk/emsdk_env.sh"' >> $HOME/.zprofile```

*Check if it worked*

`em++ --version`

in Qt Creator set up emsdk path
`-> go to Qt Creator's preferences (CMD+,) -> devices -> webassembly -> choose emsdk folder -> (e.g. ~/dev/emsdk)`

Now you can simply open the project in Qt creator. Choose the file `Hoptiwasm/CMakeLists.txt`

## **----run----**

Probably your firefox browser open up automatically and shows the application. Choose the target with the configuration button above the play button in the lower left corner. 

**press play**
