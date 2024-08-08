program dos;

const
    dimF = 50;

type
    vector = array[1..dimF] of integer;

procedure leerNumerosRecursiva(var v: vector; var dimL: integer);
var
    num: integer;
begin
    Read(num);
    if (num <> 0) and (dimL < dimF) then
    begin
        dimL := dimL + 1;
        v[dimL] := num;
        leerNumerosRecursiva(v, dimL);
    end;
end;

procedure imprimirRecursivamente(num: integer);
begin
    if num <> 0 then
    begin
        imprimirRecursivamente(num div 10);  
        Write(num mod 10, ' ');
    end;
end;

procedure recorrerVectorImprimir(v: vector; dimL: integer; i: integer);
begin
    if i <= dimL then
    begin
        imprimirRecursivamente(v[i]);   {cada llamada resursiva me da el numero mas significativo}
        recorrerVectorImprimir(v, dimL, i + 1);
    end;
end;

var
    v: vector;
    dimL: integer;

begin
    dimL := 0;
    leerNumerosRecursiva(v, dimL);
    recorrerVectorImprimir(v, dimL, 1);
end.
