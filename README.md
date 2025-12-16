# Portfolio — Personal website

> Simple, responsive personal portfolio built with **Flutter Web**.  
> Showcases projects, skills and contact details.

[![Live Demo](https://img.shields.io/badge/demo-live-brightgreen)](https://pietrzak-mateusz.github.io/portfolio/)
[![Flutter](https://img.shields.io/badge/Flutter-3.38.4-blue.svg)](https://flutter.dev/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Web-orange)](https://flutter.dev/web)

---

## Preview

### Desktop
![Desktop view](assets/screenshots/desktop.png)
> *Main page showing project showcase and skills section*

### Mobile
![Mobile view](assets/screenshots/mobile.png)
> ...

### Project detail page
![Project details](assets/screenshots/project-detail.png)
> ...

---

## Features

- Responsive layout: desktop / tablet / mobile  
- Bilingual (Polish / English) — language switcher  
- Projects gallery with detailed project pages (1–3 images per project)  
- Skills section grouped by category  
- Simple contact (e-mail / copy-to-clipboard)  
- Desktop/mobile variants

---

## Built with

- Flutter (Web)  
- Dart  
- Hosted example: GitHub Pages (optional)

---

## Quick start

**Prerequisites**

- Flutter SDK (recommended stable channel)  
- Git

**Clone**

```bash
git clone https://github.com/pietrzak-mateusz/portfolio.git
cd portfolio
```

**Install dependencies**

```bash
flutter pub get
```

**Run locally (recommended)**

Use the platform you prefer:

```bash
# open in Chrome (debug)
flutter run -d chrome

# or use a web server (works even if Chrome debugging is problematic)
flutter run -d web-server
# open the printed http://localhost:xxxx in your browser
```

**Build for production**

```bash
flutter build web --release
# output is in build/web
```

---

## Deployment (GitHub Pages)

**TL;DR:**
```bash
flutter build web --release --base-href "/portfolio/"
cd build/web && git init && git add . && git commit -m "Deploy"
git branch -M gh-pages
git remote add origin https://github.com/YOUR_USERNAME/portfolio.git
git push -f origin gh-pages
```

1. Build the web app:

   ```bash
   flutter build web --release --base-href "/portfolio/"
   ```
2. Deploy the `build/web` folder to the `gh-pages` branch:

   ```bash
   cd build/web
   git init
   git add .
   git commit -m "Deploy"
   git branch -M gh-pages
   git remote add origin https://github.com/YOUR_USERNAME/portfolio.git
   git push -f origin gh-pages
   ```
3. Enable GitHub Pages

   - Go to your repository on GitHub.
   - Open **Settings**.
   - Navigate to **Pages** (left sidebar).
   - Under **Build and deployment**:
      - Set **Source** to `Deploy from a branch`
      - Select branch: `gh-pages`
      - Select folder: `/ (root)`
   - Click **Save**.

> **Important:** Your repository must be **public** for GitHub Pages to work with the free plan. Private repositories require a GitHub Pro account for GitHub Pages hosting.

After a few minutes (up to 10), your site will be available at:

https://YOUR_USERNAME.github.io/portfolio/

---

## Project structure (short)

```
lib/
├── main.dart
├── constants/        # colors, sizes, sns links
├── data/             # static data (projects, skills)
├── i18n/             # translations and locale controller
├── pages/            # screens: home, project detail
├── projects/         # project model / repository
├── styles/           # theme and shared styles
└── widgets/          # reusable UI widgets
assets/
└── projects/         # project images, screenshots/
web/
└── index.html
```

---

## Notes on architecture

* Data (projects, skills) is separated from UI — add new projects by editing `project_data` and adding images.
* Translation keys are in `i18n/strings.dart` (pattern: `project.{id}.title` etc.).
* Desktop / mobile variants are implemented per-section (e.g. `main_desktop.dart` / `main_mobile.dart`) for responsive control.

---

## Contributing & how to add a project

1. Add image(s) to `assets/`
2. Add an entry to `project_data.dart` (or `project_repository`) — follow existing IDs `m1`, `t1`...
3. Add translation strings in `i18n/strings.dart` for `project.{id}.title`, `...subtitle`, `...description`
4. Run locally and verify layout

---

## Credits

This project started from a public template by **Shohruh AK** and was substantially reworked. I credit the original template as the starting point.

---

## License

This project is open-source and licensed under the **MIT License** — see [LICENSE](LICENSE).

---

## Author

**Mateusz Pietrzak**
- GitHub: [@pietrzak-mateusz](https://github.com/pietrzak-mateusz)
- Portfolio: [pietrzak-mateusz.github.io/portfolio](https://pietrzak-mateusz.github.io/portfolio/)
