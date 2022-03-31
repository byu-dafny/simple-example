Welcome!  The following is a small example for utilizing our test framework.

# Compile to Java & Run with Maven

Run the provided shell script

    $ ./dafny-compile-java.sh

which will cross-compile all .dfy files in the dafny directory and place the target code in a project structure that Maven expects.  The script will also replace the stubbed Assertions.java file with a more complete JUnit assertion library from the utils directory.

At this point, you can use commands such as 

    $ mvn clean test

to run your test suites.

# Compile to C# using XUnit

Run the provided shell script

    $ ./dafny-compile-cs.sh

which will cross-compile all .dfy files and place the target code in a single file within the dafny directory.  

Utils.dfy contains an Assertions class that is not included in the cross-compilation.  You will need to inject the XUnit assertion library found in utils/Assertions.cs in order for your tests to run.

To run the XUnit tests

    $ test DafnyTests.csproj