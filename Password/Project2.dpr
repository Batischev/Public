program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  i, j, k, hop_count: byte;
  A: array[1..3,1..3] of byte;
  path_num, total: Int64;

Procedure PATH(cur_i, cur_j: byte; k: byte);
var
  i, j: byte;
begin
  A[cur_i,cur_j]:=1;
  for i:=1 to 3 do
    begin
      for j:=1 to 3 do
        begin
          if k<hop_count then
            begin
              if (A[i,j]=0)and not(((i=cur_i)and(Abs(j-cur_j)>1)and(A[i,2]=0))
              or((j=cur_j)and(Abs(i-cur_i)>1)and(A[2,j]=0))or((Abs(i-cur_i)>1)
              and(Abs(j-cur_j)>1)and(A[2,2]=0)))
              then
                begin
                  if k=hop_count then
                    Inc(path_num);
                    A[i,j]:=1;
                    PATH(i,j,k+1);
                    A[i,j]:=0;
                end;
            end
          else
            begin
              if (A[i,j]=0)and not(((i=cur_i)and(Abs(j-cur_j)>1)and(A[i,2]=0))
              or((j=cur_j)and(Abs(i-cur_i)>1)and(A[2,j]=0))or((Abs(i-cur_i)>1)
              and (Abs(j-cur_j)>1) and (A[2,2]=0)))
              then
                Inc(path_num);
            end;
        end;
    end;
end;

begin
  k:=1; total:=0;
  for hop_count:=3 to 8 do
    begin
      path_num:=0;
      for i:=1 to 3 do
        for j:=1 to 3 do
          begin
            PATH(i,j,k);
            A[i,j]:=0;
          end;
      writeln('Hops: ',hop_count,'. Path amount: ',path_num);
      total:=total+path_num;
    end;
  Writeln('Total amount: ',total);
  Readln;
end.
