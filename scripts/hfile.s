#!/bin/bash
set -e
cmd=$(hgloballocate.s "f" "echo" $1 $2)
$cmd
