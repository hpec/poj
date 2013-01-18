program PKU3624;
var
 n,m,i,j,w,d:longint;
 f:array[0..12880] of longint;

function max(a,b:longint):longint;
begin
if a>b then exit(a) else exit(b);
end;

begin
readln(n,m);
for i:=1 to n do
 begin
 readln(w,d);
 for j:=m downto w do
  if f[j]<f[j-w]+d then
    f[j]:=f[j-w]+d;
 end;
writeln(f[m]);
end.
