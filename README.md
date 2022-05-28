# Praktikum 2 Probstat F [Rahmat Faris Akbar / 5025201003]

## Daftar Isi
* [Daftar Isi](#daftar-isi)
* [Nomor 1](#nomor-1)
* [Nomor 2](#nomor-2)
* [Nomor 3](#nomor-3)
* [Nomor 4](#nomor-4)
* [Nomor 5](#nomor-5)
* [Nomor 6](#nomor-6)

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
Dalam implementasi bahasa R, dapat digunakan fungsi `dbinom(x, size, prob)` untuk menghitung peluang dalam distribusi binomial. Pada soal diketahui bahwa terdapat 20 pasien menderita Covid19 yang digunakan sebagai parameter size, peluang sembuh 0.2 sebagai parameter probs, dan 4 pasien yang sembuh (sukses) sebagai parameter x.

```R
dbinom(x=4, size=20, prob=.2)
```
Dari kode di atas didapatkan hasil perhitungan peluang terdapat 4 pasien yang sembuh dari 20 pasien dengan peluang sembuh sebesar 0.2 adalah 0.2181994

<img width="256" alt="image" src="https://user-images.githubusercontent.com/99629909/162554237-e47fe2c4-7f96-4f7c-b527-6d8acc028abd.png">


### **Soal 2b**
Jelaskan maksud dari output yang dihasilkan!

#### Penyelesaian
Langkah-langkah untuk membuat grafik dalam distribusi binomial adalah:
0. digunakan bantuan `library(dplyr)` dan `library(ggplot2)` untuk menampilkan grafik
1. melakukan permisalan atau menentukan range data randomnya. Pada kasus ini saya misalkan rangenya adalah antara 0 sampai 10
2. kemudian gunakan command `data.frame`. Pada command ini dibutuhkan parameter prob yang dapat dicari dengan menggunakan command `dbinom` dengan parameter sesuai ketentuan soal
3. digunakan command `mutate` yang mengambil parameter dari banyak kesuksesan untuk dihighlight. Pada kasus ini adalah 4
4. kemudian tetapkan sumbu x sebagai keberhasilan (x) dan sumbu y sebagai prob/peluang distribusi binomial
5. atur posisi penempatan angka dan kata pada grafik, sehingga dapat terbaca dengan nyaman
6. digunakan command `labs` untuk memberikan nama pada grafik

Berikut ini merupakan kode untuk membuat grafik banyak kondisi sukses terhadap peluang distribusi binomial:
```R
library(dplyr)
library(ggplot2)
#library(scales)

data.frame(heads = 0:10, prob = dbinom(x = 0:10, size = 20, prob = .2)) %>%
  mutate(Heads = ifelse(heads == 4, "4", "other")) %>%
  ggplot(aes(x = factor(heads), y = prob, fill = Heads)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,4), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 2,
    vjust = 0
  ) +
  labs(title = "Probability of X = 4 successes.",
       subtitle = "b(20, .2)",
       x = "Successes (x)",
       y = "probability") 
```
Berikut ini merupakan tampilan grafiknya:

<img width="391" alt="image" src="https://user-images.githubusercontent.com/99629909/162554964-ce76e49a-7228-4b5c-b1ef-31a51d9af380.png">

Sedangkan untuk menampilkan grafik histogram x (banyak kondisi sukses) terhadap frekuensi, dapat ditampilkan dengan langkah berikut ini:
1. generate data random menggunakan command `rbinom`. Disini saya mencontohkan dengan hanya mengambil 10 data random
2. kemudian digunakan package library(tidyverse) untuk membantu dalam pembuatan grafik
3. digunakan command `qplot` dengan parameter geom adalah histogram dan set warna border sesuai yang kita inginkan

```R
x <- rbinom(10, 20, .2) 
library(tidyverse)
qplot(x, geom = "histogram", col = I("white"))
```
Berikut merupakan tampilan grafik histogram x (banyak kondisi sukses) terhadap frekuensi:

<img width="387" alt="image" src="https://user-images.githubusercontent.com/99629909/162555107-4271e787-84ff-4ae4-8c66-93f44ead89de.png">

### **Soal 2c**
Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!

#### Penyelesaian
Rataan untuk kondisi eksak dapat dihitung dengan rumus
> mean(x) = size * p

Sehingga pengimplementasiannya dalam bahasa R adalah:
```R
n=20
p=0.2
mean = n * p
mean
```
Dari kode di atas didapatkan hasil rataan exact adalah 4

<img width="122" alt="image" src="https://user-images.githubusercontent.com/99629909/162555398-9a9dfdab-bd82-4515-b9a9-2f3af33d4146.png">

Rataan untuk kondisi simulasi (n data random) dapat dihitung dengan command `mean` dengan parameter `rbinom`. Misalkan n = 10, maka dapat dituliskan kode: 
```R
x <- rbinom(10, 20, .2) 
mean(x)
```
atau bisa juga dituliskan dengan format langsung sebagai berikut:
```R
mean(rbinom(n = 10, size = 20, prob = .2))
```
Dari kode di atas didapatkan hasil rataan simulasi adalah kurang lebih bernilai 4

<img width="361" alt="image" src="https://user-images.githubusercontent.com/99629909/162555554-55c7a3b2-f4fd-405b-ac08-b781944d546e.png">


Varian untuk kondisi eksak dapat dihitung dengan rumus
> var(x) = size * p * (1-p)

Sehingga pengimplementasiannya dalam bahasa R adalah:
```R
n=20
p=0.2
var = n * p * (1-p)
var
```
Dari kode di atas didapatkan hasil rataan exact adalah 3.2

<img width="178" alt="image" src="https://user-images.githubusercontent.com/99629909/162555687-0b6a6e93-f5a6-4536-a853-3b2bb220960e.png">

Varian untuk kondisi simulasi (n data random) dapat dihitung dengan command `var` dengan parameter `rbinom`. Misalkan n = 10, maka dapat dituliskan kode: 
```R
x <- rbinom(10, 20, .2) 
var(x)
```
atau bisa juga dituliskan dengan format langsung sebagai berikut:
```R
var(rbinom(n = 10, size = 20, prob = .2))
```
Dari kode di atas didapatkan hasil rataan simulasi adalah kurang lebih bernilai 3.2

<img width="355" alt="image" src="https://user-images.githubusercontent.com/99629909/162555760-939e0dca-5bf3-431e-89ed-f2cf9b31c251.png">



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
Pada soal diketahui bahwa rata-rata historis bayi lahir per hari atau lambdanya adalah 4,5. Sehingga dapat digunakan command `dpois` untuk menghitung peluang eksak (probability density function dari X), dimana nilai x adalah 6.

```R
dpois(x=6, lambda=4.5)
```
Didapatkan peluang bahwa 6 bayi akan lahir di rumah sakit ini besok adalah sebesar 0.1281201

<img width="198" alt="image" src="https://user-images.githubusercontent.com/99629909/162556341-114039d9-b420-4b51-872e-1e7f471d8227.png">

### **Soal 3b**
Hitung Sampel Statistik

#### Penyelesaian
Langkah-langkah untuk membuat grafik dalam distribusi poisson adalah:
1. menggunakan fungsi `set.seed` agar data random yang dipanggil memiliki nilai yang tetap
2. membuat 365 data random dengan fungsi `rpois` dan menyimpannya dalam variabel `bayi`
3. membuat plot dengan geom histogram dengan memasukkan paramter-parameter yang dibutuhkan

Berikut ini merupakan kode untuk membuat grafik banyak kondisi sukses terhadap peluang distribusi binomial:
```R
set.seed(2)

bayi <- data.frame('data' = rpois(365, 4.5))

bayi %>% ggplot() +
  geom_histogram(aes(x = data,
                     y = stat(count / sum(count)),
                     fill = data == 6),
                 binwidth = 1,
                 color = 'black',) +
  scale_x_continuous(breaks = 0:10) + 
  labs(x = 'Banyak bayi lahir setiap periode',
       y = 'Proporsi',
       title = 'kelahiran 6 bayi akan lahir di rumah sakit ini selama setahun (n = 365)') +
  theme_bw()
```
Berikut ini merupakan tampilan grafiknya:

<img width="699" alt="image" src="https://user-images.githubusercontent.com/99629909/162600561-71ba0e6c-9e10-4098-bf10-bbc3b4965b90.png">

Untuk bisa mengetahui nilai eksak dari kondisi True pada grafik histogram di atas adalah dengan cara berikut:
```R
bayi %>% dplyr::summarize(enam_bayi = sum(bayi$data == 6) / n())
```
<img width="537" alt="image" src="https://user-images.githubusercontent.com/99629909/162600655-30871be5-8588-4e5b-ae6f-33ecb63f1f6b.png">


### **Soal 3c**
Lakukan Uji Statistik (df =2)

#### Penyelesaian
Hasil dari perhitungan simulasi adalah 0.12 atau 12%, sangat mendekati hasil perhitungan theoritical probability yang nilainya 0.1281201 atau 12.81201%.
Jadi kesimpulan yang dapat diambil adalah bahwa theoritical probability terbukti benar dan dapat dipakai dalam perhitungan probabilitasi poisson.

### **Soal 3d**
Nilai Kritikal

#### Penyelesaian

Nilai rataan dapat dihitung dengan kode berikut:
```R
x <- rpois(365, 4.5) 
mean(x)
```
didapatkan rataannya adalah kurang lebih 4.5

<img width="186" alt="image" src="https://user-images.githubusercontent.com/99629909/162557244-54e6e0b6-01da-45c8-aa8a-8b8cb3fc3d6f.png">

Nilai varian dapat dihitung dengan kode berikut:
```R
x <- rpois(365, 4.5)  
var(x)
```
didapatkan rataannya adalah kurang lebih 4.5

<img width="185" alt="image" src="https://user-images.githubusercontent.com/99629909/162557286-cbf5302e-2a76-48a3-9ed4-7820f77c06f5.png">

### **Soal 3e**
Keputusan

#### Penyelesaian


### **Soal 3f**
Kesimpulan

#### Penyelesaian


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
