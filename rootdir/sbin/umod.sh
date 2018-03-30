#!/system/bin/sh

if "$(getprop persist.sys.modgfx)" == "true" ; then 
	# fast mode
	/system/bin/settings put global window_animation_scale 0.6
	/system/bin/settings put global transition_animation_scale 0.6
	/system/bin/settings put global animator_duration_scale 0.6 
else
	/system/bin/settings put global window_animation_scale 1.00
	/system/bin/settings put global transition_animation_scale 1.00
	/system/bin/settings put global animator_duration_scale 1.00
fi
