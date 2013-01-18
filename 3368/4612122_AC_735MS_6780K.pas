program Poj3368;
Type TreeNode=Record
             a,b,Left,Right:Longint;
             sr,sl,s:Longint;
             End;
var
 e:array[0..100000] of longint;
 Tree:array[1..200000] of TreeNode;
 n,q,Tot,ans,c,d,i,tmp:longint;
Function max(a,b:longint):longint;
begin
if a>b then exit(a) else exit(b);
end;
Function min(a,b:longint):longint;
begin
if a<b then exit(a) else exit(b);
end;
Procedure MakeTree(a,b:Longint);
Var Now,i:Longint;
Begin
 Inc(Tot);
 Now:=Tot;
 Tree[Now].a:=a; Tree[Now].b:=b;
 if a=b then begin Tree[Now].s:=1; Tree[Now].sr:=1; Tree[Now].sl:=1; end;
 If a<b then begin
   Tree[Now].Left:=Tot+1; MakeTree(a,(a+b) div 2);
   Tree[Now].Right:=Tot+1; MakeTree((a+b) div 2+1,b);
   Tree[Now].sl:=Tree[Tree[Now].left].sl;
   Tree[Now].sr:=Tree[Tree[Now].right].sr;
   Tree[Now].s:=max(Tree[Tree[Now].left].s,Tree[Tree[Now].right].s);
   if e[(a+b) div 2]=e[(a+b) div 2+1] then
   begin
    if Tree[Now].sl=(a+b)div 2-a+1 then
     Tree[Now].sl:=Tree[Now].sl+Tree[Tree[Now].right].sl;
    if Tree[Now].sr=b-(a+b)div 2 then
     Tree[Now].sr:=Tree[Now].sr+Tree[Tree[Now].left].sr;
    Tree[Now].s:=max(Tree[Now].s,Tree[Tree[Now].left].sr+Tree[Tree[Now].right].sl);
    Tree[Now].s:=max(max(Tree[Now].s,Tree[now].sr),Tree[Now].sl)
   end;
 End;
End;
Procedure Insert(Num:Longint);
Var mid:longint;
Begin
 Mid:=(Tree[Num].a+Tree[Num].b) div 2;
 If (c<=Tree[Num].a) and (Tree[Num].b<=d) then
 Begin
   ans:=max(ans,Tree[Num].s);
{   if e[Tree[Num].a]=e[Tree[Num].a-1] then
    begin
    inc(tmp,Tree[Num].sl);
    ans:=max(ans,tmp);
    end
   else tmp:=Tree[Num].sr; }
 End
 Else begin
      If c<=mid then Insert(Tree[Num].Left);
      If d>=mid+1 then Insert(Tree[Num].Right);
      If e[mid]=e[mid+1] then
       ans:=max(ans,min(mid-c+1,Tree[Tree[Num].Left].sr)+min(d-mid,Tree[Tree[Num].Right].sl))
      End;
End;
begin
While not eof do
begin
Tot:=0;
fillchar(Tree,sizeof(Tree),0);
Read(n);if n=0 then break;
Readln(q);
for i:=1 to n do read(e[i]);
MakeTree(1,n);
for i:=1 to q do
begin
 readln(c,d);
 ans:=0; tmp:=0;
 insert(1);
 writeln(ans);
end;
end;
end.