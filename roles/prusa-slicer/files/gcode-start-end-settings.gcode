; new start gcode
G21 ;metric values
G90 ;absolute positioning
M82 ;set extruder to absolute mode
M107 ;start with the fan off
G28 X0 Y0 ;move X/Y to min endstops
G28 Z0 ;move Z to min endstops
G92 E0 ;zero the extruded length
; purge line
; https://youtu.be/6csbJ5965Bk?t=335
G1 Z2.0 F500.0 ; move up 2mm
G1 Y-3.0 F500.0 ; move out of print volume
G1 X60.0 E9 F500.0 ; start purge line
G1 X100.0 E12.5 F500.0 ; finish purge line
G92 E0 ;zero the extruded length again
M117 Printing... ;Put printing message on LCD screen


;------------------------------------------------
; default start gcode
G21 ;metric values
G90 ;absolute positioning
M82 ;set extruder to absolute mode
M107 ;start with the fan off
G28 X0 Y0 ;move X/Y to min endstops
G28 Z0 ;move Z to min endstops
G1 Z15.0 F{speed_travel} ;move the platform down 15mm
G92 E0 ;zero the extruded length
G1 F200 E6 ;extrude 6 mm of feed stock
G92 E0 ;zero the extruded length again
G1 F{speed_travel} 
;Put printing message on LCD screen
M117 Printing...

;------------------------------------------------
; start gcode from thingiverse https://www.thingiverse.com/groups/i3/forums/general/topic:16062
G21 ;metric values
G90 ;absolute positioning
M82 ;set extruder to absolute mode
M107 ;start with the fan off
G92 E0; set extruder to 0;
G28 X0 Y0 ; move X/Y to min endstops
G28 Z0 ; move Z to min endstops
G1 Y-3.0 F500.0 ; move out of print volume
G1 X60.0 E9 F500.0 ; start purge line
G1 X100.0 E12.5 F500.0 ; finish purge line


;------------------------------------------------
; default end gcode
M104 S0                                 ;extruder heater off 
G91                                     ;relative positioning
G1 E-1 F300                             ;retract the filament a bit before lifting the nozzle, to release some of the pressure
G1 Z+0.5 E-5 X-20 Y-20 F{speed_travel}  ;move Z up a bit and retract filament even more
G28 X0 Y0                               ;move X/Y to min endstops, so the head is out of the way
M84                                     ;steppers off
G90                                     ;absolute positioning

;------------------------------------------------
; new end gcode
M104 S0         ;extruder heater off 
G91             ;relative positioning
G1 E-5 F300     ;retract the filament a bit before lifting the nozzle, to release some of the pressure

; move extruder and build plate out of the way so it can be reached
M211 S1         ;turn on soft limits
G0 Z150 F1500   ;move Z axis upwards so the print can be reached
G28 X0          ;move X axis to min endstop, so the print can be reached
G0 Y150 F1500   ;move Y to +max position, so the print can be reached

M84             ;steppers off
G90             ;absolute positioning
M82             ;absolute extrusion mode
