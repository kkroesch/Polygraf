# Polygraf – Hugo Workflow (just)
set shell := ["bash", "-cu"]

HUGO := "hugo"
SITE := "doc"
PUB  := "{{SITE}}/public"
CSS  := "{{SITE}}/static/css"

serv:
  {{HUGO}} server -s {{SITE}} -D

bld: chroma css
  {{HUGO}} -s {{SITE}} --minify

clean:
  rm -rf {{PUB}} {{SITE}}/resources

chroma:
  {{HUGO}} gen chromastyles --style=borland > {{CSS}}/chroma.css

chroma-dark:
  {{HUGO}} gen chromastyles --style=gruvbox > {{CSS}}/chroma-dark.css

css: chroma chroma-dark
  # polygraf.css lädt dark/print via @import

pdf: bld
  if ! command -v wkhtmltopdf >/dev/null; then echo "wkhtmltopdf fehlt"; exit 1; fi
  wkhtmltopdf --enable-local-file-access {{PUB}}/index.html demo.pdf

open:
  python3 - <<'PY'
import webbrowser, os
p=os.path.abspath("{{PUB}}/index.html")
webbrowser.open("file://"+p)
PY

gh-pages: bld
  if ! command -v git >/dev/null; then echo "git fehlt"; exit 1; fi
  cd {{PUB}} && \
  git init && git checkout -B gh-pages && git add -A && \
  git -c user.name="ci" -c user.email="ci@local" commit -m "deploy" && \
  git remote add origin "$(git -C ../../.. remote get-url origin)" || true && \
  git push -f origin gh-pages
