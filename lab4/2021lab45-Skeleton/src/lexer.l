%option noyywrap
%option yylineno
%{
	#include<iostream>
	#include<math.h>
    	#include<string.h>
    /*
    * You will need to comment this line in lab5.
    */
    #define ONLY_FOR_LEX
    extern int yylineno;
    #ifdef ONLY_FOR_LEX
    
    
    #else
    #define YYSTYPE void *
    #include "parser.h"
    #endif

    #define YY_NO_UNPUT
    #define YY_NO_INPUT
    #include <string>

    #ifdef ONLY_FOR_LEX
    #include <ostream>
    #include <fstream>
    #include<iostream>
    #include<math.h>
    #include<string.h>
    using namespace std;
    
    extern FILE *yyin; 
    extern FILE *yyout;
    extern int n;
    char buffer[200];
    char buffer1[200];
    char buffer2[200];
    char buffer3[200];
    char s1[200];
    void DEBUG_FOR_LAB4(std::string s){
    	 sprintf(buffer,"%d",yylineno);
    	 sprintf(buffer1,"%s",yytext);
        std::string DEBUG_INFO = "[DEBUG LAB4]: \t" + s + "\t"+"lexeme: \t" + buffer1 +"\t"+"yylineno: \t" + buffer + "\n";
        fputs(DEBUG_INFO.c_str(), yyout);
       
        
    }
    
    void DEBUG_FOR_LAB4X(std::string s){
    	 sprintf(buffer,"%d",yylineno);
    	 sprintf(buffer2,"%s",s1);
        std::string DEBUG_INFO = "[DEBUG LAB4]: \t" + s + "\t"+"lexeme: \t" + buffer2 +"\t"+"yylineno: \t" + buffer + "\n";
        fputs(DEBUG_INFO.c_str(), yyout);
       
        
    }
   
    
    #endif
%}

DECIMIAL ([1-9][0-9]*|0)

HEX(0[xX][0-9a-fA-F]+)

OCT(0[1-7][0-7]*)

ID [[:alpha:]_][[:alpha:][:digit:]_]*
EOL (\r\n|\n|\r)
WHITE [\t ]
RELATION{>|<|==|>=|<=|!=}
CALCULATION{*|/|%|+|-|=}
EXPRESSION{ID*DECIMIAL|ID+DECIMIAL|ID-DECIMIAL|ID%DECIMIAL|ID/DECIMIAL}
LINECOMMENT \/\/[^\n]*
BLOCKCOMMENT "/*"([^*]|\*+[^*/])*\*+"/"



%%


{LINECOMMENT}

{BLOCKCOMMENT}





"int" {
    /*
    * Questions: 
    *   Q1: Why we need to return INT in further labs?
    *   Q2: What is "INT" actually?
    */
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("INT");
        
      	
       
    #else
        return INT;
    #endif
}
"void" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("VOID");
    #else
        return VOID;
    #endif 
}

    
"if" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("IF");
    #else
        return IF;
    #endif
};
"else" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ELSE");
    #else
        return ELSE;
    #endif
};
"return" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RETURN");
    #else
        return RETURN;
    #endif
}

{ID} {

 #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ID");
        
      	
       
    #else
        return ID;
    #endif


}

{HEX} {
	
	
    	 sprintf(s1,"%s",yytext);
    	 
    	 int t=strlen(s1);
    	 int sum=0;
    	 for(int i=2;i<t;i++)
    	 {
    	 if(s1[i]>='A'&&s1[i]<='Z')
    	 s1[i]=int(s1[i]-'A')+10+'0';
    	 sum+=((s1[i]-'0')*(pow(16,t-1-i)));
    	 }
	sprintf(s1,"%d",sum);

#ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4X("NUM");
        
      	
    #else
        return NUM;
    #endif
    }
    
{OCT} {


sprintf(s1,"%s",yytext);
    	 
    	 int t=strlen(s1);
    	 int sum=0;
    	 for(int i=1;i<t;i++)
    	 {
    	 
    	 sum+=((s1[i]-'0')*(pow(8,t-1-i)));
    	 }
	sprintf(s1,"%d",sum);
#ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4X("NUM");
        
      	
       
    #else
        return NUM;
    #endif

}

{DECIMIAL} {

 #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("NUM");
        
      	
       
    #else
        return NUM;
    #endif


}



"=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ASSIGN");
    #else
        return ASSIGN;
    #endif
}
"<" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LESS");
    #else
        return LESS;
    #endif
}
">" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("MORE");
    #else
        return MORE;
    #endif
}
"==" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("EQUAL");
    #else
        return EQUAL;
    #endif
}
"!=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ADD");
    #else
        return NOEQUAL;
    #endif
}
">=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("MOREOREQUAL");
    #else
        return MOREOREQUAL;
    #endif
}
"<=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LESSOREQUAL");
    #else
        return LESSOREQUAL;
    #endif
}
"+" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ADD");
    #else
        return ADD;
    #endif
}

"-" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("SUB");
    #else
        return SUB;
    #endif
}
"*" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("MUL");
    #else
        return MUL;
    #endif
}
"/" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("DIV");
    #else
        return DIV;
    #endif
}
"%" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("MOD");
    #else
        return MOD;
    #endif
}
";" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("SEMICOLON");
    #else
        return SEMICOLON;
    #endif
}
"(" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LPAREN");
    #else
        return LPAREN;
    #endif
}
")" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RPAREN");
    #else
    return RPAREN;
    #endif
}
"{" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LBRACE");
    #else
        return LBRACE;
    #endif
}
"}" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RBRACE");
    #else
        return RBRACE;
    #endif
}
"&&" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("AND");
    #else
        return AND;
    #endif
}
"||" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("OR");
    #else
        return OR;
    #endif
}
"!" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("NOT");
    #else
        return NOT;
    #endif
}
"\t"	;
{EOL} yylineno++;

{WHITE}	;

%%

#ifdef ONLY_FOR_LEX
int main(int argc, char **argv){
    if(argc != 5){
        fprintf(stderr, "Argument Not Enough");
        exit(EXIT_FAILURE);
    }

    if(!(yyin = fopen(argv[1], "r"))){
        fprintf(stderr, "No such file or directory: %s", argv[1]);
        exit(EXIT_FAILURE);
    }

    if(!(yyout = fopen(argv[3], "w"))){
        fprintf(stderr, "No such file or directory: %s", argv[3]);
        exit(EXIT_FAILURE);
    }

    yylex();
    return 0;
}
#endif
