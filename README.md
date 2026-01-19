# b_stacktrace

A minimalistic single-header multi-platform C89 lib for stack tracing, by [Borislav Stanimirov](https://github.com/iboB).

<br>

## Installation

Run:

```sh
$ npm i b_stacktrace.c
```

And then include `b_stacktrace.h` as follows:

```c
// main.c
#define B_STACKTRACE_IMPLENTATION  // or B_STACKTRACE_IMPL
#include <b_stacktrace.h>

int main() { /* ... */ }
```

Finally, compile while adding the path `node_modules/b_stacktrace.c` to your compiler's include paths.

```bash
$ clang -I./node_modules/b_stacktrace.c main.c  # or, use gcc
$ gcc   -I./node_modules/b_stacktrace.c main.c
```

You may also use a simpler approach with the [cpoach](https://www.npmjs.com/package/cpoach.sh) tool, which automatically adds the necessary include paths of all the installed dependencies for your project.

```bash
$ cpoach clang main.c  # or, use gcc
$ cpoach gcc   main.c
```

<br>

## Usage

### C or C++

Including `b_stacktrace.h` provides:

* `char* b_stacktrace_get_string();`- Returns a human-readable stack-trace string from the point of view of the caller. The string is allocated with `malloc` and needs to be freed with `free`.
* `b_stacktrace_handle b_stacktrace_get();` - Returns a stack-trace handle from the point of view of the caller which can be expanded to a string via `b_stacktrace_to_string`. The handle is allocated with `malloc` and needs to be freed with `free`.
* `char* b_stacktrace_to_string(b_stacktrace_handle stacktrace);` - Converts a stack-trace handle to a human-readable string. The string is allocated with `malloc` and needs to be freed with `free`.
* `int b_stacktrace_depth(b_stacktrace_handle stacktrace);` - Returns the number of entries (frames) in the stack-trace handle.

`#define B_STACKTRACE_IMPL` before including `b_stacktrace.h` in *one* C or C++ file to create the implementation

### Optional wrapper for C++17 and newer

*TBD*

<br>

## Examples

The subdirectory `example/` contains several small examples:

* `trace.c` - creates a trace from a C program
* `trace.cpp` - creates a trace from a C++ program, demonstrating more complex symbols (classes, templates)
* `crash.c` - example usage of the provided stack trace: as a crash handler

<br>

## License

The library is distributed under the [MIT Software License](http://opensource.org/licenses/MIT). Copyright &copy; 2020-2025 Borislav Stanimirov.

<br>
<br>


[![](https://raw.githubusercontent.com/qb40/designs/gh-pages/0/image/11.png)](https://wolfram77.github.io)<br>
[![SRC](https://img.shields.io/badge/src-repo-green?logo=Org)](https://github.com/iboB/b_stacktrace)
[![ORG](https://img.shields.io/badge/org-nodef-green?logo=Org)](https://nodef.github.io)
![](https://ga-beacon.deno.dev/G-RC63DPBH3P:SH3Eq-NoQ9mwgYeHWxu7cw/github.com/nodef/b_stacktrace.c)
