%{
#include<stdio.h>
#include<stdlib.h>
int yywrap(void);
int yylex(void);
void eliminar_final(char* cadena, int cadena_l, int caracteres_a_eliminar){
	cadena[cadena_l-caracteres_a_eliminar]='\0';
}

%}

no_vocal	([^aAáÁeEéÉiIíÍoOóÓuUúÚ])

aa	(as)
AA	(As)
ee	(es)
EE	(Es)
ii	(is)
II	(Is)
oo  (os)
OO  (Os)
uu	(us)
UU  (Us)
alr (al|ar|ad|aj|az)
Alr (Al|Ar|Ad)
elr (el|er|ed|ez)
Elr (El|Er)
ilr (il|ir|id|iz)
Ilr (Il|Ir)
olr (ol|or|od|oz)
Olr (Ol|Or)
ulr (ul|ur|ud|uz)
Ulr (Ul|Ur)
a-	(ás)
A-	(Ás)
e-	(és)
E-	(És)
i-	(ís)
I-	(Ís)
o-	(ós)
O-	(Ós)
u-	(ús)
U-	(Ús)


%%

{aa}/{no_vocal}	{printf("â");}
{AA}/{no_vocal}	{printf("Â");}
{ee}/{no_vocal}	{printf("ê");}
{EE}/{no_vocal}	{printf("Ê");}
{ii}/{no_vocal}	{printf("î");} 			
{II}/{no_vocal}	{printf("Î");}
{oo}/{no_vocal}	{printf("ô");}
{OO}/{no_vocal}	{printf("Ô");} 
{uu}/{no_vocal}	{printf("û");}
{UU}/{no_vocal}	{printf("Û");}
[ \n][^ \t\n-\"\']{2,}{alr}/[ \.\n]		{eliminar_final(yytext, yyleng, 2); printf("%sâ", yytext);}
[ \n][^ \t\n-\"\']{2,}{Alr}/[ \.\n]		{eliminar_final(yytext, yyleng, 2); printf("%sÂ", yytext);}
[ \n][^ \t\n-\"\']{2,}{elr}/[ \.\n]		{eliminar_final(yytext, yyleng, 2); printf("%sê", yytext);}
[ \n][^ \t\n-\"\']{2,}{Elr}/[ \.\n]		{eliminar_final(yytext, yyleng, 2); printf("%sÊ", yytext);}
[ \n][^ \t\n-\"\']{2,}{ilr}/[ \.\n]		{eliminar_final(yytext, yyleng, 2); printf("%sî", yytext);}
[ \n][^ \t\n-\"\']{2,}{Ilr}/[ \.\n]		{eliminar_final(yytext, yyleng, 2); printf("%sÎ", yytext);}
[ \n][^ \t\n-\"\']{2,}{olr}/[ \.\n]		{eliminar_final(yytext, yyleng, 2); printf("%sô", yytext);}
[ \n][^ \t\n-\"\']{2,}{Olr}/[ \.\n]		{eliminar_final(yytext, yyleng, 2); printf("%sÔ", yytext);}
[ \n][^ \t\n-\"\']{2,}{ulr}/[ \.\n]		{eliminar_final(yytext, yyleng, 2); printf("%sû", yytext);}
[ \n][^ \t\n-\"\']{2,}{Ulr}/[ \.\n]		{eliminar_final(yytext, yyleng, 2); printf("%sÛ", yytext);}
{a-}/{no_vocal}	{printf("âh");}
{e-}/{no_vocal}	{printf("êh");}
{E-}/{no_vocal}	{printf("Êh");}
{i-}/{no_vocal}	{printf("îh");}
{I-}/{no_vocal}	{printf("Îh");}
{o-}/{no_vocal}	{printf("ôh");}
{O-}/{no_vocal}	{printf("Ôh");}
{u-}/{no_vocal}	{printf("ûh");}
{U-}/{no_vocal}	{printf("Ûh");}

%%

int yywrap(void)	{return 1;}

int main()	{
	return yylex();
}
