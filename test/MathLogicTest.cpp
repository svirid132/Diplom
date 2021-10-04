#include <QtTest>
#include <QCoreApplication>
#include <QDebug>

// add necessary includes here

#include "src/MathLogic/MathLogic.h"
#include "src/MathLogic/ArrValues.h"

float round(float var)
{
    float value = (int)(var * 100 + .5);
    return (float)value / 100;
}

class MathLogicTest : public QObject
{
    Q_OBJECT

public:
    MathLogicTest() {};
    ~MathLogicTest() {};
    static bool isCompare(const float *ext_1, const float *ext_2, int length);

private:
    MathLogic* logic;

private slots:
    void initTestCase();
    void maxValue();
    void crititcalPoint();
    void calcStockRatio();
    void handleImpulsesData();
    void handleFindMaxXFromY();
//    void cleanupTestCase();
};

bool MathLogicTest::isCompare(const float *ext_1, const float *ext_2, int length) {
    for (int i = 0; i < length; ++i) {
        if (round(ext_1[i]) != round(ext_2[i])) {
            qDebug() << i << ":" << round(ext_1[i]) << round(ext_2[i]);
            return false;
        }
    }
    return true;
};

void MathLogicTest::initTestCase()
{
    this->logic = new MathLogic();
    this->logic->setUserSettings(2.5, 4.5);
}

//void MathLogicTest::cleanupTestCase(){ }

void MathLogicTest::handleImpulsesData() {
    float impulses[20] = {588, 1700, 2500, 2000, 500, 160, 12, 0, 0, 0, 0, 230, 0, 0, 0, 0, 0, 0, 0};
    logic->setImpulses(impulses, 20);
    const ArrValues checkRusults = logic->getArrValues();

    const float expectedDepths[20] = {0, 0.13, 0.26, 0.39, 0.53, 0.66, 0.79, 0.92, 1.05, 1.18, 1.32, 1.45, 1.58, 1.71, 1.84, 1.97, 2.11, 2.24, 2.37, 2.50};

    QCOMPARE(MathLogicTest::isCompare(checkRusults.impulses, impulses, 20), true);
    QCOMPARE(MathLogicTest::isCompare(checkRusults.depths, expectedDepths, 20), true);
    QCOMPARE(checkRusults.length, 20);
}

void MathLogicTest::handleFindMaxXFromY()
{
    const float Xs[3] = {1.3, 2.4, 6.5};
    const float Ys[3] = {5, 6.4, 2.5};
    QCOMPARE(MathLogic::findMaxXFromY(Xs, Ys, 3), float(2.4));
}

void MathLogicTest::maxValue()
{
    float array[6] = {2, 4, 10, 32, 12.432, 432423.54};
    float value = MathLogic::maxValue(array, int(6));
    QCOMPARE(value, float(432423.54));
}

void MathLogicTest::calcStockRatio()
{
     float value = MathLogic::calcStockRatio(float(0.263157895), float(4.5), float(2500), float(588));
     QCOMPARE(round(value), round(float(1.710827716)));
}

void MathLogicTest::crititcalPoint() {
    CriticalPoint point = MathLogic::calcCriticalPoint(float(0.263157895), float(4.5), float(2500), float(588));
    QCOMPARE(round(point.sampleHeightOnHeight_touch), round(float(2.169590643)));
    QCOMPARE(round(point.maxImpulseOnZeroImpulse), round(float(4.25170068)));
}


QTEST_MAIN(MathLogicTest)
#include "MathLogicTest.moc"
