# Proton-GE Custom Installer

This script automates the process of downloading, installing, and managing Proton-GE Custom releases for Steam on Linux. It checks for the latest release of Proton-GE Custom from GloriousEggroll's GitHub repository, downloads the tarball, and extracts it to the appropriate directory. The script also provides an option to remove previous releases.

## Prerequisites

- `wget`
- `jq`

Install these tools using your package manager if not already installed.

## Usage

1. Clone this repository or download the `proton_ge_custom_installer.sh` script.
2. Make the script executable: `chmod +x proton_ge_custom_installer.sh`
3. Run the script: `./proton_ge_custom_installer.sh`

The script will prompt you to confirm the latest release version before proceeding. It will then download the tarball, extract it to the correct directory, and give you the option to remove previous releases.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
