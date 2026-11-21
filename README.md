# R36S (G80CA-MB V1.2-20250423) Panel 8 / Panel 9 DTB & Boot Files

Bu repo, **R36S Klon (Anakart: G80CA-MB V1.2-20250423)** el konsolları için özel olarak hazırlanmış ve test edilmiş **DTB**, **Boot** ve **Ses Yaması (Audio Fix)** dosyalarını içerir.

---

## Karşılaşılan ve Çözülen Sorunlar

1. **Siyah Ekran Problemi:**
   * Cihazda kullanılan Panel 8 (`elida,kd35t133` MIPI DSI) ekran denetleyicisi ile tam uyumlu DTB ve boot yapılandırması sunulmuştur.
2. **İlk Açılışta Ses Gelmeme (Uyutup Uyandırmadan Ses Gelmemesi):**
   * **Kök Neden:** `G80CA-MB V1.2` anakart revizyonunda donanımsal ses yükseltici amfi devresi ilk boot anında kapalı (mute/sleep) başlar. Cihaz elle uyku moduna alınıp tekrar uyandırıldığında kernel `/usr/lib/systemd/system-sleep/sleep post` yordamını çalıştırarak ses donanımını tetikler.
   * **Çözüm:** EmulationStation arayüz başlatıcısına eklenen otomatik arka plan tetikleyicisi sayesinde cihaz açılır açılmaz uyandırma sinyali gönderilir; kullanıcı hiçbir tuşa basmadan ilk saniyeden itibaren ses aktif hale gelir.

---

## Kurulum Talimatı (Sıfırdan İşletim Sistemi Kurulduğunda)

### 1. Adım: Ekran ve DTB Dosyalarını Atma
1. MicroSD kartınıza işletim sistemini (ArkOS / dArkOS RE vb.) yazdırın.
2. Bilgisayarınızda beliren **`BOOT`** bölümüne girin.
3. Bu repodaki ana dizinde bulunan:
   * `rk3326-r36s-linux.dtb`
   * `rg351v-uboot.dtb`
   * `boot.ini`
   dosyalarını doğrudan `BOOT` bölümüne kopyalayın (üzerine yazmayı onaylayın).

### 2. Adım: İlk Açılışta Ses Yamasını Uygulama (Audio Fix)
Kartı cihaza takıp ilk kurulumu tamamladıktan sonra sesi kalıcı olarak otomatik açmak için iki basit yöntem vardır:

#### A) Otomatik Script İle (Önerilen):
* `audio-fix/install_audio_fix.sh` dosyasını SD kartın `EASYROMS/tools` klasörüne atıp cihazdaki **Tools** menüsünden çalıştırabilir veya konsoldan şu komutu verebilirsiniz:
  ```bash
  sudo bash /path/to/install_audio_fix.sh
  ```

#### B) Elle Dosya Düzenleme:
* SD kartın `ROOTFS` bölümündeki `/usr/bin/emulationstation/emulationstation.sh` dosyasını açın.
* `export XDG_RUNTIME_DIR=...` satırının hemen altına şu satırları ekleyin:
  ```bash
  # Quick sleep/wake trigger to wake the hardware amplifier
  if [ ! -f "/dev/shm/.BOOT_AUDIO_TRIGGERED" ]; then
      touch /dev/shm/.BOOT_AUDIO_TRIGGERED
      sudo /usr/lib/systemd/system-sleep/sleep post >/dev/null 2>&1 &
  fi
  ```

---

## Donanım Özellikleri (Hardware Specs)
* **SoC:** Rockchip RK3326
* **Anakart Modeli:** G80CA-MB V1.2-20250423
* **Audio Codec:** Rockchip RK817 Codec (I2C)
* **Ekran Paneli:** 3.5 inç 640x480 IPS Panel 8 (KD35T133)
