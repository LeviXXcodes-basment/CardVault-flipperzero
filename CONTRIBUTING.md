# Contributing to CardVault

Thanks for your interest! CardVault is a small, single-file Flipper Zero app.

## Building

```bash
pip install ufbt
ufbt update --channel=release
ufbt            # build
ufbt launch     # build + run on a connected Flipper
```

## Guidelines

- Keep it **one source file** (`cardvault.c`) where reasonable.
- The firmware compiles with **warnings-as-errors** — no unused variables, and
  watch `snprintf` buffer sizes (format-truncation is an error).
- Don't weaken the security model without discussion. In particular:
  - the encryption key must stay **derived** (device UID + PIN), never written to disk;
  - never add a way to recover data without the PIN.
- Test on a real Flipper (Momentum firmware) before opening a PR.

## Reporting issues

Open a GitHub issue with:
- firmware version (e.g. Momentum MNTM-012),
- what you did, what you expected, what happened,
- the `ufbt` build log if it's a build problem.
