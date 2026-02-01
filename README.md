# My GRUB2 Themes

A collection of custom, high-quality themes for the GRUB2 bootloader.

## 🎨 Available Themes

### 1. Girl Looking at the Screen

A clean and modern theme featuring an anime-inspired background and a comprehensive set of icons for various Linux distributions.

- **Resolution:** Tested on 1920x1080
- **Font:** Noto Sans

![girl-looking-at-the-screen theme preview](./previews/girl-looking-at-the-screen-preview.jpeg)

## 📁 Project Structure

This repository is organized as follows:

- `themes/`: Contains the specific files for each theme (backgrounds, fonts, `theme.txt`).
- `icons/`: Centralized collection of icons used across all themes.
- `scripts/`: Utility scripts for development and building.
- `__tests__/`: Local directory for theme testing and development (ignored by Git).
- `.github/workflows/`: Automation for packaging themes into ZIP files.

## 🚀 Installation & Usage

### Option 1: Download from Releases (Recommended)

Download the pre-packaged ZIP file for your favorite theme from the **Releases** section. These ZIPs already include all necessary icons.

### Option 2: Manual Installation (from Source)

If you clone the repository, you'll need to combine the theme files with the icons:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/harukadev/grub-themes.git
   cd grub-themes
   ```

2. **Prepare the theme:**
   Use the utility script to inject icons into a specific theme:
   ```bash
   chmod +x scripts/prepare.sh
   ./scripts/prepare.sh girl-looking-at-the-screen
   ```
   The prepared theme will be available in the `__tests__` directory.

3. **Copy to GRUB themes directory:**
   ```bash
   sudo mkdir -p /boot/grub/themes
   sudo cp -r __tests__/girl-looking-at-the-screen /boot/grub/themes/
   ```

4. **Configure GRUB:**
   Edit `/etc/default/grub` and update the `GRUB_THEME` line:
   ```text
   GRUB_THEME="/boot/grub/themes/girl-looking-at-the-screen/theme.txt"
   ```

5. **Update GRUB:**
   - **Ubuntu/Debian/Mint/Kali:** `sudo update-grub`
   - **Arch/Fedora/OpenSUSE:** `sudo grub-mkconfig -o /boot/grub/grub.cfg`

## 🛠️ Development

### Packaging

The **GitHub Action** automatically packages each theme into a ZIP file when you push to `main` or create a tag starting with `v*`.

### Local Development

1. Edit files in `themes/<theme-name>`.
2. Run `./scripts/prepare.sh <theme-name>` to update the version in `__tests__/`.
3. Use `grub2-theme-preview` to visualize:
   ```bash
   grub2-theme-preview . --resolution 1920x1080 --grub-cfg ./__tests__/grub.cfg --no-kvm
   ```

### Font Generation

If you want to use different fonts, you must convert them to `.pf2` format:

```bash
grub-mkfont \
  --size=28 \
  --name="Noto Sans 28" \
  --output=NotoSans28.pf2 \
  --force-autohint \
  /path/to/font.ttf
```

Get font name:

```bash
strings ./NotoSans28.pf2 | sed -n '3p'
```

## 🤝 Contributing

Feel free to open issues or submit pull requests if you have new themes or improvements!
