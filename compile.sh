#!/bin/bash
flex conversor_epa_consonantes.l 
gcc lex.yy.c -o consonantes
(./consonantes < entrada) > tmp
flex conversor_epa_vocales.l
gcc lex.yy.c -o vocales
(./vocales < tmp) > salida
rm lex.yy.c tmp vocales consonantes
