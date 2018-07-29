TEMPLATE = lib
TARGET = $$qtLibraryTarget(owncloudshareplugin)
CONFIG += plugin
DEPENDPATH += .

CONFIG += link_pkgconfig
PKGCONFIG += nemotransferengine-qt5

include($$PWD/../common/common.pri)

# Input
HEADERS += \
    nextcloudconsts.h \
    nextclouduploader.h \
    nextcloudplugininfo.h \
    nextcloudshareplugin.h \
    globaltransfermanager.h

SOURCES += \
    nextcloudplugininfo.cpp \
    nextclouduploader.cpp \
    nextcloudshareplugin.cpp \
    globaltransfermanager.cpp

OTHER_FILES += \
    NextcloudShareUI.qml

target.path = /usr/lib/nemo-transferengine/plugins

shareui.files = $$PWD/*.qml
shareui.path = /usr/share/nemo-transferengine/plugins

shareui_icon_64.files = $$PWD/icons/z1.0/icon-m-share-harbour-owncloud.png
shareui_icon_64.path = /usr/share/themes/sailfish-default/meegotouch/z1.0/icons

shareui_icon_80.files = $$PWD/icons/z1.25/icon-m-share-harbour-owncloud.png
shareui_icon_80.path = /usr/share/themes/sailfish-default/meegotouch/z1.25/icons

shareui_icon_72.files = $$PWD/icons/z1.5-large/icon-m-share-harbour-owncloud.png
shareui_icon_72.path = /usr/share/themes/sailfish-default/meegotouch/z1.5-large/icons

shareui_icon_112.files = $$PWD/icons/z1.75/icon-m-share-harbour-owncloud.png
shareui_icon_112.path = /usr/share/themes/sailfish-default/meegotouch/z1.75/icons

INSTALLS += \
    target \
    shareui \
    shareui_icon_64 \
    shareui_icon_80 \
    shareui_icon_72 \
    shareui_icon_112
