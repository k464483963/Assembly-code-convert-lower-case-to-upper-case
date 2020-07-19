#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char str[] = "hello world";
int main(void){
	int i;
	for(i=0; i<strlen(str); i++){
		if(str[i]>='a'&&str[i]<='z'){
			putchar((char)(str[i]-32));
		}
		else{
			putchar(str[i]);
		}
	}
	printf("\n");
	return EXIT_SUCCESS;
}
