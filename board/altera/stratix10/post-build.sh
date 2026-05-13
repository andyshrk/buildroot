#!/usr/bin/env bash
set -e

TARGET_DIR="${TARGET_DIR:-$1}"
SSHD_CONFIG="$TARGET_DIR/etc/ssh/sshd_config"

set_sshd_option() {
	local key="$1"
	local value="$2"

	if grep -Eq "^[#[:space:]]*${key}[[:space:]]+" "$SSHD_CONFIG"; then
		sed -i -E "s|^[#[:space:]]*${key}[[:space:]].*|${key} ${value}|" "$SSHD_CONFIG"
	else
		printf '%s %s\n' "$key" "$value" >> "$SSHD_CONFIG"
	fi
}

# Keep root password empty for password-less serial and SSH login.
sed -i -E 's|^root:[^:]*:|root::|' "$TARGET_DIR/etc/shadow"

set_sshd_option PermitRootLogin yes
set_sshd_option PasswordAuthentication yes
set_sshd_option PermitEmptyPasswords yes
