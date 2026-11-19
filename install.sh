#!/usr/bin/env bash
# install.sh — prepara il Cato Motion Studio su un Mac, da zero, con un solo comando:
#
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/dvianello-cato/cato-motion-studio-install/main/install.sh)"
#
# Non serve nessun account GitHub: lo studio è pubblico. Fa solo il minimo per arrivarci:
# Homebrew, Node, FFmpeg, Claude Code e il download dello studio. Poi
# apre Claude Code nella cartella con /setup-studio, che fa tutto il resto (Node, FFmpeg, plugin, test).
# Rilanciarlo è sicuro: rifà solo quello che manca e aggiorna la cartella.
set -euo pipefail
REPO="dvianello-cato/cato-motion-studio"
DEST="${CATO_MOTION_DIR:-$HOME/Desktop/cato-motion-studio}"

# In prova non si tocca ~/.zprofile della persona che lancia la prova.
profilo() { [ "${CATO_INSTALL_PROVA:-0}" = 1 ] && return 0; grep -qsF "$1" "$HOME/.zprofile" || printf '\n%s\n' "$1" >> "$HOME/.zprofile"; }
say() { printf '\n▸ %s\n' "$*"; }
ok()  { printf '  ✔ %s\n' "$*"; }
die() { printf '\n  ✗ %s\n' "$*" >&2; exit 1; }

# `CATO_INSTALL_PROVA=1` salta i controlli sull'ambiente e l'apertura finale di Claude Code: serve alle
# prove automatiche. `CATO_MOTION_SRC` clona da un'altra sorgente (una cartella locale), sempre per le prove.
PROVA="${CATO_INSTALL_PROVA:-0}"
if [ "$PROVA" != 1 ]; then
  [ "$(uname -s)" = Darwin ] || die "questo installer è per macOS"
  # Con `curl … | bash` lo stdin è lo script stesso: Homebrew e i login non potrebbero chiedere niente.
  [ -t 0 ] || die "lancialo così, non con una pipe:
    /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/dvianello-cato/cato-motion-studio-install/main/install.sh)\""
fi

say "Homebrew"
if ! command -v brew > /dev/null 2>&1; then
  for b in /opt/homebrew/bin/brew /usr/local/bin/brew; do [ -x "$b" ] && { eval "$("$b" shellenv)"; break; }; done
fi
if ! command -v brew > /dev/null 2>&1; then
  echo "  lo installo: il Mac ti chiede la password una volta"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  for b in /opt/homebrew/bin/brew /usr/local/bin/brew; do [ -x "$b" ] && { eval "$("$b" shellenv)"; break; }; done
  command -v brew > /dev/null 2>&1 || die "Homebrew non risulta installato: rilancia questo comando"
fi
# Senza questa riga, nel prossimo Terminale `brew` e quello che installa non ci sarebbero.
riga="eval \"\$($(command -v brew) shellenv)\""
profilo "$riga"
ok "$(brew --version | head -1)"

say "Node e FFmpeg"
command -v node > /dev/null 2>&1 || brew install node > /dev/null
command -v ffmpeg > /dev/null 2>&1 || brew install ffmpeg > /dev/null
ok "node $(node -v), $(ffmpeg -version | head -1 | cut -d' ' -f1-3)"

say "Claude Code"
if ! command -v claude > /dev/null 2>&1; then
  echo "  lo installo con l'installer ufficiale"
  curl -fsSL https://claude.ai/install.sh | bash
  export PATH="$HOME/.local/bin:$PATH"
  riga='export PATH="$HOME/.local/bin:$PATH"'
  profilo "$riga"
  command -v claude > /dev/null 2>&1 || die "Claude Code non risulta installato: rilancia questo comando"
fi
ok "$(claude --version 2> /dev/null | head -1)"

say "Lo studio"
URL="https://github.com/$REPO.git"
command -v git > /dev/null 2>&1 || die "manca git: rilancia questo comando (Homebrew lo installa con gli strumenti di Apple)"
if [ -d "$DEST/.git" ] && [ "$(git -C "$DEST" remote get-url origin 2> /dev/null)" = "$URL" ] && git -C "$DEST" pull --ff-only -q 2> /dev/null; then
  ok "aggiornato in $DEST"
else
  if [ -e "$DEST" ]; then
    # Studio vecchio (altro indirizzo o altra storia): lo sposto da parte e ne scarico uno nuovo, poi riporto i film.
    vecchio="$DEST-vecchio-$(date +%Y%m%d-%H%M%S)"
    mv "$DEST" "$vecchio"
    echo "  lo studio che avevi è stato spostato in $vecchio"
  fi
  if [ -n "${CATO_MOTION_SRC:-}" ]; then
    git clone -q "$CATO_MOTION_SRC" "$DEST" || die "non riesco a scaricare lo studio: rilancia questo comando"
  else
    git clone -q "$URL" "$DEST" || die "non riesco a scaricare lo studio: controlla la connessione e rilancia questo comando"
  fi
  ok "scaricato in $DEST"
  if [ -n "${vecchio:-}" ] && [ -d "$vecchio/films" ]; then
    mkdir -p "$DEST/films"
    for f in "$vecchio"/films/*/; do
      [ -d "$f" ] || continue
      n="$(basename "$f")"
      [ -e "$DEST/films/$n" ] || cp -R "$f" "$DEST/films/$n"
    done
    ok "i tuoi film sono di nuovo in $DEST/films"
  fi
fi

if [ "$PROVA" = 1 ]; then ok "prova: fermo qui, senza aprire Claude Code"; exit 0; fi
say "Apro Claude Code nello studio"
echo "  la prima volta ti chiede di entrare con il tuo account Claude di Cato,"
echo "  poi se ti fidi della cartella e se installare il plugin HyperFrames: rispondi sì."
cd "$DEST"
exec claude "/setup-studio"
