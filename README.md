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
Untuk menghitung standar deviasi bisa dilakukan melalui cara manual dan menggunakan library RStudio. Untuk cara perhitungan manualnya adalah sebagai berikut:

<img width="401" alt="image" src="https://user-images.githubusercontent.com/99629909/170859531-ab549f9f-c4df-4cab-b4d4-4ee8d27f23e4.png">

Sedangkan untuk implementasinya ke bahasa R adalah sebagai berikut:

```R
x <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

dataku = data.frame(x,y)

stdev = sd(dataku$y - dataku$x)
stdev
```

Pada kode di atas, langkah pertamanya adalah dengan memasukkan semua data yang ada, yaitu data saturasi oksigen sebelum beraktivitas (x) dan data saturassi oksigen sesudah beraktivitas (y). Kemudian digabung menjadi satu tabel dengan menggunakan `data.frame`. Terakhir, dilakukan perhitungan standar deviasi dengan menggunakan `sd`.

<img width="377" alt="image" src="https://user-images.githubusercontent.com/99629909/170859830-5b3f0dce-d97e-439b-905f-db2a713abdbb.png">

**Sehingga didapatkan nilai standar deviasi yang sama dengan cara manual yaitu 6.359595**


### **Soal 1b**
carilah nilai t (p-value)

#### Penyelesaian
Untuk mencari nilai t dan p-value bisa langsung menggunakan fungsi `t.test`. Implementasinya adalah sebagai berikut:

```R
t.test(dataku$y,dataku$x,paired = TRUE)
```

<img width="544" alt="image" src="https://user-images.githubusercontent.com/99629909/170860566-842f7f9e-cf58-4c21-9dc5-0df69575de93.png">

Dari kode di atas, diketahui nilai statistik dari uji 𝑡 (𝑡) adalah 7.6525, sementara nilai probabilitas (p-value) adalah 0.00006003 (atau 6.003e-05). Diketahui juga nilai derajat bebas (df) adalah 8. 

### **Soal 1c**
tentukanlah apakah terdapat pengaruh yang signifikan secara statistika
dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan
aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada
pengaruh yang signifikan secara statistika dalam hal kadar saturasi
oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

#### Penyelesaian
Nilai dari 𝑡𝑘𝑟𝑖𝑡𝑖𝑠 dengan derajat bebas 8 dan tingkat signifikansi 5% adalah ±2,306. Perhatikan bahwa karena |𝑡ℎ𝑖𝑡𝑢𝑛𝑔| > |𝑡𝑘𝑟𝑖𝑡𝑖𝑠|, yakni 7.652 > 2.306, maka disimpulkan bahwa hipotesis nol ditolak dan hipotesis alternatif diterima. Hal ini berarti terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴 pada tingkat signifikansi 5%.

Berdasarkan perhitungan pada penyelesaian soal 1b, diketahui nilai probabilitas dari uji 𝑡 (p-value) adalah 0.00006003. Karena nilai probabilitas tersebut lebih kecil dibandingkan tingkat signifikansi 𝛼 = 0.05,
maka hipotesis nol ditolak dan hipotesis alternatif diterima. Hal ini berarti terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴 pada tingkat signifikansi 5%.

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

Mencari H0:

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
Pertama-tama kita harus mengambil data dari link pada soal dengan kode sebagai berikut:

```R
data_oneway <- read.table("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt",h=T)
head(data_oneway)
```

<img width="126" alt="image" src="https://user-images.githubusercontent.com/99629909/170862958-68a37fba-4e62-4c5c-ab84-a67b6c12158f.png">

Kemudian kita buat `data_oneway` menjadi grup. Disini digunakan nama "Group" bukan "Grup" dikarenakan nama kolom databasenya adalah "Group". Implementasi kodenya adalah sebagai berikut:

```R
data_oneway$Group <- as.factor(data_oneway$Group)
table(data_oneway$Group)
```

<img width="82" alt="image" src="https://user-images.githubusercontent.com/99629909/170862974-4a1d9d7c-d170-471b-859c-d3429d2cbf8c.png">

Selanjutnya untuk mengecek apakah dia sudah berhasil menyimpan setiap data ke Groupnya digunakan kode berikut:

```R
str(data_oneway)
```

<img width="547" alt="image" src="https://user-images.githubusercontent.com/99629909/170862997-4316f1e0-934c-4a9e-92c2-f8e893ae8a46.png">

