include "Utils.dfy"


module Mult {

    export reveals Calculator
            provides Calculator.mult

    class Calculator {

        static method mult(a : int, b : int) returns (res : int)
        ensures a * b == res {
            return a * b;
        }
    }

}