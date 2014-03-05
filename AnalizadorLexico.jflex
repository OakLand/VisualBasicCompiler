%%

%unicode
%class Lexer
%int
%line
%standalone

dim = Dim
as = As
integer = Integer
double = Double
sub = Sub
end = End
private = Private
plus = +
minus = -
mult = *
div = /
vocal = [aeiouAEIOU]
palabraTriVocal = {consonante}*{vocal}*{consonante}*{vocal}*{consonante}*{vocal}*{consonante}*
%%

<YYINITIAL> {
	{palabraTriVocal}	{System.out.println("Palabra de tres vocales: " + yytext());}
	.		{}
}
