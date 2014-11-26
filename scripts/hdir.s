#!/bin/bash
set -e
cmd=$(hgloballocate.s "d" "echo" $1 $2)
$cmd
