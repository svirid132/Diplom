#include <QtTest>
#include <QCoreApplication>

// add necessary includes here

#include "func/sum.cpp"

class MyTestTesting : public QObject
{
    Q_OBJECT

public:
    MyTestTesting();
    ~MyTestTesting();

private slots:
    void initTestCase();
    void cleanupTestCase();
    void test_case1();

};

MyTestTesting::MyTestTesting()
{

}

MyTestTesting::~MyTestTesting()
{

}

void MyTestTesting::initTestCase()
{

}

void MyTestTesting::cleanupTestCase()
{

}

void MyTestTesting::test_case1()
{
    QCOMPARE(sum(2, 3), 5);
}

QTEST_MAIN(MyTestTesting)

#include "tst_mytesttesting.moc"
