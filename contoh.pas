PROGRAM TUBESDAP;
USES crt;
	TYPE Mahasiswa=record
			id:integer;
			nama,nim:string;
			gender:char;
		end;

		tabel = array of Mahasiswa;
VAR
	A:tabel;

	procedure splashScreen();
	begin
		clrscr;
		writeln('Selamat Datang di Aplikasi DAP');
		writeln('==============================');
		write('Press any key');
		readln;
	end;

	procedure menuInput();
	var
		N:integer;
	begin
		N:=length(A);
		setLength(A,N+1);
		clrscr;
		writeln('Input data');
		writeln('==============================');
		write('Nama      : ');readln(A[N].nama);
		write('Nim       : ');readln(A[N].nim);
		repeat
			write('Gender [L\P]: ');readln(A[N].gender);
		until (A[N].gender='L') or (A[N].gender='P') or (A[N].gender='l') or (A[N].gender='p');
		A[N].id:=N;
		write('Data berhasil ditambah...');readln;
	end;

	function getGender(x:char):string;
	begin
		case lowercase(x) of
			'l': getGender:='Laki-laki';
			'p': getGender:='Perempuan';
		end;
	end;

	procedure editData();
	begin
		writeln('= pilihan edit');
		write('= masukkan nomor soal: ');
	end;

	procedure hapusData();
	begin
		writeln('= pilihan hapus');
		write('= masukkan nomor soal: ');
	end;

	procedure menuViewOption(pil:char);
	begin
		case pil of
			'e' : editData();
			'd' : hapusData();
		end;
	end;

	procedure menuView();
	var
		i:integer;
		pil:char;
	begin
		repeat
			clrscr;
			writeln('View data');
			writeln('==============================');
			for i:=0 to length(A)-1 do begin	
				writeln('No        : ',i+1);
				writeln('Nama      : ',A[i].nama);
				writeln('Nim       : ',A[i].nim);
				writeln('Gender    : ',getGender(A[i].gender));
				writeln;
			end;
			writeln('press [e] Edit; [d] Delete; [c] Continue');
			write('...');readln(pil);
		until (lowercase(pil)='e') or (lowercase(pil)='d') or (lowercase(pil)='c');
		menuViewOption(pil);
		readln;
	end;	

	procedure menuMHSOption(opsi:integer);
	begin
		case opsi of
			1: menuInput();
			2: menuView();
		end;
	end;

	procedure menuMHS();
	var
		opsi:integer;
	begin
		repeat
			clrscr;
			writeln('Mahasiswa');
			writeln('==============================');
			writeln('1. input data');
			writeln('2. view data');
			writeln('3. back');
			writeln('==============================');
			write('option: ');readln(opsi);
		until (opsi>=1) and (opsi<=3);
		if (opsi<>3) then begin
			menuMHSOption(opsi);
			menuMHS();
		end;
	end;

	procedure homeOption(opsi:integer);
	begin
		case opsi of
			1: menuMHS();
		end;
	end;

	procedure home();
	var
		opsi:integer;
	begin
		repeat
		clrscr;
			writeln('Selamat Datang di Aplikasi DAP');
			writeln('==============================');
			writeln('1. Menu Mahasiswa');
			writeln('3. Menu 2');
			writeln('4. Menu 3');
			writeln('2. exit');
			writeln('==============================');
			write('option: ');readln(opsi);
		until (opsi=1) or (opsi=2);
		if opsi<>2 then begin
			homeOption(opsi);
			home();
		end;
	end;

BEGIN
	splashScreen();
	home();
END.