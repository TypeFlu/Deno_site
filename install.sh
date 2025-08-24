#!/bin/bash
#
# Sukisu Ultra Installation Helper
# A beautiful interactive script to guide users to Sukisu Ultra

# --- Colors and Styling ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# --- Beautiful ASCII Art ---
show_welcome() {
    clear
    echo -e "${PURPLE}${BOLD}"
    echo "╔═══════════════════════════════════════════════════════════════╗"
    echo "║                                                               ║"
    echo "║   ███████╗██╗   ██╗██╗  ██╗██╗███████╗██╗   ██╗               ║"
    echo "║   ██╔════╝██║   ██║██║ ██╔╝██║██╔════╝██║   ██║               ║"
    echo "║   ███████╗██║   ██║█████╔╝ ██║███████╗██║   ██║               ║"
    echo "║   ╚════██║██║   ██║██╔═██╗ ██║╚════██║██║   ██║               ║"
    echo "║   ███████║╚██████╔╝██║  ██╗██║███████║╚██████╔╝               ║"
    echo "║   ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝╚══════╝ ╚═════╝                ║"
    echo "║                                                               ║"
    echo "║                    ${CYAN}✨ ULTRA EDITION ✨${PURPLE}                     ║"
    echo "║                                                               ║"
    echo "╚═══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# --- Animated typing effect ---
type_text() {
    local text="$1"
    local delay="${2:-0.05}"
    for (( i=0; i<${#text}; i++ )); do
        echo -n "${text:$i:1}"
        sleep "$delay"
    done
    echo
}

# --- Loading animation ---
show_loading() {
    local duration="$1"
    local message="$2"
    local chars="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
    local end_time=$((SECONDS + duration))
    
    while [ $SECONDS -lt $end_time ]; do
        for (( i=0; i<${#chars}; i++ )); do
            echo -ne "\r${CYAN}${chars:$i:1} ${message}${NC}"
            sleep 0.1
        done
    done
    echo -ne "\r${GREEN}✓ ${message} Complete!${NC}\n"
}

# --- Main Script ---
show_welcome

echo -e "\n${YELLOW}${BOLD}Welcome to the Sukisu Ultra Experience!${NC}\n"

type_text "${WHITE}Hello there, fellow developer! 👋${NC}" 0.03

echo -e "\n${BLUE}${BOLD}🌟 Time for an Amazing Journey! 🌟${NC}"
echo -e "${WHITE}To get the latest and greatest version of Sukisu Ultra,${NC}"
echo -e "${WHITE}we need you to take a quick trip to our releases page.${NC}\n"

show_loading 2 "Preparing your experience"

echo -e "\n${PURPLE}${BOLD}📋 Here's what you need to do:${NC}"
echo -e "${CYAN}  1. ${WHITE}Switch to your web browser (Chrome, Firefox, Safari, etc.)${NC}"
echo -e "${CYAN}  2. ${WHITE}Navigate to: ${YELLOW}${BOLD}github.com/sukisu-ultra/sukisu-ultra/releases${NC}"
echo -e "${CYAN}  3. ${WHITE}Download the latest release for your system${NC}"
echo -e "${CYAN}  4. ${WHITE}Come back to this terminal when you're done${NC}\n"

echo -e "${YELLOW}${BOLD}🚀 Ready? Let's go!${NC}\n"

# Try to open the URL automatically if possible
if command -v open >/dev/null 2>&1; then
    echo -e "${GREEN}Opening the releases page for you...${NC}"
    open "https://github.com/sukisu-ultra/sukisu-ultra/releases" 2>/dev/null || true
elif command -v xdg-open >/dev/null 2>&1; then
    echo -e "${GREEN}Opening the releases page for you...${NC}"
    xdg-open "https://github.com/sukisu-ultra/sukisu-ultra/releases" 2>/dev/null || true
fi

echo -e "${WHITE}Press ${BOLD}${GREEN}ENTER${NC}${WHITE} when you've downloaded Sukisu Ultra and are ready to continue...${NC}"
read -r

# Beautiful thank you message
clear
echo -e "${PURPLE}${BOLD}"
echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║                                                               ║"
echo "║           🎉 ${YELLOW}THANK YOU FOR CHOOSING SUKISU!${PURPLE} 🎉            ║"
echo "║                                                               ║"
echo "║  ${CYAN}✨ Your journey with Sukisu Ultra begins now! ✨${PURPLE}        ║"
echo "║                                                               ║"
echo "║     ${WHITE}We hope you found something amazing! 🚀${PURPLE}              ║"
echo "║                                                               ║"
echo "║        ${GREEN}Have a nice day, and see you in the future! 👋${PURPLE}        ║"
echo "║                                                               ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo -e "${NC}\n"

# Animated goodbye
echo -e "${YELLOW}${BOLD}"
type_text "Thanks for using our installer! 💖" 0.04
echo -e "${NC}"

echo -e "${CYAN}${BOLD}"
type_text "Goodbye, and happy developing! ✨" 0.04
echo -e "${NC}\n"

# Final sparkle effect
echo -e "${WHITE}${BOLD}✨ ⭐ 🌟 ✨ ⭐ 🌟 ✨ ⭐ 🌟 ✨ ⭐ 🌟 ✨${NC}\n"
