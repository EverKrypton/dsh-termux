# dsh-termux

Script de instalación de **DeepSeek Harness (DSH)** en Termux, usando `npm` directo y añadiendo el plugin de modelos gratis de OpenCode Zen.

## Requisitos

Ya deben estar instalados en el dispositivo (el script **no** los instala ni actualiza):

- Node.js >= 22.19 (`pkg install nodejs-lts`)
- npm
- git
- pnpm (`npm i -g pnpm`) — lo usa `dsh plugin` por debajo

## Uso

### Opción 1: clonar el repo

```sh
git clone https://github.com/EverKrypton/dsh-termux.git
cd dsh-termux
chmod +x dsh-termux.sh
./dsh-termux.sh
```

### Opción 2: descargar y ejecutar en un paso

```sh
curl -fsSL https://raw.githubusercontent.com/EverKrypton/dsh-termux/master/dsh-termux.sh -o dsh.sh && chmod +x dsh.sh && ./dsh.sh
```

## Qué hace el script

1. `npm i -g @deepseek-ai/dsh` — instala DSH globalmente.
2. Añade el plugin de modelos gratis al perfil `web`:
   `dsh plugin --profile web add github:xiaozhe7772222/dsh-opencode-zen`
   (si falla, cae a `dsh-opencode-cli`).
3. Arranca la Web UI en `http://127.0.0.1:3080` con `dsh web --no-open`.

## Después de arrancar

En el navegador, abre `http://127.0.0.1:3080` y ve a:

**Settings → Models → provider `opencode` → `deepseek-v4-flash-free`**

Modelos gratis disponibles: `deepseek-v4-flash-free`, `mimo-v2.5-free`, `hy3-free`,
`nemotron-3-ultra-free`, `nemotron-3.5-lightning-free`, `laguna-s-2.1-free`.

## Usar DeepSeek de pago (opcional)

En **Settings → Models**, tarjeta **DeepSeek**, pega tu API key y guarda.
La key se guarda en `~/.dsh/.credentials.yaml` y no se vuelve a mostrar.

## Notas

- DSH está en *developer preview*: puede haber cambios incompatibles entre versiones.
- Actualizar DSH: `npm i -g @deepseek-ai/dsh`
- Ver versión: `dsh --version`
