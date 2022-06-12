#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="`realpath "$(dirname "$0")"`"

DATE_COVER=$(date "+%d %B %Y")

SOURCE_FORMAT="markdown_strict\
+pipe_tables\
+backtick_code_blocks\
+auto_identifiers\
+strikeout\
+yaml_metadata_block\
+implicit_figures\
+all_symbols_escapable\
+link_attributes\
+smart\
+fenced_divs"

pandoc -s --dpi=300 --slide-level 2 --toc --listings --shift-heading-level=0 --columns=50 --template "$SCRIPT_DIR/../templates/beamer-default-template.latex" --pdf-engine lualatex -f "$SOURCE_FORMAT" -M date="$DATE_COVER" -V classoption:aspectratio=169 -V lang=en-US -t beamer "$1" -o "$1.pdf"