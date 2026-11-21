#!/bin/bash
# R36S G80CA Tek Tıkla Ses Yaması (Options / Tools Menüsü İçin)
# Bu dosyayı SD karttaki EASYROMS/tools klasörüne atın ve cihazın menüsünden çalıştırın.

LOG="/var/log/apply_audio_fix.log"
exec > >(tee -a "$LOG") 2>&1

echo "=========================================="
echo "    R36S AUDIO FIX APPLIER (G80CA)       "
echo "=========================================="

ES_FILE="/usr/bin/emulationstation/emulationstation.sh"

if [ ! -f "$ES_FILE" ]; then
    echo "[!] Hata: $ES_FILE bulunamadı!"
    sleep 3
    exit 1
fi

if grep -q "BOOT_AUDIO_TRIGGERED" "$ES_FILE"; then
    echo "[✓] Ses yaması zaten sistemde kurulu!"
    sleep 2
    exit 0
fi

# Yedeğini al
cp "$ES_FILE" "${ES_FILE}.bak"

# Tetikleyiciyi XDG_RUNTIME_DIR sonrasına enjekte et
sed -i '/export XDG_RUNTIME_DIR/a \
\
# Quick sleep/wake trigger to wake the hardware amplifier (G80CA Audio Fix)\
if [ ! -f "/dev/shm/.BOOT_AUDIO_TRIGGERED" ]; then\
    touch /dev/shm/.BOOT_AUDIO_TRIGGERED\
    sudo /usr/lib/systemd/system-sleep/sleep post >/dev/null 2>&1 &\
fi' "$ES_FILE"

sync

echo "[✓] Ses yaması başarıyla kuruldu!"
echo "Artık konsol her açıldığında ses kendiliğinden gelecektir."
echo "Menüye dönülüyor..."
sleep 3
