module Utils {

    export 
        reveals Assertions
        provides Assertions.assertEquals

    class Assertions {
        static method {:extern} assertEquals<T>(left : T, right : T)
        requires left == right

        static method {:extern} assertTrue(value : bool)
        requires value

        static method {:extern} assertFalse(value : bool)
        requires !value
    }
}