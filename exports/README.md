# Exported Slides

This folder contains exported PDF and HTML versions of the slides.

## How to Export

### Using Marp CLI:

```bash
# Export to PDF
marp slides/01_Intro_Linux.md -o exports/Slide_01.pdf

# Export to HTML
marp slides/01_Intro_Linux.md -o exports/Slide_01.html

# Export all slides
marp slides/*.md -o exports/
```

### Using VS Code with Marp Extension:
1. Open slide `.md` file
2. Click "Marp" icon in status bar
3. Select "Export Slide Deck..."
4. Choose format (PDF/HTML/PPTX)
5. Save to this folder

## Batch Export Script

Create `export_all.sh`:
```bash
#!/bin/bash
for file in slides/*.md; do
    filename=$(basename "$file" .md)
    marp "$file" -o "exports/${filename}.pdf"
    marp "$file" -o "exports/${filename}.html"
done
```
