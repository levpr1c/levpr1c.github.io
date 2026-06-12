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

## Blog

- Posts live in `blog/posts/` as `.md` files.
- To add a post:
  1. Create `blog/posts/<slug>.md`
  2. Run `bash blog/gen-posts.sh` to regenerate `blog/posts.json`
- First line of `.md` file MUST be `# Title` (used as post title).
- Metadata (title, date) is extracted from the `.md` file by gen-posts.sh.
- Images in markdown use relative paths: `![alt](photos/file.png)` — renderer prepends `blog/posts/`.
- `{ breaks: true }` in marked — single newlines render as `<br>`.
- Posts are sorted newest-first (by file mtime).

## Quirks

- `powerPreference: 'high-performance'` forced in WebGL context.
- `pixelRatio` capped at `1.5` (not `Math.min(devicePixelRatio, 2)`).
- No favicon, no `CNAME`, no `_config.yml`.
