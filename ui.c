#include "ui.h"

void cls() {
   	#if defined(__MINGW32__) || defined(_MSC_VER) || defined(WIN32)
		system("cls");
	#else
		system("clear");
	#endif
}

void printBoard(int board[]) {
    cls();
	printf("+---+---+---+\n");
	for (int i = 0; i < 9; i++) {
        if (board[i] > 0) printf("| %c ", board[i] == 1 ? 'X' : 'O' );
        else printf("|   ");
		if (i == 2 || i == 5) {
			printf("|");
			printf("\n+---+---+---+\n");
		}
	}
	printf("|");
	printf("\n+---+---+---+\n");
}