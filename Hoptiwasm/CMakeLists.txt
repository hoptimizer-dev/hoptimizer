cmake_minimum_required(VERSION 3.16)

project(Hoptiwasm VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick QuickControls2 Core Svg)

qt_standard_project_setup()

set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOMOC ON)

set(TARGET_NAME appHoptiwasm)

qt_add_executable(${TARGET_NAME}
    main.cpp
    images.qrc # not sure if this is neededd here https://doc.qt.io/qt-6/resources.html
    viewcontroller.h viewcontroller.cpp
    endstationviewcontroller.h endstationviewcontroller.cpp
)

qt_add_qml_module(${TARGET_NAME}
    URI Hoptiwasm
    VERSION 1.0
    RESOURCE_PREFIX /qt/qml
    QML_FILES Main.qml

    RESOURCES images.qrc
    QML_FILES AvbSwitchView.qml
    QML_FILES EndstationView.qml
    QML_FILES ConnectionLine.qml
    SOURCES singletonpattern.h
    SOURCES backend.h backend.cpp
    SOURCES viewcontroller.h viewcontroller.cpp
    SOURCES endstationviewcontroller.h endstationviewcontroller.cpp
    QML_FILES ConnectionMechanism.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(${TARGET_NAME} PROPERTIES

    # MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appHoptiwasm
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(${TARGET_NAME}
    PRIVATE
    Qt6::Quick
    Qt6::QuickControls2
    Qt6::Core
    Qt6::Svg
)

include(GNUInstallDirs)

if(EMSCRIPTEN)
    install(
        FILES "$<TARGET_FILE_DIR:${TARGET_NAME}>/${TARGET_NAME}.js"
        "$<TARGET_FILE_DIR:${TARGET_NAME}>/${TARGET_NAME}.html"
        "$<TARGET_FILE_DIR:${TARGET_NAME}>/${TARGET_NAME}.wasm"
        "$<TARGET_FILE_DIR:${TARGET_NAME}>/qtloader.js"
        "$<TARGET_FILE_DIR:${TARGET_NAME}>/qtlogo.svg"
        DESTINATION .
    )
    install(FILES "$<TARGET_FILE_DIR:${TARGET_NAME}>/${TARGET_NAME}.html" DESTINATION . RENAME index.html)
    set(CPACK_GENERATOR "ZIP")
else()
    install(
        TARGETS appHoptiwasm
        BUNDLE DESTINATION .
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    )
    qt_generate_deploy_qml_app_script(
        TARGET appHoptiwasm
        OUTPUT_SCRIPT deploy_script
    )

    install(SCRIPT ${deploy_script})

    if(APPLE)
        install(CODE "execute_process(COMMAND codesign --force --deep --sign - \${CMAKE_INSTALL_PREFIX}/${TARGET_NAME}.app COMMAND_ERROR_IS_FATAL ANY)")
        set(CPACK_GENERATOR "DragNDrop")
    endif()
endif()

include(CPack)
