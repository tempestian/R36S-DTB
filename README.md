# R36S (G80CA-MB V1.2-20250423) Panel 8 / Panel 9 DTB & Boot Files

Bu repo, **R36S Klon (Anakart: G80CA-MB V1.2-20250423)** el konsolları için test edilmiş **DTB**, **Boot** ve **Otomatik Ses Başlatma** dosyalarını içerir.

---

## ⚡ Hızlı Kurulum Rehberi (Sıfırdan Sistem Kurulumunda)

### 1. Adım: Ekran Dosyalarını Yükleme (Görüntü İçin)
1. MicroSD kartınıza ArkOS / dArkOS imajını yazdırın (flash edin).
2. Bilgisayarınızda beliren **`BOOT`** bölümünü açın.
3. Bu depodaki ana dizinde yer alan:
   * **`rk3326-r36s-linux.dtb`**
   * **`rg351v-uboot.dtb`**
   * **`boot.ini`**
   dosyalarını doğrudan **`BOOT`** bölümüne kopyalayın (üzerine yazmayı onaylayın).

---

### 2. Adım: İlk Açılışta Sesin Kendiliğinden Gelmesi İçin (Tek Seferlik)
`G80CA-MB V1.2` anakartında amfi çipi güç entegresinin uyku hattına bağlı olduğu için ilk açılışta kilitli başlar; normalde cihazı her seferinde uyutup uyandırmak gerekir. Bunu tamamen otomatik ve görünmez hale getirmek için:

1. Bu depodaki **`enable_sound_autostart.sh`** dosyasını MicroSD kartınızın **`EASYROMS/tools`** klasörüne kopyalayın.
2. SD kartı R36S'e takıp cihazı açın.
3. Menüden **Options / Tools** sekmesine girin.
4. **`enable_sound_autostart`** seçeneğini **A** tuşuna basarak bir kez çalıştırın.

> **İşlem Tamam!** Artık cihazınız her açıldığında arka planda donanımsal amfi uyandırma sinyalini kendisi gönderecek, elinizi güç tuşuna sürmenize gerek kalmadan menü ve oyun sesleri doğrudan gelecektir.

---

## Donanım Özellikleri (Hardware Specs)
* **SoC:** Rockchip RK3326
* **Anakart Modeli:** G80CA-MB V1.2-20250423
* **Audio Codec / PMIC:** Rockchip RK817
* **Ekran Paneli:** 3.5 inç 640x480 IPS Panel 8 (KD35T133)
* **Desteklenen Alternatifler:** `dtb-variants/` altında Panel 9 varyantı da mevcuttur.

---

## Katkıda Bulunanlar (Contributors)
* **[Bayram (Tempestian)](https://github.com/tempestian)** - Donanım analizi, test ve proje sahibi
* **Gemini (DeepMind)** - Donanım DTB patchleme, amfi hata tespiti ve ses otomasyonu
