# P2_Probstat_F_5025201003

## Daftar Isi
* [Daftar Isi](#daftar-isi)
* [Nomor 1](#nomor-1)
* [Nomor 2](#nomor-2)
* [Nomor 3](#nomor-3)
* [Nomor 4](#nomor-4)
* [Nomor 5](#nomor-5)

## Nomor 1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap
kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel
sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat
kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut
diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali
kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden
mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴

<img width="156" alt="image" src="https://user-images.githubusercontent.com/99629909/170820006-80f262a0-09c7-4b55-93fc-31404c9a115b.png">

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari
responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah
melakukan aktivitas 𝐴 sebanyak 70.

### **Soal 1a**
Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel
diatas

#### Penyelesaian
Pada soal, diketahui bahwa p = 0.20 dan x = 3. Diketahui juga bahwa soal ini meruapakan permasalahan distribusi geometrik. Sehingga pengimplementasian pada bahasa R bisa menggunakan command `dgeom` pada kondisi eksak.
```R
dgeom(x = 3, prob = .2)
```
Dari kode di atas, didapatkan hasil perhitungan 0.1024

<img width="99" alt="image" src="https://user-images.githubusercontent.com/99629909/162525950-8d90025d-66aa-4344-b6e9-3dc40d69c139.png">


### **Soal 1b**
carilah nilai t (p-value)

#### Penyelesaian
Pada soal, diketahui bahwa digunakan 10000 data random dengan probabilitas keberhasilan dan X yang sama seperti soal sebelumnya. Untuk melakukan generate 10000 data random, digunakan command `rgeom` dengan parameter n = 10000 dan prob = 0.2. Karena pada soal ini digunakan banyak data, maka kita dapat menggunakan fungsi `mean` dengan kondisi X = 3.
```R
mean(rgeom(n=10000, prob=.2)==3)
```
Dari kode di atas, didapatkan hasil perhitungan kurang lebih 0.1024

<img width="288" alt="image" src="https://user-images.githubusercontent.com/99629909/162526548-e35f8d1e-b478-4916-b175-668503e4d33c.png">


### **Soal 1c**
tentukanlah apakah terdapat pengaruh yang signifikan secara statistika
dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan
aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada
pengaruh yang signifikan secara statistika dalam hal kadar saturasi
oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

#### Penyelesaian
Dari perbandingan hasil poin a dan b dapat dilihat bahwa nilainya hampir sama antara keduanya. Sehingga dapat disimpulkan pada metode perhitungan eksak maupun simulasi (data random dengan `mean`) dapat diterapkan dalam menghitung persoalan peluang pada distribusi geometrik.


## Nomor 2
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun.
Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk
mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata
23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan library seperti referensi pada modul).

### **Soal 2a**
Apakah Anda setuju dengan klaim tersebut?

#### Penyelesaian
Diketahui:

H0: μ ≥ 20.000

H1: μ < 20.000

Dimana  μ adalah rata-rata jarak tempuh mobil per tahun.

Karena pada soal tidak ditentukan nilai dari level signifikan (α) -nya, maka saya mengasumsikan menggunakan nilai α default pada aplikasi R Studio yaitu α = 0.05

Dalam persoalan ini bisa menggunakan rumus manual yaitu:

<img width="250" alt="image" src="https://user-images.githubusercontent.com/99629909/170826430-bdee13e0-0a02-49f4-9f41-7acf32c97701.png">

Namun pada persoalan ini saya menggunakan library dari RStudio sesuai dengan perintah soal. Sehingga diperlukan install package terlebih dahulu dengan kode sebagai berikut:

```R
install.packages("BSDA")
library(BSDA)
```

Lalu untuk kode perhitungannya adalah sebagai berikut:

```R
zsum.test(mean.x=23500, sigma.x = 3900, n.x = 100,  
          alternative = "less", mu = 20000)
```

Pada kode di atas conf.level tidak ditulis, karena hanya langsung mengikuti default pada RStudio. 

Dari kode di atas didapatkan output sebagai berikut:

<img width="438" alt="image" src="https://user-images.githubusercontent.com/99629909/170826608-8984b7b4-beea-45ed-84f7-298d92515f2e.png">

>**Sehingga saya setuju dengan klaim tersebut.**

### **Soal 2b**
Jelaskan maksud dari output yang dihasilkan!

#### Penyelesaian
Berdasarkan output yang dihasilkan, diperoleh nilai Zhitung = 8.9744 dan p-value = 1. Dari hasil tersebut saya dapat menerima hipotesis awal dan disumpulkan bahwa tidak terdapat cukup bukti di mana rata-rata dari jarak tempuh mobil per tahun secara signifikan tidak lebih besar dari 20.000 kilometer. Selain itu, dari output, kita juga dapatkan selang kepercayaan rata-rata dari sampel yang berkisar kurang dari 24141.49 atau dapat dinyatakan bahwa dengan selang kepercayaan 95% kita yakin rata-rata jarak tempuh mobil per tahun akan berkisar antara 24141.49. Rata-rata jarak tempuh mobil per tahun dari data sampel yang dihitung adalah 23500.

### **Soal 2c**
Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!

#### Penyelesaian
Karena P-Value hitungan (P-Value = 1) lebih besar dari taraf keberartian α yang ditentukan (α = 0.05), maka H0 atau hipotesis awal dapat diterima. Sehingga dapat disimpulkan bahwa rata-rata jarak tempuh sebuah mobil adalah lebih dari 20.000 kilometer per tahun atau dengan kalimat lain, mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun.


## Nomor 3
Diketahui perusahaan memiliki seorang data analyst ingin memecahkan
permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya
didapatkanlah data berikut dari perusahaan saham tersebut.

<img width="315" alt="image" src="https://user-images.githubusercontent.com/99629909/170820105-32139874-6393-470d-82d7-6b32d9c469c1.png">

Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil
diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada
rata-ratanya (α= 0.05)? Buatlah :

### **Soal 3a**
H0 dan H1

#### Penyelesaian
Untuk mencari H0 dan H1 dapat menggunakan rumus:

<img width="353" alt="image" src="https://user-images.githubusercontent.com/99629909/170854388-ca920f1c-1495-4e99-9ff7-70263e1dc776.png">

Apabila diimplementasikan ke RStudio akan menjadi:

Mencari HO:

```R
h0 = (3.64-0)/(1.67/sqrt(19))
h0
```

<img width="255" alt="image" src="https://user-images.githubusercontent.com/99629909/170854591-bc1316c4-dca9-4e7f-92f2-cefcef18594d.png">

Didapatkan nilainya adalah 9.500834

Mencari H1:

```R
h1 = (2.79-0)/(1.32/sqrt(27))
h1
```

<img width="258" alt="image" src="https://user-images.githubusercontent.com/99629909/170854611-f9580f55-beb9-4808-9fcf-c2018faaba9f.png">

Didapatkan nilainya adalah 10.98278

### **Soal 3b**
Hitung Sampel Statistik

#### Penyelesaian
Untuk menghitung sampel statistik dapat menggunakan fungsi `tsum.test` berikut:

```R
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y =2.79 , s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)
```

<img width="539" alt="image" src="https://user-images.githubusercontent.com/99629909/170854635-6e169ded-f705-4a4e-8c6a-963f5a27461a.png">


### **Soal 3c**
Lakukan Uji Statistik (df =2)

#### Penyelesaian
Kita dapat menggunakan fugnsi `plotDist`, namun kita terlebih dahulu harus menginstall library `mosaic`.

```R
install.packages("mosaic")
library(mosaic)
```

Setelah library `mosaic` terinstall kita dapat menggunakan fungsi `plotDist` dengan parameter df = 2 sesuai yang diminta soal.

```R
plotDist(dist='t', df=2, col="red")
```

<img width="526" alt="image" src="https://user-images.githubusercontent.com/99629909/170854781-d521e109-180c-4d1f-b62b-587130da5cd6.png">

### **Soal 3d**
Nilai Kritikal

#### Penyelesaian
Untuk menghitung nilai kritikal dapat digunakan fungsi `qchisq` dengan df = 2 seusai yang diminta pada soal.

```R
qchisq(p = 0.05, df = 2, lower.tail=FALSE)
```

didapatkan nilai kritikalnya adalah 5.991465

<img width="364" alt="image" src="https://user-images.githubusercontent.com/99629909/170855154-557209fe-7117-44aa-aff4-b07f3be73185.png">

### **Soal 3e**
Keputusan

#### Penyelesaian
Pada teori keputusan terdapat aksi dan kemungkinan konsekuensi. Pada soal ini aksinya adalah `({a}_{a∈A})` dan kemungkinan konsekuensinya adalah `({c}_{c∈C})`. Sehingga keputusan dapat diambil dari `t.test`. 

### **Soal 3f**
Kesimpulan

#### Penyelesaian
Kesimpulan yang dapat diambil adalah bahwa tidak ada perbedaan rata-rata bila dilihat dari uji statistik dan akan ada sedikit perbedaan yang tidak signifikan yang dipengaruhi oleh nilai kritikal.


## Nomor 4
Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya
ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan
kucing putih dengan panjangnya masing-masing.
Jika :
diketahui dataset https://intip.in/datasetprobstat1
H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya
sama
Maka Kerjakan atau Carilah:

### **Soal 4a**
Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup
2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan
lihat apakah ada outlier utama dalam homogenitas varians.

#### Penyelesaian
Pada soal diketahui bahwa nilai x adalah 2 dan nilai v atau derajat kebebasannya adalah 10

```R
pchisq(2, 10)
```
didapatkan hasilnya adalah 0.0037

<img width="127" alt="image" src="https://user-images.githubusercontent.com/99629909/162557411-b54e52e8-bd2b-452e-93d8-808e5cab6358.png">

### **Soal 4b**
carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang
didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?

#### Penyelesaian
1. generate data random menggunakan command `rchisq`. Disini saya mencontohkan dengan hanya mengambil 100 data random sesuai ketentuan soal
2. pada `rchisq` membuthkan parameter berupa derajat kebebasan, dimana pada soal ini derajat kebebasannya bernilai 10
3. kemudian digunakan package library(tidyverse) untuk membantu dalam pembuatan grafik
4. digunakan command `qplot` dengan parameter geom adalah histogram dan set warna border sesuai yang kita inginkan
```R
x <- rchisq(100, 10)
library(tidyverse)
qplot(x, geom = "histogram", col = I("white"))
```

<img width="395" alt="image" src="https://user-images.githubusercontent.com/99629909/162557461-d8685031-82c5-402c-8492-a5a99aef554f.png">

### **Soal 4c**
Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus
Grup dan beri nama model tersebut model 1.

#### Penyelesaian
Nilai rataan dari distribusi Chi-Square adalah sama dengan derajat kebebasan. Atau bisa dituliskan dengan formula:
> μ = df

Sehingga nilai rataanya adalah 10.

Pengimplementasiannya dalam bahasa R adalah sebagai berikut:

```R
x <- rchisq(100, 10) 
mean(x)
```
Hasil running kode di atas mendapatkan nilai rataan yang sama sesuai dengan teori yaitu 10.

<img width="185" alt="image" src="https://user-images.githubusercontent.com/99629909/162557680-5f38e613-0372-47a7-b649-b057db10ecf8.png">

Nilai varian dari distribusi Chi-Square adalah sama dengan 2 kali derajat kebebasan. Atau bisa dituliskan dengan formula:
> μ = 2df

Sehingga nilai variannya adalah 20.

Pengimplementasiannya dalam bahasa R adalah sebagai berikut:

```R
x <- rchisq(100, 10)  
var(x)
```
Hasil running kode di atas mendapatkan nilai varian yang sama sesuai dengan teori yaitu 20.

<img width="182" alt="image" src="https://user-images.githubusercontent.com/99629909/162557729-5c2815bb-243d-4aa3-9e68-e629dc3e4229.png">

### **Soal 4d**
Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan
dari H0?

#### Penyelesaian


### **Soal 4e**
Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p
yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.

#### Penyelesaian


### **Soal 4f**
Visualisasikan data dengan ggplot2

#### Penyelesaian

## Nomor 5
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk
mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca
pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan
dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil
Eksperimen. Dengan data tersebut:

### **Soal 5a**
Buatlah plot sederhana untuk visualisasi data

#### Penyelesaian
Fungsi Probabilitas (densitas) dari Distribusi Exponensial adalah sebagai berikut:
> f(x; λ) = λe^(-λx)

Langkah-langkah untuk menghitung fungsi probabilitas dari distribusi exponensial dalam bahasa R adalaah:
1. digunakan fungsi `set.seed(1)` supaya pada saat pemanggilan random data, nilainya tetap/konsisten
2. digunakan fungsi `rexp(1)` untuk generate 1 data random
3. digunakan fungsi `dexp()` dengan parameter data dari `rexp(1)` dan lambda 3 

```R
set.seed(1)
dexp(rexp(1), 3)
```
Hasil dari Fungsi Probabilitas Distribusi Exponensial di atas adalah 0.31

<img width="150" alt="image" src="https://user-images.githubusercontent.com/99629909/162599060-482cd98c-b121-4039-82fc-2a1d01f93ae7.png">

### **Soal 5b**
Lakukan uji ANOVA dua arah

#### Penyelesaian
Dalam pembuatan histogram dari distribusi exponential, digunakan fungsi `hist()` yang di dalamnya telah digenerate data random menggunakan fungsi `rexp` dengan banyak data sesuai yang diinginkan dan dengan nilai lambda sebesar 3.
```R
# random data = 10
hist(rexp(10, 3)
     ,main = "Distribution Exponential of 10 random data"
     ,xlab = "variables"
     ,breaks = 15
     ,density = 15)
```
<img width="468" alt="image" src="https://user-images.githubusercontent.com/99629909/162599626-bdad3349-01d8-45ed-9890-26ac13950295.png">

```R
# random data = 100
hist(rexp(100, 3)
     ,main = "Distribution Exponential of 100 random data"
     ,xlab = "variables"
     ,breaks = 15
     ,density = 15)
```
<img width="469" alt="image" src="https://user-images.githubusercontent.com/99629909/162599655-9caa5780-2f42-42dc-9e09-ead57baca882.png">

```R
# random data = 1000
hist(rexp(1000, 3)
     ,main = "Distribution Exponential of 1000 random data"
     ,xlab = "variables"
     ,breaks = 15
     ,density = 15)
```
<img width="478" alt="image" src="https://user-images.githubusercontent.com/99629909/162599666-4965d683-09d4-4237-a444-b8d36fdb0514.png">

```R
# random data = 10000
hist(rexp(10000, 3)
     ,main = "Distribution Exponential of 10000 random data"
     ,xlab = "variables"
     ,breaks = 15
     ,density = 15)
```
<img width="475" alt="image" src="https://user-images.githubusercontent.com/99629909/162599679-24beb83d-eb49-425e-85e2-8837e01a723e.png">

### **Soal 5c**
Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk
setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

#### Penyelesaian
Rataan untuk kondisi eksak dapat dihitung dengan rumus
> mean(x) = 1/lambda

Sehingga pengimplementasiannya dalam bahasa R adalah:
```R
lambda = 3
mean = 1/lambda
mean
```
Dari kode di atas didapatkan hasil rataan exact adalah 0.33

<img width="150" alt="image" src="https://user-images.githubusercontent.com/99629909/162558625-7fd8d526-c652-415b-9d33-cb138bc4d682.png">

Rataan untuk kondisi simulasi (n data random) dapat dihitung dengan command `mean` dengan parameter `rexp`. Misalkan n = 100, maka dapat dituliskan kode: 
```R
x <- rexp(100, 3) 
mean(x)
```
atau bisa juga dituliskan dengan format langsung sebagai berikut:
```R
mean(rexp(100,3))
```
Dari kode di atas didapatkan hasil rataan simulasi adalah kurang lebih bernilai 0.33

<img width="160" alt="image" src="https://user-images.githubusercontent.com/99629909/162558687-9992f381-a8c6-4a70-ad5b-4050fdb983a9.png">

Varian untuk kondisi eksak dapat dihitung dengan rumus
> var(x) = 1/(n * lambda^2)

Sehingga pengimplementasiannya dalam bahasa R adalah:
```R
n = 100
lambda = 3
var = 1/(lambda^2)
var
```
Dari kode di atas didapatkan hasil rataan exact adalah 0.11

<img width="174" alt="image" src="https://user-images.githubusercontent.com/99629909/162558947-69b6147e-a9cb-43c0-af98-98ebf6819044.png">

Varian untuk kondisi simulasi (n data random) dapat dihitung dengan command `var` dengan parameter `rexp`. Misalkan n = 100, maka dapat dituliskan kode: 
```R
x <- rexp(100, 3)  
var(x)
```
atau bisa juga dituliskan dengan format langsung sebagai berikut:
```R
var(rexp(100, 3))
```
Dari kode di atas didapatkan hasil rataan simulasi adalah bernilai sekitar 0.11

<img width="162" alt="image" src="https://user-images.githubusercontent.com/99629909/162558997-edac89a5-568d-4e4b-ab8b-644a875a53d5.png">

### **Soal 5d**
Lakukan uji Tukey

#### Penyelesaian


### **Soal 5e**
Gunakan compact letter display untuk menunjukkan perbedaan signifikan
antara uji Anova dan uji Tukey

#### Penyelesaian
