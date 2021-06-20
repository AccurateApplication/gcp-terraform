#!/usr/bin/env bash
set -e
umask 077
# TODO place these in correct dir
wg genkey > ""$PROJECT_BASE_DIR/secrets/privatekey""
wg pubkey < ""$PROJECT_BASE_DIR/secrets/privatekey"" > ""$PROJECT_BASE_DIR/ansible/publickey""

# encrypt with vault

echo -e "Will generate encrypted strings of publickey "
ansible-vault encrypt_string "$(cat ""$PROJECT_BASE_DIR/secrets/publickey"")"
echo -e "^Paste into var file^\n\n"
echo -e "Will generate encrypted strings of privatekey"
ansible-vault encrypt_string "$(cat ""$PROJECT_BASE_DIR/secrets/publickey"")"
echo -e "^Paste into var file^"
