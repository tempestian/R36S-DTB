# R36S (G80CA-MB V1.2-20250423) Panel 8 / Panel 9 DTB & Boot Files

Bu repo, **R36S Klon (Anakart: G80CA-MB V1.2-20250423)** el konsolları için özel olarak hazırlanmış ve test edilmiş **DTB** ve **Boot** dosyalarını içerir.

## Çözülen Kritik Sorunlar

1. **Siyah Ekran Problemi:** Cihazda kullanılan Panel 8 (`elida,kd35t133` MIPI DSI) ekran denetleyicisi ile tam uyumludur.
2. **Uyku Modu Olmadan Ses Gelmeme Sorunu (Audio Sleep Bug):**
   * Bu klon anakartta HP-DET (kulaklık takılı algılama) pini donanımsal olarak farklı çalıştığı için standart ArkOS / dArkOS imajlarında cihaz ilk açılışta kulaklık algılandı sanıp hoparlörü susturur; sadece uyku moduna alınıp uyandırılınca ses gelirdi.
   * Bu repodaki yapılandırma ve DTB ile dahili hoparlör (Internal Speaker) doğrudan köprülenmiş olup ilk açılıştan itibaren ses kusursuz çalışır.

## Kullanım Talimatı (Herhangi Bir İşletim Sistemi Kurulduğunda)

1. MicroSD kartınıza istediğiniz işletim sistemini (ArkOS, ROCKNIX, Amberelec vb.) yazdırın (flash edin).
2. Yazdırma işlemi bittikten sonra bilgisayarınızda beliren **`BOOT`** bölümünü açın.
3. Bu repodaki ana dizinde bulunan:
   * `rk3326-r36s-linux.dtb`
   * `rg351v-uboot.dtb`
   * `boot.ini`
   dosyalarını doğrudan **`BOOT`** bölümünün kök dizinine kopyalayın (üzerine yazmayı onaylayın).
4. Eğer sisteminizde `/etc/r36_config.ini` dosyası varsa veya ayar menüsünden erişilebiliyorsa `alsa_path` değerini `SPK` olarak kullanın.
5. SD kartı R36S'e takıp çalıştırın.

## Donanım Özellikleri (Hardware Specs)
* **SoC:** Rockchip RK3326
* **Anakart:** G80CA-MB V1.2-20250423
* **Audio Codec:** Rockchip RK817 Codec (I2C)
* **Ekran:** 3.5 inç 640x480 IPS Panel 8 (KD35T133)
