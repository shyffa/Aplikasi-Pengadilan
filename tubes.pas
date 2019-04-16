program pengadilan;
uses crt;
        const filename='kasus.txt';
        type kasus=record
                namalpr,namaplk,jenis,bulan:string;
                tanggal,tahun:string;
        end;
var
        id : array of integer;
        s,p,h,yes,no : string;
        A : kasus;
        f : file of string;
        n,i,u,k : integer;
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
                writeln('3.Hasil Sidang');
                writeln('4.exit');
                readln(n);

        end;

        procedure permasalahan();
        var
                n:integer;
        begin
                assign(f,'kasus.txt');
                rewrite(f);
                {n:=length(s);
                setlength(s,n+1);}
                clrscr;
                write('Masukan Nama Pelapor : ');
                readln(A.namalpr);
                write('Masukan Nama Pelaku : ');
                readln(A.namaplk);
                write('Masukan Jenis Kasus (Pembunuhan/Korupsi/Penipuan) : ');
                readln(A.jenis);
                write('Masukan Tanggal Kejadian : ');
                readln(A.tanggal);
                write('Masukan Bulan Kejadian : ');
                readln(A.bulan);
                write('Masukan Tahun Kejadian : ');
                readln(A.tahun);
                write(f,A.namalpr);
                write(f,A.namaplk);
                write(f,A.jenis);
                write(f,A.tanggal);
                write(f,A.bulan);
                write(f,A.tahun);

                close(f);
                writeln('Data berhasil ditambahkan...');
                readln;
                menu();
                end;

        procedure tampildata;
        begin
                write('Pilih (T>:Tampil Data  (S>:Cari Data  (U):Urut Data ');
                readln(p);
                assign(f,'kasus.txt');
                reset(f);

                if (p='T') then begin
                        writeln(' (E):Edit data (D):Delete Data');
                        while not EOF(f) do begin
                        read(f,A.namalpr);
                        read(f,A.namaplk);
                        read(f,A.jenis);
                        read(f,A.tanggal);
                        read(f,A.bulan);
                        read(f,A.tahun);
                        writeln('Tanggal kejadian : ',A.tanggal);
                        writeln('Bulan Kejadian : ',A.bulan);
                        writeln('Tahun Kejadian : ',A.tahun);
                        writeln('Nama Pelapor : ',A.namalpr);
                        writeln('Nama Pelaku : ',A.namaplk);
                        writeln('Jenis Kejahatan : ',A.jenis);
                        end;
                        readln;
                end;
                if (p='S') then begin
                end;
                if (p='U') then begin
                writeln('Urutkan berdasarkan : (1):kasus ');
                readln(u);
                        if u=1 then
                end;
                close(f);
                menu();

        end;

        procedure hasilsidang ();
        begin
                write('Masukan Jenis Kasus (1.Pembunuhan 2.Korupsi 3.Penipuan) ');
                readln(k);
                assign(f,'kasus.txt');
                reset(f);
                if k=1 then begin
                        writeln('Hasil Sidang : Dihukum Mati');
                end;
                if k=2 then begin
                        writeln('Hasil Sidang : Denda 100M penjara 20 tahun');
                end;
                if k=3 then begin
                        writeln('Hasil Sidang : Denda 10M penjara 20 Tahun');
                end;
                writeln('Apakah Setuju dengan Keputusan Sidang?  (yes/no)');
                readln(h);
                if h=yes then begin
                        writeln('Semoga Allah mengampunimu');
                end;
                if h=no then begin
                        writeln('Banding');
                end;
                menu();
        end;

begin
        n:=10000;
        setlength(id,n);
        menu();
        if n=1 then begin
                permasalahan();
        end;
        if n=2 then begin
                tampildata();
        end;
        if n=3 then begin
                hasilsidang();
        end;
        if n=4 then begin

        end;
        readln;
end.
