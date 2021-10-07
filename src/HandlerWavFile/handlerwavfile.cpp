#include "handlerwavfile.h"

#include <src/WafFile/wavfile.h>

#include <QDebug>

#include <src/MathLogic/MathLogicFunc.cpp>
#include <cmath>

HandlerWavFile::HandlerWavFile()
{

}

//for testing
template <typename T>
void testingWriteData(T arr, int length, QString fileName) {
    QFile file;
    file.setFileName(fileName);
    file.open(QIODevice::WriteOnly);
    QTextStream stream(&file);
    for (int i = 0; i < length; ++i) {
        stream << "data " << i << ": " << +arr[i] << "\r\n";
//            qDebug() << "data int: " << i << ampSet[i];
    }
}

void HandlerWavFile::handle(int periodSec, int countPeriod, int minAmpProcent, QString fileName){
    WavFile file;
    try {
        file.open("D:/Project/Diplom/Diplom/assets/Hero Death/square.wav");
        QByteArray data = file.monoRead();

        testingWriteData(data, data.length(), "data_char.txt");

        int sampleSize = file.getSampleSize();
        QList<int> ampSet;
        char charNum[sampleSize];

        int position = 0;
        int maxUnsignedChar = 0;

        qDebug() << "duration:" << file.getDurationSec();

        for (int i = 0; i < data.length(); i += sampleSize) {
            int num = 0;
            for (int a = 0; a < sampleSize; ++a) {
                num = (num << 8) | static_cast<char>(data[i + sampleSize - a - 1]);
            }
            ampSet.append(num);
        }

        testingWriteData(ampSet, ampSet.length(), "testing_ampSet.txt");

        int maxAmp = maxValue<int>(ampSet.data(), ampSet.length());
        int minAmp = minValue<int>(ampSet.data(), ampSet.length());
        int procAmp = calcProcAmp(maxAmp, minAmp, 0.75);
        QList<int> filterAmpSet;
        for (int i = 0; i < ampSet.length(); ++i) {
            if (ampSet[i] >= procAmp) {
                filterAmpSet.append(ampSet[i]);
            }
        }
        qDebug() << "size AmpSet:" << ampSet.length() << "size filterAmpSet:" << filterAmpSet.length();


    }  catch (...) {
        qDebug() << "ошибка";
    }
}

int HandlerWavFile::calcProcAmp(int maxAmp, int minAmp, float proc) {
    int lengthAmp = abs(maxAmp) + abs(minAmp);
    int procLenghtAmp = lengthAmp * proc;
    int procAmp = minAmp + procLenghtAmp;
    return procAmp;
}
