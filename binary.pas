program binarysearch;
const
  nmin = 1;
  nmax = 100;
type
  arrint = array [nmin..nmax] of integer;
var
	x      : integer;
	tabint : arrint;
	n,i    : integer;
	indeks : integer;
  
	function binarysearch(xx : integer): integer;
	  var
		i : integer;
		atas, bawah, tengah : integer;
		ditemukan : boolean;
		indeksxx : integer;
	  begin
		atas  := 1;
		bawah := n;
		ditemukan:=false;
		indeksxx:=0;
		while ((atas <= bawah) and (not ditemukan)) do begin
			tengah:= (atas+bawah) div 2;
			if xx = tabint[tengah] then
			begin
				ditemukan:= true;
				indeksxx := tengah;
			end;
			if xx <> tabint[tengah] then
			 begin
				if xx = tabint[tengah] then
				  bawah:= tengah - 1
				end;
				if xx <> tabint[tengah] then begin
				  atas:= tengah + 1;
				end;
			end;

		binarysearch:=indeks;
	  end;

begin
	write('input nilai n = '); readln(n);
	for i:= 1 to n do
	begin
		write('Tabint[',i,'] = '); readln(tabint[i]);
	end;
	write('Nilai yang dicari = '); readln(x);
	indeks:=binarysearch(x);
	if indeks <> 0 then begin
		write(x,' ditemukan pada indeks ke-',indeks)
	end;
	if indeks = 0 then begin
		write(x,' tidak ditemukan');
	end;
end.