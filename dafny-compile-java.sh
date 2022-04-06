#!/bin/sh

MODULENAME=Mult
DAFNY="${HOME}/byu/dafny"
MODEL="./dafny/${MODULENAME}Tests.dfy"
ARGS="/compileVerbose:1 /compile:2 /spillTargetCode:3 /compileTarget:java /noVerify /out:${MODULENAME}"

# Create Maven directory structure
rm -rf src
mkdir src
mkdir src/main
mkdir src/main/java
mkdir src/test
mkdir src/test/java

# Generate Java from Dafny model and move srcs
${DAFNY}/Scripts/dafny ${MODEL} $ARGS

# Clean build files
find ./${MODULENAME}-java -name "*.class" | xargs rm -rf

# Move generated source files into Maven structure
mv ./${MODULENAME}-java/${MODULENAME}_Compile src/main/java/.
mv ./${MODULENAME}-java/${MODULENAME}Tests_Compile src/test/java/.
mv ./${MODULENAME}-java/dafny src/main/java/.

# Add the external Assertions library to the test directory
mv ./${MODULENAME}-java/Utils_Compile src/test/java/.
cp utils/Assertions.java src/test/java/Utils_Compile/Assertions.java

# Move left over files to the main directory
mv ./${MODULENAME}-java/* src/main/java/.

# Remove unneccessary files
rm -r src/main/java/_System
rm src/main/java/${MODULENAME}.java

# Clean the output directory
rm -rf ./${MODULENAME}-java
