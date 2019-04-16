PROGRAM TUBESDAP;
USES crt, sysutils;
	const filename='kasusnya.dat';
	TYPE kasus=record
			{noktp,tgl:longint;}
			namalpr,namaplk,jenis,alamat:string;
			gender:char;
			notlp,noktp,tgl,thn,bln : integer;
		end;
		//tabel = array of kasus;
VAR
	A : array of kasus;
	f : file of kasus;
	s : kasus;
	opsi,k,N,d:integer;
    h,pembunuhan,korupsi,penipuan:string;

    procedure bacakasus();
    var
    i :integer;
    data: kasus;
    begin
    	assign(f,filename);
    	if fileexists(filename) then
    	begin
    		reset(f);
    		N := filesize(f);
            setlength(A, N);
                for i:=0 to N-1 do
                begin
	                read(f, data);
	                A[i] := data;
                end;
        end
        else
        begin
        rewrite(f);
    	end;
    end;

    procedure savekasus();
	var
        i : integer;
    begin
        rewrite(f);
        for i := 0 to length(A)-1 do
        begin
            write(f, A[i]);
        end;
    end;

	procedure menuInput();
	var
		b,n,i : integer;
	begin
		//assign(f,'kasusnya.txt');
		//reset(f);
		//rewrite(f);
        //seek(f,filesize(f));
			clrscr;
			writeln('Berapa Data yang ingin dimasukan ?');
			readln(n);writeln;
			b := length(A);
			setlength(A,length(A)+n);
			//N:=length(A);
			{N:=length(A);;
			//setLength(A,N+1);)
			writeln('Input data');
			writeln('=================================================================');
			for i:=b to length(A)-1 do
			begin
			write('Nama Korban                                   : ');readln(A[N].namalpr);
			write('Masukan No.KTP Korban                         : ');readln(A[N].noktp);
			write('Masukan No.Telephone Korban                         : ');readln(A[N].notlp);
			write('Masukan Alamat Korban                         : ');readln(A[N].alamat);
			write('Nama Pelaku                                   : ');readln(A[N].namaplk);
			write('Jenis Kejahatan (Pembunuhan/Korupsi/Penipuan) : ');readln(A[N].jenis);
			write('Masukan Tanggal Kejadian (ex: 20)             : ');readln(A[N].tgl);
			write('Masukan Bulan Kejadian (ex: 02)               : ');readln(A[N].bln);
			write('Masukan Tahun Kejadian (ex: 2016)             : ');readln(A[N].thn);
	        repeat
			write('Gender Pelaku [L\P]                           : ');readln(A[N].gender);
			until (A[N].gender='L') or (A[N].gender='P') or (A[N].gender='l') or (A[N].gender='p');
			write(f,A[N]);
			//write(f,s);
			write('Data berhasil ditambah...');readln;
			{write('No Kasus Anda :',N);}
			writeln('=================================================================');
			end;
		savekasus();
	end;

	function getGender(x:char):string;
	begin
		case lowercase(x) of
			'l': getGender:='Laki-laki';
			'p': getGender:='Perempuan';
		end;
	end;

	procedure editData(var A : array of kasus);
        var
		n,m: integer;
	begin
	    writeln; writeln('== pilihan edit ==');
		write(' masukkan nomor Kasus yang ingin diedit: '); readln(n); writeln;
        writeln('Data yang ingin anda edit?');
		writeln('1. Nama Korban');
		writeln('2. No.KTP Korban');
		writeln('3. No Telepon Korban');
		writeln('4. Tanggal Kejadian');
		writeln('5. Bulan Kejadian');
		writeln('6. Tahun Kejadian');
		writeln('7. Nama Pelaku');
		writeln('8. Jenis Kelamin Pelaku');
		writeln('9. Alamat Korban');
		writeln('10. Semua Data yang sudah Masuk');
		write(' Silahkan pilih yang akan diedit :'); readln(m); writeln;
		if m=1 then begin
			write('Nama Korban : '); readln(A[n-1].namalpr);
                end
		else if m=2 then begin
		        write('No.KTP Korban : '); readln(A[n-1].alamat);
                end
		else if m=3 then begin
		        write('No Telepon Korban : '); readln(A[n-1].telpon);
                end
		else if m=4 then begin
		        write('Tanggal Kejadian : '); readln(A[n-1].ukuran);
                end
		else if m=5 then begin
				write('Bulan Kejadian : '); readln(A[n-1].kode);
				end
		else if m=6 then begin
				write('Tahun Kejadian : '); readln(A[n-1].warna);
				end
		else if m=7 then begin
				write('Nama Pelaku : '); writeln(A[n-1].banyak);
				end
		else if m=8 then begin
				write('Jenis Kelamin Pelaku : '); writeln(A[n-1].banyak);
				end
		else if m=9 then begin
				write('Alamat Korban : '); writeln(A[n-1].banyak);
				end
		else if m=10 then begin

			write('Nama Korban : '); readln(A[n-1].namalpr);
			write('No.KTP Korban : '); readln(A[n-1].noktp);
			write('No Telepon Korban : '); readln(A[n-1].notlp);
			write('Tanggal Kejadian : '); readln(A[n-1].tgl);
			write('Bulan Kejadian : '); readln(A[n-1].bln);
			write('Tahun Kejadian : '); readln(A[n-1].thn);
			write('Nama Pelaku : '); readln(A[n-1].namaplk);
			write('Jenis Kelamin Pelaku : '); readln(A[n-1].gender);
			write('Alamat Korban : '); readln(A[n-1].alamat);
		end;
		savekasus();
	end;

	procedure hapusdata();
        var
            i,j : integer;
        begin
                writeln; write('Nomor Kasus yang ingin dihapus : ');
                readln(i);
                i := i -1;
                for j := i to length(A)-2 do
                begin
                        A[j] := A[j+1];
                end;
                setlength(A,length(A)-1);
				savekasus();
        end;

    procedure caridata();
        var
                nama : string;
                found : boolean;
                i : integer;
        begin
                found := false;
                write('Masukkan nama Korban yang ingin dicari : ');
                readln(nama);
                clrscr;
                for i:=0 to length(A)-1 do
                begin
                        if A[i].namalpr = nama then
                        begin
                                        found := true;
                                        writeln('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
                                        writeln('             Data Anda Sudah Ditemukan');
                                        writeln('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
                                        writeln('Nomor            : ',i+1);
                                        writeln('Nama             : ',A[i].nama);
                                        writeln('Ukuran           : ',A[i].ukuran);
                                        writeln('Kode Barang      : ',A[i].kode);
                                        writeln('Banyak           : ',A[i].banyak);
                                        write('Nama Korban : ',A[i].namalpr);
										write('No.KTP Korban : ',A[i].noktp);
										write('No Telepon Korban : ',A[i].notlp);
										write('Tanggal Kejadian : ',A[i].tgl);
										write('Bulan Kejadian : ',A[i].bln);
										write('Tahun Kejadian : ',A[i].thn);
										write('Nama Pelaku : ',A[i].namaplk);
										write('Jenis Kelamin Pelaku : ',A[i].gender);
										write('Alamat Korban : ',A[i.alamat);
                        end;
                end;
                if not found then
                begin
                        writeln('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
                        writeln('Maaf Nama Korban yang dicari tidak ditemukan');
                        writeln('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
                end;
                readln;
        end;

	procedure urutData();
	begin
		writeln ('= Pilihan Urut =');
		write('Masukan tanggal kejadian kasus : ');
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

	procedure exit();
	begin
		clrscr;
		writeln('Terima Kasih Sudah Berkunjung');
		writeln('=====================================');
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

        {procedure menuView();
	var
			i:integer;
            pil:char;
	begin
		//repeat
		assign(f,'kasusnya.txt');
		reset(f);
		//seek(f,filesize(f));
		//N:=length(A);
		N:=1;
		setLength(A,N+1);
        //read(f,A[N]);
        writeln('View data');
		writeln('=================================================================');
		//while not EOF(f) do begin
		repeat
			clrscr;
			//read(f,s);
			read(f,A[N]);
			for i:=0 to length(A)-1 do begin
				writeln('No Kasus        : ',i+1);readln(A[i].no);writeln;
				writeln('No KTP Korban   : ',A[i].noktp);
				writeln('Nama Korban     : ',A[i].namalpr);
				writeln('Nama Pelaku     : ',A[i].namaplk);
				writeln('Jenis Kejahatan : ',A[i].jenis);
				writeln('Gender          : ',getGender(A[i].gender));
				writeln('Tanggal         : ',A[i].tgl);
				writeln('Bulan           : ',A[i].bln);
				writeln('Tahun           : ',A[i].thn);writeln;
				//read(f,A[N]);
            end;
		until EOF(f) ;
		//end;
		writeln('=============================================================');read;
		close(f);
		repeat
		writeln('press [e] Edit; [d] Delete; [c] Continue');
		write('...');readln(pil);
		until (lowercase(pil)='e') or (lowercase(pil)='d') or (lowercase(pil)='c');
		menuViewOption(pil);
		
	end;}

	 procedure viewdata();
        var
                i : integer;
        begin
        repeat
            clrscr;
			writeln('               DATA Kasus  ');
			writeln('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
            for i:= 0 to length(A)-1 do
            begin
                writeln('No Kasus    : ',i+1);
				writeln('No KTP Korban   : ',A[i].noktp);
				writeln('Nama Korban     : ',A[i].namalpr);
				writeln('Nomor Telephone Korban : ',A[i].notlp);
				writeln('Alamat Korban   : ',A[i].alamat);
				writeln('Nama Pelaku     : ',A[i].namaplk);
				writeln('Jenis Kejahatan : ',A[i].jenis);
				writeln('Gender          : ',getGender(A[i].gender));
				writeln('Tanggal         : ',A[i].tgl);
				writeln('Bulan           : ',A[i].bln);
				writeln('Tahun           : ',A[i].thn);writeln;
                writeln;
            end;
            writeln('press [e] Edit; [d] Delete; [c] Continue');
			write('...');readln(pil);
			until (lowercase(pil)='e') or (lowercase(pil)='d') or (lowercase(pil)='c');
			menuViewOption(pil);
        end;

	procedure menuOption(opsi:integer);
	begin
		{assign(f,'kasusnya.txt');
		reset(f);}
		case opsi of
			1: menuInput();
			2: menuView();
		end;
		{close(f);}
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
        	assign(f,'kasusnya.txt');
			reset(f);
			N:=1;
			setLength(A,N+1);
			repeat
			read(f,A[N]);
	        write('Masukan No Kasus : ',A[k].namalpr);readln;
                {writeln(A.[k]);
                readln;}
                if A[k].jenis='pembunuhan' then begin
                        writeln('Hukumanmu Seumur Hidup, karena nyawa di bayar nyawa');
                        readln;
                end;
                if A[k].jenis='korupsi' then begin
                        writeln('Hukumanmu Denda 200M dan penjara 20 tahun');
                        readln;
                end;
                if A[k].jenis='penipuan' then begin
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
			{splashScreen();}
			until eof(f);
			close(f);
        end;

	procedure akhirkasus();
    var
            i: integer;
            h: string;
	begin
		assign(f,'kasusnya.txt');
		reset(f);
		//while not EOF(f) do begin
			
			N:=1;
			setLength(A,N+1);
			repeat
			read(f,A[N]);
			menusidang(h);
			clrscr;
			writeln('Akhir Kasus');
			writeln('=================================================================');
			for i:=0 to length(A)-1 do begin
				//writeln('No Kasus        : ');readln(N);
				writeln('Masukan No Kasus : ',A[N].namalpr);read;
				writeln('Nama Korban     : ',A[N].namalpr);read;
				writeln('Nama Pelaku     : ',A[N].namaplk);read;
				writeln('Jenis Kejahatan : ',A[N].jenis);read;
				writeln('Gender    		 : ',getGender(A[N].gender));read;
				writeln('Akhir Kasus	 : ');
				if h='yes' then begin
					writeln('Dihukum');
					readln;
				end;
				if h='no' then begin
					writeln('Banding');
					readln;
				end;
			writeln('=================================================================');
				readln;
			end;
			 close(f);
			until eof(f);
        //end;

    end;


    procedure home(opsi : integer);
	var
		
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
            writeln('5. exit');
			writeln('=================================================================');
			write('option: ');readln(opsi);
		if opsi=1 then begin
			menuInput();
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
		if opsi = 4 then begin
			akhirkasus();
			read;
		end;
		if opsi= 5 then begin
			exit();
			read;
		end;
		until opsi=5
	end;

BEGIN
	splashScreen();
	bacakasus();
	home(opsi);
END.