<<<<<<< HEAD
# UAS Praktikum Mikroprosesor

Terdapat 2 jenis program dengan menggunakan bahasa assembly 8051.

1. Menggunakan BCD atau Decoder untuk Konversi nilai Bit ke 7-Segment
2. Tanpa menggunakan BCD, sehingga nilainya langsung ditetapkan ke 7-Segment

## Cara Penggunaan

1. Buka Topview Simulator
2. Sesuaikan Konfigurasi Device
   > ![image](https://user-images.githubusercontent.com/39443794/231340692-3e77c78c-972e-4b51-9647-3b6ebe5e716f.png)
3. Setup 7-Segment dan Keyboard Input

4.Pergi ke menu `External Modules Setting` > `LED`.

> ![image](https://user-images.githubusercontent.com/39443794/231342937-1f1425f0-8fc8-4480-8f41-98a7b38b4d76.png)

5.  Konfigurasi 7-Segment Display

    > - Interface Selection : Non-Multiplexed
    > - Display Color : Red/Green (Sesuai Selera)
    > - Display Type : Common Cathode
    > - Data Input Selection : BCD (Untuk BCD) | 7 Segment (Untuk Non-BCD)
    >   ![image](https://user-images.githubusercontent.com/39443794/231343280-4a3e28dc-29a6-45aa-9168-041b1dbada6b.png)

6.  Enable dan Konfigurasi Port 7-Segment Display
    > - Uncheck `No Seven Segment Display`
    > - Klik Selection of Port Lines and Number of Digits
    >   ![image](https://user-images.githubusercontent.com/39443794/231343582-8240928a-b131-4bed-81b6-5332f41f8dd7.png)

6.1 Konfigurasi BCD Port 7-Segment Display

> `No. of Digits : 4`

```
| Control Line | Port Line |
| Digit1 A     |    P0.0   |
| Digit1 B     |    P0.1   |
| Digit1 C     |    P0.2   |
| Digit1 D     |    P0.3   |
| Digit1 DP    |    GND    |

| Digit2 A     |    P1.0   |
| Digit2 B     |    P1.1   |
| Digit2 C     |    P1.2   |
| Digit2 D     |    P1.3   |
| Digit2 DP    |    +5V    |

| Digit3 A     |    P2.0   |
| Digit3 B     |    P2.1   |
| Digit3 C     |    P2.2   |
| Digit3 D     |    P2.3   |
| Digit3 DP    |    GND    |

| Digit4 A     |    P3.0   |
| Digit4 B     |    P3.1   |
| Digit4 C     |    P3.2   |
| Digit4 D     |    P3.3   |
| Digit4 DP    |    GND    |
```

6.2 Konfigurasi Port 7-Segment Display

> `No. of Digits : 4`

```
| Control Line | Port Line |
| Digit1 SEG A |    P0.0   |
| Digit1 SEG B |    P0.1   |
| Digit1 SEG C |    P0.2   |
| Digit1 SEG D |    P0.3   |
| Digit1 SEG E |    P0.4   |
| Digit1 SEG F |    P0.5   |
| Digit1 SEG G |    P0.6   |
| Digit1 SEG DP|    GND    |

| Digit2 SEG A |    P1.0   |
| Digit2 SEG B |    P1.1   |
| Digit2 SEG C |    P1.2   |
| Digit2 SEG D |    P1.3   |
| Digit2 SEG E |    P1.4   |
| Digit2 SEG F |    P1.5   |
| Digit2 SEG G |    P1.6   |
| Digit2 SEG DP|    +5V    |

| Digit3 SEG A |    P2.0   |
| Digit3 SEG B |    P2.1   |
| Digit3 SEG C |    P2.2   |
| Digit3 SEG D |    P2.3   |
| Digit3 SEG E |    P2.4   |
| Digit3 SEG F |    P2.5   |
| Digit3 SEG G |    P2.6   |
| Digit3 SEG DP|    GND    |

| Digit4 SEG A |    P3.0   |
| Digit4 SEG B |    P3.1   |
| Digit4 SEG C |    P3.2   |
| Digit4 SEG D |    P3.3   |
| Digit4 SEG E |    P3.4   |
| Digit4 SEG F |    P3.5   |
| Digit4 SEG G |    P3.6   |
| Digit4 SEG DP|    GND    |
```

7. Pergi ke menu `External Modules Setting` > `Keyboard`.

   > ![image](https://user-images.githubusercontent.com/39443794/231348975-0703b318-9921-4a5a-b866-34d7bd8838b1.png)

8. Konfigurasi `Keys - Momentary Type`

   > - Port Line Checked = Port 1 & Port 2
   > - Activating Levels = Port 1 & Port 2
   >   Note : ini berlaku untuk BCD dan Non-BCD
   >   ![image](https://user-images.githubusercontent.com/39443794/231349258-623c272a-71e4-4fa1-b16f-a2fe1dc2d6de.png)

9. Muat program `.hex` dengan mengklik `File` > `Load Program`

10. Jalankan Program dengan klik `Run` > `Go`

#### Cara Kerja Program

Program memiliki 2 cara untuk melakukan display, dengan menggunakan BCD dan tanpa BCD.

> Tombol Momentary 2.7 Digunakan untuk menetapkan nilai menit
> Tombol Momentary 3.7 Digunakan untuk melakukan reset

Masing-masing program dengan menggunakana BCD dan tanpa BCD memiliki 2 alur proses yang berbeda, dimana:

##### Proses 1 (Started Run)

1. Ketika Program Dijalankan, Counting akan segera mulai dari detik 00:00 tanpa perlu disetting
2. Ketika tombol setting diklik, digit menit akan berubah menjadi 00, dan digit detik akan berhenti. Ketika selesai setting dengan tidak menekan tombol setting selama beberapa detik, maka digit menit akan ditampilkan sesuai dengan berapa kali tombol menit ditekan, dan program akan melanjutkan counting.
3. Jika tombol reset diklik, maka program akan memulai counting dari 00:00 dan langsung berjalan seperti semula.

##### Proses 2 (Started Delay)

1. Ketika Program Dijalankan, Counting tidak akan segera mulai dari detik 00:00, dan perlu disetting
2. Ketika tombol setting diklik, digit menit akan berubah menjadi 00, dan digit detik akan berhenti. Ketika selesai setting dengan tidak menekan tombol setting selama beberapa detik, maka digit menit akan ditampilkan sesuai dengan berapa kali tombol menit ditekan, dan program akan melanjutkan counting.
3. Jika tombol reset diklik, maka program akan memulai counting dari 00:00 dan proses counting akan berhenti.
4. Counting dapat dilanjutkan kembali jika setting menit sudah dilakukan.

## Authors

- [@riobastian09](https://github.com/riobastian09/)
=======
# UAS Praktikum Mikroprosesor

Terdapat 2 jenis program dengan menggunakan bahasa assembly 8051.
1. Menggunakan BCD atau Decoder untuk Konversi nilai Bit ke 7-Segment
2. Tanpa menggunakan BCD, sehingga nilainya langsung ditetapkan ke 7-Segment

## Cara Penggunaan
1. Buka Topview Simulator
2. Sesuaikan Konfigurasi Device
> ![image](https://user-images.githubusercontent.com/39443794/231340692-3e77c78c-972e-4b51-9647-3b6ebe5e716f.png)
3. Setup 7-Segment dan Keyboard Input

4.Pergi ke menu `External Modules Setting` > `LED`.
> ![image](https://user-images.githubusercontent.com/39443794/231342937-1f1425f0-8fc8-4480-8f41-98a7b38b4d76.png)

5.  Konfigurasi 7-Segment Display
> - Interface Selection   : Non-Multiplexed
> - Display Color         : Red/Green (Sesuai Selera)
> - Display Type          : Common Cathode
> - Data Input Selection  : BCD (Untuk BCD) | 7 Segment (Untuk Non-BCD)
> ![image](https://user-images.githubusercontent.com/39443794/231343280-4a3e28dc-29a6-45aa-9168-041b1dbada6b.png)

6.  Enable dan Konfigurasi Port 7-Segment Display
> - Uncheck `No Seven Segment Display`
> - Klik Selection of Port Lines and Number of Digits
> ![image](https://user-images.githubusercontent.com/39443794/231343582-8240928a-b131-4bed-81b6-5332f41f8dd7.png)

6.1 Konfigurasi BCD Port 7-Segment Display
> `No. of Digits : 4`
```
| Control Line | Port Line |
| Digit1 A     |    P0.0   |
| Digit1 B     |    P0.1   |
| Digit1 C     |    P0.2   |
| Digit1 D     |    P0.3   |
| Digit1 DP    |    GND    |

| Digit2 A     |    P1.0   |
| Digit2 B     |    P1.1   |
| Digit2 C     |    P1.2   |
| Digit2 D     |    P1.3   |
| Digit2 DP    |    +5V    |

| Digit3 A     |    P2.0   |
| Digit3 B     |    P2.1   |
| Digit3 C     |    P2.2   |
| Digit3 D     |    P2.3   |
| Digit3 DP    |    GND    |

| Digit4 A     |    P3.0   |
| Digit4 B     |    P3.1   |
| Digit4 C     |    P3.2   |
| Digit4 D     |    P3.3   |
| Digit4 DP    |    GND    |
```

6.2 Konfigurasi Port 7-Segment Display
> `No. of Digits : 4`
```
| Control Line | Port Line |
| Digit1 SEG A |    P0.0   |
| Digit1 SEG B |    P0.1   |
| Digit1 SEG C |    P0.2   |
| Digit1 SEG D |    P0.3   |
| Digit1 SEG E |    P0.4   |
| Digit1 SEG F |    P0.5   |
| Digit1 SEG G |    P0.6   |
| Digit1 SEG DP|    GND    |

| Digit2 SEG A |    P1.0   |
| Digit2 SEG B |    P1.1   |
| Digit2 SEG C |    P1.2   |
| Digit2 SEG D |    P1.3   |
| Digit2 SEG E |    P1.4   |
| Digit2 SEG F |    P1.5   |
| Digit2 SEG G |    P1.6   |
| Digit2 SEG DP|    +5V    |

| Digit3 SEG A |    P2.0   |
| Digit3 SEG B |    P2.1   |
| Digit3 SEG C |    P2.2   |
| Digit3 SEG D |    P2.3   |
| Digit3 SEG E |    P2.4   |
| Digit3 SEG F |    P2.5   |
| Digit3 SEG G |    P2.6   |
| Digit3 SEG DP|    GND    |

| Digit4 SEG A |    P3.0   |
| Digit4 SEG B |    P3.1   |
| Digit4 SEG C |    P3.2   |
| Digit4 SEG D |    P3.3   |
| Digit4 SEG E |    P3.4   |
| Digit4 SEG F |    P3.5   |
| Digit4 SEG G |    P3.6   |
| Digit4 SEG DP|    GND    |
```

7. Pergi ke menu `External Modules Setting` > `Keyboard`.
> ![image](https://user-images.githubusercontent.com/39443794/231348975-0703b318-9921-4a5a-b866-34d7bd8838b1.png)

8. Konfigurasi `Keys - Momentary Type`
> - Port Line Checked = Port 1 & Port 2
> - Activating Levels = Port 1 & Port 2
> Note : ini berlaku untuk BCD dan Non-BCD
> ![image](https://user-images.githubusercontent.com/39443794/231349258-623c272a-71e4-4fa1-b16f-a2fe1dc2d6de.png)

9.  Muat program `.hex` dengan mengklik `File` > `Load Program`

10. Jalankan Program dengan klik `Run` > `Go` 

####  Cara Kerja Program
Program memiliki 2 cara untuk melakukan display, dengan menggunakan BCD dan tanpa BCD.
> Tombol Momentary 2.7 Digunakan untuk menetapkan nilai menit
> Tombol Momentary 3.7 Digunakan untuk melakukan reset

Masing-masing program dengan menggunakana BCD dan tanpa BCD memiliki 2 alur proses yang berbeda, dimana:
##### Proses 1 (Started Run)
1. Ketika Program Dijalankan, Counting akan segera mulai dari detik 00:00 tanpa perlu disetting
2. Ketika tombol setting diklik, digit menit akan berubah menjadi 00, dan digit detik akan berhenti. Ketika selesai setting dengan tidak menekan tombol setting selama beberapa detik, maka digit menit akan ditampilkan sesuai dengan berapa kali tombol menit ditekan, dan program akan melanjutkan counting.
3. Jika tombol reset diklik, maka program akan memulai counting dari 00:00 dan langsung berjalan seperti semula.

##### Proses 2 (Started Delay)
1. Ketika Program Dijalankan, Counting tidak akan segera mulai dari detik 00:00, dan perlu disetting
2. Ketika tombol setting diklik, digit menit akan berubah menjadi 00, dan digit detik akan berhenti. Ketika selesai setting dengan tidak menekan tombol setting selama beberapa detik, maka digit menit akan ditampilkan sesuai dengan berapa kali tombol menit ditekan, dan program akan melanjutkan counting.
3. Jika tombol reset diklik, maka program akan memulai counting dari 00:00 dan proses counting akan berhenti.
4. Counting dapat dilanjutkan kembali jika setting menit sudah dilakukan.

## Authors
- [@riobastian09](https://github.com/riobastian09/)
>>>>>>> a6e5faa0e4b65bc92ec8cf023e79edbc59ebf5df
