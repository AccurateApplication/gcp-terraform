#!/usr/bin/env bash
set -e
umask 077
secretDir="$(git rev-parse --show-toplevel)/secrets"
if [[ ! -d  "$secretDir" ]]
then
    mkdir -p "$secretDir"
fi

# TODO place these in correct dir
wg genkey > "$secretDir/privatekey"
wg pubkey < "$secretDir"/privatekey > "$secretDir"/publickey


# encrypt with vault
echo -e "Will generate encrypted strings of publickey "
ansible-vault encrypt_string "$(cat "$secretDir/publickey")"
echo -e "^Paste into var file^\n\n"
echo -e "Will generate encrypted strings of privatekey"
ansible-vault encrypt_string "$(cat "$secretDir/privatekey")"
echo -e "^Paste into var file^"
