#!/usr/bin/env sh

if ls /proc/asound/ | grep -q 'Audio'; then
    if grep -q DSD /proc/asound/Audio/pcm0p/sub0/hw_params; then
        echo 'native DSD'
    else
        echo "$(awk 'NR==5{print $2}' /proc/asound/Audio/pcm0p/sub0/hw_params | sed 's/100/.1kHz/g; s/000/kHz/g; s/200/.2kHz/g')"
    fi
else
    echo ""
fi
