program Treap1;
type treap=record
     l,r,x,ran,size:longint;
end;

var
 t:array[0..15000] of treap;
 n,i,tot,x,root,k,ch,tmp:longint;
 ans:array[0..15000] of longint;


procedure lt(var p:longint);
var
 x:longint;
begin
 x:=t[p].l;
 t[x].size:=t[p].size;
 t[p].size:=t[t[x].r].size+t[t[p].r].size+1;
 t[p].l:=t[x].r;
 t[x].r:=p;
 p:=x;
end;

procedure rt(var p:longint);
var
 x:longint;
begin
 x:=t[p].r;
 t[x].size:=t[p].size;
 t[p].size:=t[t[x].l].size+t[t[p].l].size+1;
 t[p].r:=t[x].l;
 t[x].l:=p;
 p:=x;
end;


procedure ins(var p,x:longint);
begin
if p=0 then
 begin
 inc(tot);
 p:=tot;
 t[p].x:=x;
 t[p].ran:=random(maxlongint);
 t[p].size:=1;
 exit;
 end;
inc(t[p].size);
if x<t[p].x then
 begin
 ins(t[p].l,x);
 if t[t[p].l].ran<t[p].ran then lt(p);
 end;
if x>t[p].x then
 begin
 ins(t[p].r,x);
 if t[t[p].r].ran<t[p].ran then rt(p);
 end;
end;

function find(p,k:longint):longint;
begin
if k=t[t[p].l].size+1 then exit(t[p].x);
if k<t[t[p].l].size+1 then exit(find(t[p].l,k));
if k>t[t[p].l].size+1 then exit(find(t[p].r,k-t[t[p].l].size-1));
end;

{procedure del(var x,p:longint);
begin
if x<t[p].x then del(x,t[p].l)
else if x>t[p].x then del(x,t[p].r)
else begin
     if t[p].num>1 then begin dec(t[p].num); exit; end;
     if (t[p].l=0)and(t[p].r=0) then p:=0;
     if (t[p].l=0)and(t[p].r<>0) then begin rt(p); del(x,t[p].l); end;
     if (t[p].r=0)and(t[p].l<>0) then begin lt(p); del(x,t[p].r); end;
     if (t[p].l<>0)and(t[p].r<>0) then
      if t[t[p].l].x>t[t[p].r].x then
       begin rt(p); del(x,t[p].l); end
      else
       begin lt(p); del(x,t[p].r); end;
      end;
end;
}
procedure sum(i,x:longint);
begin
if i=0 then exit;
if t[i].x<x then
 begin
 inc(tmp,t[t[i].l].size+1);
 sum(t[i].r,x);
 end
else sum(t[i].l,x);
end;



begin
{assign(input,'carry.in'); reset(input);
assign(output,'carry.out'); rewrite(output);}
randomize;
readln(n);
root:=0;
for i:=1 to n do
 begin
 read(x); readln(x);
 tmp:=0;
 sum(root,x);
 inc(ans[tmp]);
 ins(root,x);
 end;
for i:=0 to n-1 do writeln(ans[i]);
//close(output);
end.
