#!/bin/bash
set -e
cmd=$(hgloballocate.s 'f' 'emacs -nw' $1 $2)
$cmd
