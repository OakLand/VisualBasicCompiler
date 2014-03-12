%%
%unicode
%class Lexer
%int
%column
%line
%states string

%{
	String str;
	private Symbol symbol(int type){
		return new Symbol(type, yyline, yycolumn);
	}	
	private Symbol symbol(int type, Object value){
		return new Symbol(type, yyline, yycolumn, value);
	}

%}

%init{
	str = "";
%init}


and = And
as = As
boolean = Boolean
by_ref = ByRef
by_val = ByVal
case = Case
char = Char
dim = Dim
do = Do
double = Double
each = Each
else = Else
elseif = Else {space}+ If
end = End
end_if = End {space}+ If
end_while = End {space}+ While
end_for = End {space}+ For
end_select = End {space}+ Select
end_sub = End {space}+ Sub
end_function = End {space}+ Function
end_type = End {space}+ Type
equiv = Eqv
exit = Exit
exit_for = Exit {space}* For
float = Float
for = For
from = From
function = Function
if = If
in = In
integer = Integer
implication = Imp
loop = Loop
main = Main
mod = Mod
next = Next
new = New
not = Not
or = Or
private = Private
print = Print
public = Public
return = Return
select = Select
select_case = Select {space}+ Case
step = Step
structs = Structs
string = String
sub = Sub
then = Then
to = To
type = Type
while = While
xor = Xor


equals = \=
bool_type = true | false
line_end = ([\n\r])+
number = [0-9]
letter = [a-zA-z]
int = {number}+
id = {letter}({number}*{under}*{letra}*)*
char = "{letra}"
points = \:
comma = \,
less = \<
more = \>
dif = <\>
pow = \^
under = \_
less_or_eq = <\= 
more_or_eq= >\= 
concat = \& 
quote = \" 
ignore_quote = \\{comillas}
space = [ ] 
tab	= \t 
minus = \- 
plus = \+ 
mult = \* 
div =  \/ 
div_int = \\ 
parths_left = \( 
parths_right = \) 
under = \_ 
bracket_left = \{ 
bracket_right = \} 
sq_bracket_left = \[
sq_bracket_right = \]
comment	= \' 

%%

<YYINITIAL> {
	{and} {return symbol(sym.And)}
	{as} {return symbol(sym.As)}
	{boolean} {return symbol(sym.Boolean)}
	{by_ref} {return symbol(sym.ByRef)}
	{by_val} {return symbol(sym.ByVal)}
	{case} {return symbol(sym.Case)}
	{char} {return symbol(sym.Char)}
	{dim} {return symbol(sym.Dim)}
	{do} {return symbol(sym.Do)}
	{double} {return symbol(sym.Double)}
	{each} {return symbol(sym.Each)}
	{else} {return symbol(sym.Else)}
	{elseif} {return symbol(sym.ElseIf)}
	{end} {return symbol(sym.End)}
	{end_if} {return symbol(sym.EndIf)}
	{end_while} {return symbol(sym.EndWhile)}
	{end_for} {return symbol(sym.EndFor)}
	{end_select} {return symbol(sym.EndSelect)}
	{end_sub} {return symbol(sym.EndSub)}
	{end_function} {return symbol(sym.EndFunction)}
	{end_type} {return symbol(sym.EndType)}
	{equiv} {return symbol(sym.Equiv)}
	{exit} {return symbol(sym.Exit)}
	{exit_for} {return symbol(sym.ExitFor)}
	{float} {return symbol(sym.Float)}
	{for} {return symbol(sym.For)}
	{from} {return symbol(sym.From)}
	{function} {return symbol(sym.Function)}
	{if} {return symbol(sym.If)}
	{in} {return symbol(sym.In)}
	{integer} {return symbol(sym.Integer)}
	{implication} {return symbol(sym.Implication)}
	{loop} {return symbol(sym.Loop)}
	{main} {return symbol(sym.Main)}
	{mod} {return symbol(sym.Mod)}
	{next} {return symbol(sym.Next)}
	{new} {return symbol(sym.New)}
	{not} {return symbol(sym.Not)}
	{or} {return symbol(sym.Or)}
	{private} {return symbol(sym.Private)}
	{print} {return symbol(sym.Print)}
	{public} {return symbol(sym.Public)}
	{return} {return symbol(sym.Return)}
	{select} {return symbol(sym.Select)}
	{select_case} {return symbol(sym.SelectCase)}
	{step} {return symbol(sym.Step)}
	{structs} {return symbol(sym.Structs)}
	{string} {return symbol(sym.String)}
	{sub} {return symbol(sym.Sub)}
	{then} {return symbol(sym.Then)}
	{to} {return symbol(sym.To)}
	{type} {return symbol(sym.Type)}
	{while} {return symbol(sym.While)}
	{xor} {return symbol(sym.Xor)}
	{equals} {return symbol(sym.Equals)}
	{bool_type} {return symbol(sym.BoolType)}
	{line_end} {return symbol(sym.LineEnd)}
	{number} {return symbol(sym.Number)}
	{letter} {return symbol(sym.Letter)}
	{int} {return symbol(sym.Integer)}
	{id} {return symbol(sym.Id)}
	{char} {return symbol(sym.Char)}
	{points} {return symbol(sym.Points)}
	{comma} {return symbol(sym.Comma)}
	{less} {return symbol(sym.Less)}
	{more} {return symbol(sym.More)}
	{dif} {return symbol(sym.Dif)}
	{pow} {return symbol(sym.Pow)}
	{under} {return symbol(sym.Under)}
	{less_or_eq} {return symbol(sym.LessOrEq)}
	{more_or_eq} {return symbol(sym.MoreOrEq)}
	{concat} {return symbol(sym.Concat)}
	{quote} {yybegin(str);}
	{ignore_quote} {return symbol(sym.IgnoreQuote)}
	{space} {}
	{tab} {}
	{minus} {return symbol(sym.Minus)}
	{plus} {return symbol(sym.Plus)}
	{mult} {return symbol(sym.Mult)}
	{div} {return symbol(sym.Div)}
	{div_int} {return symbol(sym.DivInt)}
	{parths_left} {return symbol(sym.ParthsLeft)}
	{parths_right} {return symbol(sym.ParthsRight)}
	{under} {return symbol(sym.Under)}
	{bracket_left} {return symbol(sym.BracketLeft)}
	{bracket_right} {return symbol(sym.BracketRight)}
	{sq_bracket_left} {return symbol(sym.SqBracketLeft)}
	{sq_bracket_right} {return symbol(sym.SqBracketRight)}
	{comment} {}
	
}


<str> {
	{quote}		{System.out.println("String: " + str); str=""; yybegin(YYINITIAL);}
	{ignore_quote}	{str+="\"";}
	.				{str+=yytext();}
}