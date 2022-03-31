#!/bin/sh

MODULENAME=Mult
DOTNET="/usr/bin/dotnet"
DAFNY="${HOME}/byu/dafny/Binaries/Dafny.dll"
MODEL="./dafny/${MODULENAME}Tests.dfy"
ARGS="/verifyAllModules /compileTarget:java /compile:1 /spillTargetCode:1 /out:${MODULENAME}"

# Create Maven directory structure
rm -rf src
mkdir src
mkdir src/main
mkdir src/main/java
mkdir src/test
mkdir src/test/java

# Generate Java from Dafny model and move srcs
${DOTNET} ${DAFNY} ${MODEL} $ARGS

# Clean build files
find ./${MODULENAME}-java -name "*.class" | xargs rm -rf

# Move generated source files into Maven structure
mv ./${MODULENAME}-java/Utils_Compile src/test/java/.
mv ./${MODULENAME}-java/${MODULENAME}_Compile src/main/java/.
mv ./${MODULENAME}-java/${MODULENAME}Tests_Compile src/test/java/.
mv ./${MODULENAME}-java/dafny src/main/java/.

# Clean the output directory
rm -rf ./${MODULENAME}-java

# Copy Assertion library to project
cp utils/Assertions.java src/test/java/Utils_Compile/Assertions.java