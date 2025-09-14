#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>
#include <assert.h>

void listprint(char name[4]) {
    char path[30] = "cheatSheet/";
    strcat(path,name);
    FILE *list = fopen(path,"r");
    assert(list != NULL);

    char *line = NULL;
    size_t line_len = 0;
    while(getline(&line,&line_len,list) != -1) {
        printf("%s",line);
    }
    printf("%s",line);
    free(line);
    fclose(list);
}

int main(int argc,char *argv[]) {
    if (argc!=2) {
        listprint("list");
    }
    if (argc == 2) {
        char name[] = argv;
        listprint(name);
    }


}

