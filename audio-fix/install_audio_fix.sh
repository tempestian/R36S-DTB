#!/bin/bash
# R36S G80CA-MB V1.2-20250423 Otomatik Ses ve Amfi Uyandirma Yamasi
# Bu script, cihazi ilk acilista uyutup uyandirmadan ses gelmeme sorununu
# EmulationStation baslangicina wake-up tetikleyicisi ekleyerek kalici olarak cozer.

set -e

echo "=== R36S Audio Wake-up Yamasi Uygulaniyor ==="

ES_SCRIPT="/usr/bin/emulationstation/emulationstation.sh"

if [ ! -f "$ES_SCRIPT" ]; then
    echo "Hata: $ES_SCRIPT bulunamadi!"
    exit 1
fi

if grep -q "BOOT_AUDIO_TRIGGERED" "$ES_SCRIPT"; then
    echo "Yama zaten kurulu."
    exit 0
fi

# Yedeğini al
cp "$ES_SCRIPT" "${ES_SCRIPT}.bak"

# Wake-up tetikleyici kodunu export XDG_RUNTIME_DIR sonrasina ekle
sed -i '/export XDG_RUNTIME_DIR/a \
\
# Quick sleep/wake trigger to wake the hardware amplifier (G80CA Audio Fix)\
if [ ! -f "/dev/shm/.BOOT_AUDIO_TRIGGERED" ]; then\
    touch /dev/shm/.BOOT_AUDIO_TRIGGERED\
    sudo /usr/lib/systemd/system-sleep/sleep post >/dev/null 2>&1 &\
fi' "$ES_SCRIPT"

echo "Yama basariyla uygulandi! Ilk acilista ses otomatik olarak gelecektir."
