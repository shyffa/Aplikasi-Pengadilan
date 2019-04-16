Program Lalu_Lintas;
uses crt;

        type Tilang=record
                Nama,ID,Alamat, Pekerjaan, Pendidikan, tmptLahir, Plat, JenisPelanggaran, pasal, hari, penilang, jam, tglLahir, sidang : string;
                Umur, tgl, bln, thn: integer;
                Denda: real;
		golSIM: Char;
        end;

		type tabel= array [1..100] of Tilang;

var
        A:array [1..100] of Tilang;
        m, pil : integer;
		s:file of tabel;

		procedure load();
		begin
			assign(s,'praktikum.dat');
			reset(s);
			read(s, A);
			close(s);
		end;

		procedure save();
		begin
			assign(s,'praktikum.dat');
			rewrite(s);
			write(s, A);
			close(s);
		end;

		function count(A:tabel):integer;
		var
		  i:integer;
		begin
			i:=1;
			while A[i].bln<>0 do
				begin
					i := i+1;
				end;
				count := i;
			end;

		procedure SplashScreen();
        begin
                clrscr;
                writeln('==============================================');
                writeln('   Selamat Datang di SATLANTAS EMERALD CITY   ');
                writeln('==============================================');
                writeln('Press ENTER to continue');
                readln;
        end;


        Procedure editData({var A: array of Tilang});
	var
	        puul:integer;
        begin
		load();
			writeln;
			writeln('== Edit ==');
			write('== Masukkan Nomor Data yang akan Diedit: '); readln(m);
			writeln;
				writeln('1. Nama');
				writeln('2. Alamat');
				writeln('3. Pekerjaan');
				writeln('4. Pendidikan');
				writeln('5. Umur');
				writeln('6. Tempat Lahir');
				writeln('7. Tanggal Lahir');
				writeln('8. Gologan SIM');
				writeln('9. Plat Nomor');
				writeln('10. Hari');
				writeln('11. Tanggal');
				writeln('12. Bulan');
				writeln('13. Tahun');
				writeln('14. Jam(24jam)');
				writeln('15. Tanggal Sidang');
				writeln('16. Penilang');
				writeln('== Pilih yang Akan Diedit: '); readln(puul);
								case puul of
								0: begin
									   writeln('back');  readln;
										end;

					1: begin
							write('Nama: '); readln(A[m].Nama);
									end;
					2: begin
							write('Alamat: '); readln(A[m].Alamat);
							end;
					3: begin
							write('Pekerjaan: '); readln(A[m].Pekerjaan);
							end;
					4: begin
							write('Pendidikan: '); readln(A[m].Pendidikan);
							end;
					5: begin
							write('Umur: '); readln(A[m].Umur);
							end;
					6: begin
							write('Tempat Lahir: '); readln(A[m].tmptLahir);
							end;
					7: begin
							write('Tanggal Lahir: '); readln(A[m].tglLahir);
							end;
					8: begin
							write('Golongan SIM: '); readln(A[m].golSIM);
							end;
					9: begin
							write('Plat Nomor: '); readln(A[m].plat);
							end;
					10: begin
							write('Hari: '); readln(A[m].hari);
							end;
						11: begin
							write('Tanggal: '); readln(A[m].tgl);
							end;
					12: begin
							write('Bulan: '); readln(A[m].bln);
							end;
					13: begin
							write('Tahun: '); readln(A[m].thn);
							end;
					14: begin
							write('Jam(24jam): '); readln(A[m].jam);
							end;
					15: begin
							write('Tanggal Sidang: '); readln(A[m].Sidang);
							end;
					16: begin
							write('Penilang: '); readln(A[m].penilang);
							end;
					17: begin
							write('Nama    		: '); readln(A[m].Nama);
							write('Alamat   	: '); readln(A[m].Alamat);
							write('Pekerjaan	: '); readln(A[m].Pekerjaan);
							write('Pendidikan	: '); readln(A[m].Pendidikan);
							write('Umur		: '); readln(A[m].Umur);
							write('Tempat Lahir	: '); readln(A[m].tmptLahir);
							write('Tanggal Lahir	: '); readln(A[m].tglLahir);
							write('Gologan SIM	: '); readln(A[m].golSIM);
							write('Plat Nomor	: '); readln(A[m].Plat);
							write('Hari		: '); readln(A[m].hari);
							write('Tanggal		: '); readln(A[m].tgl);
							write('Bulan		: '); readln(A[m].bln);
							write('Tahun		: '); readln(A[m].thn);
							write('Jam(24jam)	: '); readln(A[m].jam);
							write('Tanggal Sidang	: '); readln(A[m].sidang);
							write('Penilang		: '); readln(A[m].penilang);
							end;
				end;
				writeln('Ceks');
				save();
		end;

        procedure hapusdata();
        var
            i,j : integer;
        begin
	        load();
                writeln; write('Nomor data yang ingin dihapus : ');
                readln(i);
                i := i -1;
                for j := i to length(A)-2 do
                begin
                        A[j] := A[j+1];
                end;
				save();
        end;

	procedure Input();
        var
                N: integer;
        begin
                clrscr;
				load();
				n:=count(a);
                writeln('Surat Tilang');
                writeln('================================');
                write('Nama             : '); readln(A[N].Nama);
		write('ID               : '); readln(A[N].ID);
                write('Alamat           : '); readln(A[N].Alamat);
		write('Pekerjaan        : '); readln(A[N].Pekerjaan);
		write('Pendidikan       : '); readln(A[N].Pendidikan);
		write('Umur             : '); readln(A[N].Umur);
                write('Tempat Lahir     : '); readln(A[N].tmptLahir);
			write('Tanggal Lahir(DD/MM/YYYY)    : '); readln(A[N].tglLahir);
        repeat
		    write('Gologan SIM(A/B/C)      : '); readln(A[N].golSIM);
        until (A[N].golSIM='A') or (A[N].golSIM='B') or (A[N].golSIM='C');
		write('Plat Nomor       : '); readln(A[N].Plat);
		repeat
		        write('Pelanggaran(A/B/C/D/E/F/G/H/I/J)      : '); readln(A[N].JenisPelanggaran);
		until (A[N].JenisPelanggaran='A') or (A[N].JenisPelanggaran='B') or (A[N].JenisPelanggaran='C') or (A[N].JenisPelanggaran='D') or (A[N].JenisPelanggaran='E') or (A[N].JenisPelanggaran='F') or (A[N].JenisPelanggaran='G')
                or (A[N].JenisPelanggaran='H') or (A[N].JenisPelanggaran='I') or (A[N].JenisPelanggaran='J');
		write('Melanggar Pasal   : '); readln(A[N].pasal);
		write('Hari              : '); readln(A[N].hari);
		repeat
			write('Bulan             : '); readln(A[N].bln);
		until (A[N].bln<=12) and (A[N].bln>00);
		repeat
			write('Tanggal           : '); readln(A[N].tgl);
		until(A[N].tgl<=30)and (A[N].tgl>=1);
		write('Tahun             : '); readln(A[N].thn);
		repeat
			write('Jam(24jam)        : '); readln(A[N].jam);
		until (A[N].jam>='00.00') and (A[N].jam<='23.59');
		write('Tanggal Sidang    : '); readln(A[N].sidang);
		write('Penilang          : '); readln(A[N].penilang);
		write('Denda             : '); readln(A[N].Denda);
		save();
	end;

	function getJenisPelanggaran(jenisPelanggaran:string): string;
        begin
               case JenisPelanggaran of
				'A': getJenisPelanggaran:= 'Menerobos Lampu Merah';
				'B': getJenisPelanggaran:= 'Tidak Menggunakan Helm';
				'C': getJenisPelanggaran:= 'Tidak Menyalakan Lampu Kendaraan';
				'D': getJenisPelanggaran:= 'Tidak Membawa Surat Kelengkapan Kendaraan';
				'E': getJenisPelanggaran:= 'Melawan Arus';
				'F': getJenisPelanggaran:= 'Melanggar Rambu-rambu Lalu Lintas';
				'G': getJenisPelanggaran:= 'Menerobos Jalur Busway';
				'H': getJenisPelanggaran:= 'Penggunaan Kendaraan yang Tidak Memperhatikan Aspek Keselamatan';
				'I': getJenisPelanggaran:= 'Tidak Menggunakan Spion';
				'J': getJenisPelanggaran:= 'Berkendara Lewat Trotoar';
                end;
        end;

		procedure menuViewOption(ppl:integer);
        begin
                case ppl of
                        1: editData({A});
                        2: hapusData();
                end;
        end;

        procedure menuView();
        var
                kul, N : integer;

        begin
                //repeat
				load();
                        clrscr;
                        writeln('View Data');
                        writeln('================================');
						for N:= 1 to count(a)-1 do
						begin
                                writeln('No             : ', N);
                                writeln('Nama           : ',A[N].Nama);
				writeln('ID             : ',A[N].ID);
				writeln('Alamat         : ',A[N].Alamat);
			        writeln('Pekerjaan      : ',A[N].Pekerjaan);
				writeln('Pendidikan     : ',A[N].Pendidikan);
				writeln('Umur		: ',A[N].Umur);
				writeln('Tempat Lahir	: ',A[N].tmptLahir);
				writeln('Tanggal Lahir  : ',A[N].tglLahir);
				writeln('Gologan SIM    : ',A[N].golSIM);
				writeln('Plat Nomor     : ',A[N].Plat);
				writeln('Pelanggaran	: ',getJenisPelanggaran(A[N].JenisPelanggaran));
				writeln('Melanggar Pasal: ',A[N].pasal);
				writeln('Hari           : ',A[N].hari);
				writeln('Tanggal        : ',A[N].tgl);
				writeln('Bulan          : ',A[N].bln);
				writeln('Tahun          : ',A[N].thn);
				writeln('Jam(24jam)     : ',A[N].jam);
				writeln('Tanggal Sidang	: ',A[N].sidang);
				writeln('Penilang       : ',A[N].penilang);
				writeln('Denda          : ',A[N].Denda:0:0);
                        end;
                        writeln('[1] Edit; [2] Delete; [3] Back');
                        write('...'); readln(kul);
			{while kul<>3 do}
                        menuViewOption(kul);
                //until (kul=3);
        end;

        procedure menuOption(opsi:integer);
        begin
                case opsi of
                        1: Input();
                        2: menuView();
                end;
        end;

        procedure menu();
        var
                opsi: integer;
        begin
                repeat
                        clrscr;
                        writeln('Pilihan Menu');
                        writeln('================================');
                        writeln('1. Input Data');
                        writeln('2. View Data');
                        writeln('3. Exit');
                        writeln('================================');
                        write('option: '); readln(opsi);
                until (opsi>=1) and (opsi<=3);
                if (opsi<>3) then begin
                        menuOption(opsi);
                        menu();
                end;
        end;

begin
	splashscreen();
        menu()
end.
