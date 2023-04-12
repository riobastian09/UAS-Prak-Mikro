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

#### Menggunakan BCD
6.1 Konfigurasi Port 7-Segment Display
> `No. of Digits : 4`

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
| Digit3 A     |    P3.0   |
| Digit3 B     |    P3.1   |
| Digit3 C     |    P3.2   |
| Digit3 D     |    P3.3   |
| Digit3 DP    |    GND    |
| Digit4 A     |    P4.0   |
| Digit4 B     |    P4.1   |
| Digit4 C     |    P4.2   |
| Digit4 D     |    P4.3   |
| Digit4 DP    |    GND    |

## Authors

- [@riobastian09](https://github.com/riobastian09/)
