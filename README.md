# omarchy_post_install

> A simple script to remove, install, and configure applications for a base Omarchy installation.

## About the Project

This project is a set of scripts to automate the installation and configuration of various applications on an Arch Linux-based distribution, specifically Omarchy. It provides a simple way to set up a new machine with all the necessary software, without having to manually install and configure each application one by one.

## Tech Stack

The main technologies and libraries used in this project are:

* **Ruby**
* **Bash**

## Installation

To install and run this project, you can use the following command:

```bash
curl -sSL https://raw.githubusercontent.com/luizvilasboas/omarchy_post_install/main/install.sh | sudo bash
```

## Managed Software

This script will install the following applications:

* KeePassXC
* Discord
* Gnome Disk Utility
* GParted
* Cheese
* Steam
* Lutris
* ProtonPlus
* Waybar Updates

This script will remove the following applications:

* 1Password
* Typora
* Dropbox
* Obsidian
* Signal Desktop
* OBS Studio
* Kdenlive
* Tailscale

## Managed Configurations

This script will install the following configurations:

* Bash
* Starship
* Waybar

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

