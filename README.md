Welcome!  The following is a small example for utilizing our test framework.

# Compile to Java

Run the provided shell script

    $ ./dafny-compile-java.sh

which will cross-compile all .dfy files in the dafny directory and place the target code in a project structure that Maven expects.  The script will also replace the stubbed Assertions.java file with a more complete JUnit assertion library from the utils directory.

## Run JUnit tests with Maven

At this point, you can use commands such as 

    $ mvn clean test

to run your test suites.

## Jacoco Coverage Report

To generate coverage reports for your test suite using Jacoco, run

    $ mvn test jacoco:report

# Compile to C# using XUnit

Run the provided shell script

    $ ./dafny-compile-cs.sh

which will cross-compile all .dfy files and place the target code in a single file within the dafny directory.  

Utils.dfy contains an Assertions class that is not included in the cross-compilation.  You will need to include the XUnit assertion library found in utils/Assertions.cs in order for your tests to run.  This can be accomplished by deleting the stub definition of the Assertions class from the generated .cs file.  Dotnet will automatically include utils/Assertion.cs.

## Run XUnit tests with dotnet

To run the XUnit tests

    $ dotnet test DafnyTests.csproj

## Coverlet Coverage Report

To generate coverage reports for your test suite using Coverlet, run

    $ dotnet test DafnyTests.csproj /p:CollectCoverage=true /p:IncludeTestAssembly=true

To parse the produced .json file into a more readable coverage report, run

    $ reportgenerator -reports:"coverage.json" -targetdir:"coveragereport" -reporttypes:Html

The report can be found at coveragereport/index.html