# R36S (G80CA-MB V1.2-20250423) Panel 8 / Panel 9 DTB & Boot Files

Bu repo, **R36S Klon (Anakart: G80CA-MB V1.2-20250423)** el konsolları için saf **DTB** seviyesinde ekran ve ses düzeltmelerini içeren dosyaları barındırır. 

**Hiçbir ek script, yama veya konsol komutuna ihtiyaç yoktur; her şey doğrudan DTB (Device Tree) seviyesinde donanımsal olarak çözülmüştür.**

---

## ⚡ Kullanım Talimatı (Sıfırdan Kurulum İçin)

1. MicroSD kartınıza istediğiniz işletim sistemini (ArkOS, dArkOS RE, ROCKNIX vb.) yazdırın (flash edin).
2. Bilgisayarınızda beliren **`BOOT`** bölümünü açın.
3. Bu depodaki ana dizinde bulunan:
   * **`rk3326-r36s-linux.dtb`**
   * **`rg351v-uboot.dtb`**
   * **`boot.ini`**
   dosyalarını doğrudan **`BOOT`** bölümüne kopyalayın (üzerine yazmayı onaylayın).
4. SD kartı R36S'e takın ve cihazınızı açın. 

Tebrikler! Ekranınız düzgün açılacak ve ses ilk andan itibaren donanımsal olarak aktif olacaktır.

---

## 🛠️ Çözülen Donanımsal Problemler

1. **Siyah Ekran Problemi:**
   * Cihazda kullanılan Panel 8 (`elida,kd35t133` MIPI DSI) ekran denetleyicisi ve zamanlamaları tam uyumludur.
2. **İlk Açılışta Ses Gelmeme (Uykuya Almadan Ses Gelmemesi) Sorunu:**
   * `G80CA-MB V1.2` anakart revizyonunda amfi açma pini normalde ilk boot anında uykuda başlar. 
   * Bu DTB içerisine eklenen sabit donanım güç regülatörü (`regulator-fixed` / `vcc-spk`) sayesinde, Linux çekirdeği boot ettiği ilk milisaniyede amfi pini (`GPIO3_A7`) doğrudan `regulator-boot-on` ve `regulator-always-on` direktifleriyle tetiklenir.
   * Böylece işletim sistemi seviyesinde hiçbir script, hook veya manuel müdahaleye gerek kalmadan ses saf donanım düzeyinde kendiliğinden çalışır.

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
* **Gemini (DeepMind)** - Donanım DTB patchleme, amfi regülatör tasarımı ve hata tespiti
