help:
	@echo 'Makefile for i3 dotfiles'
	@echo '' 
	@echo 'Usage:  make install'
	@echo 'To clean files installed: make clean'
	@echo 'Warning make sure you backup your stuff first!'

install: rc 

rc:
	@mkdir -p "$$HOME/"{.i3,Scripts,.conky}
	@ln -sf "$$PWD/config" "$(HOME)/.i3/config"
	@ln -sf "$$PWD/layouts" "$(HOME)/.i3/layouts"
	@ln -sf "$$PWD/misc/caja_nodesktop" "$(HOME)/Scripts/caja_nodesktop"
	@ln -sf "$$PWD/misc/conky-i3bar" "$(HOME)/.conky/conky-i3bar"
	@ln -sf "$$PWD/misc/conky-wrapper" "$(HOME)/Scripts/conky-wrapper"
	@ln -sf "$$PWD/misc/extmonitor.sh" "$(HOME)/Scripts/extmonitor.sh"
	@ln -sf "$$PWD/misc/lock.sh" "$(HOME)/Scripts/lock"
	@ln -sf "$$PWD/misc/rofipowermenu" "$(HOME)/Scripts/rofipowermenu"
	@ln -sf "$$PWD/misc/rofimonitorlayout" "$(HOME)/Scripts/rofimonitorlayout"
	@ln -sf "$$PWD/misc/rofisearch" "$(HOME)/Scripts/rofisearch"
	@ln -sf "$$PWD/misc/scratchpad" "$(HOME)/Scripts/scratchpad"
	@ln -sf "$$PWD/misc/vol.sh" "$(HOME)/Scripts/vol.sh"
	@ln -sf "$$PWD/misc/windowtitleosd" "$(HOME)/Scripts/windowtitleosd"
	@echo Installing... Done!

clean:
	-@rm -rfi "$(HOME)/.i3" || true
	-@rm -rfi "$(HOME)/.conky/conky-i3bar"|| true
	-@rm -rfi "$(HOME)/Scripts/caja_nodesktop"|| true
	-@rm -rfi "$(HOME)/Scripts/conky-wrapper"|| true
	-@rm -rfi "$(HOME)/Scripts/extmonitor.sh"|| true
	-@rm -rfi "$(HOME)/Scripts/lock"|| true
	-@rm -rfi "$(HOME)/Scripts/rofimonitorlayout"|| true
	-@rm -rfi "$(HOME)/Scripts/rofipowermenu"|| true
	-@rm -rfi "$(HOME)/Scripts/rofisearch"|| true
	-@rm -rfi "$(HOME)/Scripts/scratchpad"|| true
	-@rm -rfi "$(HOME)/Scripts/vol.sh"|| true
	-@rm -rfi "$(HOME)/Scripts/windowtitleosd"|| true
	@echo Cleaning... Done !
