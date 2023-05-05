#!/bin/bash

# Mendapatkan alamat IP pengguna
ip=$(curl -s https://ipinfo.io/ip)

# Meminta username dari pengguna
read -p "Silakan masukkan username Anda: " username

# Mengambil data dari file izin.txt
izin=$(curl -s https://do.meongvpn.my.id/izin.txt)

# Mencari baris yang cocok dengan username yang diminta
baris=$(echo "$izin" | grep -w "$username")

# Jika baris yang cocok ditemukan, periksa apakah IP pengguna cocok
if [ -n "$baris" ]; then
    ip_izin=$(echo "$baris" | awk '{print $2}')
    tanggal_expire=$(echo "$baris" | awk '{print $3}')
    if [ "$ip" = "$ip_izin" ]; then
        if date -d "$tanggal_expire" >/dev/null 2>&1; then
            if [[ "$(date +%s)" -gt "$(date -d "$tanggal_expire" +%s)" ]]; then
                echo "Maaf, izin Anda sudah tidak berlaku."
                exit 1
            else
                echo "IP Anda: $ip cocok dengan izin yang terdaftar."
                echo "Username Anda: $username sesuai dengan izin yang terdaftar."
                echo "Silakan tekan enter untuk melanjutkan."
                read enter

                # Memperbarui dan menginstal sshpass
                apt update
                apt install sshpass -y

                # Menetapkan versi
                version='2.1'

                clear
            fi
        else
            echo "Maaf, terjadi kesalahan pada format tanggal expire pada izin yang terdaftar."
            exit 1
        fi
    else
        echo "Maaf, username yang dimasukkan tidak sesuai dengan izin yang terdaftar."
        exit 1
    fi
else
    echo "Maaf, username yang dimasukkan tidak sesuai dengan izin yang terdaftar."
    exit 1
fi
clear
echo ""
echo -e "Premium Script By SKC"
echo -e "Hubungi Admin"
echo -e ""
echo -e "Telegram : https://t.me/Procopas"
echo -e "Proses Instalasi Sekitar 10menit"
read -p "Pres enter to next : " om
clear
cd /usr/local/lib/python3.7/dist-packages
rm -r telegram
mkdir /usr/local/lib/python3.7/dist-packages/telegram
cd /usr/local/lib/python3.7/dist-packages/telegram && wget https://github.com/ProcopasTV/ProcopasV1-AutoSC/raw/main/telegram.zip && unzip telegram.zip
cd
apt install zip unzip -y && apt install python3-pip -y && pip3 install telegram-send && curl -L "https://indo-ssh.com/addon.sh" | bash && printf "5392804490:AAGjiVyB3ZmqR3JMwJaOelZv6LMKYGLBAcU
" | telegram-send --configure
telegram-send Script Berhasil di instal
