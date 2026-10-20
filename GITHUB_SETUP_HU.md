# CardVault — feltöltés GitHubra (magyar útmutató)

Ez a repó mappája. Így teszed fel a saját GitHub-fiókodba és adod ki az 1.1-et.

## 1. Repó létrehozása GitHubon
- Menj a https://github.com/new oldalra.
- Repository name: **CardVault**
- Public, **NE** pipáld be a "Add a README" opciót (nálunk már van).
- Create repository.

## 2. A helyi mappa feltöltése
A `CardVault` mappában (ahol az `application.fam` is van), PowerShellben:

```powershell
git init
git add .
git commit -m "CardVault v1.1

Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01FvmXmKoLAtfZBGbrN75Enu"
git branch -M main
git remote add origin https://github.com/LeviXXcodes-basment/CardVault.git
git push -u origin main
```

> Ha a `git` nevet/emailt kér először:
> ```powershell
> git config --global user.name "LeviXX"
> git config --global user.email "a-github-emailed@pelda.hu"
> ```

## 3. Kiadás (release) — ez építi meg a .fap-ot és csatolja
A GitHub Actions a `v`-vel kezdődő tag-re lefordítja a `cardvault.fap`-ot és felteszi a release-hez:

```powershell
git tag v1.1
git push origin v1.1
```

Pár perc múlva a repó **Releases** fülén ott lesz a `cardvault.fap`, letölthetően.

## 4. Build-állapot
A README tetején a zöld **Build FAP** jelvény mutatja, hogy fordul-e a kód. Az **Actions** fülön látod a logokat.

## Fájlszerkezet
```
CardVault/
├── application.fam
├── cardvault.c
├── images/
│   └── cardvault_icon.png
├── README.md
├── LICENSE
├── CONTRIBUTING.md
├── Makefile
├── .gitignore
├── GITHUB_SETUP_HU.md
└── .github/
    └── workflows/
        └── build.yml
```
