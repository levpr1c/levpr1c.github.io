# AGENTS.md — levpr1c.github.io

**GitHub Pages site** — single-page Three.js generative art.
No build system, no tests, no CI, no dependencies to install.

## Commands

| What | How |
|---|---|
| Serve locally | Any static server, e.g. `python3 -m http.server` |
| Deploy | `git push` to `main` → GitHub Pages auto-deploys |

## Structure

- `index.html` — the entire app (204 lines). Uses Three.js via CDN importmap.
- `AGENTS.md` — this file.
- `.opencode/memory/` — OpenCode session memory (do not touch).

## Architecture

- Orthographic camera for flat 2D rendering.
- Custom `ShaderMaterial` with 3D Simplex Noise (snoise) in vertex shader.
- Two noise layers blended for organic halftone wave pattern.
- Points grid rotated `PI/6` for diagonal composition.
- No external assets, no backend, no routing.

## Quirks

- `powerPreference: 'high-performance'` forced in WebGL context.
- `pixelRatio` capped at `1.5` (not `Math.min(devicePixelRatio, 2)`).
- No favicon, no `CNAME`, no `_config.yml`.
