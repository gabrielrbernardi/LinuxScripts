echo "Starting script"

sudo apt update
sudo apt install snapd -y
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo apt update

echo ""
echo "Creating folder on /home/$USER/programs"
echo ""
mkdir /home/$USER/programs
cd /home/$USER/programs

echo "Downaloading Google Chrome"
echo ""
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#installing all aplications .deb
echo ""
echo "Installing .deb packages"
echo ""
sudo dpkg -i *.deb

echo ""
echo "Installing Spotify"
echo ""
sudo snap install spotify
echo ""
echo "Installing VS Code"
echo ""
sudo snap install code --classic

echo ""
echo "Installing Code Blocks"
echo ""
flatpak install flathub org.codeblocks.codeblocks -y
echo ""
echo "Installing AnyDesk"
echo ""
flatpak install flathub com.anydesk.Anydesk -y
echo ""
echo "Installing PulseEffects"
echo ""
flatpak install --user https://flathub.org/repo/appstream/com.github.wwmm.pulseeffects.flatpakref -y
flatpak --user update com.github.wwmm.pulseeffects -y

flatpak update

echo "End of script"
