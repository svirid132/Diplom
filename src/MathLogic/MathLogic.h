#ifndef MATHLOGIC_H
#define MATHLOGIC_H
#include "ArrValues.h"

struct ArrValues{
    float* impulses;
    float* depths;
    int length;
};


class MathLogic {
    ArrValues arrValues;
    float sampleHeight;
    float zeroImpulse;
    float maxImpulse;
    float maxDepthFromImpulses;
    float height;
    float stockRatio;//Коэффицент запаса

public:
    static float maxValue(const float* array, int length);
    static float findMaxXFromY(const float* Xs, const float* Ys, int length);
    static float calcStockRatio(float sampleHeight, float height, float maxImpulse, float zeroImpulse);
    MathLogic() {};
    void setImpulses(const float* array, int lenght);
    void setUserSettings(float sampleHeight, float height);
    ArrValues getArrValues();
};

#endif // MATHLOGIC_H
