#!/bin/sh
set -eu
cd "$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
if ! command -v latexmk >/dev/null 2>&1; then
  for tex_bin in "${CSUST_TEX_BIN:-}" /Library/TeX/texbin "$HOME/Library/TinyTeX/bin/universal-darwin"; do
    if [ -n "$tex_bin" ] && [ -x "$tex_bin/latexmk" ]; then PATH="$tex_bin:$PATH"; export PATH; break; fi
  done
fi
if ! command -v latexmk >/dev/null 2>&1 || ! command -v xelatex >/dev/null 2>&1; then
  printf '%s\n' '请先安装 TeX Live/MacTeX，或设置 CSUST_TEX_BIN 为其 bin 目录。' >&2; exit 1
fi
mkdir -p .build/chapters
latexmk -xelatex -outdir=.build -interaction=nonstopmode -halt-on-error -file-line-error -no-shell-escape main.tex
cp .build/main.pdf main.pdf
printf '%s\n' '编译完成：main.pdf（中间文件在隐藏的 .build 文件夹）'
