program dos;

type

cadena=string[50];

rango_zona=1..5;

TipoPropiedad=(casa, Departamento,Terreno);

propiedad=record
	Zona:integer;
	Codigo:integer;
	Tipo:TipoPropiedad;
	MetrosCuadrados:Integer;
	PrecioPorMetroCuadrado:Real;
	PrecioTotal:real;
end;


listaP=^nodo;
nodo=record
	dato:propiedad;
	sig:listaP;
end;

procedure AgregarPropiedad(var L:listaP; P:propiedad);
var
	Nue:listaP;   
	Actual, Anterior:listaP;
begin
	New(Nue);
	Nue^.dato:=P;
	Nue^.sig:=nil;
	
	Actual:=L;
	Anterior:=nil;
	
	while(Actual<>nil) and (Actual^.dato.Zona = P.Zona) and (Actual^.dato.Tipo < P.Tipo) do begin
		Anterior:=Actual; Actual:=Actual^.sig;
	end;
	If (Actual =Anterior) then 
		L:=Nue
	else 
		Anterior^.sig:=Nue;
	Nue^.sig := Actual;
end;

procedure LeerPropiedad(var P:propiedad);
begin
	writeln('Ingrese la Zona (1 a 5, -1 para fianlizar): ');
	readln(P.Zona);
	if P.Zona <> -1 then 
	begin
		writeln('Ingrese el codigo de propiedad: ');
		readln(P.Codigo);
		writeln('Ingrese el tipo de propiedad(Casa, Departamento, Terreno): ');
		readln(P.Tipo);
		writeln('Ingrese la cantidad de metros cuadrados: ');
		readln(P.MetrosCuadrados);
		writeln('Ingrese el precio por metro cuadrado: ');
		readln(P.PrecioPorMetroCuadrado);
		
		P.PrecioTotal:= P.MetrosCuadrados * P.PrecioPorMetroCuadrado;		
	end;
end;	

procedure MostrarPropiedadesEnZonaYTipo(L:listaP; Zona:Integer; Tipo:TipoPropiedad);
var
	Actual:listaP;
begin
	Actual:=L; 
	
	while Actual <> nil do begin
		if (Actual^.dato.Zona = Zona) and (Actual^.dato.Tipo = Tipo) then begin
			writeln('Codigo de Propiedad: ', Actual^.dato.Codigo);
			writeln('Precio Total: ', Actual^.dato.PrecioTotal:0:2);
		end;
		Actual:=Actual^.sig; 
	end;
end;

var 
	Propiedades:listaP;
	P:propiedad;
	ZonaBusqueda:Integer;
	TipoBusqueda:TipoPropiedad;
begin
	Propiedades:=nil;
	
	repeat
		LeerPropiedad(P);
		if P.Zona <> -1 then
			AgregarPropiedad(Propiedades,P);
	
	until (P.Zona=-1);
	
	writeln('Ingrese la zona a buscar: ');
	readln(ZonaBusqueda);
	writeln('Ingrese el tipo de propiedad (Casa, Departamento, Terreno): ');
	readln(TipoBusqueda);
	
	MostrarPropiedadesEnZonaYTipo(Propiedades, ZonaBusqueda, TipoBusqueda);
end.

	
