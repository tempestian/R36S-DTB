# R36S (G80CA-MB V1.2-20250423) Panel 8 / Panel 9 DTB & Boot Files

Bu repo, **R36S Klon (Anakart: G80CA-MB V1.2-20250423)** el konsolları için özel olarak hazırlanmış ve test edilmiş **DTB**, **Boot** ve **Tek Tıkla Ses Yaması** dosyalarını içerir.

---

## ⚡ 1 Dakikada Hızlı Kurulum Rehberi

Yeni bir işletim sistemi (ArkOS, dArkOS vb.) kurduğunuzda sadece iki adımda cihazı tamamen hazır hale getirebilirsiniz:

### 1. Adım: Ekranı ve Sistemi Açma (DTB Dosyaları)
1. MicroSD kartınıza ArkOS / dArkOS imajını yazdırın (flash edin).
2. Bilgisayarınızda beliren **`BOOT`** bölümünü açın.
3. Bu depodaki ana dizinde yer alan:
   * **`rk3326-r36s-linux.dtb`**
   * **`rg351v-uboot.dtb`**
   * **`boot.ini`**
   dosyalarını doğrudan **`BOOT`** bölümüne sürükleyip bırakın (üzerine yazmayı onaylayın).

---

### 2. Adım: İlk Açılışta Ses Sorununu Çözme (Tek Tıkla Menüden)
Bu klon anakartta donanımsal amfi uyku pini farklı olduğu için cihazı uyutup uyandırmadan ses gelmez. Bunu çözmek için:

1. Bu repodaki **`apply_audio_fix.sh`** dosyasını MicroSD kartınızın **`EASYROMS`** (veya `roms`) bölümü içindeki **`tools`** klasörüne atın.
2. SD kartı R36S'e takıp cihazı açın.
3. Cihazın ana menüsünden **Options / Tools** sekmesine girin.
4. Listede görünen **`apply_audio_fix`** seçeneğini **A** tuşuna basarak çalıştırın.
5. Ekranda yeşil onay mesajı belirecek ve işlem tamamlanacaktır!

> **Tebrikler!** Artık cihazınız her açıldığında ekran düzgün gelecek ve ses elinizi güç tuşuna sürmenize gerek kalmadan kendiliğinden açık olacaktır.

---

## Donanım Özellikleri (Hardware Specs)
* **SoC:** Rockchip RK3326
* **Anakart Modeli:** G80CA-MB V1.2-20250423
* **Audio Codec:** Rockchip RK817 Codec (I2C)
* **Ekran Paneli:** 3.5 inç 640x480 IPS Panel 8 (KD35T133)
* **Desteklenen Alternatifler:** `dtb-variants/` altında Panel 9 varyantı da mevcuttur.

---

## Katkıda Bulunanlar (Contributors)
* **[Bayram (Tempestian)](https://github.com/tempestian)** - Donanım analizi, test ve proje sahibi
* **Gemini (DeepMind)** - DTB decompile/patchleme, amfi hata tespiti ve ses yaması
