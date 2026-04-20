#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATA_FOLDER="$SCRIPT_DIR"
SUGARFOLDER="~/.martenapps/sugardemo"
#Install Script For Now Installing Sugary Spire Exhibition Night

if [ "$1" != "--in-terminal" ]; then
    lxterminal -e "bash -c '$0 --in-terminal; exec bash'"
    exit
fi

echo Installing "Now Installing Sugary Spire Exhibition Night..."
echo This Project Would Have Not Been Possible
echo Without The Great People At Pi-Apps!
echo Support Botspot!

if [ -d "$SUGARFOLDER" ]; then
	echo "Packages Installed, Moving On."
else
	if [ ! -d "$HOME/pi-apps" ]; then
		wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/install | bash
	fi
	~/pi-apps/manage install "Box86"
	~/pi-apps/manage install "Wine (x64)"
	sudo apt install xdelta3 -y
fi

echo "Now Installing Sugary Spire Exhibition Night..."

rm -r ~/.martenapps/sugardemo
rm -r ~/.martenapps/sugardemo45/
mkdir ~/.martenapps
mkdir ~/.martenapps/sugardemo/
mkdir ~/.martenapps/sugardemo45/
cd ~/.martenapps/sugardemo/
rm 1080p.xdelta
rm PT_Eggplantv15_3.zip
wget https://archive.org/download/sugary-spire-exhibition-night-v-1.3.2/SugarySpire_ExhibitionNight_V1.3.2.zip
wget https://raw.githubusercontent.com/martenmario64/Sugary-Spire-On-Raspberry/refs/heads/main/1080p.xdelta
unzip SugarySpire_ExhibitionNight_V1.3.2.zip -d ~/.martenapps/sugardemo/Game/
unzip SugarySpire_ExhibitionNight_V1.3.2.zip -d ~/.martenapps/sugardemo45/Game/
xdelta3 -n -d -s ~/.martenapps/sugardemo45/Game/data.win ~/.martenapps/sugardemo/1080p.xdelta ~/.martenapps/sugardemo45/data.win
rm ~/.martenapps/sugardemo45/Game/data.win
mv ~/.martenapps/sugardemo45/data.win ~/.martenapps/sugardemo45/Game/
mv ~/.martenapps/sugardemo/data.win ~/.martenapps/sugardemo/Game/
cd ~/.martenapps/sugardemo/
wget https://github.com/martenmario64/Sugary-Spire-On-Raspberry/raw/refs/heads/main/runner.sh
sudo chmod +x runner.sh
mv ~/.martenapps/sugardemo/runner.sh ~/.martenapps/sugardemo/Game/runner.sh
cd Game/
cp runner.sh ~/Desktop/SugarySpire_ExhibitionNight.sh
cd $SCRIPT_DIR

echo "Finished! Go To The Desktop And Find "SugarySpire_ExhibitionNight.sh"!"
echo "Press Any Button To Close."
read button
exit 0
