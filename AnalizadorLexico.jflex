%%

%unicode
%class Lexer
%int
%line
%standalone

if = If
then = Then
elseif = ElseIf
else = Else
end = End
return = Return
true = True
false = False
function = Function
private = Private
new = New
from = From
for = For
each = Each
in = In
next = Next

dim = Dim
as = As
integer = Integer
double = Double
sub = Sub
boolean = Boolean

plus = +
minus = -
mult = *
div = /
oprnts = (
cprnts = )

vocal = [aeiouAEIOU]
palabraTriVocal = {consonante}*{vocal}*{consonante}*{vocal}*{consonante}*{vocal}*{consonante}*
%%

<YYINITIAL> {
	{palabraTriVocal}	{System.out.println("Palabra de tres vocales: " + yytext());}
	.		{}
}
