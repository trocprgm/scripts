Complete patch list
--------------------

 - activemonitor
 - alwayscenter
 - attachbottom
 - cfacts-vanitygaps
 - pertag
 - adjacenttag
 - scratchpads

Buildsesh#1 on 11-25-24
Bruh I am so fucking tweak tired

Plan A:

dwm version:
    dwm-6.5

patches:
    5    activemonitor
    4    alwayscenter
    3    attachbottom
    1    cfacts-vanitygaps
    2    pertag
    3.5  adjacenttag

^planed patch order

Total install took like 5 hours, but all done now. 

Buildsesh#2 on 11-30-24
going to add scratchpads
scratchpads installed sucessfully


Buildsesh#3 on sameday
got volume keys working
source:
https://gist.github.com/palopezv/efd34059af6126ad970940bcc6a90f2e

Had to install 
https://archlinux.org/packages/extra/x86_64/libx11/
sudo pacman -S libx11
in the exrtra repo

Also made it so that that scratchpads can be possitioned

Patching on 10-14-25
added floatrules patch 
wrote little if statement in dwm.c that only centers floating windows on the far left and doesnt interfer with windows defined by float ruels.
Works pretty well
did some other stuff

