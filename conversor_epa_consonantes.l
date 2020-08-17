%{
#include<stdio.h>
#include<stdlib.h>
int yywrap(void);
int yylex(void);
void eliminar_final(char* cadena, int cadena_l, int caracteres_a_eliminar){
	cadena[cadena_l-caracteres_a_eliminar]='\0';
}
%}

vocal	([aAáÁeEéÉiIíÍoOóÓuUúÚ])

zs	(s|z)
ZS	(S|Z)
cs (c|s)
CS (C|S)
ck (c|k)
CK (C|K)
qk (qu|k)
QK	(Qu|K)
gu	(gu)
Gu	(Gu)
w	(w)
W	(W)

ch	(ch)
Ch	(Ch)
ll	(ll)
Ll	(Ll)
 /*letras_iguales	(b|B|d|D|f|F|ga|Ga|go|Go|gu|Gu|m|M|n|N|ñ|Ñ|p|P|r|R|t|T) */

%%

 /*Diccionario*/
[Jj]oder[ ]tí[oa]	{printf("Lavín compae");}
[ ]todos	{printf("tôh");}
^Todos		{printf("Tôh");}
[ ]todas	{printf("toâ");}
^Todas	{printf("Toâ");}
 /**/

{zs}/[aáoóuú]	{printf("ç");}
{ZS}/[aáoóuú]	{printf("Ç");}
{cs}/[eéií]	{printf("ç");}
{CS}/[eéií]	{printf("Ç");}
{ck}/[aáoóuú]	{printf("c");}
{CK}/[aáoóuú]	{printf("C");}
{qk}/[eéií]	{printf("qu");}
{QK}/[eéií]	{printf("Qu");}
{gu}/[eéií]	{printf("g");}
{Gu}/[eéií]	{printf("G");}
{w}/{vocal}	{printf("gu");}
{W}/{vocal}	{printf("Gu");}

v		{printf("b");}
V		{printf("B");}
j		{printf("h");}
J		{printf("H");}
g/[ei]	{printf("h");}
G/[ei]	{printf("H");}
{ch} 	{printf("x");}
{Ch}	{printf("X");}
[hH]	{}
{ll}	{printf("y");}
{Ll} 	{printf("Y");}

^[L]a[ ][hH]?[a]	{printf("L'a");}
^[l]a[ ][hH]?[a]	{printf("l'a");}
^[L]a[ ][hH]?[A]	{printf("L'A");}
^[l]a[ ][hH]?[A]	{printf("l'A");}
[ ][L]a[ ][hH]?[a]	{printf(" L'a");}
[ ][l]a[ ][hH]?[a]	{printf(" l'a");}
[ ][L]a[ ][hH]?[A]	{printf(" L'A");}
[ ][l]a[ ][hH]?[A]	{printf(" l'A");}
[^ \n\t\.]{3,}ada	{eliminar_final(yytext, yyleng, 3); printf("%sá",yytext);}	/* Cambia ***ada por *á (hablada->hablá) */
[ \t][^ \n\t\.]{3,}ada	{eliminar_final(yytext, yyleng, 3); printf("%sá",yytext);}
 /*{letras_iguales}	ECHO;*/
.	ECHO;

%%

int yywrap(void)	{printf("\n");	return 1;}

int main(int narg, char* arg[])	{
	return yylex();
}
