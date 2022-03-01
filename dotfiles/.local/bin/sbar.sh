
#!/bin/bash

# INIT
sec=0

update_pkgupdates() {
	pkgcount="$(xbps-install -un | wc -l)"
	pkgupdates="$(printf ' ')$([ $pkgcount = 0 ] && echo 'Fully Updated' || echo $pkgcount)"
}


update_weather () {
	weather="$(sweather)"
}


update_vol () { 
	vol="$([ "$(pamixer --get-mute)" = "false" ] && printf '墳 ' || printf '婢 ')$(pamixer --get-volume)%"
}


update_date () { 
	date="$(date "+%a %d %b %H:%M")" 
}


# We have to run this only once.
update_vol

display () { 
	xsetroot -name "$date;[ $weather ] [ $vol ] [ $pkgupdates ]  "
}

# Handling receiving signal
# RTMIN = 34 (always)
trap	"update_vol;display"	"RTMIN"
# where m = 34 + n

while true; do
	sleep 1 &
  wait && { 
		# to update item ever n seconds with a offset of m
		## [ $((sec % n)) -eq m ] && udpate_item
		[ $((sec % 5 )) -eq 0 ] && update_date
		[ $((sec % 7200)) -eq 0 ] && update_weather
		[ $((sec % 36000)) -eq 0 ] && update_pkgupdates

		# how often the display updates ( 5 seconds )
		[ $((sec % 5 )) -eq 0 ] && display
		sec=$((sec + 1))
	}
done 
