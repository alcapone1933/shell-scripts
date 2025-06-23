#!/bin/bash

if [ "$(whoami)" != "root" ]; then
    echo "Please run this script as root or using sudo"
    exit 1
fi

# Set the name and download URL of the program
program_name="shoutrrr"
program_repo="containrrr/shoutrrr"
program_download_url="https://github.com/${program_repo}/releases/download"

# Print help message
function print_help {
    echo "Usage: $0 [--help|--install|--update|--remove]"
    echo ""
    echo "  shoutrrr cli install script"
    echo ""
    echo "  -h or --help   : HELP OUTPUT"
    echo ""
    echo "  -i or --install: Download and install the latest version of $program_name."
    echo "  -u or --update : Check for a new version of $program_name and update if available."
    echo "  -r or --remove : Remove $program_name from the system."
    echo ""
    echo "  for linux os   : linux/386 linux/amd64 linux/arm linux/arm64"
}

# Check if the program is already installed
function check_installed {
    if [ -x "$(command -v $program_name)" ]; then
        $program_name --version
        return 0
    else
        return 1
    fi
}

# Download and install the latest version of the program
function install {
    if check_installed; then
        echo "$program_name is already installed. Use the update command to check for updates."
        return
    fi
    case $(uname -m) in
        i386|i686)
            os="linux_386"
            ;;
        x86_64|amd64)
            os="linux_amd64"
            ;;
        armv7l|armhf)
            os="linux_armv6"
            ;;
        aarch64|arm64)
            os="linux_arm64"
            ;;
        *)
            echo "Unsupported architecture: $(uname -m). Please use the --os option to specify the operating system architecture."
            return
            ;;
    esac
    # Download and extract the program to /usr/local/bin
    echo "Downloading $program_name for $os ..."
    latest_version=$(curl -s https://api.github.com/repos/${program_repo}/releases/latest | grep 'tag_name' | cut -d\" -f4)
    curl -L# "$program_download_url/$latest_version/${program_name}_${os}.tar.gz" -o /tmp/$program_name.tar.gz
    tar -xvzf /tmp/$program_name.tar.gz -C /usr/local/bin $program_name
    rm -v /tmp/$program_name.tar.gz
    chmod +x /usr/local/bin/$program_name
    # Print the updated version
    $program_name --version
}

# Check for updates and install if available
function update {
    if ! check_installed; then
        echo "$program_name is not installed. Use the install command to download and install it."
        return
    fi
    # Determine the operating system architecture
    case $(uname -m) in
        i386|i686)
            os="linux_386"
            ;;
        x86_64|amd64)
            os="linux_amd64"
            ;;
        armv7l|armhf)
            os="linux_armv6"
            ;;
        aarch64|arm64)
            os="linux_arm64"
            ;;
        *)
            echo "Unsupported architecture: $(uname -m). Please use the --os option to specify the operating system architecture."
            return
            ;;
    esac
    # Check if an update is available
    echo "Checking for updates to $program_name ..."
    current_version=$($program_name --version | cut -d' ' -f3)
    latest_version=$(curl -s https://api.github.com/repos/${program_repo}/releases/latest | grep 'tag_name' | cut -d\" -f4)
    if [ "v$current_version" = "$latest_version" ]; then
        echo "$program_name is already up to date."
        return
    fi
    # Download and extract the program to /usr/local/bin
    echo "Updating $program_name from v$current_version to $latest_version version ..."
    curl -L# "$program_download_url/$latest_version/${program_name}_${os}.tar.gz" -o /tmp/$program_name.tar.gz
    remove
    tar -xvzf /tmp/$program_name.tar.gz -C /usr/local/bin $program_name
    rm -v /tmp/$program_name.tar.gz
    chmod +x /usr/local/bin/$program_name
    # Print the updated version
    $program_name --version
    echo "Programm $program_name is Updating from v$current_version to $latest_version version ..."
}

# Remove the program from the system

function remove {
    if ! check_installed; then
        echo "$program_name is not installed."
        return
    fi

    # Remove the program binary from /usr/local/bin
    echo "Removing $program_name ..."
    rm -v /usr/local/bin/$program_name

    if check_installed; then
        echo "Failed to remove $program_name."
        return
    else
        echo "$program_name has been removed."
    fi
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -h|--help)
            print_help
            exit
            ;;
        -i|--install)
            install
            exit
            ;;
        -u|--update)
            update
            exit
            ;;
        -r|--remove)
            remove
            exit
            ;;
        *)
            echo "Invalid option: $key"
            print_help
            exit 1
            ;;
    esac
done

# If no arguments were given, print the help message
if [ $# -eq 0 ]; then
    print_help
fi
