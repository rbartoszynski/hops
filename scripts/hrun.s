#!/bin/bash
set -e
cmd=$(hgloballocate.s 'f' '' $1 $2)
$cmd
