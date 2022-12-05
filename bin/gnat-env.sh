#!/usr/bin/env bash

BINARIES=("/home/modolo/opt/GNAT/2021/bin"
"/home/modolo/opt/GNAT/2021/libexec/gnatstudio/clang/bin"
"/home/modolo/opt/GNAT/2021/libexec/gnatstudio/als"
"/home/modolo/opt/GNAT/2021/libexec/gnatstudio/gnathub/bin"
"/home/modolo/opt/GNAT/2021/libexec/gnatstudio/gnathub/share/gnathub/python/bin"
"/home/modolo/opt/GNAT/2021/libexec/spark/bin"
"/home/modolo/opt/GNAT/2021/share/gdb-10/python-3.8/bin"
"/home/modolo/opt/GNAT/2021/share/examples/gnat/other_languages/bin"
"/home/modolo/opt/GNAT/2021/share/examples/gnat/full_project/bin"
)

TMP=""
EXEC_PATH=""

for binary in ${BINARIES[@]}
do
  TMP="$TMP${binary}:"
  EXEC_PATH="$EXEC_PATH\"${binary}\" "
done
echo $TMP
echo
echo $EXEC_PATH
export PATH="$TMP$PATH"


