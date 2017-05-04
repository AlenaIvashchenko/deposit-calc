#include "deposit.h"
#include "ctest.h"

CTEST(validoTest1,First){
	const int result = getInput(0,0);
	const int expected = 0;
	ASSERT_EQUAL(expected,result);
}
CTEST(validoTest2,Second){
	const int result = getInput(400,0);
	const int expected = 1;
	ASSERT_EQUAL(expected,result);
}
CTEST(validoTest3,Thirds){
	const int result = getInput(280,0);
	const int expected = 0;
	ASSERT_EQUAL(expected,result);
}
CTEST(validoTest4,Fourth){
	const int result = getInput(0,-100);
	const int expected = 1;
	ASSERT_EQUAL(expected,result);
}
CTEST(validoTest5,Fifth){
	const int result = getInput(25,100);
	const int expected = 0;
	ASSERT_EQUAL(expected,result);
}