Kemudian Group tersebut akan dibagi menjadi 3 Group dengan nama sesuai pada soal. Implementasi kodenya sebagai berikut:

```R
data_oneway$Group = factor(data_oneway$Group,labels = c("kucing oren", "kucing hitam", "kucing putih"))

Group1 <- subset(data_oneway, Group == "kucing oren")
Group2 <- subset(data_oneway, Group == "kucing hitam")
Group3 <- subset(data_oneway, Group == "kucing putih")
```

Untuk menggambarkan plot kuantil normal untuk setiap kelompok dapat menggunakan fungsi `qqnorm` dan `qqline`.

Plot kuartil normal untuk Group 1:

```R
qqnorm(Group1$Length)
qqline(Group1$Length)
```

<img width="615" alt="image" src="https://user-images.githubusercontent.com/99629909/170863017-3388758f-f636-42d0-947f-8048e4eba835.png">

Plot kuartil normal untuk Group 2:

```R
qqnorm(Group2$Length)
qqline(Group2$Length)
```

<img width="638" alt="image" src="https://user-images.githubusercontent.com/99629909/170863109-7f9eb6b4-bb20-461b-9917-34630c131c36.png">

Plot kuartil normal untuk Group 3:

```R
qqnorm(Group3$Length)
qqline(Group3$Length)
```

<img width="609" alt="image" src="https://user-images.githubusercontent.com/99629909/170863129-a93a1b35-ee25-4880-8ed1-97c923b44508.png">

**Dapat dilihat bahwa tidak ada outlier utama dalam homogenitas varians.**


### **Soal 4b**
carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang
didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?

#### Penyelesaian

```R
bartlett.test(Length ~ Group, data = data_oneway)
```

<img width="472" alt="image" src="https://user-images.githubusercontent.com/99629909/170863263-3e3a16f4-5ad1-463e-b66b-7a17be4cdd28.png">

Dapat dilihat bahwa p-valuenya adalah 0.43292. Karena p-value lebih besar dari 0,05, maka terima H0. Maka dia memiliki varians yang sama (homogenity of variances) secara statistik di antara kelompok.


### **Soal 4c**
Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus
Grup dan beri nama model tersebut model 1.

#### Penyelesaian
Untuk memodelkan uji ANOVA satu arah dalam bentuk model linier dengan Panjang (Length) versus Grup (Group) serta nama model adalah "model1" dapat menggunakan kode sebagai berikut:

```R
model = lm(Length ~ Group, data = data_oneway)
anova(model)

model1 = aov(Length ~ Group, data=data_oneway)
summary(model1)
```

<img width="509" alt="image" src="https://user-images.githubusercontent.com/99629909/170864361-7cfed2fe-c81e-4cc4-b275-eff3cbbf6b43.png">

### **Soal 4d**
Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan
dari H0?

#### Penyelesaian
Dari hasil di atas dapat dilihat bahwa p-valuenya adalah 0.0013. Karena p-valuenya 0.0013 yang mana lebih kecil dari 0.05, maka Ho ditolak.

### **Soal 4e**
Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p
yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.

#### Penyelesaian
Pada RStudio penggunaan Post-hoc test Tukey HSD dapat diimplementasikan dengan kode berikut:

```R
TukeyHSD(aov(model))
```

<img width="555" alt="image" src="https://user-images.githubusercontent.com/99629909/170864517-3a6e8e78-5814-4e97-b813-fb604f55895c.png">

```R
TukeyHSD(model1)
```

<img width="563" alt="image" src="https://user-images.githubusercontent.com/99629909/170864532-1e493262-5c8c-4c72-ad40-7c2b6833c54b.png">

Karena p-valuenya 0.0013 yang mana lebih kecil dari 0.05, maka Ho ditolak. Sehingga dapat disimpulkan bahwa satu jenis kucing lebih panjang dari yang lain.


### **Soal 4f**
Visualisasikan data dengan ggplot2

#### Penyelesaian
```R
library("ggplot2")
ggplot(data_oneway, aes(x = Group, y = Length)) +
  geom_boxplot(fill = "grey100", colour = "black") +
  scale_x_discrete() + xlab("Treatment Group") +
  ylab("Length (cm)")
```

<img width="508" alt="image" src="https://user-images.githubusercontent.com/99629909/170864484-db7679e4-86c4-40ee-82e4-5511794ab856.png">


## Nomor 5
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk
mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca
pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan
dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil
Eksperimen. Dengan data tersebut:

