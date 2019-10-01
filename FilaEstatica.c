#include "FilaEstatica.h"

Fila* cria_Fila(){
    Fila *fi= (Fila*)  malloc(sizeof(aluno));
    if(fi != NULL){
        fi-> inicio=0;
        fi->final = 0;
        fi->qtd=0;
    }
    return fi;
}