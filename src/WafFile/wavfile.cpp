#include "wavfile.h"

#include <QDebug>
#include <QDebug>
#include <QtEndian>
//#include "src/MathLogic/MathLogic.h"

WavFile::WavFile(QObject *parent) :
    QFile(parent),
    headerLength(0)
{
}

bool WavFile::open(QString file)
{
    QFile::setFileName(file);
    headerLength = 0;

    try {
        if(!QFile::open(QIODevice::ReadOnly)) {
            throw QString("Файл невозможно открыть");
        }
        if (!readHeader()) {
            throw QString("Файл невозможно прочитать");
        }
    }  catch (QString error) {
        headerLength = 0;
        qDebug() << error;
        close();
        throw std::move(error);//из l-value в r-value
        return false;
    }

    return true;
}

int WavFile::dataSize() {
    qDebug() << "size:" << size() << "headerLength" << headerLength;
    return size() - headerLength;
}

QByteArray WavFile::monoRead()
{
    QByteArray data = QFile::readAll();
    qDebug() << "data length:" << data.length() << "byte";

    if (header.wave.numChannels != 1) {
        QByteArray newData;
        int countByteOnChanel = header.wave.blockAlign / header.wave.numChannels;
        char blockAlign[header.wave.blockAlign];
        for (int i = 0; i < data.length(); ++i) {
            blockAlign[i % header.wave.blockAlign] = data[i];
            if (i % header.wave.blockAlign == 0 && i) {
                newData.append(blockAlign, countByteOnChanel);
            }
        }
        return newData;
    }

    return data;
}

int WavFile::getDurationSec()
{
    qDebug() << "header.wave.byteRate" << dataSize() << header.wave.byteRate;
    return dataSize() / header.wave.byteRate;
}

int WavFile::getSampleSize() {
    return header.wave.blockAlign / header.wave.numChannels;
}

bool WavFile::readHeader()
{
    CombinedHeader header;
    bool result = read(reinterpret_cast<char *>(&header), sizeof(CombinedHeader)) == sizeof(CombinedHeader);

    if (result) {
        if ((memcmp(&header.riff.descriptor.id, "RIFF", 4) == 0
             || memcmp(&header.riff.descriptor.id, "RIFX", 4) == 0)
                && memcmp(&header.riff.type, "WAVE", 4) == 0
                && memcmp(&header.wave.descriptor.id, "fmt ", 4) == 0
                && (header.wave.audioFormat == 1 || header.wave.audioFormat == 0)) {

            // Read off remaining header information
            DATAHeader dataHeader;

            if (qFromLittleEndian<quint32>(header.wave.descriptor.size) > sizeof(WAVEHeader)) {

                // Extended data available
                quint16 extraFormatBytes;
                if (peek((char*)&extraFormatBytes, sizeof(quint16)) != sizeof(quint16))
                    return false;
                const qint64 throwAwayBytes = sizeof(quint16) + qFromLittleEndian<quint16>(extraFormatBytes);
                if (read(throwAwayBytes).size() != throwAwayBytes)
                    return false;
                headerLength +=throwAwayBytes;
            }

            if (read((char*)&dataHeader, sizeof(DATAHeader)) != sizeof(DATAHeader))
                return false;
        }
    }
    this->header = header;
    headerLength += sizeof(CombinedHeader);
    headerLength += sizeof(DATAHeader);

    qDebug() << "header length: " << headerLength << "byte";

    return result;
}
