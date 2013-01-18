program POJ1067;
var
 a,b,tmp,a1,b1:int64;  k:double;
begin
//Assign(input,'1'); reset(input);
While not eof do
begin
readln(a,b);
if (a=0)and(b=0) then writeln(1) else begin
if a>b then begin tmP:=a; a:=b; b:=tmp; end;
k:=(sqrt(5)+1)/2;
a1:=trunc((b-a)*k); b1:=(trunc((b-a)*k*k));
if (a1=a)and(b1=b) then
 writeln(0) else writeln(1);          end;
end;
//close(input);
end.          