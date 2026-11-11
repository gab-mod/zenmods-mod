# zenmods-mod

My mods for [Zen Browser](https://zen-browser.app/).

## Mods

### [Mod Zen Tweaks](./mod-zen-tweaks)

Frosted purple glass on the active tab only, with a thin violet gradient ring. It also hides the container color line and gives the sidebar a darker background. Works in both the compact and full-size sidebar.

## Install

You need Zen Browser, `zsh` and `python3`.

1. Clone the repo:
   ```sh
   git clone https://github.com/gabrielscolt0/zenmods-mod.git
   cd zenmods-mod
   ```
2. Copy the mods into your Zen profile:
   ```sh
   ./dev/sync-mods.sh                   # all mods
   ./dev/sync-mods.sh mod-zen-tweaks    # just one
   ```
   The script looks for your `*.Default (release)` profile in `~/.config/zen`, `~/.zen`, the Flatpak folder, or `~/Library/Application Support/zen/Profiles` on macOS. To use another profile, set it yourself:
   ```sh
   ZEN_PROFILE="/path/to/profile" ./dev/sync-mods.sh
   ```
3. Turn it on: open `about:preferences#zenMarketplace` (Settings → Look and Feel → Zen Mods) and switch the mod off and on again, or restart Zen.

## Editing a mod

`./dev/watch-mods.sh` syncs the mods once, then syncs again every time you save a `chrome.css` or `theme.json`. Switch the mod off and on in Zen to see each change.

## Credits

The `dev/` sync scripts and the repo layout come from [Rory-Miley/zen_mods](https://github.com/Rory-Miley/zen_mods) (MIT). Here they also find Zen profiles on Linux.

## License

[MIT](./LICENSE)
