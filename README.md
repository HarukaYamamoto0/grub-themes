# My GRUB2 Themes

A collection of custom, high-quality themes for the GRUB2 bootloader.

## 🎨 Available Themes

### 1. Girl Looking at the Screen

A clean and modern theme featuring an anime-inspired background and a comprehensive set of icons for various Linux distributions.

- **Resolution:** Tested on 1920x1080
- **Font:** Noto Sans

![girl-looking-at-the-screen theme preview](./previews/girl-looking-at-the-screen-preview.jpeg)

## 🚀 Installation

### Step 1: Clone the repository

```bash
git clone https://github.com/harukadev/grub-themes.git
cd grub-themes
```

### Step 2: Copy the theme

Choose the theme you want to install and copy it to the GRUB themes directory (usually `/boot/grub/themes/`):

```bash
sudo mkdir -p /boot/grub/themes
sudo cp -r themes/girl-looking-at-the-screen /boot/grub/themes/
```

### Step 3: Configure GRUB

Edit the `/etc/default/grub` file:

```bash
sudo nano /etc/default/grub
```

Add or update the `GRUB_THEME` line:

```text
GRUB_THEME="/boot/grub/themes/girl-looking-at-the-screen/theme.txt"
```

Make sure `GRUB_TERMINAL_OUTPUT="gfxterm"` is also present and not commented out.

### Step 4: Update GRUB configuration

Depending on your distribution, run:

- **Ubuntu/Debian/Mint/Kali:**
  ```bash
  sudo update-grub
  ```
- **Arch/Fedora/OpenSUSE:**
  ```bash
  sudo grub-mkconfig -o /boot/grub/grub.cfg
  ```

## 🛠️ Development & Preview

### Local Preview

This project includes a `grub.cfg` file specifically designed for theme testing. It acts as a "mock" configuration that simulates a real boot menu without actually booting into an OS.

To test the theme using `grub2-theme-preview`:

```bash
grub2-theme-preview . --resolution 1920x1080 --grub-cfg ./grub.cfg --no-kvm
```

### Using the Mock `grub.cfg`

The `grub.cfg` is optimized for development:
- **Variable-based theme selection**: Change `set theme_name="..."` at the top of the file to switch between different themes in the `themes/` directory.
- **Fast Feedback**: Selecting an entry will display a mock message and wait for 3 seconds instead of performing a real boot.
- **Clean Structure**: The file is kept minimal and well-documented for easy customization.

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
