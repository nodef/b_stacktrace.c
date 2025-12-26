#!/usr/bin/env bash
# Fetch the latest version of the library
fetch() {
if [ -d "b_stacktrace" ]; then return; fi
URL="https://github.com/iboB/b_stacktrace/raw/refs/heads/master/include/b_stacktrace.h"
FILE="b_stacktrace.h"

# Download the release
mkdir -p b_stacktrace
echo "Downloading $FILE from $URL ..."
curl -L "$URL" -o "b_stacktrace/$FILE"
echo ""
}


# Test the project
test() {
echo "Running 01-trace.c ..."
clang -I. -o 01.exe examples/01-trace.c                 && ./01.exe && echo -e "\n"
echo "Running 02-trace.cxx ..."
clang++ -std=c++17 -I. -o 02.exe examples/02-trace.cxx  && ./02.exe && echo -e "\n"
echo "Running 03-crash.c ..."
clang -I. -o 03.exe examples/03-crash.c                 && ./03.exe && echo -e "\n"
}


# Main script
if [[ "$1" == "test" ]]; then test
elif [[ "$1" == "fetch" ]]; then fetch
else echo "Usage: $0 {fetch|test}"; fi
