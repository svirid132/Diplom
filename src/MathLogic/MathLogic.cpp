#include "MathLogic.h"

#include <QDebug>
#include <cmath>

float MathLogic::maxValue(float const* array, int length) {
    float max = 0;
    for (int i = 0; i < length; ++i) {
        if (max < array[i]) {
            max = array[i];
        }
    }
    return max;
}

float MathLogic::findMaxXFromY(const float *Xs, const float *Ys, int length)
{
    const float maxY = maxValue(Ys, length);

    int maxYOnIndex = 0;
    for (int i = 0; i < length; ++i) {
        if (maxY == Ys[i]) {
            maxYOnIndex = i;
        }
    }

    return Xs[maxYOnIndex];
}

float MathLogic::calcStockRatio(float sampleHeight, float height, float maxImpulse, float zeroImpulse)
{
    float sampleHeightOnHeight = sampleHeight / height;
    float maxImpulseOnZeroImpulse = maxImpulse / zeroImpulse;
    float calcValue =
            (float(4.8)*std::pow(sampleHeightOnHeight, 3) +
            float(14.0229)*pow(sampleHeightOnHeight, 2) -
            float(1.5029) * sampleHeightOnHeight +
            float(7.3129)) / maxImpulseOnZeroImpulse;
    return calcValue;
}

CriticalPoint MathLogic::calcCriticalPoint(float sampleHeight, float height, float maxImpulse, float zeroImpulse)
{
    float sampleHeightOnHeight_touch = sampleHeight / height * 20 + 1;
    float maxImpulseOnZeroImpulse = maxImpulse / zeroImpulse;

    const CriticalPoint criticalPoint = {sampleHeightOnHeight_touch, maxImpulseOnZeroImpulse};
    return criticalPoint;
}

void MathLogic::setUserSettings(float sampleHeight, float height) {
    this->sampleHeight = sampleHeight;
    this->height = height;
}

ArrValues MathLogic::getArrValues() {
    return this->arrValues;
}

void MathLogic::setImpulses(const float *array, int lenght)
{
    float step = this->sampleHeight / float(lenght - 1);

    arrValues = {new float[lenght], new float[lenght], lenght};
    for (int i = 0; i < lenght; ++i) {
        arrValues.impulses[i] = array[i];
        if (i == 0){
            arrValues.depths[0] = 0;
            continue;
        }
            arrValues.depths[i] = step + arrValues.depths[i - 1];
    }

    zeroImpulse = array[0];
    maxImpulse = this->maxValue(array, lenght);

    maxDepthFromImpulses = this->findMaxXFromY(arrValues.impulses, arrValues.depths, lenght);

    stockRatio = calcStockRatio(sampleHeight, height, maxImpulse, zeroImpulse);
}


