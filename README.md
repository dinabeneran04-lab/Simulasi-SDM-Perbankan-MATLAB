# Mathematical Modeling for Optimal Management of Human Resources (Banking Sector)

Repositori ini berisi implementasi model matematika deterministik berbasis sistem persamaan diferensial (ODE) non-linear untuk mengelola sumber daya manusia secara optimal di sektor perbankan, dengan studi kasus di Bangladesh.

## Deskripsi Proyek
Proyek ini bertujuan untuk mengembangkan strategi optimal dalam meningkatkan jumlah pegawai ahli (*experts*) dengan cara yang efisien dan berbiaya rendah. Model ini membagi karyawan menjadi dua kompartemen: **Freshers (F)** dan **Experts (E)**, serta mempertimbangkan variabel **Vacancies (V)**.

### Model Matematika (F-E-V)
Sistem persamaan yang digunakan adalah:

$$
\begin{aligned}
\frac{dF}{dt} &= kV - \beta F - \gamma FE - \delta F - \tau u_1(t)F \\
\frac{dE}{dt} &= -\xi V + \gamma FE - \psi(1 - u_2(t))E - \delta E + \tau u_1(t)F \\
\frac{dV}{dt} &= -\phi E + \gamma FE - kV + \beta F + \delta F + \psi(1 - u_2(t))E + \delta E + \xi V
\end{aligned}
$$

## Fitur Utama
- **Analisis Kestabilan**: Penentuan titik equilibrium dan angka reproduksi dasar ($R_0$) untuk memprediksi keberlangsungan tenaga ahli dalam sistem.
- **Kontrol Optimal**: Implementasi Prinsip Maksimum Pontryagin untuk mengoptimalkan kebijakan pelatihan ($u_1$) dan penyediaan fasilitas khusus ($u_2$).
- **Simulasi Numerik**: Penyelesaian menggunakan metode **Runge-Kutta Orde 4** dan teknik **Forward-Backward Sweep**.

## Struktur File
- `simulasi_gamma.m`: Analisis pengaruh tingkat kolaborasi antara *freshers* dan *experts*.
- `simulasi_psi.m`: Simulasi dampak tingkat perpindahan kerja (*job switching*).
- `kontrol_optimal_main.m`: Algoritma utama untuk mencari fungsi biaya minimum dan profil kontrol optimal.
- `hr_model.m`: Fungsi inti sistem persamaan diferensial model SDM.

## Teknologi yang Digunakan
- **MATLAB R2021b**: Digunakan untuk seluruh simulasi numerik dan pembuatan grafik.
- **Metode Numerik**: ODE45 (Runge-Kutta 4) & Pontryagin's Maximum Principle.

---
**Oleh Kelompok 7 - Program Studi Matematika FMIPA UNP** *Dina Rahma Wita (22030087)*