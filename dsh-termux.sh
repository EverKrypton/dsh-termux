#!/data/data/com.termux/files/usr/bin/bash
# DSH (DeepSeek Harness) en Termux - instalación directa con npm
set -euo pipefail

say() { printf '\n\033[1;36m==> %s\033[0m\n' "$*"; }
# ---------- 1. Instalar DSH ----------
say "Instalando @deepseek-ai/dsh (esto tarda)"
npm i -g @deepseek-ai/dsh
say "dsh $(dsh --version)"

# ---------- 2. Plugins de modelos gratis (OpenCode Zen) ----------
say "Añadiendo plugin de modelos free al perfil web"
if ! dsh plugin --profile web add github:xiaozhe7772222/dsh-opencode-zen; then
  say "Falló el plugin de GitHub, probando alternativa vía npm"
  dsh plugin --profile web add dsh-opencode-cli
fi

# ---------- 3. Arrancar ----------
say "Listo. Arrancando Web UI en http://127.0.0.1:3080"
say "En el navegador: Settings > Models > provider 'opencode' > deepseek-v4-flash-free"
exec dsh web --no-open
