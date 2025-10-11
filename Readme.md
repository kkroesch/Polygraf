[![Build & Deploy](https://github.com/kkroesch/Polygraf/actions/workflows/deploy.yml/badge.svg)](https://github.com/kkroesch/Polygraf/actions/workflows/deploy.yml)
[![Build PDF](https://github.com/kkroesch/Polygraf/actions/workflows/pdf.yml/badge.svg)](https://github.com/kkroesch/Polygraf/actions/workflows/pdf.yml)


# Polygraf Documentation Template

Polygraf is a clean typographic CSS system for technical documentation and scientific writing. It provides well-balanced layouts for screen, dark mode, and print. This repository integrates Polygraf with [Hugo](https://gohugo.io/) for static site generation.


📄 **Live demo:** [kkroesch.github.io/Polygraf](https://kkroesch.github.io/Polygraf/)
📘 **Download PDF:** [Latest demo.pdf (artifact)](https://github.com/kkroesch/Polygraf/actions/workflows/pdf.yml)

---

## ✨ Features

- Elegant serif/sans-serif typography with consistent line length and spacing
- Smooth integration with Hugo and Goldmark (block attributes, figure captions)
- Automatic `figure` rendering from Markdown images
- Meta-box partial for document metadata
- Gruvbox dark theme and Borland light syntax highlighting (Chroma)
- Polished print layout without boxes or excessive shading
- Ready-to-use GitHub Actions workflow for static deployment

---

## 📦 Installation

Clone or copy this repository and ensure Hugo is installed:

```bash
brew install hugo
```

Then install dependencies and run the local server:

```bash
make serve
# or
just serv
```

The site root is `doc/`.

---

## 🏗 Project Structure

```
doc/
├── archetypes/
├── content/
│   └── signalübertragung/
│       ├── index.md
│       └── timing.svg
├── layouts/
│   ├── _default/
│   ├── partials/
│   └── _markup/
├── static/css/
│   ├── polygraf.css
│   ├── polygraf-dark.css
│   ├── polygraf-print.css
│   ├── chroma.css
│   └── chroma-dark.css
├── hugo.yaml
└── .gitignore
```

---

## 🧰 Make / Just Commands

| Target        | Description                                              |
| ------------- | -------------------------------------------------------- |
| `serve`       | Run Hugo dev server (`hugo server -s doc -D`)            |
| `build`       | Build static site (minified)                             |
| `pdf`         | Export `public/index.html` to `demo.pdf` via wkhtmltopdf |
| `chroma`      | Generate Borland syntax theme                            |
| `chroma-dark` | Generate Gruvbox dark syntax theme                       |
| `gh-pages`    | Deploy site to GitHub Pages branch                       |

Example:

```bash
make build
make pdf
```

---

## 🧑‍💻 Hugo Configuration (`hugo.yaml`)

Includes:

- `goldmark.renderer.unsafe: true` (allows HTML, KaTeX, etc.)
- `goldmark.parser.attribute.block: true` (for `{.class}` blocks)
- Chroma highlighting with class-based styling

---

## 🧩 Layouts

- `` – loads Polygraf and KaTeX
- `` – renders individual documents
- `` – section index
- `` – shows author, version, tags, etc.
- `` – turns Markdown images into `<figure>` + `<figcaption>`

---

## 🖋 Styling Layers

| File                 | Purpose                                |
| -------------------- | -------------------------------------- |
| `polygraf.css`       | Core screen layout, light mode         |
| `polygraf-dark.css`  | Gruvbox dark theme                     |
| `polygraf-print.css` | Print layout (monochrome, typographic) |

`polygraf.css` automatically imports dark and print variants:

```css
@import url("/css/polygraf-dark.css") screen and (prefers-color-scheme: dark);
@import url("/css/polygraf-print.css") print;
```

---

## 🧮 Math Support

KaTeX is embedded in `baseof.html`.

```markdown
$$
H(j\omega) = \frac{1}{1 + j\omega RC}
$$
```

---

## 🚀 Deployment (GitHub Actions)

Located in `.github/workflows/deploy.yml`.

Builds the Hugo site from `doc/` and publishes to GitHub Pages using artifacts:

```yaml
on:
  push:
    branches: [ main ]
```

No secrets required — Pages is handled natively via `actions/deploy-pages@v4`.

---

## 🧾 License

MIT © Karsten Krösch
