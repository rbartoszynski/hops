#!/bin/bash
set -e
cmd=$(hgloballocate.s "f" "cat" $1 $2)
$cmd
