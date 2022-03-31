include "Mult.dfy"
include "Utils.dfy"



module MultTests {

    import opened Mult
    import opened Utils

    class CalculatorTests {

        static method Mult_Source() returns (testInputs : seq<(int, int, int)>)
        {
            return [
                (2, 3, 6),
                (40, -2, -80),
                (-7, -7, 49)
            ];
        }

        method {:test "MethodSource", "Mult_Source"} test_mult_shouldMultTwoArguments(a : int, b : int, expected : int) 
        requires expected == a * b 
        {
            var product := Calculator.mult(a, b);
            Assertions.assertEquals(expected, product);
        }

    }

}
    