PROGRAM TUBESDAP;
USES crt;
	const filename='kasusnya.txt';
	TYPE kasus=record
			noktp:longint;
			namalpr,namaplk,jenis:string;
			gender:char;
		end;
		tabel = array of integer;
VAR
	A : tabel;
	f : file of kasus;
	s : kasus;
	opsi,N:integer;
        pembunuhan,korupsi,penipuan:string;

	procedure menuInput();
	var
		N:integer;
	begin
		assign(f,'kasusnya.txt');
		rewrite(f);
		clrscr;
		N:=length(A);
		setLength(A,N+1);
		writeln('Input data');
		writeln('=================================================================');
		write('Nama Korban                                   : ');readln(s.namalpr);
		write('Masukan No.KTP Korban                         : ');readln(s.noktp);
		write('Nama Pelaku                                   : ');readln(s.namaplk);
		write('Jenis Kejahatan (Pembunuhan/Korupsi/Penipuan) : ');readln(s.jenis);
        repeat
			write('Gender Pelaku [L\P]                           :');readln(s.gender);
		until (s.gender='L') or (s.gender='P') or (s.gender='l') or (s.gender='p');
		write('Data berhasil ditambah...');readln;
		write('No Kasus Anda :',A[N]);
		writeln('=================================================================');
        write(f,s);
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
		write('= masukkan nomor kasus: ');
		readln;
	end;

	procedure hapusData();
	begin
		writeln('= pilihan hapus');
		write('= masukkan nomor ktp korban: ');
		readln;
	end;

	procedure urutData();
	begin
		writeln ('= Pilihan Urut =');
		write('Masukan nomor kasus : ');
		readln;
	end;

	procedure splashScreen();
	begin
		clrscr;
		writeln('Selamat Datang di Aplikasi Pengadilan');
		writeln('=====================================');
		write('Press any key');
		readln;
	end;

	procedure menuViewOption(pil:char);
	begin
		case pil of
			'e' : editData();
			'd' : hapusData();
			'c' : splashScreen();
		end;
	end;

        procedure menuView();
	var
		i:integer;
                pil:char;
	begin
		reset(f);
		while not EOF(f) do begin
		repeat
			read(f,s);
			clrscr;
			writeln('View data');
			writeln('=================================================================');
			for i:=0 to length(A)-1 do begin
				writeln('No Kasus        : ',N);read;
				writeln('No KTP Korban   : ',s.noktp);read;
				writeln('Nama Korban     : ',s.namalpr);read;
				writeln('Nama Pelaku     : ',s.namaplk);read;
				writeln('Jenis Kejahatan : ',s.jenis);read;
				writeln('Gender          : ',getGender(s.gender));read;
				writeln('=============================================================');read;
			end;
            close(f);
			writeln('press [e] Edit; [d] Delete; [c] Continue');
			write('...');readln(pil);
		until (lowercase(pil)='e') or (lowercase(pil)='d') or (lowercase(pil)='c');
		menuViewOption(pil);
		end;
		readln;
	end;

	procedure menuOption(opsi:integer);
	begin
		case opsi of
			1: menuInput();
			2: menuView();
		end;
	end;

        procedure menukasus();
	var
		opsi:integer;
	begin
		repeat
			clrscr;
			writeln('Kasus');
			writeln('=================================================================');
			writeln('1. input data');
			writeln('2. view data');
			writeln('3. back');
			writeln('=================================================================');
			write('option: ');readln(opsi);
		until (opsi>=1) and (opsi<=3);
		if (opsi<>3) then begin
			menuOption(opsi);
			menukasus();
		end;
                {if opsi=1 then begin
                        menuInput();
                end;
                if opsi=2 then begin
                        menuView();
                end;}
		if  opsi=3 then begin
			splashScreen();

		end;
	end;

    {procedure homeOption(opsi:integer);
	begin
		case opsi of
			1: menukasus();
		end;
	end;}

	procedure menusidang(var h : shortstring);
        begin
	        write('Masukan No Kasus : ');
                readln(N);
                {writeln(A.[N]);
                readln;}
                if s.jenis='pembunuhan' then begin
                        writeln('Hukumanmu Seumur Hidup, karena nyawa di bayar nyawa');
                        readln;
                end;
                if s.jenis='korupsi' then begin
                        writeln('Hukumanmu Denda 200M dan penjara 20 tahun');
                        readln;
                end;
                if s.jenis='penipuan' then begin
                        writeln('Hukumanmu Denda 100M dan penjara 10 tahun');
                        readln;
                end;
				write('Apakah Anda dapat menerima hukumannya ? (yes/no)');
				readln(h);
					{if h='yes' then begin
						writeln('Semoga Allah Mengampunimu');
						readln;
					end;
					if h='no' then begin
						writeln('Heh banyak Uang ya ? Banding neh');
						readln;
					end;}
					splashScreen();
        end;

	procedure akhirkasus();
    var
            i: integer;
            h: string;
	begin
		reset(f);
		while not EOF(f) do begin
			read(f,s);
			menusidang(h);
			clrscr;
			writeln('Akhir Kasus');
			writeln('=================================================================');
			for i:=0 to length(A)-1 do begin
				writeln('No Kasus        : ');readln(N);
				writeln('Nama Korban     : ',s.namalpr);read;
				writeln('Nama Pelaku     : ',s.namaplk);read;
				writeln('Jenis Kejahatan : ',s.jenis);read;
				writeln('Gender    		 : ',getGender(s.gender));read;
				writeln('Akhir Kasus	 : ');
				if h='yes' then begin
					writeln('Dihukum');
					readln;
				end;
				if h='no' then begin
					writeln('Bsnding');
					readln;
				end;
			writeln('=================================================================');
				readln;
				close(f);
			end;
        end;
    end;


    procedure home();
	var
	opsi : integer;
        h : string;
	begin
	repeat
		clrscr;
			writeln('Selamat Datang di Aplikasi Pengadilan');
			writeln('=================================================================');
			writeln('1. Menu Input Data Kejahatan');
			writeln('2. Lihat Data');
			writeln('3. Menu Sidang');
			writeln('4. Akhir Kasus');
            writeln('4. exit');
			writeln('=================================================================');
			write('option: ');readln(opsi);
		if opsi=1 then begin
			menuInput();
			{menukasus();
			home();}
		end;
		if opsi=2 then begin
			{repeat}
				menukasus();
			{until opsi=3;
            read;}
		end;
		if opsi=3 then begin
			menusidang(h);
            read;
		end;
		if opsi=4 then begin
			akhirkasus();
			read;
		end;
		until (opsi=4);
	end;
BEGIN
	splashScreen();
	home();
END.
