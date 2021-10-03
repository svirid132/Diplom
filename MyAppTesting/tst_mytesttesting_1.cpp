#include <QtTest>
#include <QCoreApplication>

// add necessary includes here

#include "func/sum.cpp"

class MyTestTesting_1 : public QObject
{
    Q_OBJECT

public:
    MyTestTesting_1();
    ~MyTestTesting_1();

private slots:
    void initTestCase();
    void cleanupTestCase();
    void test_case1();

};

MyTestTesting_1::MyTestTesting_1()
{

}

MyTestTesting_1::~MyTestTesting_1()
{

}

void MyTestTesting_1::initTestCase()
{

}

void MyTestTesting_1::cleanupTestCase()
{

}

void MyTestTesting_1::test_case1()
{
    QCOMPARE(sum(2, 3), 5);
}

QTEST_MAIN(MyTestTesting_1)

#include "tst_mytesttesting_1.moc"
