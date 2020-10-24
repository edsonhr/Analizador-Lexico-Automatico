package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
if |
for |
do |
while |
begin |
end |
class |
extends |
implements |
while {lexeme=yytext(); return Reservada;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}

"++" {lexeme=yytext(); return Incremento;}
"+=" {lexeme=yytext(); return Suma_Abreviada;}
"+" {lexeme=yytext(); return Suma;}
":=" {lexeme=yytext(); return Asigancion;}
";" {lexeme=yytext(); return Punto_y_coma;}
"{" {lexeme=yytext(); return Llave_abre;}
"}" {lexeme=yytext(); return Llave_cierra;}
"<" {lexeme=yytext(); return Menor_que;}
"<=" {lexeme=yytext(); return Menor_igual_que;}
"<<" {lexeme=yytext(); return Desplazamiento_aritmetico_izquierda;}
"<<<" {lexeme=yytext(); return Desplazamiento_logico_izquierda;}
"*" {lexeme=yytext(); return Multiplicacion;}

{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
{D}|{D}* {lexeme=yytext(); return Entero_positivo_sin_signo;}
"+" {D}|{D}* {lexeme=yytext(); return Entero_positivo_con_signo;}
"-" {D}|{D}* {lexeme=yytext(); return Entero_negativo;}
"+" {D} "." ({D}|{D})* {lexeme=yytext(); return Real_positivo_con_signo;}
{D} "." ({D}|{D})* {lexeme=yytext(); return Real_positivo_sin_signo;}
"-" {D} "." ({D}|{D})* {lexeme=yytext(); return Real_negativo;}
 . {lexeme=yytext(); return ERROR;}