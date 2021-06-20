#!/usr/bin/env bash
set -e
umask 077
wg genkey > ""$PROJECT_BASE_DIR/ansible/privatekey""
wg pubkey < ""$PROJECT_BASE_DIR/ansible/privatekey"" > ""$PROJECT_BASE_DIR/ansible/publickey""
