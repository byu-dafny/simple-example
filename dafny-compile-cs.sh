#!/bin/sh

MODULENAME=Mult
DOTNET="/usr/bin/dotnet"
DAFNY="${HOME}/byu/dafny/Binaries/Dafny.dll"
MODEL="${MODULENAME}Tests.dfy"
ARGS="/verifyAllModules /compile:0 /spillTargetCode:3 /out:${MODULENAME}"

cd dafny

${DOTNET} ${DAFNY} ${MODEL} $ARGS

cd ..