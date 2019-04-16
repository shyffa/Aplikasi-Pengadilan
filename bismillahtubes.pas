program pengadilan;
uses crt;
        const filename='kasus.dat';
        type kasus=record
                namalpr,namaplk,jenis:string;
                gendre:char;
        end;
        tabel = array of kasus;
var
        s : string;
        A : tabel;
        f : file of string;
        n : integer;
        procedure menu();
        begin
                clrscr;
                writeln('==============================');
                writeln('========Selamat Datang========');
                writeln('=====Aplikasi Pengadilan======');
                writeln('==============================');
                writeln;writeln;writeln;writeln;
                writeln('Menu');
                writeln('1.Input Permasalahan');
                writeln('2.Lihat perasalahan');
                writeln('3.Keputusan Sidang');
                writeln('4.Hasil Sidang');
                writeln('5.Cari Permasalahan');
                writeln('6.exit');
                readln(n);
        end;


        procedure tampildata;
        begin   
                write('Pilih (E):Edit  (D):Delete ')
                assign(f,'kasus.dat');
                reset(f);
                while not EOF(f) do begin
                        readln(f,A[n])
                end;
                close(f);
				menu();
        end;

        procedure permasalahan();
        var
                n:integer;
        begin
                assign(f,'kasus.dat')
                rewrite(f)
                n:=length(A);
                setlength(A,n+1);
                clrscr;
                writeln('Masukan Nama Pelapor : ');
                readln(A[n].namalpr);
                writeln('Masukan Nama Pelaku : ');
                readln(A[n].namaplk);
                write(f,A[n])
                close(f);
                write('Data berhasil ditambahkan ...');readln;
                menu;
        end;

        procedure sidang;
        begin
        end;

        procedure hasil;
        begin
        end;

begin
        menu();
        if n=1 then begin
                permasalahan();
        end;
        if n=2 then begin
                tampildata();
        end;
        if n=3 then begin
                hasil();
        end;
        if n=4 then begin
                cari();
        end;
        readln;
end.