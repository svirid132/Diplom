#ifndef WAVFILE_H
#define WAVFILE_H

#include <QFile>

struct chunk
{
    char        id[4];
    quint32     size;
};

struct RIFFHeader
{
    chunk       descriptor;     // "RIFF"
    char        type[4];        // "WAVE"
};

struct WAVEHeader
{
    chunk       descriptor;
    quint16     audioFormat;
    quint16     numChannels;
    quint32     sampleRate;
    quint32     byteRate;
    quint16     blockAlign;
    quint16     bitsPerSample;
};

struct DATAHeader
{
    chunk       descriptor;
};

struct CombinedHeader
{
    RIFFHeader  riff;
    WAVEHeader  wave;
};

class WavFile : public QFile
{
public:
    explicit WavFile(QObject *parent = nullptr);
    bool open(QString);
    QByteArray monoRead();
    int getDurationSec();

    int dataSize();
    int getSampleSize();
private:
    bool readHeader();
    CombinedHeader header;
    int headerLength;
};

#endif // WAVFILE_H
