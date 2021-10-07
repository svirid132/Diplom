#ifndef HANDLERWAVFILE_H
#define HANDLERWAVFILE_H

#include <QString>



class HandlerWavFile
{
public:
    HandlerWavFile();

    void handle(int periodSec, int countPeriod, int minAmpProcent, QString fileName);
private:
    int calcProcAmp(int maxAmp, int minAmp, float proc);
};

#endif // HANDLERWAVFILE_H
