#!/bin/bash

WTHR=$(curl -n 'wttr.in/?format=%c' 2> /dev/null)" "$(curl -n 'wttr.in/?format=%l:+%C+%t' 2> /dev/null)
if [[ ! "$WTHR" == Sorry* ]] ; then # if error message don't display
	echo -E -n "$WTHR"
fi
