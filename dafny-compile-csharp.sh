#!/bin/sh

MODULENAME=Mult
DAFNY="${HOME}/byu/dafny"
MODEL="./dafny/${MODULENAME}Tests.dfy"
ARGS="/compileVerbose:1 /compile:2 /spillTargetCode:3 /noVerify /out:${MODULENAME}.cs"

${DAFNY}/Scripts/dafny ${MODEL} $ARGS