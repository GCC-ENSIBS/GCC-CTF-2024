#!/bin/sh
clang-16 baby_bof.c -o baby_bof -fstack-protector-all -fPIE -Wl,-z,now -Wl,-z,relro -fsanitize=safe-stack -flto -fvisibility=hidden -fsanitize=cfi-vcall -fsanitize=cfi-derived-cast -fsanitize=cfi-unrelated-cast -fsanitize=cfi-nvcall -fsanitize=cfi-icall -fsanitize-cfi-canonical-jump-tables -fcomplete-member-pointers
