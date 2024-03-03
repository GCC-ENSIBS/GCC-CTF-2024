#include <seccomp.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

__attribute__ ((__constructor__)) 
void setup() {
    setvbuf(stdin, NULL, _IONBF, 0);
    setvbuf(stdout, NULL, _IONBF, 0);
    setvbuf(stderr, NULL, _IONBF, 0);
    
    srand(time( NULL ));


    void* ctx;

    ctx = seccomp_init(SCMP_ACT_KILL);
    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(read), 0);
    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(write), 0);
    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(open), 0);
    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(close), 0);
    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(mmap), 0);
    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(munmap), 0);
    seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(exit), 0);

    seccomp_load(ctx);


}

void banner() {
 puts("_______        _______  ______       ______  _____  _     _        _______ _______ _______ _______");
 puts("|______ |      |_____| |  ____      |_____/ |     | |     | |      |______    |       |    |______");
 puts("|       |_____ |     | |_____|      |    \\_ |_____| |_____| |_____ |______    |       |    |______");
 puts("\nNo skill, only luck ;)\n");
                                                                                                   
}

void menu() {
    puts("1. Place a bet");
    puts("2. Delete a bet");
    puts("3. Turn the roulette");
    printf("> ");
}

void win() {
    puts("You won");
    puts("Like, actually won");
    puts("You are not supposed to win");
    puts("You probably cheated, this function is not supposed to get called");
    exit(0);
}

void lose() {
    puts("You lose, and we win");
    exit(0);
}



int main () {

    banner();

    char placed = 0;
    char player_byte;
    unsigned int idx;

    char c;
    char nl;
    int size;

    char* bet;

    while (1) {

        menu();

        c = 0;
        nl = 0;

        c = getchar();
        while (c == '\n') {
            c = getchar();
        }

        while(nl != '\n') {
            nl = getchar();
        }

        switch(c) {
            case '1':
                if (placed == 1) {
                    puts("You already have a bet placed");
                    break;
                }

                puts("How many bytes would you like to bet on ?");
                printf("> ");
                scanf("%ud", &size);

                if (size < 128) {
                    puts("Not enough bytes");
                    puts("The bet is not risky enough");
                    break;
                }

                if (size > 135168) {
                    puts("Come on, you cannot be THAT lucky ;)");
                    break;
                }

                
                bet = malloc(size);
                for (unsigned int i = 0; i < size; i++) {
                    bet[i] = rand() % 256;
                    while (bet[i] < 0x20 || bet[i] > 0x7e) {
                        bet[i] = rand() % 256;
                    }
                }
                puts("Random pattern generated successfully");

                puts("\nAs a sign of good will, we will let you modify set exactly one byte in this sea of randomness");
                puts("Please choose the index of the byte to modify");
                printf("> ");
                scanf("%ud", &idx);

                if (idx < 0) {
                    puts("At least you tried :D");
                    break;
                }

                puts("Please set the new value of this byte");
                printf("> ");
                scanf("%ud", &player_byte);

                bet[idx] = player_byte;
                puts("Modification successful");

                placed = 1;
                break;

            case '2':
                if (placed == 0) {
                    puts("You have no bet placed");
                    break;
                }

                free(bet);
                bet = NULL;
                puts("Bet successfully deleted");

                placed = 0;
                break;

            case '3':
                if (placed == 0) {
                    puts("You have not placed a bet !");
                    break;
                }

                printf("Your bet : %s\n", bet);

                for (unsigned int i = 0; i < size; i = i+3) {
                    if (bet[i] != 'G') {
                        lose();
                    }
                    if (bet[i+1] != 'C') {
                        lose();
                    }
                    if (bet[i+2] != 'C') {
                        lose();
                    }
                }

                win();
                break;
            
        }
    }

}
