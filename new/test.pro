######################################################################
# Automatically generated by qmake (2.01a) Mon Jan 17 20:04:29 2011
######################################################################

TEMPLATE = app
TARGET = test
DEPENDPATH += .
INCLUDEPATH += .

CONFIG += release
;CONFIG += debug
QT += core
;QT += core gui declarative


;unix {
    ;CONFIG += link_pkgconfig
    ;PKGCONFIG += dbus-python
;}

;INCLUDEPATH += /usr/include/python2.5
;LIBS += -L/usr/lib/python2.5 -lpython2.5

# Input
HEADERS += dict.h trie.h lookup.h
SOURCES += main.cpp lookup.cpp
