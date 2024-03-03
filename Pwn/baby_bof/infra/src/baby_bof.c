#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define BUFLEN 64

void banner() {
    puts("\n================================================");
    puts("|| Welcome to my obviously vulnerable program ||");
    puts("================================================\n");
}

void menu() {
    puts("1. Ask for the flag");
    puts("2. Give up");
    printf("> ");
}

int main () {

    setvbuf(stdin, NULL, _IONBF, 0);
    setvbuf(stdout, NULL, _IONBF, 0);
    setvbuf(stderr, NULL, _IONBF, 0);

    banner();

    char buffer[BUFLEN];
    char c;
    char nl;

    while (1) {

        menu();
        c = getchar();
        nl = 0;

        while(nl != '\n') {
            nl = getchar();
        }

        switch(c) {
            case '1':
                puts("Ask nicely enough, and I shall reward you with a flag");
                printf("> ");
                read(0, buffer, 0x1337);
                printf("\nYou say : %s\n", buffer);
                puts("I say : lmao\n");
                break;

            case '2':
                puts("You shamefully give up and won't get your free flag");
                puts("I hope you are proud of yourself, because I am not");
                return 0;
        }
    }

    return 0;
}