# Godot Website Example

This project demonstrates how to create a simple, responsive website using the Godot Engine. It serves as a learning resource for those interested in web development with Godot.

## Features

- Responsive layout using Godot's UI controls
- Dynamic content loading
- Customizable background, logo, and menu items
- Easy to extend and modify

## Prerequisites

- Godot Engine 4.3 or later

## Getting Started

1. Clone this repository:

   ```
   git clone https://github.com/alvarlaigna/godot-website-example.git
   ```

2. Open the project in Godot Engine.

3. Run the project in the editor or export it for web.

## Project Structure

- `home.tscn`: Main scene file
- `webroot.gd`: Main script controlling the website layout and content
- `export_presets.cfg`: Configuration for exporting the project
- `project.godot`: Godot project file
- `background.jpg`: Background image
- `logo.png`: Logo image

## Customization

To customize the website:

1. Replace `background.jpg` and `logo.png` with your own images.
2. Modify the `setup_header()`, `setup_content()`, and `setup_footer()` functions in `webroot.gd` to change the layout and content.

## Exporting for Web

1. In Godot, go to Project > Export.
2. Select the "Web" preset.
3. Click "Export Project" and choose a destination folder.

## Materials Used

### Logo

The logo used in this project is the Service Mark symbol, obtained from:
https://simple.m.wikipedia.org/wiki/File:Service_mark.svg

This image is in the public domain. The copyright holder has released this work worldwide for any purpose, without any conditions, unless such conditions are required by law.

### Background

The background image used in this project is from:
https://www.heroscreen.cc/2023/12/clean-design-pc-wallpaper-4k-gradient.html#google_vignette

Please note that you should verify the usage rights for this image before using it in your own projects. If you plan to use this project as a template for your own work, consider replacing the background image with one that you have the rights to use.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- Logo: Public Domain, via Wikimedia Commons
- Background: HeroScreen.cc (usage rights unverified)
