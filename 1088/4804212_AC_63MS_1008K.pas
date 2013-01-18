program SKI;
var
 f,a:array[0..100,0..100] of longint;
 i,j,m,n,maxi,maxj,maxa:longint; ans,x:longint;
function max(a,b:longint):longint;
 begin
 if a>b then exit(a) else exit(b);
 end;
function go(i,j:longint):longint;
begin
 if f[i,j]<>0 then exit(f[i,j])
 else begin
      if (i+1<=m) and (a[i+1,j]<a[i,j]) then
       f[i,j]:=max(go(i+1,j)+1,f[i,j]);
      if (i-1>=1) and (a[i-1,j]<a[i,j]) then
       f[i,j]:=max(go(i-1,j)+1,f[i,j]);
      if (j+1<=n) and (a[i,j+1]<a[i,j]) then
       f[i,j]:=max(go(i,j+1)+1,f[i,j]);
      if (j-1>=1) and (a[i,j-1]<a[i,j]) then
       f[i,j]:=max(go(i,j-1)+1,f[i,j]);
      if ans<f[i,j] then ans:=f[i,j];
      exit(f[i,j]);
      end;
end;
begin
readln(m,n);
for i:=1 to m do
 for j:=1 to n do
  begin read(a[i,j]); if a[i,j]>maxa then begin maxi:=i; maxj:=j; end; end;
for i:=1 to m do
 for j:=1 to n do
  f[i,j]:=go(i,j);
writeln(ans+1);
end.    