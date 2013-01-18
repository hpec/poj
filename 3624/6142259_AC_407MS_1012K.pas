program PKU3624;
var
 n,m,i,j,bound:longint;
 w,d,s:array[1..3402] of longint;
 f:array[0..12880] of longint;

function max(a,b:longint):longint;
begin
if a>b then exit(a) else exit(b);
end;

begin
readln(n,m);
for i:=1 to n do readln(w[i],d[i]);
for i:=n downto 1 do s[i]:=s[i+1]+w[i];
for i:=1 to n do
 begin
 bound:=max(w[i],m-s[i]);
 for j:=m downto bound do
  if f[j]<f[j-w[i]]+d[i] then
    f[j]:=f[j-w[i]]+d[i];
 end;
writeln(f[m]);
end.
