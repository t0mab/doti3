#!/bin/bash
# Clean out the workspace, ready for the new windows
i3-msg 'rename workspace 2 to "junk2"'
# Load Python documentation: 2 browser windows into a tabbed container
i3-msg "workspace 2; append_layout /home/user/.i3/saved-layouts/python/browser.json"
firefox --new-window http://www.google.com/
firefox --new-window /usr/share/doc/python-doc/html/index.html
i3-msg 'rename workspace 1 to "junk1"'
# Load Sublime text and some terminals into split and stacked containers
i3-msg "workspace 1; append_layout /home/user/.i3/saved-layouts/python/python.json"
subl3 &
i3-sensible-terminal &
i3-sensible-terminal &
