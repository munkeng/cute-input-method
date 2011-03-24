#include "dict.h"

#include <QDebug>
#include <QFile>
#include <QStringList>
#include <QTextStream>

void load( Dict* d, QString file_path ) {
    QFile file( file_path ) ;
    bool flag ;

    flag = file.open( QIODevice::ReadOnly | QIODevice::Text ) ;
    if ( flag ) {
        QTextStream in( &file ) ;
        in.setCodec( "utf-8" ) ;
        while( !in.atEnd() ) {
            QString line = in.readLine() ;
            QStringList list = line.split( " " ) ;
            QString code = list.at(0) ;
            QString pinyin = list.at(1) ;
            QString hanzi = list.at(2) ;
            qreal freq = list.at(3).toFloat() ;
            d->insert( pinyin, hanzi, freq ) ;
        }
    }
}
int main( int argc, char** argv ) {
    Dict d ;
    load( &d, argv[1] ) ;
    QTextStream cin( stdin, QIODevice::ReadOnly ) ;
    qDebug() << "loaded" ;
    while( 1 ) {
        QString key ;
        cin >> key ;
        qDebug() << *(d.find(key)) ;
    }
}