### **Soal 5a**
Buatlah plot sederhana untuk visualisasi data

#### Penyelesaian
Pada penyelesaian soal nomor 5 ini saya menggunakan referensi kode dari internet dengan link sebagai berikut: https://statdoe.com/two-way-anova-in-r/

Langkah pertama adalah mendownload file GTL.csv pada link yang ada pada soal. Selanjutnya kita harus menginstall packages yang dibutuhkan yaitu `multcompView` dan melakukan run terhadap semua library yang dibutuhkan dalam penyelesaian soal ini.

```R
install.packages("multcompView")
library(multcompView)
library(readr)
library(dplyr)
library(ggplot2)
```

Kemudian kita read dan assign file GTL.csv dari link pada soal menggunakan kode berikut:

```R
GTL <- read_csv("GTL.csv")
head(GTL)
```

<img width="658" alt="image" src="https://user-images.githubusercontent.com/99629909/170867681-9b57bd83-3802-4bb8-b09d-f1e73a667b47.png">

Untuk mengecek apakah data kita sudah masuk ke `GTL` atau belum sekaligus melakuakn observasi terhadap data, kita bisa menggunakan kode berikut:

```R
str(GTL)
```

<img width="536" alt="image" src="https://user-images.githubusercontent.com/99629909/170867799-bbeb0f33-df7b-4747-b92b-6d9d29c5ca9c.png">

Dan terakhir kita akan membuat visualisasi data menggunakan simple plot dengan kode sebagai berikut:

```R
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)
```

Tampilan dari hasil run kode di atas adalah sebagai berikut:

<img width="696" alt="image" src="https://user-images.githubusercontent.com/99629909/170867857-7965308a-ff1f-4108-b140-e69f48a941dc.png">

### **Soal 5b**
Lakukan uji ANOVA dua arah

#### Penyelesaian
Pertama-tama kita harus membuat variabel as factor sebagai ANOVA

```R
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
```

<img width="637" alt="image" src="https://user-images.githubusercontent.com/99629909/170867894-a8254e4c-f12f-4d47-890d-bce3c45ed6ba.png">

Kemudian untuk melakukan analisis of variance, kita bisa menggunakan kode sebagai berikut:

```R
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```

<img width="520" alt="image" src="https://user-images.githubusercontent.com/99629909/170867908-4b5109d3-85a1-4fbb-9cb5-5ff923c680a8.png">

### **Soal 5c**
Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk
setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

#### Penyelesaian
Pertama-tama data akan dikelompokkan dengan fungsi `group_by`, kemudian dilakukan `summarise` sesuai dengan mean dan standar deviasi yang berlaku. Implementasi ke dalam kodenya adalah sebagai berikut:

```R
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```

<img width="742" alt="image" src="https://user-images.githubusercontent.com/99629909/170867926-446cb298-f04e-41e7-8c83-3a9e584063b1.png">

### **Soal 5d**
Lakukan uji Tukey

#### Penyelesaian
Digunakan fungsi `TukeyHSD(anova)`. Pengimplementasian kodenya adalah sebagai berikut:

```R
tukey <- TukeyHSD(anova)
print(tukey)
```

<img width="495" alt="image" src="https://user-images.githubusercontent.com/99629909/170867960-85839419-0ce4-426c-ae1f-6d7e7ae492f3.png">

<img width="469" alt="image" src="https://user-images.githubusercontent.com/99629909/170868026-2633cc9f-08c6-44f3-8143-40a8e009e77b.png">

<img width="467" alt="image" src="https://user-images.githubusercontent.com/99629909/170868052-381ee7a8-b34b-4c34-8345-02c62cc445f2.png">

### **Soal 5e**
Gunakan compact letter display untuk menunjukkan perbedaan signifikan
antara uji Anova dan uji Tukey

#### Penyelesaian
Pertama-tama dibuat compact letter display dengan menggunakan kode sebagai berikut:

```R
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
```

<img width="446" alt="image" src="https://user-images.githubusercontent.com/99629909/170868081-96e40382-2fe6-43cd-b9ce-7acb63c534ee.png">

Kemudian hasil dari compact letter display tersebut akan ditambahkan ke tabel dengan nilai mean dan standar deviasi. Implementasi kodenya adalah sebagai berikut:

```R
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
```

<img width="469" alt="image" src="https://user-images.githubusercontent.com/99629909/170868132-74c4fa79-9df2-497f-bd14-6762e690e7c2.png">
