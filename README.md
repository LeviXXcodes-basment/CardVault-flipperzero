# 🔐 CardVault

[![Build FAP](https://github.com/LeviXXcodes-basment/CardVault/actions/workflows/build.yml/badge.svg)](https://github.com/LeviXXcodes-basment/CardVault/actions/workflows/build.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Flipper Zero](https://img.shields.io/badge/Flipper%20Zero-Momentum-orange)](https://momentum-fw.dev)

A **PIN-protected, device-bound vault** for your saved **NFC** and **RFID** cards — plus encrypted **secure notes / passwords** — for the Flipper Zero.

CardVault moves your saved cards off the open file system and into an encrypted vault that **only this Flipper, with the correct PIN, can open**.

---

## 📸 Screenshots

<p align="center">
  <img src="screenshots/pin.png" width="30%" alt="PIN unlock screen">
  <img src="screenshots/menu-top.png" width="30%" alt="Main menu with live card count">
  <img src="screenshots/my-vault.png" width="30%" alt="My Vault list">
</p>
<p align="center">
  <img src="screenshots/secure-notes.png" width="30%" alt="Secure Notes list">
  <img src="screenshots/menu-bottom.png" width="30%" alt="Main menu (Secure Notes, Change PIN, About)">
</p>

---

## ✨ Features

- **4-digit PIN gate** — set on first launch, required every time.
- **Encrypt cards into the vault** — pick a `.nfc` or `.rfid` file; it is encrypted and the **original is removed** from its app.
- **My Vault** — browse your stored cards with a live count; **decrypt (restore)** or **delete** any of them.
- **Secure Notes** — store text and passwords, encrypted the same way. View or delete.
- **Device-bound encryption** — see the security model below.

## 🔒 Security model

- The encryption key is **derived, never stored**: it comes from **this Flipper's unique hardware serial (UID) + your PIN**, run through a slow **SHA-256** key-derivation (8000 rounds) with a **random per-file salt**.
- Cipher: **SHA-256 keystream** (hash-CTR) — a real cryptographic primitive, not a toy XOR.
- Because the key needs **both** the device serial (which is **not** on the SD card) **and** the PIN, a copied `.cvx` file **cannot be decrypted** on another Flipper or without the correct PIN.
- A `CVT1` magic header verifies the key on decrypt, so a wrong PIN fails cleanly instead of writing garbage.

> ⚠️ **Important:** changing the PIN **re-keys** everything. **Decrypt your cards and notes before changing the PIN**, or you will not be able to recover them.
>
> This protects against SD-card extraction and cloning. It is **not** designed to resist an attacker who has physical access to *this* Flipper and reverse-engineers it. Keep your device and PIN private.

---

## 📦 Install

### Option A — download the release
1. Grab `cardvault.fap` from the [latest release](https://github.com/LeviXXcodes-basment/CardVault/releases/latest).
2. Copy it to your Flipper SD card under `apps/Tools/`.
3. Launch it from **Apps → Tools → CardVault**.

### Option B — build it yourself
Requires [`ufbt`](https://pypi.org/project/ufbt/):

```bash
pip install ufbt
ufbt update --channel=release        # first time only
git clone https://github.com/LeviXXcodes-basment/CardVault.git
cd CardVault
ufbt            # builds dist/cardvault.fap
ufbt launch     # build + upload + run on a connected Flipper
```

---

## 🕹️ Usage

1. **First launch:** set a 4-digit PIN (enter it twice).
2. **Later launches:** enter your PIN to unlock.
3. **Encrypt NFC Card / Encrypt RFID Tag** — pick a saved card; it moves into the vault, encrypted.
4. **My Vault** — see stored cards; open one to **Decrypt (restore)** or **Delete**.
5. **Secure Notes** — add encrypted notes/passwords; open one to **View** or **Delete**.
6. **Change PIN** — remember to decrypt your items first.

**PIN screen controls:** Up/Down change the digit, Left/Right move between digits, OK confirms.

---

## 🛠️ Built with

- [Momentum Firmware](https://momentum-fw.dev) (MNTM) SDK via `ufbt`
- Pure C, a single self-contained source file, with an embedded SHA-256 implementation

## 📄 License

MIT — see [LICENSE](LICENSE).

## 🙋 Author

**LeviXX** · built with help from Claude.
