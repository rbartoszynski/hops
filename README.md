#hops
Enhanced bash via quick file lookup.

##Before and After
###What you're doing now:
![With cd](http://i.imgur.com/fVSrRju.gif)
###What you could be doing instead:
![With hops](http://i.imgur.com/wYBMpTU.gif)
####It even works with multiple matches:
![With hops and multiple matches](http://i.imgur.com/JGJCx9J.gif)

##More than just a cd replacement.
###Cat files
    hcat.s my_file
###Copy files
    cp my_file $(hdir.s some_dir)
###ls directories
    hls.f some_dir
###edit files
    hedit.s my_file #opens with your favorite editor
###find file
    hfile.s my_file
###find dir
    hdir.s some_dir

##Installation
For now, it's 'primitive'.
1. git clone the repo

2. source hops/functions/functions.f in your .bash_profile

3. add hops/scripts to your PATH

4. ?

5. Profit