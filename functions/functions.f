#!/bin/bash

#############################################################################################################################
#cd to a directory just using name

#!/bin/bash
hcd.f()
{
    cmd=$(hgloballocate.s 'd' 'cv' $1 $2)
    $cmd
}


#############################################################################################################################
#ls a directory just using name

#!/bin/bash
hls.f()
{
    cmd=$(hgloballocate.s 'd' 'ls' $1 $2)
    $cmd
}
#export -f hls.f




