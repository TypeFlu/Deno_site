#!/bin/bash
#
# Sukisu Ultra - Lightning Fast Installer ⚡
# iPhone-ish fluid experience with error handling

# Colors (iOS-inspired)
readonly G='\033[0;32m'    # Green
readonly B='\033[0;34m'    # Blue  
readonly R='\033[0;31m'    # Red
readonly Y='\033[1;33m'    # Yellow
readonly P='\033[0;35m'    # Purple
readonly C='\033[0;36m'    # Cyan
readonly W='\033[1;37m'    # White
readonly D='\033[0;90m'    # Dim
readonly N='\033[0m'       # Reset

# Error handling (iPhone-style)
handle_error() {
    echo -e "\n${R}■${N} ${W}Oops! Something went wrong${N}"
    echo -e "${D}Error details: $1${N}"
    echo -e "${Y}→${N} Try again or contact support"
    exit 1
}

# Trap errors
trap 'handle_error "Unexpected error on line $LINENO"' ERR

# Fast animations
pulse() { 
    local msg="$1"
    for i in {1..3}; do 
        echo -ne "\r${C}●${N} $msg"
        sleep 0.1
        echo -ne "\r${B}●${N} $msg"
        sleep 0.1
    done
    echo -ne "\r${G}●${N} $msg ✓\n"
}

# iPhone-style loading
loading() {
    local dots="   "
    for i in {1..8}; do
        echo -ne "\r${B}${dots:0:$((i%4))}${N}"
        sleep 0.1
    done
    echo -ne "\r${G}✓${N} Ready!\n"
}

# System detection
detect_system() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        SYSTEM="macOS"
        OPENER="open"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        SYSTEM="Linux"
        OPENER="xdg-open"
    else
        SYSTEM="Unknown"
        OPENER=""
    fi
}

# Main UI
clear
echo -e "${P}╭─────────────────────────────────────────╮${N}"
echo -e "${P}│${N}                                         ${P}│${N}"
echo -e "${P}│${N}  ${W}SUKISU ${C}ULTRA${N} ${Y}⚡${N}                    ${P}│${N}"
echo -e "${P}│${N}  ${D}Lightning fast installer${N}            ${P}│${N}"
echo -e "${P}│${N}                                         ${P}│${N}"
echo -e "${P}╰─────────────────────────────────────────╯${N}"

echo -e "\n${G}●${N} ${W}Welcome!${N} Let's get you set up"

# Quick system check
detect_system
pulse "Detecting system: $SYSTEM"

# Error simulation for demo (iPhone VCS-style)
if [[ "$1" == "--demo-error" ]]; then
    echo -e "\n${R}■${N} ${W}Git Error${N}"
    echo -e "${D}fatal: repository 'sukisu-ultra' not found${N}"
    echo -e "${Y}→${N} ${W}Fix:${N} Check your connection"
    echo -e "${Y}→${N} ${W}Or:${N} Try manual download"
    echo -e "\n${C}?${N} Need help? Visit our docs"
    exit 1
fi

loading

echo -e "\n${Y}→${N} ${W}Quick action needed:${N}"
echo -e "  ${B}1.${N} Switch to your browser"
echo -e "  ${B}2.${N} Visit: ${C}github.com/sukisu-ultra/sukisu-ultra/releases${N}"
echo -e "  ${B}3.${N} Download latest release"

# Auto-open if possible
if command -v "$OPENER" >/dev/null 2>&1; then
    echo -e "\n${G}●${N} Opening browser..."
    "$OPENER" "https://github.com/sukisu-ultra/sukisu-ultra/releases" 2>/dev/null || {
        echo -e "${Y}!${N} Could not open browser automatically"
        echo -e "${D}Please open manually: github.com/sukisu-ultra/sukisu-ultra/releases${N}"
    }
else
    echo -e "\n${Y}!${N} Please open manually:"
    echo -e "${C}github.com/sukisu-ultra/sukisu-ultra/releases${N}"
fi

echo -e "\n${D}Press ${W}ENTER${D} when ready...${N}"
read -r

# Success animation
clear
echo -e "${G}╭─────────────────────────────────────────╮${N}"
echo -e "${G}│${N}                 ${G}✓${N}                   ${G}│${N}"
echo -e "${G}│${N}           ${W}All set!${N}               ${G}│${N}"
echo -e "${G}│${N}                                         ${G}│${N}"
echo -e "${G}│${N}  ${C}Thanks for choosing Sukisu Ultra${N}   ${G}│${N}"
echo -e "${G}│${N}                                         ${G}│${N}"
echo -e "${G}╰─────────────────────────────────────────╯${N}"

echo -e "\n${Y}✨${N} ${W}Happy coding!${N}"
echo -e "${D}See you soon... ${P}bye!${N} ${Y}👋${N}\n"

# Quick exit
sleep 0.5
