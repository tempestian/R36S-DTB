#!/bin/bash
# R36S G80CA-MB V1.2 İlk Açılışta Ses Açıcı (Tek Tıkla Entegrasyon)
# Bu dosyayı MicroSD kartın EASYROMS/tools klasörüne atıp cihazdaki Tools menüsünden bir kez çalıştırın.

set -e
ES_SCRIPT="/usr/bin/emulationstation/emulationstation.sh"

if [ ! -f "$ES_SCRIPT" ]; then
    echo "Hata: EmulationStation başlatıcı scripti bulunamadı!"
    sleep 3
    exit 1
fi

if grep -q "BOOT_AUDIO_TRIGGERED" "$ES_SCRIPT"; then
    echo "Bu yama zaten sisteminizde kurulu ve aktif."
    sleep 2
    exit 0
fi

# Yedeğini oluştur
cp "$ES_SCRIPT" "${ES_SCRIPT}.bak"

# EmulationStation arayüzü başlamadan hemen önce donanım amfisini uyandıran darbeyi ekle
sed -i '/export XDG_RUNTIME_DIR/a \
\
# G80CA Hardware Amplifier Wakeup Pulse\
if [ ! -f "/dev/shm/.BOOT_AUDIO_TRIGGERED" ]; then\
    touch /dev/shm/.BOOT_AUDIO_TRIGGERED\
    sudo /usr/lib/systemd/system-sleep/sleep post >/dev/null 2>&1 &\
fi' "$ES_SCRIPT"

sync
echo "=========================================="
echo " [✓] Ses Otomasyonu Başarıyla Kuruldu!"
echo " Artık cihaz her açıldığında ses doğrudan"
echo " kendiliğinden gelecektir."
echo "=========================================="
sleep 3
