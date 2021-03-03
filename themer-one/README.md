# `themer`

Your theme's unique URL:

https://themer.dev/?colors.dark.accent0=%23e06c75&colors.dark.accent1=%23d19a66&colors.dark.accent2=%23e5c07b&colors.dark.accent3=%2398c379&colors.dark.accent4=%2356b6c2&colors.dark.accent5=%2361afef&colors.dark.accent6=%23c678dd&colors.dark.accent7=%23be5046&colors.dark.shade0=%23282c34&colors.dark.shade1=%23393e48&colors.dark.shade2=%234b515c&colors.dark.shade3=%235c6370&colors.dark.shade4=%23636d83&colors.dark.shade5=%23828997&colors.dark.shade6=%23979eab&colors.dark.shade7=%23abb2bf&colors.light.accent0=%23e45649&colors.light.accent1=%23986801&colors.light.accent2=%23c18401&colors.light.accent3=%2350a14f&colors.light.accent4=%230184bc&colors.light.accent5=%234078f2&colors.light.accent6=%23a626a4&colors.light.accent7=%23ca1243&colors.light.shade0=%23fafafa&colors.light.shade1=%23CDCED1&colors.light.shade2=%23a0a1a7&colors.light.shade3=%239d9d9f&colors.light.shade4=%2383858B&colors.light.shade5=%23696c77&colors.light.shade6=%2351535D&colors.light.shade7=%23383a42&activeColorSet=dark&calculateIntermediaryShades.dark=false&calculateIntermediaryShades.light=false

If you find `themer` useful, here are some ways to support the project:

* Star [`themer` on GitHub](https://github.com/mjswensen/themer)
* Follow [@themerdev](https://twitter.com/themerdev) on Twitter
* [Send a tip through the Brave Browser](https://brave.com/the537), either on [the repository page](https://github.com/mjswensen/themer) or [the Web UI](https://themer.dev)
* Pay what you want when downloading your theme from [themer.dev](https://themer.dev)

# Installation instructions

## Alacritty

1. Paste the contents of `Alacritty/Themer.yml` into your Alacritty config file.
2. Select the desired theme by setting the `colors` config key to reference the scheme's anchor (i.e., `colors: *light` or `colors: *dark`).

## Block Wave Wallpaper

Files generated:

* `Block Wave Wallpaper/themer-wallpaper-block-wave-dark-1920x950.png`
* `Block Wave Wallpaper/themer-wallpaper-block-wave-light-1920x950.png`

## Brave

1. Launch Brave and go to `brave://extensions`.
2. Check the "Developer mode" checkbox at the top.
3. Click the "Load unpacked extension..." button and choose the desired theme directory (`Brave/Themer Dark` or `Brave/Themer Light`).

(To reset or remove the theme, visit `brave://settings` and click "Reset to Default" in the "Appearance" section.)

## Burst Wallpaper

Files generated:

* `Burst Wallpaper/themer-wallpaper-burst-dark-1920x950.png`
* `Burst Wallpaper/themer-wallpaper-burst-light-1920x950.png`

## Chrome

1. Launch Chrome and go to `chrome://extensions`.
2. Check the "Developer mode" checkbox at the top.
3. Click the "Load unpacked extension..." button and choose the desired theme directory (`Chrome/Themer Dark` or `Chrome/Themer Light`).

(To reset or remove the theme, visit `chrome://settings` and click "Reset to Default" in the "Appearance" section.)

## Circuits Wallpaper

Files generated:

* `Circuits Wallpaper/themer-wallpaper-circuits-dark-1920x950.png`
* `Circuits Wallpaper/themer-wallpaper-circuits-light-1920x950.png`

## Diamonds Wallpaper

Files generated:

* `Diamonds Wallpaper/themer-wallpaper-diamonds-dark-1920x950.png`
* `Diamonds Wallpaper/themer-wallpaper-diamonds-light-1920x950.png`

## Dot Grid Wallpaper

Files generated:

* `Dot Grid Wallpaper/themer-wallpaper-dot-grid-dark-1920x950-1.png`
* `Dot Grid Wallpaper/themer-wallpaper-dot-grid-dark-1920x950-2.png`
* `Dot Grid Wallpaper/themer-wallpaper-dot-grid-light-1920x950-1.png`
* `Dot Grid Wallpaper/themer-wallpaper-dot-grid-light-1920x950-2.png`

## Firefox Add-on

To use the generated extension package, the code will need to be packaged up and signed by Mozilla.

To package the code in preparation for submission, the `web-ext` tool can be used:

    npx web-ext build --source-dir 'Firefox Add-on/Themer Dark' # or 'Firefox Add-on/Themer Light'

Then the package can be submitted to Mozilla for review in the [Add-on Developer Hub](https://addons.mozilla.org/en-US/developers/addon/submit/distribution).

Learn more about Firefox themes from [extensionworkshop.com](https://extensionworkshop.com/documentation/themes/)

To theme Firefox without the need to create a developer account and go through the extension review process, see themer's integration with [Firefox Color](https://color.firefox.com).

## Firefox Color

The Firefox Color add-on allows for simple theming without the need for a developer account or package review process by Mozilla.

1. Install the [Firefox Color add-on](https://addons.mozilla.org/en-US/firefox/addon/firefox-color/).
2. Open 'Firefox Color/themer-dark.url' or 'Firefox Color/themer-light.url' directly with Firefox.
3. Click "Yep" when prompted to apply the custom theme.

For a more fully featured Firefox theme, see themer's Firefox theme add-on generator.

## kitty

In the kitty configuration file (usually `~/.config/kitty/kitty.conf`), `include` the generated theme file:

    include kitty/themer-dark.conf
    include kitty/themer-light.conf

## Octagon Wallpaper

Files generated:

* `Octagon Wallpaper/themer-wallpaper-octagon-dark-1920x950.png`
* `Octagon Wallpaper/themer-wallpaper-octagon-light-1920x950.png`

## Shirts Wallpaper

Files generated:

* `Shirts Wallpaper/themer-wallpaper-shirts-dark-1920-950.png`
* `Shirts Wallpaper/themer-wallpaper-shirts-light-1920-950.png`

## Triangles Wallpaper

Files generated:

* `Triangles Wallpaper/themer-wallpaper-triangles-dark-1920x950.png`
* `Triangles Wallpaper/themer-wallpaper-triangles-light-1920x950.png`

## Trianglify Wallpaper

Files generated:

* `Trianglify Wallpaper/themer-wallpaper-trianglify-dark-1920x950-0.75-1.png`
* `Trianglify Wallpaper/themer-wallpaper-trianglify-dark-1920x950-0.75-2.png`
* `Trianglify Wallpaper/themer-wallpaper-trianglify-light-1920x950-0.75-1.png`
* `Trianglify Wallpaper/themer-wallpaper-trianglify-light-1920x950-0.75-2.png`

## Vim

Copy or symlink `Vim/ThemerVim.vim` to `~/.vim/colors/`.

Then set the colorscheme in `.vimrc`:

    " The background option must be set before running this command.
    colo ThemerVim

## Vim lightline

Make sure that the `background` option is set in `.vimrc`.

Copy or symlink `Vim lightline/ThemerVimLightline.vim` to `~/.vim/autoload/lightline/colorscheme/`.

Then set the colorscheme in `.vimrc`:

    let g:lightline = { 'colorscheme': 'ThemerVimLightline' }