
.syntax unified
.thumb



.section ".text.accel_data_service_subscribe__deprecated"
.align 2
.thumb_func
.global accel_data_service_subscribe__deprecated
.type accel_data_service_subscribe__deprecated STT_FUNC
accel_data_service_subscribe__deprecated:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =0    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.accel_data_service_unsubscribe"
.align 2
.thumb_func
.global accel_data_service_unsubscribe
.type accel_data_service_unsubscribe STT_FUNC
accel_data_service_unsubscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =4    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.accel_service_peek"
.align 2
.thumb_func
.global accel_service_peek
.type accel_service_peek STT_FUNC
accel_service_peek:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =8    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.accel_service_set_samples_per_update"
.align 2
.thumb_func
.global accel_service_set_samples_per_update
.type accel_service_set_samples_per_update STT_FUNC
accel_service_set_samples_per_update:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =12    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.accel_service_set_sampling_rate"
.align 2
.thumb_func
.global accel_service_set_sampling_rate
.type accel_service_set_sampling_rate STT_FUNC
accel_service_set_sampling_rate:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =16    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.accel_tap_service_subscribe"
.align 2
.thumb_func
.global accel_tap_service_subscribe
.type accel_tap_service_subscribe STT_FUNC
accel_tap_service_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =20    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.accel_tap_service_unsubscribe"
.align 2
.thumb_func
.global accel_tap_service_unsubscribe
.type accel_tap_service_unsubscribe STT_FUNC
accel_tap_service_unsubscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =24    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_legacy2_add_to_window"
.align 2
.thumb_func
.global action_bar_layer_legacy2_add_to_window
.type action_bar_layer_legacy2_add_to_window STT_FUNC
action_bar_layer_legacy2_add_to_window:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =28    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_legacy2_clear_icon"
.align 2
.thumb_func
.global action_bar_layer_legacy2_clear_icon
.type action_bar_layer_legacy2_clear_icon STT_FUNC
action_bar_layer_legacy2_clear_icon:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =32    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_legacy2_create"
.align 2
.thumb_func
.global action_bar_layer_legacy2_create
.type action_bar_layer_legacy2_create STT_FUNC
action_bar_layer_legacy2_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =36    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_legacy2_destroy"
.align 2
.thumb_func
.global action_bar_layer_legacy2_destroy
.type action_bar_layer_legacy2_destroy STT_FUNC
action_bar_layer_legacy2_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =40    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_legacy2_get_layer"
.align 2
.thumb_func
.global action_bar_layer_legacy2_get_layer
.type action_bar_layer_legacy2_get_layer STT_FUNC
action_bar_layer_legacy2_get_layer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =44    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_legacy2_remove_from_window"
.align 2
.thumb_func
.global action_bar_layer_legacy2_remove_from_window
.type action_bar_layer_legacy2_remove_from_window STT_FUNC
action_bar_layer_legacy2_remove_from_window:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =48    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_legacy2_set_background_color_2bit"
.align 2
.thumb_func
.global action_bar_layer_legacy2_set_background_color_2bit
.type action_bar_layer_legacy2_set_background_color_2bit STT_FUNC
action_bar_layer_legacy2_set_background_color_2bit:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =52    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_legacy2_set_click_config_provider"
.align 2
.thumb_func
.global action_bar_layer_legacy2_set_click_config_provider
.type action_bar_layer_legacy2_set_click_config_provider STT_FUNC
action_bar_layer_legacy2_set_click_config_provider:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =56    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_legacy2_set_context"
.align 2
.thumb_func
.global action_bar_layer_legacy2_set_context
.type action_bar_layer_legacy2_set_context STT_FUNC
action_bar_layer_legacy2_set_context:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =60    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_legacy2_set_icon"
.align 2
.thumb_func
.global action_bar_layer_legacy2_set_icon
.type action_bar_layer_legacy2_set_icon STT_FUNC
action_bar_layer_legacy2_set_icon:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =64    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_legacy2_create"
.align 2
.thumb_func
.global animation_legacy2_create
.type animation_legacy2_create STT_FUNC
animation_legacy2_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =68    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_legacy2_destroy"
.align 2
.thumb_func
.global animation_legacy2_destroy
.type animation_legacy2_destroy STT_FUNC
animation_legacy2_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =72    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_legacy2_get_context"
.align 2
.thumb_func
.global animation_legacy2_get_context
.type animation_legacy2_get_context STT_FUNC
animation_legacy2_get_context:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =76    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_legacy2_is_scheduled"
.align 2
.thumb_func
.global animation_legacy2_is_scheduled
.type animation_legacy2_is_scheduled STT_FUNC
animation_legacy2_is_scheduled:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =80    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_legacy2_schedule"
.align 2
.thumb_func
.global animation_legacy2_schedule
.type animation_legacy2_schedule STT_FUNC
animation_legacy2_schedule:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =84    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_legacy2_set_curve"
.align 2
.thumb_func
.global animation_legacy2_set_curve
.type animation_legacy2_set_curve STT_FUNC
animation_legacy2_set_curve:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =88    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_legacy2_set_delay"
.align 2
.thumb_func
.global animation_legacy2_set_delay
.type animation_legacy2_set_delay STT_FUNC
animation_legacy2_set_delay:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =92    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_legacy2_set_duration"
.align 2
.thumb_func
.global animation_legacy2_set_duration
.type animation_legacy2_set_duration STT_FUNC
animation_legacy2_set_duration:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =96    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_legacy2_set_handlers"
.align 2
.thumb_func
.global animation_legacy2_set_handlers
.type animation_legacy2_set_handlers STT_FUNC
animation_legacy2_set_handlers:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =100    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_legacy2_set_implementation"
.align 2
.thumb_func
.global animation_legacy2_set_implementation
.type animation_legacy2_set_implementation STT_FUNC
animation_legacy2_set_implementation:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =104    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_legacy2_unschedule"
.align 2
.thumb_func
.global animation_legacy2_unschedule
.type animation_legacy2_unschedule STT_FUNC
animation_legacy2_unschedule:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =108    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_legacy2_unschedule_all"
.align 2
.thumb_func
.global animation_legacy2_unschedule_all
.type animation_legacy2_unschedule_all STT_FUNC
animation_legacy2_unschedule_all:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =112    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_comm_get_sniff_interval"
.align 2
.thumb_func
.global app_comm_get_sniff_interval
.type app_comm_get_sniff_interval STT_FUNC
app_comm_get_sniff_interval:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =116    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_comm_set_sniff_interval"
.align 2
.thumb_func
.global app_comm_set_sniff_interval
.type app_comm_set_sniff_interval STT_FUNC
app_comm_set_sniff_interval:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =120    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_event_loop"
.align 2
.thumb_func
.global app_event_loop
.type app_event_loop STT_FUNC
app_event_loop:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =124    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_log"
.align 2
.thumb_func
.global app_log
.type app_log STT_FUNC
app_log:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =136    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_message_deregister_callbacks"
.align 2
.thumb_func
.global app_message_deregister_callbacks
.type app_message_deregister_callbacks STT_FUNC
app_message_deregister_callbacks:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =140    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_message_open"
.align 2
.thumb_func
.global app_message_open
.type app_message_open STT_FUNC
app_message_open:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =144    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_sync_deinit"
.align 2
.thumb_func
.global app_sync_deinit
.type app_sync_deinit STT_FUNC
app_sync_deinit:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =172    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_sync_get"
.align 2
.thumb_func
.global app_sync_get
.type app_sync_get STT_FUNC
app_sync_get:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =176    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_sync_init"
.align 2
.thumb_func
.global app_sync_init
.type app_sync_init STT_FUNC
app_sync_init:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =180    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_sync_set"
.align 2
.thumb_func
.global app_sync_set
.type app_sync_set STT_FUNC
app_sync_set:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =184    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_timer_cancel"
.align 2
.thumb_func
.global app_timer_cancel
.type app_timer_cancel STT_FUNC
app_timer_cancel:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =188    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_timer_register"
.align 2
.thumb_func
.global app_timer_register
.type app_timer_register STT_FUNC
app_timer_register:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =192    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_timer_reschedule"
.align 2
.thumb_func
.global app_timer_reschedule
.type app_timer_reschedule STT_FUNC
app_timer_reschedule:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =196    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.atan2_lookup"
.align 2
.thumb_func
.global atan2_lookup
.type atan2_lookup STT_FUNC
atan2_lookup:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =200    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.atoi"
.align 2
.thumb_func
.global atoi
.type atoi STT_FUNC
atoi:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =204    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.atol"
.align 2
.thumb_func
.global atol
.type atol STT_FUNC
atol:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =208    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.battery_state_service_peek"
.align 2
.thumb_func
.global battery_state_service_peek
.type battery_state_service_peek STT_FUNC
battery_state_service_peek:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =212    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.battery_state_service_subscribe"
.align 2
.thumb_func
.global battery_state_service_subscribe
.type battery_state_service_subscribe STT_FUNC
battery_state_service_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =216    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.battery_state_service_unsubscribe"
.align 2
.thumb_func
.global battery_state_service_unsubscribe
.type battery_state_service_unsubscribe STT_FUNC
battery_state_service_unsubscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =220    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.bitmap_layer_create"
.align 2
.thumb_func
.global bitmap_layer_create
.type bitmap_layer_create STT_FUNC
bitmap_layer_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =224    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.bitmap_layer_destroy"
.align 2
.thumb_func
.global bitmap_layer_destroy
.type bitmap_layer_destroy STT_FUNC
bitmap_layer_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =228    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.bitmap_layer_get_layer"
.align 2
.thumb_func
.global bitmap_layer_get_layer
.type bitmap_layer_get_layer STT_FUNC
bitmap_layer_get_layer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =232    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.bitmap_layer_set_alignment"
.align 2
.thumb_func
.global bitmap_layer_set_alignment
.type bitmap_layer_set_alignment STT_FUNC
bitmap_layer_set_alignment:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =236    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.bitmap_layer_set_background_color_2bit"
.align 2
.thumb_func
.global bitmap_layer_set_background_color_2bit
.type bitmap_layer_set_background_color_2bit STT_FUNC
bitmap_layer_set_background_color_2bit:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =240    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.bitmap_layer_set_bitmap"
.align 2
.thumb_func
.global bitmap_layer_set_bitmap
.type bitmap_layer_set_bitmap STT_FUNC
bitmap_layer_set_bitmap:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =244    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.bitmap_layer_set_compositing_mode"
.align 2
.thumb_func
.global bitmap_layer_set_compositing_mode
.type bitmap_layer_set_compositing_mode STT_FUNC
bitmap_layer_set_compositing_mode:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =248    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.bluetooth_connection_service_peek"
.align 2
.thumb_func
.global bluetooth_connection_service_peek
.type bluetooth_connection_service_peek STT_FUNC
bluetooth_connection_service_peek:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =252    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.bluetooth_connection_service_subscribe"
.align 2
.thumb_func
.global bluetooth_connection_service_subscribe
.type bluetooth_connection_service_subscribe STT_FUNC
bluetooth_connection_service_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =256    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.bluetooth_connection_service_unsubscribe"
.align 2
.thumb_func
.global bluetooth_connection_service_unsubscribe
.type bluetooth_connection_service_unsubscribe STT_FUNC
bluetooth_connection_service_unsubscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =260    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.click_number_of_clicks_counted"
.align 2
.thumb_func
.global click_number_of_clicks_counted
.type click_number_of_clicks_counted STT_FUNC
click_number_of_clicks_counted:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =264    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.click_recognizer_get_button_id"
.align 2
.thumb_func
.global click_recognizer_get_button_id
.type click_recognizer_get_button_id STT_FUNC
click_recognizer_get_button_id:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =268    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.clock_copy_time_string"
.align 2
.thumb_func
.global clock_copy_time_string
.type clock_copy_time_string STT_FUNC
clock_copy_time_string:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =272    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.clock_is_24h_style"
.align 2
.thumb_func
.global clock_is_24h_style
.type clock_is_24h_style STT_FUNC
clock_is_24h_style:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =276    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.cos_lookup"
.align 2
.thumb_func
.global cos_lookup
.type cos_lookup STT_FUNC
cos_lookup:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =280    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.data_logging_create"
.align 2
.thumb_func
.global data_logging_create
.type data_logging_create STT_FUNC
data_logging_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =284    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.data_logging_finish"
.align 2
.thumb_func
.global data_logging_finish
.type data_logging_finish STT_FUNC
data_logging_finish:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =288    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.data_logging_log"
.align 2
.thumb_func
.global data_logging_log
.type data_logging_log STT_FUNC
data_logging_log:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =292    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_calc_buffer_size"
.align 2
.thumb_func
.global dict_calc_buffer_size
.type dict_calc_buffer_size STT_FUNC
dict_calc_buffer_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =296    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_calc_buffer_size_from_tuplets"
.align 2
.thumb_func
.global dict_calc_buffer_size_from_tuplets
.type dict_calc_buffer_size_from_tuplets STT_FUNC
dict_calc_buffer_size_from_tuplets:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =300    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_find"
.align 2
.thumb_func
.global dict_find
.type dict_find STT_FUNC
dict_find:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =304    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_merge"
.align 2
.thumb_func
.global dict_merge
.type dict_merge STT_FUNC
dict_merge:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =308    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_read_begin_from_buffer"
.align 2
.thumb_func
.global dict_read_begin_from_buffer
.type dict_read_begin_from_buffer STT_FUNC
dict_read_begin_from_buffer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =312    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_read_first"
.align 2
.thumb_func
.global dict_read_first
.type dict_read_first STT_FUNC
dict_read_first:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =316    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_read_next"
.align 2
.thumb_func
.global dict_read_next
.type dict_read_next STT_FUNC
dict_read_next:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =320    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_serialize_tuplets"
.align 2
.thumb_func
.global dict_serialize_tuplets
.type dict_serialize_tuplets STT_FUNC
dict_serialize_tuplets:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =324    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_serialize_tuplets_to_buffer__deprecated"
.align 2
.thumb_func
.global dict_serialize_tuplets_to_buffer__deprecated
.type dict_serialize_tuplets_to_buffer__deprecated STT_FUNC
dict_serialize_tuplets_to_buffer__deprecated:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =328    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_serialize_tuplets_to_buffer_with_iter"
.align 2
.thumb_func
.global dict_serialize_tuplets_to_buffer_with_iter
.type dict_serialize_tuplets_to_buffer_with_iter STT_FUNC
dict_serialize_tuplets_to_buffer_with_iter:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =332    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_write_begin"
.align 2
.thumb_func
.global dict_write_begin
.type dict_write_begin STT_FUNC
dict_write_begin:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =336    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_write_cstring"
.align 2
.thumb_func
.global dict_write_cstring
.type dict_write_cstring STT_FUNC
dict_write_cstring:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =340    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_write_data"
.align 2
.thumb_func
.global dict_write_data
.type dict_write_data STT_FUNC
dict_write_data:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =344    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_write_end"
.align 2
.thumb_func
.global dict_write_end
.type dict_write_end STT_FUNC
dict_write_end:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =348    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_write_int"
.align 2
.thumb_func
.global dict_write_int
.type dict_write_int STT_FUNC
dict_write_int:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =352    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_write_int16"
.align 2
.thumb_func
.global dict_write_int16
.type dict_write_int16 STT_FUNC
dict_write_int16:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =356    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_write_int32"
.align 2
.thumb_func
.global dict_write_int32
.type dict_write_int32 STT_FUNC
dict_write_int32:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =360    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_write_int8"
.align 2
.thumb_func
.global dict_write_int8
.type dict_write_int8 STT_FUNC
dict_write_int8:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =364    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_write_tuplet"
.align 2
.thumb_func
.global dict_write_tuplet
.type dict_write_tuplet STT_FUNC
dict_write_tuplet:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =368    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_write_uint16"
.align 2
.thumb_func
.global dict_write_uint16
.type dict_write_uint16 STT_FUNC
dict_write_uint16:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =372    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_write_uint32"
.align 2
.thumb_func
.global dict_write_uint32
.type dict_write_uint32 STT_FUNC
dict_write_uint32:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =376    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_write_uint8"
.align 2
.thumb_func
.global dict_write_uint8
.type dict_write_uint8 STT_FUNC
dict_write_uint8:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =380    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.fonts_get_system_font"
.align 2
.thumb_func
.global fonts_get_system_font
.type fonts_get_system_font STT_FUNC
fonts_get_system_font:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =384    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.fonts_load_custom_font"
.align 2
.thumb_func
.global fonts_load_custom_font
.type fonts_load_custom_font STT_FUNC
fonts_load_custom_font:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =388    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.fonts_unload_custom_font"
.align 2
.thumb_func
.global fonts_unload_custom_font
.type fonts_unload_custom_font STT_FUNC
fonts_unload_custom_font:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =392    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.free"
.align 2
.thumb_func
.global free
.type free STT_FUNC
free:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =396    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_create_as_sub_bitmap"
.align 2
.thumb_func
.global gbitmap_create_as_sub_bitmap
.type gbitmap_create_as_sub_bitmap STT_FUNC
gbitmap_create_as_sub_bitmap:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =400    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_create_with_data"
.align 2
.thumb_func
.global gbitmap_create_with_data
.type gbitmap_create_with_data STT_FUNC
gbitmap_create_with_data:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =404    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_create_with_resource"
.align 2
.thumb_func
.global gbitmap_create_with_resource
.type gbitmap_create_with_resource STT_FUNC
gbitmap_create_with_resource:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =408    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_destroy"
.align 2
.thumb_func
.global gbitmap_destroy
.type gbitmap_destroy STT_FUNC
gbitmap_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =412    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gmtime"
.align 2
.thumb_func
.global gmtime
.type gmtime STT_FUNC
gmtime:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =416    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gpath_create"
.align 2
.thumb_func
.global gpath_create
.type gpath_create STT_FUNC
gpath_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =420    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gpath_destroy"
.align 2
.thumb_func
.global gpath_destroy
.type gpath_destroy STT_FUNC
gpath_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =424    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gpath_draw_filled_legacy"
.align 2
.thumb_func
.global gpath_draw_filled_legacy
.type gpath_draw_filled_legacy STT_FUNC
gpath_draw_filled_legacy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =428    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gpath_draw_outline"
.align 2
.thumb_func
.global gpath_draw_outline
.type gpath_draw_outline STT_FUNC
gpath_draw_outline:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =432    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gpath_move_to"
.align 2
.thumb_func
.global gpath_move_to
.type gpath_move_to STT_FUNC
gpath_move_to:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =436    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gpath_rotate_to"
.align 2
.thumb_func
.global gpath_rotate_to
.type gpath_rotate_to STT_FUNC
gpath_rotate_to:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =440    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gpoint_equal"
.align 2
.thumb_func
.global gpoint_equal
.type gpoint_equal STT_FUNC
gpoint_equal:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =444    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_context_set_compositing_mode"
.align 2
.thumb_func
.global graphics_context_set_compositing_mode
.type graphics_context_set_compositing_mode STT_FUNC
graphics_context_set_compositing_mode:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =448    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_context_set_fill_color_2bit"
.align 2
.thumb_func
.global graphics_context_set_fill_color_2bit
.type graphics_context_set_fill_color_2bit STT_FUNC
graphics_context_set_fill_color_2bit:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =452    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_context_set_stroke_color_2bit"
.align 2
.thumb_func
.global graphics_context_set_stroke_color_2bit
.type graphics_context_set_stroke_color_2bit STT_FUNC
graphics_context_set_stroke_color_2bit:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =456    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_context_set_text_color_2bit"
.align 2
.thumb_func
.global graphics_context_set_text_color_2bit
.type graphics_context_set_text_color_2bit STT_FUNC
graphics_context_set_text_color_2bit:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =460    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_draw_bitmap_in_rect"
.align 2
.thumb_func
.global graphics_draw_bitmap_in_rect
.type graphics_draw_bitmap_in_rect STT_FUNC
graphics_draw_bitmap_in_rect:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =464    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_draw_circle"
.align 2
.thumb_func
.global graphics_draw_circle
.type graphics_draw_circle STT_FUNC
graphics_draw_circle:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =468    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_draw_line"
.align 2
.thumb_func
.global graphics_draw_line
.type graphics_draw_line STT_FUNC
graphics_draw_line:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =472    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_draw_pixel"
.align 2
.thumb_func
.global graphics_draw_pixel
.type graphics_draw_pixel STT_FUNC
graphics_draw_pixel:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =476    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_draw_rect"
.align 2
.thumb_func
.global graphics_draw_rect
.type graphics_draw_rect STT_FUNC
graphics_draw_rect:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =480    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_draw_round_rect"
.align 2
.thumb_func
.global graphics_draw_round_rect
.type graphics_draw_round_rect STT_FUNC
graphics_draw_round_rect:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =484    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_fill_circle"
.align 2
.thumb_func
.global graphics_fill_circle
.type graphics_fill_circle STT_FUNC
graphics_fill_circle:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =488    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_fill_rect"
.align 2
.thumb_func
.global graphics_fill_rect
.type graphics_fill_rect STT_FUNC
graphics_fill_rect:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =492    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_text_layout_get_max_used_size"
.align 2
.thumb_func
.global graphics_text_layout_get_max_used_size
.type graphics_text_layout_get_max_used_size STT_FUNC
graphics_text_layout_get_max_used_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =500    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.grect_align"
.align 2
.thumb_func
.global grect_align
.type grect_align STT_FUNC
grect_align:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =504    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.grect_center_point"
.align 2
.thumb_func
.global grect_center_point
.type grect_center_point STT_FUNC
grect_center_point:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =508    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.grect_clip"
.align 2
.thumb_func
.global grect_clip
.type grect_clip STT_FUNC
grect_clip:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =512    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.grect_contains_point"
.align 2
.thumb_func
.global grect_contains_point
.type grect_contains_point STT_FUNC
grect_contains_point:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =516    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.grect_crop"
.align 2
.thumb_func
.global grect_crop
.type grect_crop STT_FUNC
grect_crop:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =520    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.grect_equal"
.align 2
.thumb_func
.global grect_equal
.type grect_equal STT_FUNC
grect_equal:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =524    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.grect_is_empty"
.align 2
.thumb_func
.global grect_is_empty
.type grect_is_empty STT_FUNC
grect_is_empty:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =528    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.grect_standardize"
.align 2
.thumb_func
.global grect_standardize
.type grect_standardize STT_FUNC
grect_standardize:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =532    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gsize_equal"
.align 2
.thumb_func
.global gsize_equal
.type gsize_equal STT_FUNC
gsize_equal:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =536    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.inverter_layer_create"
.align 2
.thumb_func
.global inverter_layer_create
.type inverter_layer_create STT_FUNC
inverter_layer_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =540    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.inverter_layer_destroy"
.align 2
.thumb_func
.global inverter_layer_destroy
.type inverter_layer_destroy STT_FUNC
inverter_layer_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =544    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.inverter_layer_get_layer"
.align 2
.thumb_func
.global inverter_layer_get_layer
.type inverter_layer_get_layer STT_FUNC
inverter_layer_get_layer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =548    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_add_child"
.align 2
.thumb_func
.global layer_add_child
.type layer_add_child STT_FUNC
layer_add_child:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =552    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_create"
.align 2
.thumb_func
.global layer_create
.type layer_create STT_FUNC
layer_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =556    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_create_with_data"
.align 2
.thumb_func
.global layer_create_with_data
.type layer_create_with_data STT_FUNC
layer_create_with_data:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =560    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_destroy"
.align 2
.thumb_func
.global layer_destroy
.type layer_destroy STT_FUNC
layer_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =564    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_get_bounds"
.align 2
.thumb_func
.global layer_get_bounds
.type layer_get_bounds STT_FUNC
layer_get_bounds:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =568    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_get_clips"
.align 2
.thumb_func
.global layer_get_clips
.type layer_get_clips STT_FUNC
layer_get_clips:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =572    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_get_data"
.align 2
.thumb_func
.global layer_get_data
.type layer_get_data STT_FUNC
layer_get_data:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =576    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_get_frame"
.align 2
.thumb_func
.global layer_get_frame
.type layer_get_frame STT_FUNC
layer_get_frame:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =580    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_get_hidden"
.align 2
.thumb_func
.global layer_get_hidden
.type layer_get_hidden STT_FUNC
layer_get_hidden:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =584    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_get_window"
.align 2
.thumb_func
.global layer_get_window
.type layer_get_window STT_FUNC
layer_get_window:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =588    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_insert_above_sibling"
.align 2
.thumb_func
.global layer_insert_above_sibling
.type layer_insert_above_sibling STT_FUNC
layer_insert_above_sibling:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =592    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_insert_below_sibling"
.align 2
.thumb_func
.global layer_insert_below_sibling
.type layer_insert_below_sibling STT_FUNC
layer_insert_below_sibling:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =596    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_mark_dirty"
.align 2
.thumb_func
.global layer_mark_dirty
.type layer_mark_dirty STT_FUNC
layer_mark_dirty:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =600    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_remove_child_layers"
.align 2
.thumb_func
.global layer_remove_child_layers
.type layer_remove_child_layers STT_FUNC
layer_remove_child_layers:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =604    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_remove_from_parent"
.align 2
.thumb_func
.global layer_remove_from_parent
.type layer_remove_from_parent STT_FUNC
layer_remove_from_parent:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =608    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_set_bounds"
.align 2
.thumb_func
.global layer_set_bounds
.type layer_set_bounds STT_FUNC
layer_set_bounds:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =612    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_set_clips"
.align 2
.thumb_func
.global layer_set_clips
.type layer_set_clips STT_FUNC
layer_set_clips:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =616    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_set_frame"
.align 2
.thumb_func
.global layer_set_frame
.type layer_set_frame STT_FUNC
layer_set_frame:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =620    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_set_hidden"
.align 2
.thumb_func
.global layer_set_hidden
.type layer_set_hidden STT_FUNC
layer_set_hidden:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =624    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_set_update_proc"
.align 2
.thumb_func
.global layer_set_update_proc
.type layer_set_update_proc STT_FUNC
layer_set_update_proc:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =628    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.light_enable"
.align 2
.thumb_func
.global light_enable
.type light_enable STT_FUNC
light_enable:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =632    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.light_enable_interaction"
.align 2
.thumb_func
.global light_enable_interaction
.type light_enable_interaction STT_FUNC
light_enable_interaction:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =636    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.localtime__deprecated"
.align 2
.thumb_func
.global localtime__deprecated
.type localtime__deprecated STT_FUNC
localtime__deprecated:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =640    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.malloc"
.align 2
.thumb_func
.global malloc
.type malloc STT_FUNC
malloc:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =644    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.memcpy"
.align 2
.thumb_func
.global memcpy
.type memcpy STT_FUNC
memcpy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =648    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.memmove"
.align 2
.thumb_func
.global memmove
.type memmove STT_FUNC
memmove:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =652    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.memset"
.align 2
.thumb_func
.global memset
.type memset STT_FUNC
memset:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =656    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_cell_basic_draw"
.align 2
.thumb_func
.global menu_cell_basic_draw
.type menu_cell_basic_draw STT_FUNC
menu_cell_basic_draw:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =660    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_cell_basic_header_draw"
.align 2
.thumb_func
.global menu_cell_basic_header_draw
.type menu_cell_basic_header_draw STT_FUNC
menu_cell_basic_header_draw:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =664    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_cell_title_draw"
.align 2
.thumb_func
.global menu_cell_title_draw
.type menu_cell_title_draw STT_FUNC
menu_cell_title_draw:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =668    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_index_compare"
.align 2
.thumb_func
.global menu_index_compare
.type menu_index_compare STT_FUNC
menu_index_compare:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =672    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_legacy2_create"
.align 2
.thumb_func
.global menu_layer_legacy2_create
.type menu_layer_legacy2_create STT_FUNC
menu_layer_legacy2_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =676    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_destroy"
.align 2
.thumb_func
.global menu_layer_destroy
.type menu_layer_destroy STT_FUNC
menu_layer_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =680    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_get_layer"
.align 2
.thumb_func
.global menu_layer_get_layer
.type menu_layer_get_layer STT_FUNC
menu_layer_get_layer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =684    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_get_scroll_layer"
.align 2
.thumb_func
.global menu_layer_get_scroll_layer
.type menu_layer_get_scroll_layer STT_FUNC
menu_layer_get_scroll_layer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =688    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_get_selected_index"
.align 2
.thumb_func
.global menu_layer_get_selected_index
.type menu_layer_get_selected_index STT_FUNC
menu_layer_get_selected_index:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =692    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_reload_data"
.align 2
.thumb_func
.global menu_layer_reload_data
.type menu_layer_reload_data STT_FUNC
menu_layer_reload_data:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =696    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_legacy2_set_callbacks__deprecated"
.align 2
.thumb_func
.global menu_layer_legacy2_set_callbacks__deprecated
.type menu_layer_legacy2_set_callbacks__deprecated STT_FUNC
menu_layer_legacy2_set_callbacks__deprecated:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =700    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_set_click_config_onto_window"
.align 2
.thumb_func
.global menu_layer_set_click_config_onto_window
.type menu_layer_set_click_config_onto_window STT_FUNC
menu_layer_set_click_config_onto_window:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =704    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_set_selected_index"
.align 2
.thumb_func
.global menu_layer_set_selected_index
.type menu_layer_set_selected_index STT_FUNC
menu_layer_set_selected_index:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =708    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_set_selected_next"
.align 2
.thumb_func
.global menu_layer_set_selected_next
.type menu_layer_set_selected_next STT_FUNC
menu_layer_set_selected_next:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =712    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.number_window_create"
.align 2
.thumb_func
.global number_window_create
.type number_window_create STT_FUNC
number_window_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =716    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.number_window_destroy"
.align 2
.thumb_func
.global number_window_destroy
.type number_window_destroy STT_FUNC
number_window_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =720    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.number_window_get_value"
.align 2
.thumb_func
.global number_window_get_value
.type number_window_get_value STT_FUNC
number_window_get_value:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =724    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.number_window_set_label"
.align 2
.thumb_func
.global number_window_set_label
.type number_window_set_label STT_FUNC
number_window_set_label:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =728    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.number_window_set_max"
.align 2
.thumb_func
.global number_window_set_max
.type number_window_set_max STT_FUNC
number_window_set_max:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =732    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.number_window_set_min"
.align 2
.thumb_func
.global number_window_set_min
.type number_window_set_min STT_FUNC
number_window_set_min:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =736    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.number_window_set_step_size"
.align 2
.thumb_func
.global number_window_set_step_size
.type number_window_set_step_size STT_FUNC
number_window_set_step_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =740    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.number_window_set_value"
.align 2
.thumb_func
.global number_window_set_value
.type number_window_set_value STT_FUNC
number_window_set_value:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =744    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.persist_delete"
.align 2
.thumb_func
.global persist_delete
.type persist_delete STT_FUNC
persist_delete:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =748    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.persist_exists"
.align 2
.thumb_func
.global persist_exists
.type persist_exists STT_FUNC
persist_exists:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =752    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.persist_get_size"
.align 2
.thumb_func
.global persist_get_size
.type persist_get_size STT_FUNC
persist_get_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =756    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.persist_read_bool"
.align 2
.thumb_func
.global persist_read_bool
.type persist_read_bool STT_FUNC
persist_read_bool:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =760    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.persist_read_data__deprecated"
.align 2
.thumb_func
.global persist_read_data__deprecated
.type persist_read_data__deprecated STT_FUNC
persist_read_data__deprecated:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =764    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.persist_read_int"
.align 2
.thumb_func
.global persist_read_int
.type persist_read_int STT_FUNC
persist_read_int:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =768    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.persist_read_string__deprecated"
.align 2
.thumb_func
.global persist_read_string__deprecated
.type persist_read_string__deprecated STT_FUNC
persist_read_string__deprecated:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =772    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.persist_write_bool"
.align 2
.thumb_func
.global persist_write_bool
.type persist_write_bool STT_FUNC
persist_write_bool:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =776    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.persist_write_data__deprecated"
.align 2
.thumb_func
.global persist_write_data__deprecated
.type persist_write_data__deprecated STT_FUNC
persist_write_data__deprecated:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =780    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.persist_write_int"
.align 2
.thumb_func
.global persist_write_int
.type persist_write_int STT_FUNC
persist_write_int:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =784    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.persist_write_string"
.align 2
.thumb_func
.global persist_write_string
.type persist_write_string STT_FUNC
persist_write_string:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =788    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_legacy2_create"
.align 2
.thumb_func
.global property_animation_legacy2_create
.type property_animation_legacy2_create STT_FUNC
property_animation_legacy2_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =792    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_legacy2_create_layer_frame"
.align 2
.thumb_func
.global property_animation_legacy2_create_layer_frame
.type property_animation_legacy2_create_layer_frame STT_FUNC
property_animation_legacy2_create_layer_frame:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =796    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_legacy2_destroy"
.align 2
.thumb_func
.global property_animation_legacy2_destroy
.type property_animation_legacy2_destroy STT_FUNC
property_animation_legacy2_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =800    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_legacy2_update_gpoint"
.align 2
.thumb_func
.global property_animation_legacy2_update_gpoint
.type property_animation_legacy2_update_gpoint STT_FUNC
property_animation_legacy2_update_gpoint:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =804    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_legacy2_update_grect"
.align 2
.thumb_func
.global property_animation_legacy2_update_grect
.type property_animation_legacy2_update_grect STT_FUNC
property_animation_legacy2_update_grect:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =808    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_legacy2_update_int16"
.align 2
.thumb_func
.global property_animation_legacy2_update_int16
.type property_animation_legacy2_update_int16 STT_FUNC
property_animation_legacy2_update_int16:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =812    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.psleep"
.align 2
.thumb_func
.global psleep
.type psleep STT_FUNC
psleep:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =816    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.rand"
.align 2
.thumb_func
.global rand
.type rand STT_FUNC
rand:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =820    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.resource_get_handle"
.align 2
.thumb_func
.global resource_get_handle
.type resource_get_handle STT_FUNC
resource_get_handle:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =824    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.resource_load"
.align 2
.thumb_func
.global resource_load
.type resource_load STT_FUNC
resource_load:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =828    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.resource_load_byte_range"
.align 2
.thumb_func
.global resource_load_byte_range
.type resource_load_byte_range STT_FUNC
resource_load_byte_range:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =832    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.resource_size"
.align 2
.thumb_func
.global resource_size
.type resource_size STT_FUNC
resource_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =836    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.rot_bitmap_layer_create"
.align 2
.thumb_func
.global rot_bitmap_layer_create
.type rot_bitmap_layer_create STT_FUNC
rot_bitmap_layer_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =840    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.rot_bitmap_layer_destroy"
.align 2
.thumb_func
.global rot_bitmap_layer_destroy
.type rot_bitmap_layer_destroy STT_FUNC
rot_bitmap_layer_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =844    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.rot_bitmap_layer_increment_angle"
.align 2
.thumb_func
.global rot_bitmap_layer_increment_angle
.type rot_bitmap_layer_increment_angle STT_FUNC
rot_bitmap_layer_increment_angle:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =848    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.rot_bitmap_layer_set_angle"
.align 2
.thumb_func
.global rot_bitmap_layer_set_angle
.type rot_bitmap_layer_set_angle STT_FUNC
rot_bitmap_layer_set_angle:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =852    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.rot_bitmap_layer_set_corner_clip_color_2bit"
.align 2
.thumb_func
.global rot_bitmap_layer_set_corner_clip_color_2bit
.type rot_bitmap_layer_set_corner_clip_color_2bit STT_FUNC
rot_bitmap_layer_set_corner_clip_color_2bit:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =856    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.rot_bitmap_set_compositing_mode"
.align 2
.thumb_func
.global rot_bitmap_set_compositing_mode
.type rot_bitmap_set_compositing_mode STT_FUNC
rot_bitmap_set_compositing_mode:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =860    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.rot_bitmap_set_src_ic"
.align 2
.thumb_func
.global rot_bitmap_set_src_ic
.type rot_bitmap_set_src_ic STT_FUNC
rot_bitmap_set_src_ic:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =864    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_add_child"
.align 2
.thumb_func
.global scroll_layer_add_child
.type scroll_layer_add_child STT_FUNC
scroll_layer_add_child:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =868    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_create"
.align 2
.thumb_func
.global scroll_layer_create
.type scroll_layer_create STT_FUNC
scroll_layer_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =872    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_destroy"
.align 2
.thumb_func
.global scroll_layer_destroy
.type scroll_layer_destroy STT_FUNC
scroll_layer_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =876    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_get_content_offset"
.align 2
.thumb_func
.global scroll_layer_get_content_offset
.type scroll_layer_get_content_offset STT_FUNC
scroll_layer_get_content_offset:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =880    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_get_content_size"
.align 2
.thumb_func
.global scroll_layer_get_content_size
.type scroll_layer_get_content_size STT_FUNC
scroll_layer_get_content_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =884    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_get_layer"
.align 2
.thumb_func
.global scroll_layer_get_layer
.type scroll_layer_get_layer STT_FUNC
scroll_layer_get_layer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =888    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_get_shadow_hidden"
.align 2
.thumb_func
.global scroll_layer_get_shadow_hidden
.type scroll_layer_get_shadow_hidden STT_FUNC
scroll_layer_get_shadow_hidden:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =892    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_scroll_down_click_handler"
.align 2
.thumb_func
.global scroll_layer_scroll_down_click_handler
.type scroll_layer_scroll_down_click_handler STT_FUNC
scroll_layer_scroll_down_click_handler:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =896    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_scroll_up_click_handler"
.align 2
.thumb_func
.global scroll_layer_scroll_up_click_handler
.type scroll_layer_scroll_up_click_handler STT_FUNC
scroll_layer_scroll_up_click_handler:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =900    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_set_callbacks"
.align 2
.thumb_func
.global scroll_layer_set_callbacks
.type scroll_layer_set_callbacks STT_FUNC
scroll_layer_set_callbacks:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =904    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_set_click_config_onto_window"
.align 2
.thumb_func
.global scroll_layer_set_click_config_onto_window
.type scroll_layer_set_click_config_onto_window STT_FUNC
scroll_layer_set_click_config_onto_window:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =908    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_set_content_offset"
.align 2
.thumb_func
.global scroll_layer_set_content_offset
.type scroll_layer_set_content_offset STT_FUNC
scroll_layer_set_content_offset:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =912    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_set_content_size"
.align 2
.thumb_func
.global scroll_layer_set_content_size
.type scroll_layer_set_content_size STT_FUNC
scroll_layer_set_content_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =916    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_set_context"
.align 2
.thumb_func
.global scroll_layer_set_context
.type scroll_layer_set_context STT_FUNC
scroll_layer_set_context:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =920    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_set_frame"
.align 2
.thumb_func
.global scroll_layer_set_frame
.type scroll_layer_set_frame STT_FUNC
scroll_layer_set_frame:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =924    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_set_shadow_hidden"
.align 2
.thumb_func
.global scroll_layer_set_shadow_hidden
.type scroll_layer_set_shadow_hidden STT_FUNC
scroll_layer_set_shadow_hidden:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =928    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.simple_menu_layer_create"
.align 2
.thumb_func
.global simple_menu_layer_create
.type simple_menu_layer_create STT_FUNC
simple_menu_layer_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =932    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.simple_menu_layer_destroy"
.align 2
.thumb_func
.global simple_menu_layer_destroy
.type simple_menu_layer_destroy STT_FUNC
simple_menu_layer_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =936    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.simple_menu_layer_get_layer"
.align 2
.thumb_func
.global simple_menu_layer_get_layer
.type simple_menu_layer_get_layer STT_FUNC
simple_menu_layer_get_layer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =940    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.simple_menu_layer_get_selected_index"
.align 2
.thumb_func
.global simple_menu_layer_get_selected_index
.type simple_menu_layer_get_selected_index STT_FUNC
simple_menu_layer_get_selected_index:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =944    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.simple_menu_layer_set_selected_index"
.align 2
.thumb_func
.global simple_menu_layer_set_selected_index
.type simple_menu_layer_set_selected_index STT_FUNC
simple_menu_layer_set_selected_index:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =948    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.sin_lookup"
.align 2
.thumb_func
.global sin_lookup
.type sin_lookup STT_FUNC
sin_lookup:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =952    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.snprintf"
.align 2
.thumb_func
.global snprintf
.type snprintf STT_FUNC
snprintf:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =956    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.srand"
.align 2
.thumb_func
.global srand
.type srand STT_FUNC
srand:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =960    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.strcat"
.align 2
.thumb_func
.global strcat
.type strcat STT_FUNC
strcat:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =964    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.strcmp"
.align 2
.thumb_func
.global strcmp
.type strcmp STT_FUNC
strcmp:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =968    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.strcpy"
.align 2
.thumb_func
.global strcpy
.type strcpy STT_FUNC
strcpy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =972    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.strftime"
.align 2
.thumb_func
.global strftime
.type strftime STT_FUNC
strftime:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =976    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.strlen"
.align 2
.thumb_func
.global strlen
.type strlen STT_FUNC
strlen:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =980    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.strncat"
.align 2
.thumb_func
.global strncat
.type strncat STT_FUNC
strncat:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =984    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.strncmp"
.align 2
.thumb_func
.global strncmp
.type strncmp STT_FUNC
strncmp:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =988    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.strncpy"
.align 2
.thumb_func
.global strncpy
.type strncpy STT_FUNC
strncpy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =992    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_legacy2_create"
.align 2
.thumb_func
.global text_layer_legacy2_create
.type text_layer_legacy2_create STT_FUNC
text_layer_legacy2_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =996    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_legacy2_destroy"
.align 2
.thumb_func
.global text_layer_legacy2_destroy
.type text_layer_legacy2_destroy STT_FUNC
text_layer_legacy2_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1000    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_legacy2_get_content_size"
.align 2
.thumb_func
.global text_layer_legacy2_get_content_size
.type text_layer_legacy2_get_content_size STT_FUNC
text_layer_legacy2_get_content_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1004    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_legacy2_get_layer"
.align 2
.thumb_func
.global text_layer_legacy2_get_layer
.type text_layer_legacy2_get_layer STT_FUNC
text_layer_legacy2_get_layer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1008    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_legacy2_get_text"
.align 2
.thumb_func
.global text_layer_legacy2_get_text
.type text_layer_legacy2_get_text STT_FUNC
text_layer_legacy2_get_text:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1012    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_legacy2_set_background_color_2bit"
.align 2
.thumb_func
.global text_layer_legacy2_set_background_color_2bit
.type text_layer_legacy2_set_background_color_2bit STT_FUNC
text_layer_legacy2_set_background_color_2bit:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1016    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_legacy2_set_font"
.align 2
.thumb_func
.global text_layer_legacy2_set_font
.type text_layer_legacy2_set_font STT_FUNC
text_layer_legacy2_set_font:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1020    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_legacy2_set_overflow_mode"
.align 2
.thumb_func
.global text_layer_legacy2_set_overflow_mode
.type text_layer_legacy2_set_overflow_mode STT_FUNC
text_layer_legacy2_set_overflow_mode:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1024    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_legacy2_set_size"
.align 2
.thumb_func
.global text_layer_legacy2_set_size
.type text_layer_legacy2_set_size STT_FUNC
text_layer_legacy2_set_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1028    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_legacy2_set_text"
.align 2
.thumb_func
.global text_layer_legacy2_set_text
.type text_layer_legacy2_set_text STT_FUNC
text_layer_legacy2_set_text:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1032    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_legacy2_set_text_alignment"
.align 2
.thumb_func
.global text_layer_legacy2_set_text_alignment
.type text_layer_legacy2_set_text_alignment STT_FUNC
text_layer_legacy2_set_text_alignment:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1036    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_legacy2_set_text_color_2bit"
.align 2
.thumb_func
.global text_layer_legacy2_set_text_color_2bit
.type text_layer_legacy2_set_text_color_2bit STT_FUNC
text_layer_legacy2_set_text_color_2bit:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1040    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.tick_timer_service_subscribe"
.align 2
.thumb_func
.global tick_timer_service_subscribe
.type tick_timer_service_subscribe STT_FUNC
tick_timer_service_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1048    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.tick_timer_service_unsubscribe"
.align 2
.thumb_func
.global tick_timer_service_unsubscribe
.type tick_timer_service_unsubscribe STT_FUNC
tick_timer_service_unsubscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1052    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.time__deprecated"
.align 2
.thumb_func
.global time__deprecated
.type time__deprecated STT_FUNC
time__deprecated:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1056    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.time_ms_deprecated"
.align 2
.thumb_func
.global time_ms_deprecated
.type time_ms_deprecated STT_FUNC
time_ms_deprecated:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1060    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.vibes_cancel"
.align 2
.thumb_func
.global vibes_cancel
.type vibes_cancel STT_FUNC
vibes_cancel:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1064    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.vibes_double_pulse"
.align 2
.thumb_func
.global vibes_double_pulse
.type vibes_double_pulse STT_FUNC
vibes_double_pulse:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1068    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.vibes_enqueue_custom_pattern"
.align 2
.thumb_func
.global vibes_enqueue_custom_pattern
.type vibes_enqueue_custom_pattern STT_FUNC
vibes_enqueue_custom_pattern:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1072    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.vibes_long_pulse"
.align 2
.thumb_func
.global vibes_long_pulse
.type vibes_long_pulse STT_FUNC
vibes_long_pulse:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1076    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.vibes_short_pulse"
.align 2
.thumb_func
.global vibes_short_pulse
.type vibes_short_pulse STT_FUNC
vibes_short_pulse:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1080    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_create"
.align 2
.thumb_func
.global window_create
.type window_create STT_FUNC
window_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1084    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_destroy"
.align 2
.thumb_func
.global window_destroy
.type window_destroy STT_FUNC
window_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1088    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_get_click_config_provider"
.align 2
.thumb_func
.global window_get_click_config_provider
.type window_get_click_config_provider STT_FUNC
window_get_click_config_provider:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1092    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_get_fullscreen"
.align 2
.thumb_func
.global window_get_fullscreen
.type window_get_fullscreen STT_FUNC
window_get_fullscreen:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1096    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_get_root_layer"
.align 2
.thumb_func
.global window_get_root_layer
.type window_get_root_layer STT_FUNC
window_get_root_layer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1100    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_is_loaded"
.align 2
.thumb_func
.global window_is_loaded
.type window_is_loaded STT_FUNC
window_is_loaded:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1104    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_set_background_color_2bit"
.align 2
.thumb_func
.global window_set_background_color_2bit
.type window_set_background_color_2bit STT_FUNC
window_set_background_color_2bit:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1108    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_set_click_config_provider"
.align 2
.thumb_func
.global window_set_click_config_provider
.type window_set_click_config_provider STT_FUNC
window_set_click_config_provider:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1112    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_set_click_config_provider_with_context"
.align 2
.thumb_func
.global window_set_click_config_provider_with_context
.type window_set_click_config_provider_with_context STT_FUNC
window_set_click_config_provider_with_context:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1116    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_set_fullscreen"
.align 2
.thumb_func
.global window_set_fullscreen
.type window_set_fullscreen STT_FUNC
window_set_fullscreen:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1120    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_set_status_bar_icon"
.align 2
.thumb_func
.global window_set_status_bar_icon
.type window_set_status_bar_icon STT_FUNC
window_set_status_bar_icon:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1124    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_set_window_handlers"
.align 2
.thumb_func
.global window_set_window_handlers
.type window_set_window_handlers STT_FUNC
window_set_window_handlers:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1128    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_stack_contains_window"
.align 2
.thumb_func
.global window_stack_contains_window
.type window_stack_contains_window STT_FUNC
window_stack_contains_window:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1132    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_stack_get_top_window"
.align 2
.thumb_func
.global window_stack_get_top_window
.type window_stack_get_top_window STT_FUNC
window_stack_get_top_window:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1136    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_stack_pop"
.align 2
.thumb_func
.global window_stack_pop
.type window_stack_pop STT_FUNC
window_stack_pop:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1140    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_stack_pop_all"
.align 2
.thumb_func
.global window_stack_pop_all
.type window_stack_pop_all STT_FUNC
window_stack_pop_all:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1144    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_stack_push"
.align 2
.thumb_func
.global window_stack_push
.type window_stack_push STT_FUNC
window_stack_push:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1148    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_stack_remove"
.align 2
.thumb_func
.global window_stack_remove
.type window_stack_remove STT_FUNC
window_stack_remove:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1152    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_focus_service_subscribe"
.align 2
.thumb_func
.global app_focus_service_subscribe
.type app_focus_service_subscribe STT_FUNC
app_focus_service_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1156    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_focus_service_unsubscribe"
.align 2
.thumb_func
.global app_focus_service_unsubscribe
.type app_focus_service_unsubscribe STT_FUNC
app_focus_service_unsubscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1160    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_get_user_data"
.align 2
.thumb_func
.global window_get_user_data
.type window_get_user_data STT_FUNC
window_get_user_data:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1164    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_set_user_data"
.align 2
.thumb_func
.global window_set_user_data
.type window_set_user_data STT_FUNC
window_set_user_data:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1168    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_message_get_context"
.align 2
.thumb_func
.global app_message_get_context
.type app_message_get_context STT_FUNC
app_message_get_context:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1172    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_message_inbox_size_maximum"
.align 2
.thumb_func
.global app_message_inbox_size_maximum
.type app_message_inbox_size_maximum STT_FUNC
app_message_inbox_size_maximum:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1176    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_message_outbox_begin"
.align 2
.thumb_func
.global app_message_outbox_begin
.type app_message_outbox_begin STT_FUNC
app_message_outbox_begin:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1180    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_message_outbox_send"
.align 2
.thumb_func
.global app_message_outbox_send
.type app_message_outbox_send STT_FUNC
app_message_outbox_send:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1184    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_message_outbox_size_maximum"
.align 2
.thumb_func
.global app_message_outbox_size_maximum
.type app_message_outbox_size_maximum STT_FUNC
app_message_outbox_size_maximum:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1188    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_message_register_inbox_dropped"
.align 2
.thumb_func
.global app_message_register_inbox_dropped
.type app_message_register_inbox_dropped STT_FUNC
app_message_register_inbox_dropped:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1192    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_message_register_inbox_received"
.align 2
.thumb_func
.global app_message_register_inbox_received
.type app_message_register_inbox_received STT_FUNC
app_message_register_inbox_received:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1196    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_message_register_outbox_failed"
.align 2
.thumb_func
.global app_message_register_outbox_failed
.type app_message_register_outbox_failed STT_FUNC
app_message_register_outbox_failed:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1200    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_message_register_outbox_sent"
.align 2
.thumb_func
.global app_message_register_outbox_sent
.type app_message_register_outbox_sent STT_FUNC
app_message_register_outbox_sent:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1204    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_message_set_context"
.align 2
.thumb_func
.global app_message_set_context
.type app_message_set_context STT_FUNC
app_message_set_context:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1208    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_long_click_subscribe"
.align 2
.thumb_func
.global window_long_click_subscribe
.type window_long_click_subscribe STT_FUNC
window_long_click_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1212    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_multi_click_subscribe"
.align 2
.thumb_func
.global window_multi_click_subscribe
.type window_multi_click_subscribe STT_FUNC
window_multi_click_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1216    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_raw_click_subscribe"
.align 2
.thumb_func
.global window_raw_click_subscribe
.type window_raw_click_subscribe STT_FUNC
window_raw_click_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1220    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_set_click_context"
.align 2
.thumb_func
.global window_set_click_context
.type window_set_click_context STT_FUNC
window_set_click_context:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1224    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_single_click_subscribe"
.align 2
.thumb_func
.global window_single_click_subscribe
.type window_single_click_subscribe STT_FUNC
window_single_click_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1228    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_single_repeating_click_subscribe"
.align 2
.thumb_func
.global window_single_repeating_click_subscribe
.type window_single_repeating_click_subscribe STT_FUNC
window_single_repeating_click_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1232    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_draw_text"
.align 2
.thumb_func
.global graphics_draw_text
.type graphics_draw_text STT_FUNC
graphics_draw_text:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1236    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_serialize_tuplets_to_buffer"
.align 2
.thumb_func
.global dict_serialize_tuplets_to_buffer
.type dict_serialize_tuplets_to_buffer STT_FUNC
dict_serialize_tuplets_to_buffer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1240    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.persist_read_data"
.align 2
.thumb_func
.global persist_read_data
.type persist_read_data STT_FUNC
persist_read_data:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1244    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.persist_read_string"
.align 2
.thumb_func
.global persist_read_string
.type persist_read_string STT_FUNC
persist_read_string:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1248    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.persist_write_data"
.align 2
.thumb_func
.global persist_write_data
.type persist_write_data STT_FUNC
persist_write_data:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1252    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dict_size"
.align 2
.thumb_func
.global dict_size
.type dict_size STT_FUNC
dict_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1256    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_text_layout_get_content_size"
.align 2
.thumb_func
.global graphics_text_layout_get_content_size
.type graphics_text_layout_get_content_size STT_FUNC
graphics_text_layout_get_content_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1260    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.simple_menu_layer_get_menu_layer"
.align 2
.thumb_func
.global simple_menu_layer_get_menu_layer
.type simple_menu_layer_get_menu_layer STT_FUNC
simple_menu_layer_get_menu_layer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1264    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.accel_data_service_subscribe"
.align 2
.thumb_func
.global accel_data_service_subscribe
.type accel_data_service_subscribe STT_FUNC
accel_data_service_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1268    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.calloc"
.align 2
.thumb_func
.global calloc
.type calloc STT_FUNC
calloc:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1272    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.bitmap_layer_get_bitmap"
.align 2
.thumb_func
.global bitmap_layer_get_bitmap
.type bitmap_layer_get_bitmap STT_FUNC
bitmap_layer_get_bitmap:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1276    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_legacy2_set_callbacks"
.align 2
.thumb_func
.global menu_layer_legacy2_set_callbacks
.type menu_layer_legacy2_set_callbacks STT_FUNC
menu_layer_legacy2_set_callbacks:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1280    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_get_click_config_context"
.align 2
.thumb_func
.global window_get_click_config_context
.type window_get_click_config_context STT_FUNC
window_get_click_config_context:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1284    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.number_window_get_window"
.align 2
.thumb_func
.global number_window_get_window
.type number_window_get_window STT_FUNC
number_window_get_window:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1288    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.realloc"
.align 2
.thumb_func
.global realloc
.type realloc STT_FUNC
realloc:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1292    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_create_blank_2bit"
.align 2
.thumb_func
.global gbitmap_create_blank_2bit
.type gbitmap_create_blank_2bit STT_FUNC
gbitmap_create_blank_2bit:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1296    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.click_recognizer_is_repeating"
.align 2
.thumb_func
.global click_recognizer_is_repeating
.type click_recognizer_is_repeating STT_FUNC
click_recognizer_is_repeating:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1300    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.accel_raw_data_service_subscribe"
.align 2
.thumb_func
.global accel_raw_data_service_subscribe
.type accel_raw_data_service_subscribe STT_FUNC
accel_raw_data_service_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1304    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_worker_is_running"
.align 2
.thumb_func
.global app_worker_is_running
.type app_worker_is_running STT_FUNC
app_worker_is_running:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1308    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_worker_kill"
.align 2
.thumb_func
.global app_worker_kill
.type app_worker_kill STT_FUNC
app_worker_kill:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1312    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_worker_launch"
.align 2
.thumb_func
.global app_worker_launch
.type app_worker_launch STT_FUNC
app_worker_launch:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1316    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_worker_message_subscribe"
.align 2
.thumb_func
.global app_worker_message_subscribe
.type app_worker_message_subscribe STT_FUNC
app_worker_message_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1320    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_worker_message_unsubscribe"
.align 2
.thumb_func
.global app_worker_message_unsubscribe
.type app_worker_message_unsubscribe STT_FUNC
app_worker_message_unsubscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1324    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_worker_send_message"
.align 2
.thumb_func
.global app_worker_send_message
.type app_worker_send_message STT_FUNC
app_worker_send_message:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1328    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.worker_event_loop"
.align 2
.thumb_func
.global worker_event_loop
.type worker_event_loop STT_FUNC
worker_event_loop:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1332    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.worker_launch_app"
.align 2
.thumb_func
.global worker_launch_app
.type worker_launch_app STT_FUNC
worker_launch_app:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1336    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.heap_bytes_free"
.align 2
.thumb_func
.global heap_bytes_free
.type heap_bytes_free STT_FUNC
heap_bytes_free:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1340    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.heap_bytes_used"
.align 2
.thumb_func
.global heap_bytes_used
.type heap_bytes_used STT_FUNC
heap_bytes_used:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1344    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.compass_service_peek"
.align 2
.thumb_func
.global compass_service_peek
.type compass_service_peek STT_FUNC
compass_service_peek:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1348    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.compass_service_set_heading_filter"
.align 2
.thumb_func
.global compass_service_set_heading_filter
.type compass_service_set_heading_filter STT_FUNC
compass_service_set_heading_filter:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1352    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.compass_service_subscribe"
.align 2
.thumb_func
.global compass_service_subscribe
.type compass_service_subscribe STT_FUNC
compass_service_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1356    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.compass_service_unsubscribe"
.align 2
.thumb_func
.global compass_service_unsubscribe
.type compass_service_unsubscribe STT_FUNC
compass_service_unsubscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1360    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.uuid_equal"
.align 2
.thumb_func
.global uuid_equal
.type uuid_equal STT_FUNC
uuid_equal:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1364    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.uuid_to_string"
.align 2
.thumb_func
.global uuid_to_string
.type uuid_to_string STT_FUNC
uuid_to_string:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1368    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gpath_draw_filled"
.align 2
.thumb_func
.global gpath_draw_filled
.type gpath_draw_filled STT_FUNC
gpath_draw_filled:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1372    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_legacy2_set_custom_curve"
.align 2
.thumb_func
.global animation_legacy2_set_custom_curve
.type animation_legacy2_set_custom_curve STT_FUNC
animation_legacy2_set_custom_curve:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1376    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.watch_info_get_color"
.align 2
.thumb_func
.global watch_info_get_color
.type watch_info_get_color STT_FUNC
watch_info_get_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1380    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.watch_info_get_firmware_version"
.align 2
.thumb_func
.global watch_info_get_firmware_version
.type watch_info_get_firmware_version STT_FUNC
watch_info_get_firmware_version:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1384    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.watch_info_get_model"
.align 2
.thumb_func
.global watch_info_get_model
.type watch_info_get_model STT_FUNC
watch_info_get_model:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1388    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_capture_frame_buffer_2bit"
.align 2
.thumb_func
.global graphics_capture_frame_buffer_2bit
.type graphics_capture_frame_buffer_2bit STT_FUNC
graphics_capture_frame_buffer_2bit:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1392    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_frame_buffer_is_captured"
.align 2
.thumb_func
.global graphics_frame_buffer_is_captured
.type graphics_frame_buffer_is_captured STT_FUNC
graphics_frame_buffer_is_captured:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1396    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_release_frame_buffer"
.align 2
.thumb_func
.global graphics_release_frame_buffer
.type graphics_release_frame_buffer STT_FUNC
graphics_release_frame_buffer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1400    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.clock_to_timestamp"
.align 2
.thumb_func
.global clock_to_timestamp
.type clock_to_timestamp STT_FUNC
clock_to_timestamp:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1404    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.launch_reason"
.align 2
.thumb_func
.global launch_reason
.type launch_reason STT_FUNC
launch_reason:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1408    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.wakeup_cancel"
.align 2
.thumb_func
.global wakeup_cancel
.type wakeup_cancel STT_FUNC
wakeup_cancel:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1412    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.wakeup_cancel_all"
.align 2
.thumb_func
.global wakeup_cancel_all
.type wakeup_cancel_all STT_FUNC
wakeup_cancel_all:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1416    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.wakeup_get_launch_event"
.align 2
.thumb_func
.global wakeup_get_launch_event
.type wakeup_get_launch_event STT_FUNC
wakeup_get_launch_event:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1420    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.wakeup_query"
.align 2
.thumb_func
.global wakeup_query
.type wakeup_query STT_FUNC
wakeup_query:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1424    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.wakeup_schedule"
.align 2
.thumb_func
.global wakeup_schedule
.type wakeup_schedule STT_FUNC
wakeup_schedule:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1428    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.wakeup_service_subscribe"
.align 2
.thumb_func
.global wakeup_service_subscribe
.type wakeup_service_subscribe STT_FUNC
wakeup_service_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1432    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.clock_is_timezone_set"
.align 2
.thumb_func
.global clock_is_timezone_set
.type clock_is_timezone_set STT_FUNC
clock_is_timezone_set:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1436    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.i18n_get_system_locale"
.align 2
.thumb_func
.global i18n_get_system_locale
.type i18n_get_system_locale STT_FUNC
i18n_get_system_locale:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1440    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text._localeconv_r"
.align 2
.thumb_func
.global _localeconv_r
.type _localeconv_r STT_FUNC
_localeconv_r:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1444    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.setlocale"
.align 2
.thumb_func
.global setlocale
.type setlocale STT_FUNC
setlocale:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1448    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.mktime"
.align 2
.thumb_func
.global mktime
.type mktime STT_FUNC
mktime:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1452    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gcolor_equal__deprecated"
.align 2
.thumb_func
.global gcolor_equal__deprecated
.type gcolor_equal__deprecated STT_FUNC
gcolor_equal__deprecated:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1456    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.__profiler_init"
.align 2
.thumb_func
.global __profiler_init
.type __profiler_init STT_FUNC
__profiler_init:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1460    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.__profiler_print_stats"
.align 2
.thumb_func
.global __profiler_print_stats
.type __profiler_print_stats STT_FUNC
__profiler_print_stats:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1464    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.__profiler_start"
.align 2
.thumb_func
.global __profiler_start
.type __profiler_start STT_FUNC
__profiler_start:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1468    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.__profiler_stop"
.align 2
.thumb_func
.global __profiler_stop
.type __profiler_stop STT_FUNC
__profiler_stop:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1472    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.bitmap_layer_set_background_color"
.align 2
.thumb_func
.global bitmap_layer_set_background_color
.type bitmap_layer_set_background_color STT_FUNC
bitmap_layer_set_background_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1480    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_context_set_fill_color"
.align 2
.thumb_func
.global graphics_context_set_fill_color
.type graphics_context_set_fill_color STT_FUNC
graphics_context_set_fill_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1484    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_context_set_stroke_color"
.align 2
.thumb_func
.global graphics_context_set_stroke_color
.type graphics_context_set_stroke_color STT_FUNC
graphics_context_set_stroke_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1488    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_context_set_text_color"
.align 2
.thumb_func
.global graphics_context_set_text_color
.type graphics_context_set_text_color STT_FUNC
graphics_context_set_text_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1492    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.rot_bitmap_layer_set_corner_clip_color"
.align 2
.thumb_func
.global rot_bitmap_layer_set_corner_clip_color
.type rot_bitmap_layer_set_corner_clip_color STT_FUNC
rot_bitmap_layer_set_corner_clip_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1496    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_set_background_color"
.align 2
.thumb_func
.global window_set_background_color
.type window_set_background_color STT_FUNC
window_set_background_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1508    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.clock_get_timezone"
.align 2
.thumb_func
.global clock_get_timezone
.type clock_get_timezone STT_FUNC
clock_get_timezone:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1512    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.localtime"
.align 2
.thumb_func
.global localtime
.type localtime STT_FUNC
localtime:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1516    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_create"
.align 2
.thumb_func
.global animation_create
.type animation_create STT_FUNC
animation_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1520    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_destroy"
.align 2
.thumb_func
.global animation_destroy
.type animation_destroy STT_FUNC
animation_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1524    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_get_context"
.align 2
.thumb_func
.global animation_get_context
.type animation_get_context STT_FUNC
animation_get_context:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1528    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_is_scheduled"
.align 2
.thumb_func
.global animation_is_scheduled
.type animation_is_scheduled STT_FUNC
animation_is_scheduled:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1532    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_schedule"
.align 2
.thumb_func
.global animation_schedule
.type animation_schedule STT_FUNC
animation_schedule:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1536    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_set_curve"
.align 2
.thumb_func
.global animation_set_curve
.type animation_set_curve STT_FUNC
animation_set_curve:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1540    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_set_custom_curve"
.align 2
.thumb_func
.global animation_set_custom_curve
.type animation_set_custom_curve STT_FUNC
animation_set_custom_curve:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1544    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_set_delay"
.align 2
.thumb_func
.global animation_set_delay
.type animation_set_delay STT_FUNC
animation_set_delay:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1548    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_set_duration"
.align 2
.thumb_func
.global animation_set_duration
.type animation_set_duration STT_FUNC
animation_set_duration:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1552    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_set_handlers"
.align 2
.thumb_func
.global animation_set_handlers
.type animation_set_handlers STT_FUNC
animation_set_handlers:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1556    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_set_implementation"
.align 2
.thumb_func
.global animation_set_implementation
.type animation_set_implementation STT_FUNC
animation_set_implementation:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1560    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_unschedule"
.align 2
.thumb_func
.global animation_unschedule
.type animation_unschedule STT_FUNC
animation_unschedule:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1564    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_unschedule_all"
.align 2
.thumb_func
.global animation_unschedule_all
.type animation_unschedule_all STT_FUNC
animation_unschedule_all:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1568    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_create_blank"
.align 2
.thumb_func
.global gbitmap_create_blank
.type gbitmap_create_blank STT_FUNC
gbitmap_create_blank:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1572    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_capture_frame_buffer"
.align 2
.thumb_func
.global graphics_capture_frame_buffer
.type graphics_capture_frame_buffer STT_FUNC
graphics_capture_frame_buffer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1576    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_capture_frame_buffer_format"
.align 2
.thumb_func
.global graphics_capture_frame_buffer_format
.type graphics_capture_frame_buffer_format STT_FUNC
graphics_capture_frame_buffer_format:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1580    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_create"
.align 2
.thumb_func
.global property_animation_create
.type property_animation_create STT_FUNC
property_animation_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1584    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_create_layer_frame"
.align 2
.thumb_func
.global property_animation_create_layer_frame
.type property_animation_create_layer_frame STT_FUNC
property_animation_create_layer_frame:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1588    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_destroy"
.align 2
.thumb_func
.global property_animation_destroy
.type property_animation_destroy STT_FUNC
property_animation_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1592    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_from"
.align 2
.thumb_func
.global property_animation_from
.type property_animation_from STT_FUNC
property_animation_from:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1596    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_get_animation"
.align 2
.thumb_func
.global property_animation_get_animation
.type property_animation_get_animation STT_FUNC
property_animation_get_animation:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1600    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_subject"
.align 2
.thumb_func
.global property_animation_subject
.type property_animation_subject STT_FUNC
property_animation_subject:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1604    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_to"
.align 2
.thumb_func
.global property_animation_to
.type property_animation_to STT_FUNC
property_animation_to:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1608    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_update_gpoint"
.align 2
.thumb_func
.global property_animation_update_gpoint
.type property_animation_update_gpoint STT_FUNC
property_animation_update_gpoint:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1612    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_update_grect"
.align 2
.thumb_func
.global property_animation_update_grect
.type property_animation_update_grect STT_FUNC
property_animation_update_grect:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1616    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_update_int16"
.align 2
.thumb_func
.global property_animation_update_int16
.type property_animation_update_int16 STT_FUNC
property_animation_update_int16:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1620    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_create_blank_with_palette"
.align 2
.thumb_func
.global gbitmap_create_blank_with_palette
.type gbitmap_create_blank_with_palette STT_FUNC
gbitmap_create_blank_with_palette:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1624    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_get_bounds"
.align 2
.thumb_func
.global gbitmap_get_bounds
.type gbitmap_get_bounds STT_FUNC
gbitmap_get_bounds:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1628    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_get_bytes_per_row"
.align 2
.thumb_func
.global gbitmap_get_bytes_per_row
.type gbitmap_get_bytes_per_row STT_FUNC
gbitmap_get_bytes_per_row:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1632    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_get_data"
.align 2
.thumb_func
.global gbitmap_get_data
.type gbitmap_get_data STT_FUNC
gbitmap_get_data:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1636    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_get_format"
.align 2
.thumb_func
.global gbitmap_get_format
.type gbitmap_get_format STT_FUNC
gbitmap_get_format:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1640    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_get_palette"
.align 2
.thumb_func
.global gbitmap_get_palette
.type gbitmap_get_palette STT_FUNC
gbitmap_get_palette:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1644    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_set_bounds"
.align 2
.thumb_func
.global gbitmap_set_bounds
.type gbitmap_set_bounds STT_FUNC
gbitmap_set_bounds:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1648    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_set_data"
.align 2
.thumb_func
.global gbitmap_set_data
.type gbitmap_set_data STT_FUNC
gbitmap_set_data:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1652    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_set_palette"
.align 2
.thumb_func
.global gbitmap_set_palette
.type gbitmap_set_palette STT_FUNC
gbitmap_set_palette:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1656    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_sequence_create_with_resource"
.align 2
.thumb_func
.global gbitmap_sequence_create_with_resource
.type gbitmap_sequence_create_with_resource STT_FUNC
gbitmap_sequence_create_with_resource:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1660    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_sequence_destroy"
.align 2
.thumb_func
.global gbitmap_sequence_destroy
.type gbitmap_sequence_destroy STT_FUNC
gbitmap_sequence_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1664    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_sequence_get_bitmap_size"
.align 2
.thumb_func
.global gbitmap_sequence_get_bitmap_size
.type gbitmap_sequence_get_bitmap_size STT_FUNC
gbitmap_sequence_get_bitmap_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1668    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_sequence_get_current_frame_idx"
.align 2
.thumb_func
.global gbitmap_sequence_get_current_frame_idx
.type gbitmap_sequence_get_current_frame_idx STT_FUNC
gbitmap_sequence_get_current_frame_idx:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1672    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_sequence_get_total_num_frames"
.align 2
.thumb_func
.global gbitmap_sequence_get_total_num_frames
.type gbitmap_sequence_get_total_num_frames STT_FUNC
gbitmap_sequence_get_total_num_frames:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1676    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_sequence_update_bitmap_next_frame"
.align 2
.thumb_func
.global gbitmap_sequence_update_bitmap_next_frame
.type gbitmap_sequence_update_bitmap_next_frame STT_FUNC
gbitmap_sequence_update_bitmap_next_frame:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1680    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_create_from_png_data"
.align 2
.thumb_func
.global gbitmap_create_from_png_data
.type gbitmap_create_from_png_data STT_FUNC
gbitmap_create_from_png_data:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1684    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_clone"
.align 2
.thumb_func
.global animation_clone
.type animation_clone STT_FUNC
animation_clone:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1688    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_get_delay"
.align 2
.thumb_func
.global animation_get_delay
.type animation_get_delay STT_FUNC
animation_get_delay:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1692    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_get_duration"
.align 2
.thumb_func
.global animation_get_duration
.type animation_get_duration STT_FUNC
animation_get_duration:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1696    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_get_play_count"
.align 2
.thumb_func
.global animation_get_play_count
.type animation_get_play_count STT_FUNC
animation_get_play_count:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1700    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_get_elapsed"
.align 2
.thumb_func
.global animation_get_elapsed
.type animation_get_elapsed STT_FUNC
animation_get_elapsed:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1704    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_get_reverse"
.align 2
.thumb_func
.global animation_get_reverse
.type animation_get_reverse STT_FUNC
animation_get_reverse:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1708    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_sequence_create"
.align 2
.thumb_func
.global animation_sequence_create
.type animation_sequence_create STT_FUNC
animation_sequence_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1712    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_sequence_create_from_array"
.align 2
.thumb_func
.global animation_sequence_create_from_array
.type animation_sequence_create_from_array STT_FUNC
animation_sequence_create_from_array:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1716    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_set_play_count"
.align 2
.thumb_func
.global animation_set_play_count
.type animation_set_play_count STT_FUNC
animation_set_play_count:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1720    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_set_elapsed"
.align 2
.thumb_func
.global animation_set_elapsed
.type animation_set_elapsed STT_FUNC
animation_set_elapsed:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1724    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_set_reverse"
.align 2
.thumb_func
.global animation_set_reverse
.type animation_set_reverse STT_FUNC
animation_set_reverse:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1728    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_spawn_create"
.align 2
.thumb_func
.global animation_spawn_create
.type animation_spawn_create STT_FUNC
animation_spawn_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1732    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_spawn_create_from_array"
.align 2
.thumb_func
.global animation_spawn_create_from_array
.type animation_spawn_create_from_array STT_FUNC
animation_spawn_create_from_array:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1736    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_get_curve"
.align 2
.thumb_func
.global animation_get_curve
.type animation_get_curve STT_FUNC
animation_get_curve:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1740    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_get_custom_curve"
.align 2
.thumb_func
.global animation_get_custom_curve
.type animation_get_custom_curve STT_FUNC
animation_get_custom_curve:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1744    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.animation_get_implementation"
.align 2
.thumb_func
.global animation_get_implementation
.type animation_get_implementation STT_FUNC
animation_get_implementation:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1748    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.launch_get_args"
.align 2
.thumb_func
.global launch_get_args
.type launch_get_args STT_FUNC
launch_get_args:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1752    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_create"
.align 2
.thumb_func
.global menu_layer_create
.type menu_layer_create STT_FUNC
menu_layer_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1756    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_sequence_get_play_count"
.align 2
.thumb_func
.global gbitmap_sequence_get_play_count
.type gbitmap_sequence_get_play_count STT_FUNC
gbitmap_sequence_get_play_count:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1764    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_sequence_restart"
.align 2
.thumb_func
.global gbitmap_sequence_restart
.type gbitmap_sequence_restart STT_FUNC
gbitmap_sequence_restart:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1768    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_sequence_set_play_count"
.align 2
.thumb_func
.global gbitmap_sequence_set_play_count
.type gbitmap_sequence_set_play_count STT_FUNC
gbitmap_sequence_set_play_count:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1772    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_context_set_antialiased"
.align 2
.thumb_func
.global graphics_context_set_antialiased
.type graphics_context_set_antialiased STT_FUNC
graphics_context_set_antialiased:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1776    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_context_set_stroke_width"
.align 2
.thumb_func
.global graphics_context_set_stroke_width
.type graphics_context_set_stroke_width STT_FUNC
graphics_context_set_stroke_width:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1780    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_add_to_window"
.align 2
.thumb_func
.global action_bar_layer_add_to_window
.type action_bar_layer_add_to_window STT_FUNC
action_bar_layer_add_to_window:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1784    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_clear_icon"
.align 2
.thumb_func
.global action_bar_layer_clear_icon
.type action_bar_layer_clear_icon STT_FUNC
action_bar_layer_clear_icon:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1788    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_create"
.align 2
.thumb_func
.global action_bar_layer_create
.type action_bar_layer_create STT_FUNC
action_bar_layer_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1792    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_destroy"
.align 2
.thumb_func
.global action_bar_layer_destroy
.type action_bar_layer_destroy STT_FUNC
action_bar_layer_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1796    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_get_layer"
.align 2
.thumb_func
.global action_bar_layer_get_layer
.type action_bar_layer_get_layer STT_FUNC
action_bar_layer_get_layer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1800    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_remove_from_window"
.align 2
.thumb_func
.global action_bar_layer_remove_from_window
.type action_bar_layer_remove_from_window STT_FUNC
action_bar_layer_remove_from_window:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1804    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_set_background_color"
.align 2
.thumb_func
.global action_bar_layer_set_background_color
.type action_bar_layer_set_background_color STT_FUNC
action_bar_layer_set_background_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1808    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_set_click_config_provider"
.align 2
.thumb_func
.global action_bar_layer_set_click_config_provider
.type action_bar_layer_set_click_config_provider STT_FUNC
action_bar_layer_set_click_config_provider:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1812    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_set_context"
.align 2
.thumb_func
.global action_bar_layer_set_context
.type action_bar_layer_set_context STT_FUNC
action_bar_layer_set_context:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1816    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_set_icon"
.align 2
.thumb_func
.global action_bar_layer_set_icon
.type action_bar_layer_set_icon STT_FUNC
action_bar_layer_set_icon:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1820    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_set_icon_animated"
.align 2
.thumb_func
.global action_bar_layer_set_icon_animated
.type action_bar_layer_set_icon_animated STT_FUNC
action_bar_layer_set_icon_animated:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1824    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_sequence_update_bitmap_by_elapsed"
.align 2
.thumb_func
.global gbitmap_sequence_update_bitmap_by_elapsed
.type gbitmap_sequence_update_bitmap_by_elapsed STT_FUNC
gbitmap_sequence_update_bitmap_by_elapsed:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1828    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_create_palettized_from_1bit"
.align 2
.thumb_func
.global gbitmap_create_palettized_from_1bit
.type gbitmap_create_palettized_from_1bit STT_FUNC
gbitmap_create_palettized_from_1bit:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1832    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_cell_layer_is_highlighted"
.align 2
.thumb_func
.global menu_cell_layer_is_highlighted
.type menu_cell_layer_is_highlighted STT_FUNC
menu_cell_layer_is_highlighted:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1836    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_draw_rotated_bitmap"
.align 2
.thumb_func
.global graphics_draw_rotated_bitmap
.type graphics_draw_rotated_bitmap STT_FUNC
graphics_draw_rotated_bitmap:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1840    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_bar_layer_set_icon_press_animation"
.align 2
.thumb_func
.global action_bar_layer_set_icon_press_animation
.type action_bar_layer_set_icon_press_animation STT_FUNC
action_bar_layer_set_icon_press_animation:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1844    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_create"
.align 2
.thumb_func
.global text_layer_create
.type text_layer_create STT_FUNC
text_layer_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1848    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_destroy"
.align 2
.thumb_func
.global text_layer_destroy
.type text_layer_destroy STT_FUNC
text_layer_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1852    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_get_content_size"
.align 2
.thumb_func
.global text_layer_get_content_size
.type text_layer_get_content_size STT_FUNC
text_layer_get_content_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1856    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_get_layer"
.align 2
.thumb_func
.global text_layer_get_layer
.type text_layer_get_layer STT_FUNC
text_layer_get_layer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1860    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_get_text"
.align 2
.thumb_func
.global text_layer_get_text
.type text_layer_get_text STT_FUNC
text_layer_get_text:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1864    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_set_background_color"
.align 2
.thumb_func
.global text_layer_set_background_color
.type text_layer_set_background_color STT_FUNC
text_layer_set_background_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1868    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_set_font"
.align 2
.thumb_func
.global text_layer_set_font
.type text_layer_set_font STT_FUNC
text_layer_set_font:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1872    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_set_overflow_mode"
.align 2
.thumb_func
.global text_layer_set_overflow_mode
.type text_layer_set_overflow_mode STT_FUNC
text_layer_set_overflow_mode:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1876    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_set_size"
.align 2
.thumb_func
.global text_layer_set_size
.type text_layer_set_size STT_FUNC
text_layer_set_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1880    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_set_text"
.align 2
.thumb_func
.global text_layer_set_text
.type text_layer_set_text STT_FUNC
text_layer_set_text:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1884    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_set_text_alignment"
.align 2
.thumb_func
.global text_layer_set_text_alignment
.type text_layer_set_text_alignment STT_FUNC
text_layer_set_text_alignment:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1888    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_set_text_color"
.align 2
.thumb_func
.global text_layer_set_text_color
.type text_layer_set_text_color STT_FUNC
text_layer_set_text_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1892    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_draw"
.align 2
.thumb_func
.global gdraw_command_draw
.type gdraw_command_draw STT_FUNC
gdraw_command_draw:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1896    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_frame_draw"
.align 2
.thumb_func
.global gdraw_command_frame_draw
.type gdraw_command_frame_draw STT_FUNC
gdraw_command_frame_draw:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1900    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_frame_get_duration"
.align 2
.thumb_func
.global gdraw_command_frame_get_duration
.type gdraw_command_frame_get_duration STT_FUNC
gdraw_command_frame_get_duration:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1904    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_frame_set_duration"
.align 2
.thumb_func
.global gdraw_command_frame_set_duration
.type gdraw_command_frame_set_duration STT_FUNC
gdraw_command_frame_set_duration:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1908    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_get_fill_color"
.align 2
.thumb_func
.global gdraw_command_get_fill_color
.type gdraw_command_get_fill_color STT_FUNC
gdraw_command_get_fill_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1912    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_get_hidden"
.align 2
.thumb_func
.global gdraw_command_get_hidden
.type gdraw_command_get_hidden STT_FUNC
gdraw_command_get_hidden:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1916    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_get_num_points"
.align 2
.thumb_func
.global gdraw_command_get_num_points
.type gdraw_command_get_num_points STT_FUNC
gdraw_command_get_num_points:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1920    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_get_path_open"
.align 2
.thumb_func
.global gdraw_command_get_path_open
.type gdraw_command_get_path_open STT_FUNC
gdraw_command_get_path_open:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1924    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_get_point"
.align 2
.thumb_func
.global gdraw_command_get_point
.type gdraw_command_get_point STT_FUNC
gdraw_command_get_point:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1928    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_get_radius"
.align 2
.thumb_func
.global gdraw_command_get_radius
.type gdraw_command_get_radius STT_FUNC
gdraw_command_get_radius:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1932    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_get_stroke_color"
.align 2
.thumb_func
.global gdraw_command_get_stroke_color
.type gdraw_command_get_stroke_color STT_FUNC
gdraw_command_get_stroke_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1936    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_get_stroke_width"
.align 2
.thumb_func
.global gdraw_command_get_stroke_width
.type gdraw_command_get_stroke_width STT_FUNC
gdraw_command_get_stroke_width:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1940    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_get_type"
.align 2
.thumb_func
.global gdraw_command_get_type
.type gdraw_command_get_type STT_FUNC
gdraw_command_get_type:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1944    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_image_clone"
.align 2
.thumb_func
.global gdraw_command_image_clone
.type gdraw_command_image_clone STT_FUNC
gdraw_command_image_clone:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1948    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_image_create_with_resource"
.align 2
.thumb_func
.global gdraw_command_image_create_with_resource
.type gdraw_command_image_create_with_resource STT_FUNC
gdraw_command_image_create_with_resource:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1952    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_image_destroy"
.align 2
.thumb_func
.global gdraw_command_image_destroy
.type gdraw_command_image_destroy STT_FUNC
gdraw_command_image_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1956    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_image_draw"
.align 2
.thumb_func
.global gdraw_command_image_draw
.type gdraw_command_image_draw STT_FUNC
gdraw_command_image_draw:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1960    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_image_get_bounds_size"
.align 2
.thumb_func
.global gdraw_command_image_get_bounds_size
.type gdraw_command_image_get_bounds_size STT_FUNC
gdraw_command_image_get_bounds_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1964    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_image_get_command_list"
.align 2
.thumb_func
.global gdraw_command_image_get_command_list
.type gdraw_command_image_get_command_list STT_FUNC
gdraw_command_image_get_command_list:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1968    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_image_set_bounds_size"
.align 2
.thumb_func
.global gdraw_command_image_set_bounds_size
.type gdraw_command_image_set_bounds_size STT_FUNC
gdraw_command_image_set_bounds_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1972    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_list_draw"
.align 2
.thumb_func
.global gdraw_command_list_draw
.type gdraw_command_list_draw STT_FUNC
gdraw_command_list_draw:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1976    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_list_get_command"
.align 2
.thumb_func
.global gdraw_command_list_get_command
.type gdraw_command_list_get_command STT_FUNC
gdraw_command_list_get_command:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1980    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_list_get_num_commands"
.align 2
.thumb_func
.global gdraw_command_list_get_num_commands
.type gdraw_command_list_get_num_commands STT_FUNC
gdraw_command_list_get_num_commands:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1984    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_list_iterate"
.align 2
.thumb_func
.global gdraw_command_list_iterate
.type gdraw_command_list_iterate STT_FUNC
gdraw_command_list_iterate:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1988    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_sequence_clone"
.align 2
.thumb_func
.global gdraw_command_sequence_clone
.type gdraw_command_sequence_clone STT_FUNC
gdraw_command_sequence_clone:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1992    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_sequence_create_with_resource"
.align 2
.thumb_func
.global gdraw_command_sequence_create_with_resource
.type gdraw_command_sequence_create_with_resource STT_FUNC
gdraw_command_sequence_create_with_resource:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =1996    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_sequence_destroy"
.align 2
.thumb_func
.global gdraw_command_sequence_destroy
.type gdraw_command_sequence_destroy STT_FUNC
gdraw_command_sequence_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2000    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_sequence_get_bounds_size"
.align 2
.thumb_func
.global gdraw_command_sequence_get_bounds_size
.type gdraw_command_sequence_get_bounds_size STT_FUNC
gdraw_command_sequence_get_bounds_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2004    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_sequence_get_frame_by_elapsed"
.align 2
.thumb_func
.global gdraw_command_sequence_get_frame_by_elapsed
.type gdraw_command_sequence_get_frame_by_elapsed STT_FUNC
gdraw_command_sequence_get_frame_by_elapsed:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2008    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_sequence_get_frame_by_index"
.align 2
.thumb_func
.global gdraw_command_sequence_get_frame_by_index
.type gdraw_command_sequence_get_frame_by_index STT_FUNC
gdraw_command_sequence_get_frame_by_index:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2012    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_sequence_get_num_frames"
.align 2
.thumb_func
.global gdraw_command_sequence_get_num_frames
.type gdraw_command_sequence_get_num_frames STT_FUNC
gdraw_command_sequence_get_num_frames:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2016    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_sequence_get_play_count"
.align 2
.thumb_func
.global gdraw_command_sequence_get_play_count
.type gdraw_command_sequence_get_play_count STT_FUNC
gdraw_command_sequence_get_play_count:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2020    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_sequence_get_total_duration"
.align 2
.thumb_func
.global gdraw_command_sequence_get_total_duration
.type gdraw_command_sequence_get_total_duration STT_FUNC
gdraw_command_sequence_get_total_duration:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2024    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_sequence_set_bounds_size"
.align 2
.thumb_func
.global gdraw_command_sequence_set_bounds_size
.type gdraw_command_sequence_set_bounds_size STT_FUNC
gdraw_command_sequence_set_bounds_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2028    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_sequence_set_play_count"
.align 2
.thumb_func
.global gdraw_command_sequence_set_play_count
.type gdraw_command_sequence_set_play_count STT_FUNC
gdraw_command_sequence_set_play_count:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2032    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_set_fill_color"
.align 2
.thumb_func
.global gdraw_command_set_fill_color
.type gdraw_command_set_fill_color STT_FUNC
gdraw_command_set_fill_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2036    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_set_hidden"
.align 2
.thumb_func
.global gdraw_command_set_hidden
.type gdraw_command_set_hidden STT_FUNC
gdraw_command_set_hidden:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2040    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_set_path_open"
.align 2
.thumb_func
.global gdraw_command_set_path_open
.type gdraw_command_set_path_open STT_FUNC
gdraw_command_set_path_open:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2044    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_set_point"
.align 2
.thumb_func
.global gdraw_command_set_point
.type gdraw_command_set_point STT_FUNC
gdraw_command_set_point:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2048    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_set_radius"
.align 2
.thumb_func
.global gdraw_command_set_radius
.type gdraw_command_set_radius STT_FUNC
gdraw_command_set_radius:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2052    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_set_stroke_color"
.align 2
.thumb_func
.global gdraw_command_set_stroke_color
.type gdraw_command_set_stroke_color STT_FUNC
gdraw_command_set_stroke_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2056    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_set_stroke_width"
.align 2
.thumb_func
.global gdraw_command_set_stroke_width
.type gdraw_command_set_stroke_width STT_FUNC
gdraw_command_set_stroke_width:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2060    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_create_bounds_origin"
.align 2
.thumb_func
.global property_animation_create_bounds_origin
.type property_animation_create_bounds_origin STT_FUNC
property_animation_create_bounds_origin:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2064    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_update_uint32"
.align 2
.thumb_func
.global property_animation_update_uint32
.type property_animation_update_uint32 STT_FUNC
property_animation_update_uint32:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2068    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gpath_draw_outline_open"
.align 2
.thumb_func
.global gpath_draw_outline_open
.type gpath_draw_outline_open STT_FUNC
gpath_draw_outline_open:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2072    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.time"
.align 2
.thumb_func
.global time
.type time STT_FUNC
time:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2076    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_set_highlight_colors"
.align 2
.thumb_func
.global menu_layer_set_highlight_colors
.type menu_layer_set_highlight_colors STT_FUNC
menu_layer_set_highlight_colors:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2080    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_set_normal_colors"
.align 2
.thumb_func
.global menu_layer_set_normal_colors
.type menu_layer_set_normal_colors STT_FUNC
menu_layer_set_normal_colors:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2084    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_set_callbacks"
.align 2
.thumb_func
.global menu_layer_set_callbacks
.type menu_layer_set_callbacks STT_FUNC
menu_layer_set_callbacks:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2088    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_pad_bottom_enable"
.align 2
.thumb_func
.global menu_layer_pad_bottom_enable
.type menu_layer_pad_bottom_enable STT_FUNC
menu_layer_pad_bottom_enable:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2092    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.status_bar_layer_create"
.align 2
.thumb_func
.global status_bar_layer_create
.type status_bar_layer_create STT_FUNC
status_bar_layer_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2096    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.status_bar_layer_destroy"
.align 2
.thumb_func
.global status_bar_layer_destroy
.type status_bar_layer_destroy STT_FUNC
status_bar_layer_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2100    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.status_bar_layer_get_background_color"
.align 2
.thumb_func
.global status_bar_layer_get_background_color
.type status_bar_layer_get_background_color STT_FUNC
status_bar_layer_get_background_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2104    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.status_bar_layer_get_foreground_color"
.align 2
.thumb_func
.global status_bar_layer_get_foreground_color
.type status_bar_layer_get_foreground_color STT_FUNC
status_bar_layer_get_foreground_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2108    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.status_bar_layer_get_layer"
.align 2
.thumb_func
.global status_bar_layer_get_layer
.type status_bar_layer_get_layer STT_FUNC
status_bar_layer_get_layer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2112    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.status_bar_layer_set_colors"
.align 2
.thumb_func
.global status_bar_layer_set_colors
.type status_bar_layer_set_colors STT_FUNC
status_bar_layer_set_colors:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2116    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.status_bar_layer_set_separator_mode"
.align 2
.thumb_func
.global status_bar_layer_set_separator_mode
.type status_bar_layer_set_separator_mode STT_FUNC
status_bar_layer_set_separator_mode:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2120    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.difftime"
.align 2
.thumb_func
.global difftime
.type difftime STT_FUNC
difftime:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2124    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.time_ms"
.align 2
.thumb_func
.global time_ms
.type time_ms STT_FUNC
time_ms:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2128    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gcolor_legible_over"
.align 2
.thumb_func
.global gcolor_legible_over
.type gcolor_legible_over STT_FUNC
gcolor_legible_over:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2132    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.property_animation_update_gcolor8"
.align 2
.thumb_func
.global property_animation_update_gcolor8
.type property_animation_update_gcolor8 STT_FUNC
property_animation_update_gcolor8:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2136    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_focus_service_subscribe_handlers"
.align 2
.thumb_func
.global app_focus_service_subscribe_handlers
.type app_focus_service_subscribe_handlers STT_FUNC
app_focus_service_subscribe_handlers:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2140    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_menu_close"
.align 2
.thumb_func
.global action_menu_close
.type action_menu_close STT_FUNC
action_menu_close:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2144    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_menu_freeze"
.align 2
.thumb_func
.global action_menu_freeze
.type action_menu_freeze STT_FUNC
action_menu_freeze:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2148    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_menu_get_context"
.align 2
.thumb_func
.global action_menu_get_context
.type action_menu_get_context STT_FUNC
action_menu_get_context:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2152    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_menu_get_root_level"
.align 2
.thumb_func
.global action_menu_get_root_level
.type action_menu_get_root_level STT_FUNC
action_menu_get_root_level:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2156    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_menu_hierarchy_destroy"
.align 2
.thumb_func
.global action_menu_hierarchy_destroy
.type action_menu_hierarchy_destroy STT_FUNC
action_menu_hierarchy_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2160    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_menu_item_get_action_data"
.align 2
.thumb_func
.global action_menu_item_get_action_data
.type action_menu_item_get_action_data STT_FUNC
action_menu_item_get_action_data:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2164    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_menu_item_get_label"
.align 2
.thumb_func
.global action_menu_item_get_label
.type action_menu_item_get_label STT_FUNC
action_menu_item_get_label:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2168    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_menu_level_add_action"
.align 2
.thumb_func
.global action_menu_level_add_action
.type action_menu_level_add_action STT_FUNC
action_menu_level_add_action:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2172    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_menu_level_add_child"
.align 2
.thumb_func
.global action_menu_level_add_child
.type action_menu_level_add_child STT_FUNC
action_menu_level_add_child:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2176    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_menu_level_create"
.align 2
.thumb_func
.global action_menu_level_create
.type action_menu_level_create STT_FUNC
action_menu_level_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2180    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_menu_level_set_display_mode"
.align 2
.thumb_func
.global action_menu_level_set_display_mode
.type action_menu_level_set_display_mode STT_FUNC
action_menu_level_set_display_mode:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2184    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_menu_open"
.align 2
.thumb_func
.global action_menu_open
.type action_menu_open STT_FUNC
action_menu_open:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2188    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_menu_set_result_window"
.align 2
.thumb_func
.global action_menu_set_result_window
.type action_menu_set_result_window STT_FUNC
action_menu_set_result_window:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2192    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.action_menu_unfreeze"
.align 2
.thumb_func
.global action_menu_unfreeze
.type action_menu_unfreeze STT_FUNC
action_menu_unfreeze:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2196    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dictation_session_create"
.align 2
.thumb_func
.global dictation_session_create
.type dictation_session_create STT_FUNC
dictation_session_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2200    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dictation_session_destroy"
.align 2
.thumb_func
.global dictation_session_destroy
.type dictation_session_destroy STT_FUNC
dictation_session_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2204    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dictation_session_enable_confirmation"
.align 2
.thumb_func
.global dictation_session_enable_confirmation
.type dictation_session_enable_confirmation STT_FUNC
dictation_session_enable_confirmation:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2208    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dictation_session_start"
.align 2
.thumb_func
.global dictation_session_start
.type dictation_session_start STT_FUNC
dictation_session_start:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2212    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dictation_session_stop"
.align 2
.thumb_func
.global dictation_session_stop
.type dictation_session_stop STT_FUNC
dictation_session_stop:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2216    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.smartstrap_attribute_begin_write"
.align 2
.thumb_func
.global smartstrap_attribute_begin_write
.type smartstrap_attribute_begin_write STT_FUNC
smartstrap_attribute_begin_write:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2220    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.smartstrap_attribute_create"
.align 2
.thumb_func
.global smartstrap_attribute_create
.type smartstrap_attribute_create STT_FUNC
smartstrap_attribute_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2224    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.smartstrap_attribute_destroy"
.align 2
.thumb_func
.global smartstrap_attribute_destroy
.type smartstrap_attribute_destroy STT_FUNC
smartstrap_attribute_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2228    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.smartstrap_attribute_end_write"
.align 2
.thumb_func
.global smartstrap_attribute_end_write
.type smartstrap_attribute_end_write STT_FUNC
smartstrap_attribute_end_write:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2232    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.smartstrap_attribute_get_attribute_id"
.align 2
.thumb_func
.global smartstrap_attribute_get_attribute_id
.type smartstrap_attribute_get_attribute_id STT_FUNC
smartstrap_attribute_get_attribute_id:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2236    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.smartstrap_attribute_get_service_id"
.align 2
.thumb_func
.global smartstrap_attribute_get_service_id
.type smartstrap_attribute_get_service_id STT_FUNC
smartstrap_attribute_get_service_id:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2240    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.smartstrap_attribute_read"
.align 2
.thumb_func
.global smartstrap_attribute_read
.type smartstrap_attribute_read STT_FUNC
smartstrap_attribute_read:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2244    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.smartstrap_service_is_available"
.align 2
.thumb_func
.global smartstrap_service_is_available
.type smartstrap_service_is_available STT_FUNC
smartstrap_service_is_available:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2248    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.smartstrap_set_timeout"
.align 2
.thumb_func
.global smartstrap_set_timeout
.type smartstrap_set_timeout STT_FUNC
smartstrap_set_timeout:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2252    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.smartstrap_subscribe"
.align 2
.thumb_func
.global smartstrap_subscribe
.type smartstrap_subscribe STT_FUNC
smartstrap_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2256    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.smartstrap_unsubscribe"
.align 2
.thumb_func
.global smartstrap_unsubscribe
.type smartstrap_unsubscribe STT_FUNC
smartstrap_unsubscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2260    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.connection_service_peek_pebble_app_connection"
.align 2
.thumb_func
.global connection_service_peek_pebble_app_connection
.type connection_service_peek_pebble_app_connection STT_FUNC
connection_service_peek_pebble_app_connection:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2264    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.connection_service_peek_pebblekit_connection"
.align 2
.thumb_func
.global connection_service_peek_pebblekit_connection
.type connection_service_peek_pebblekit_connection STT_FUNC
connection_service_peek_pebblekit_connection:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2268    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.connection_service_subscribe"
.align 2
.thumb_func
.global connection_service_subscribe
.type connection_service_subscribe STT_FUNC
connection_service_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2272    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.connection_service_unsubscribe"
.align 2
.thumb_func
.global connection_service_unsubscribe
.type connection_service_unsubscribe STT_FUNC
connection_service_unsubscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2276    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.dictation_session_enable_error_dialogs"
.align 2
.thumb_func
.global dictation_session_enable_error_dialogs
.type dictation_session_enable_error_dialogs STT_FUNC
dictation_session_enable_error_dialogs:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2280    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gbitmap_get_data_row_info"
.align 2
.thumb_func
.global gbitmap_get_data_row_info
.type gbitmap_get_data_row_info STT_FUNC
gbitmap_get_data_row_info:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2284    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.content_indicator_configure_direction"
.align 2
.thumb_func
.global content_indicator_configure_direction
.type content_indicator_configure_direction STT_FUNC
content_indicator_configure_direction:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2288    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.content_indicator_create"
.align 2
.thumb_func
.global content_indicator_create
.type content_indicator_create STT_FUNC
content_indicator_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2292    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.content_indicator_destroy"
.align 2
.thumb_func
.global content_indicator_destroy
.type content_indicator_destroy STT_FUNC
content_indicator_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2296    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.content_indicator_get_content_available"
.align 2
.thumb_func
.global content_indicator_get_content_available
.type content_indicator_get_content_available STT_FUNC
content_indicator_get_content_available:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2300    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.content_indicator_set_content_available"
.align 2
.thumb_func
.global content_indicator_set_content_available
.type content_indicator_set_content_available STT_FUNC
content_indicator_set_content_available:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2304    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_get_content_indicator"
.align 2
.thumb_func
.global scroll_layer_get_content_indicator
.type scroll_layer_get_content_indicator STT_FUNC
scroll_layer_get_content_indicator:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2308    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_get_center_focused"
.align 2
.thumb_func
.global menu_layer_get_center_focused
.type menu_layer_get_center_focused STT_FUNC
menu_layer_get_center_focused:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2312    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_set_center_focused"
.align 2
.thumb_func
.global menu_layer_set_center_focused
.type menu_layer_set_center_focused STT_FUNC
menu_layer_set_center_focused:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2316    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.grect_inset"
.align 2
.thumb_func
.global grect_inset
.type grect_inset STT_FUNC
grect_inset:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2320    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gpoint_from_polar"
.align 2
.thumb_func
.global gpoint_from_polar
.type gpoint_from_polar STT_FUNC
gpoint_from_polar:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2324    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_draw_arc"
.align 2
.thumb_func
.global graphics_draw_arc
.type graphics_draw_arc STT_FUNC
graphics_draw_arc:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2328    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_fill_radial"
.align 2
.thumb_func
.global graphics_fill_radial
.type graphics_fill_radial STT_FUNC
graphics_fill_radial:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2332    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.grect_centered_from_polar"
.align 2
.thumb_func
.global grect_centered_from_polar
.type grect_centered_from_polar STT_FUNC
grect_centered_from_polar:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2336    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_text_attributes_create"
.align 2
.thumb_func
.global graphics_text_attributes_create
.type graphics_text_attributes_create STT_FUNC
graphics_text_attributes_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2340    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_text_attributes_destroy"
.align 2
.thumb_func
.global graphics_text_attributes_destroy
.type graphics_text_attributes_destroy STT_FUNC
graphics_text_attributes_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2344    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_text_attributes_enable_paging"
.align 2
.thumb_func
.global graphics_text_attributes_enable_paging
.type graphics_text_attributes_enable_paging STT_FUNC
graphics_text_attributes_enable_paging:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2348    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_text_attributes_enable_screen_text_flow"
.align 2
.thumb_func
.global graphics_text_attributes_enable_screen_text_flow
.type graphics_text_attributes_enable_screen_text_flow STT_FUNC
graphics_text_attributes_enable_screen_text_flow:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2352    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_text_attributes_restore_default_paging"
.align 2
.thumb_func
.global graphics_text_attributes_restore_default_paging
.type graphics_text_attributes_restore_default_paging STT_FUNC
graphics_text_attributes_restore_default_paging:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2356    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_text_attributes_restore_default_text_flow"
.align 2
.thumb_func
.global graphics_text_attributes_restore_default_text_flow
.type graphics_text_attributes_restore_default_text_flow STT_FUNC
graphics_text_attributes_restore_default_text_flow:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2360    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.graphics_text_layout_get_content_size_with_attributes"
.align 2
.thumb_func
.global graphics_text_layout_get_content_size_with_attributes
.type graphics_text_layout_get_content_size_with_attributes STT_FUNC
graphics_text_layout_get_content_size_with_attributes:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2364    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_convert_point_to_screen"
.align 2
.thumb_func
.global layer_convert_point_to_screen
.type layer_convert_point_to_screen STT_FUNC
layer_convert_point_to_screen:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2368    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_convert_rect_to_screen"
.align 2
.thumb_func
.global layer_convert_rect_to_screen
.type layer_convert_rect_to_screen STT_FUNC
layer_convert_rect_to_screen:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2372    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_get_paging"
.align 2
.thumb_func
.global scroll_layer_get_paging
.type scroll_layer_get_paging STT_FUNC
scroll_layer_get_paging:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2376    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.scroll_layer_set_paging"
.align 2
.thumb_func
.global scroll_layer_set_paging
.type scroll_layer_set_paging STT_FUNC
scroll_layer_set_paging:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2380    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_enable_screen_text_flow_and_paging"
.align 2
.thumb_func
.global text_layer_enable_screen_text_flow_and_paging
.type text_layer_enable_screen_text_flow_and_paging STT_FUNC
text_layer_enable_screen_text_flow_and_paging:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2384    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.text_layer_restore_default_text_flow_and_paging"
.align 2
.thumb_func
.global text_layer_restore_default_text_flow_and_paging
.type text_layer_restore_default_text_flow_and_paging STT_FUNC
text_layer_restore_default_text_flow_and_paging:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2388    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.menu_layer_is_index_selected"
.align 2
.thumb_func
.global menu_layer_is_index_selected
.type menu_layer_is_index_selected STT_FUNC
menu_layer_is_index_selected:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2392    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_activities_iterate"
.align 2
.thumb_func
.global health_service_activities_iterate
.type health_service_activities_iterate STT_FUNC
health_service_activities_iterate:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2396    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_any_activity_accessible"
.align 2
.thumb_func
.global health_service_any_activity_accessible
.type health_service_any_activity_accessible STT_FUNC
health_service_any_activity_accessible:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2400    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_events_subscribe"
.align 2
.thumb_func
.global health_service_events_subscribe
.type health_service_events_subscribe STT_FUNC
health_service_events_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2404    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_events_unsubscribe"
.align 2
.thumb_func
.global health_service_events_unsubscribe
.type health_service_events_unsubscribe STT_FUNC
health_service_events_unsubscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2408    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_get_minute_history"
.align 2
.thumb_func
.global health_service_get_minute_history
.type health_service_get_minute_history STT_FUNC
health_service_get_minute_history:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2412    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_metric_accessible"
.align 2
.thumb_func
.global health_service_metric_accessible
.type health_service_metric_accessible STT_FUNC
health_service_metric_accessible:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2416    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_peek_current_activities"
.align 2
.thumb_func
.global health_service_peek_current_activities
.type health_service_peek_current_activities STT_FUNC
health_service_peek_current_activities:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2420    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_sum"
.align 2
.thumb_func
.global health_service_sum
.type health_service_sum STT_FUNC
health_service_sum:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2424    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_sum_today"
.align 2
.thumb_func
.global health_service_sum_today
.type health_service_sum_today STT_FUNC
health_service_sum_today:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2428    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.time_start_of_today"
.align 2
.thumb_func
.global time_start_of_today
.type time_start_of_today STT_FUNC
time_start_of_today:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2432    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_metric_averaged_accessible"
.align 2
.thumb_func
.global health_service_metric_averaged_accessible
.type health_service_metric_averaged_accessible STT_FUNC
health_service_metric_averaged_accessible:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2436    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_sum_averaged"
.align 2
.thumb_func
.global health_service_sum_averaged
.type health_service_sum_averaged STT_FUNC
health_service_sum_averaged:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2440    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_get_measurement_system_for_display"
.align 2
.thumb_func
.global health_service_get_measurement_system_for_display
.type health_service_get_measurement_system_for_display STT_FUNC
health_service_get_measurement_system_for_display:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2444    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gdraw_command_frame_get_command_list"
.align 2
.thumb_func
.global gdraw_command_frame_get_command_list
.type gdraw_command_frame_get_command_list STT_FUNC
gdraw_command_frame_get_command_list:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2448    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.gcolor_equal"
.align 2
.thumb_func
.global gcolor_equal
.type gcolor_equal STT_FUNC
gcolor_equal:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2452    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_glance_add_slice"
.align 2
.thumb_func
.global app_glance_add_slice
.type app_glance_add_slice STT_FUNC
app_glance_add_slice:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2456    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_glance_reload"
.align 2
.thumb_func
.global app_glance_reload
.type app_glance_reload STT_FUNC
app_glance_reload:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2460    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.exit_reason_set"
.align 2
.thumb_func
.global exit_reason_set
.type exit_reason_set STT_FUNC
exit_reason_set:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2464    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_aggregate_averaged"
.align 2
.thumb_func
.global health_service_aggregate_averaged
.type health_service_aggregate_averaged STT_FUNC
health_service_aggregate_averaged:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2468    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_cancel_metric_alert"
.align 2
.thumb_func
.global health_service_cancel_metric_alert
.type health_service_cancel_metric_alert STT_FUNC
health_service_cancel_metric_alert:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2472    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_metric_aggregate_averaged_accessible"
.align 2
.thumb_func
.global health_service_metric_aggregate_averaged_accessible
.type health_service_metric_aggregate_averaged_accessible STT_FUNC
health_service_metric_aggregate_averaged_accessible:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2476    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_peek_current_value"
.align 2
.thumb_func
.global health_service_peek_current_value
.type health_service_peek_current_value STT_FUNC
health_service_peek_current_value:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2480    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_register_metric_alert"
.align 2
.thumb_func
.global health_service_register_metric_alert
.type health_service_register_metric_alert STT_FUNC
health_service_register_metric_alert:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2484    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.layer_get_unobstructed_bounds"
.align 2
.thumb_func
.global layer_get_unobstructed_bounds
.type layer_get_unobstructed_bounds STT_FUNC
layer_get_unobstructed_bounds:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2488    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.preferred_result_display_duration"
.align 2
.thumb_func
.global preferred_result_display_duration
.type preferred_result_display_duration STT_FUNC
preferred_result_display_duration:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2492    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.unobstructed_area_service_subscribe"
.align 2
.thumb_func
.global unobstructed_area_service_subscribe
.type unobstructed_area_service_subscribe STT_FUNC
unobstructed_area_service_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2496    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.unobstructed_area_service_unsubscribe"
.align 2
.thumb_func
.global unobstructed_area_service_unsubscribe
.type unobstructed_area_service_unsubscribe STT_FUNC
unobstructed_area_service_unsubscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2500    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.memory_cache_flush"
.align 2
.thumb_func
.global memory_cache_flush
.type memory_cache_flush STT_FUNC
memory_cache_flush:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2504    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.rocky_event_loop_with_resource"
.align 2
.thumb_func
.global rocky_event_loop_with_resource
.type rocky_event_loop_with_resource STT_FUNC
rocky_event_loop_with_resource:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2508    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_get_heart_rate_sample_period_expiration_sec"
.align 2
.thumb_func
.global health_service_get_heart_rate_sample_period_expiration_sec
.type health_service_get_heart_rate_sample_period_expiration_sec STT_FUNC
health_service_get_heart_rate_sample_period_expiration_sec:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2512    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_set_heart_rate_sample_period"
.align 2
.thumb_func
.global health_service_set_heart_rate_sample_period
.type health_service_set_heart_rate_sample_period STT_FUNC
health_service_set_heart_rate_sample_period:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2516    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.preferred_content_size"
.align 2
.thumb_func
.global preferred_content_size
.type preferred_content_size STT_FUNC
preferred_content_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2520    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.quiet_time_is_active"
.align 2
.thumb_func
.global quiet_time_is_active
.type quiet_time_is_active STT_FUNC
quiet_time_is_active:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2524    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.moddable_createMachine"
.align 2
.thumb_func
.global moddable_createMachine
.type moddable_createMachine STT_FUNC
moddable_createMachine:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2528    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.rot_bitmap_layer_get_layer"
.align 2
.thumb_func
.global rot_bitmap_layer_get_layer
.type rot_bitmap_layer_get_layer STT_FUNC
rot_bitmap_layer_get_layer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2532    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.light_set_color"
.align 2
.thumb_func
.global light_set_color
.type light_set_color STT_FUNC
light_set_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2536    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.light_set_system_color"
.align 2
.thumb_func
.global light_set_system_color
.type light_set_system_color STT_FUNC
light_set_system_color:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2540    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.light_is_on"
.align 2
.thumb_func
.global light_is_on
.type light_is_on STT_FUNC
light_is_on:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2544    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.touch_service_is_enabled"
.align 2
.thumb_func
.global touch_service_is_enabled
.type touch_service_is_enabled STT_FUNC
touch_service_is_enabled:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2548    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.touch_service_subscribe"
.align 2
.thumb_func
.global touch_service_subscribe
.type touch_service_subscribe STT_FUNC
touch_service_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2552    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.touch_service_unsubscribe"
.align 2
.thumb_func
.global touch_service_unsubscribe
.type touch_service_unsubscribe STT_FUNC
touch_service_unsubscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2556    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.light_set_color_rgb888"
.align 2
.thumb_func
.global light_set_color_rgb888
.type light_set_color_rgb888 STT_FUNC
light_set_color_rgb888:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2560    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.speaker_get_status"
.align 2
.thumb_func
.global speaker_get_status
.type speaker_get_status STT_FUNC
speaker_get_status:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2564    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.speaker_play_notes"
.align 2
.thumb_func
.global speaker_play_notes
.type speaker_play_notes STT_FUNC
speaker_play_notes:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2568    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.speaker_play_tone"
.align 2
.thumb_func
.global speaker_play_tone
.type speaker_play_tone STT_FUNC
speaker_play_tone:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2572    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.speaker_play_tracks"
.align 2
.thumb_func
.global speaker_play_tracks
.type speaker_play_tracks STT_FUNC
speaker_play_tracks:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2576    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.speaker_set_finish_callback"
.align 2
.thumb_func
.global speaker_set_finish_callback
.type speaker_set_finish_callback STT_FUNC
speaker_set_finish_callback:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2580    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.speaker_set_volume"
.align 2
.thumb_func
.global speaker_set_volume
.type speaker_set_volume STT_FUNC
speaker_set_volume:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2584    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.speaker_stop"
.align 2
.thumb_func
.global speaker_stop
.type speaker_stop STT_FUNC
speaker_stop:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2588    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.speaker_stream_close"
.align 2
.thumb_func
.global speaker_stream_close
.type speaker_stream_close STT_FUNC
speaker_stream_close:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2592    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.speaker_stream_open"
.align 2
.thumb_func
.global speaker_stream_open
.type speaker_stream_open STT_FUNC
speaker_stream_open:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2596    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.speaker_stream_write"
.align 2
.thumb_func
.global speaker_stream_write
.type speaker_stream_write STT_FUNC
speaker_stream_write:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2600    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.persist_get_max_size"
.align 2
.thumb_func
.global persist_get_max_size
.type persist_get_max_size STT_FUNC
persist_get_max_size:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2604    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.speaker_is_muted"
.align 2
.thumb_func
.global speaker_is_muted
.type speaker_is_muted STT_FUNC
speaker_is_muted:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2608    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.backlight_service_subscribe"
.align 2
.thumb_func
.global backlight_service_subscribe
.type backlight_service_subscribe STT_FUNC
backlight_service_subscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2612    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.backlight_service_unsubscribe"
.align 2
.thumb_func
.global backlight_service_unsubscribe
.type backlight_service_unsubscribe STT_FUNC
backlight_service_unsubscribe:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2616    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.launch_button"
.align 2
.thumb_func
.global launch_button
.type launch_button STT_FUNC
launch_button:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2620    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.launch_get_quick_launch_action"
.align 2
.thumb_func
.global launch_get_quick_launch_action
.type launch_get_quick_launch_action STT_FUNC
launch_get_quick_launch_action:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2624    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.alarm_service_peek_next"
.align 2
.thumb_func
.global alarm_service_peek_next
.type alarm_service_peek_next STT_FUNC
alarm_service_peek_next:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2628    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.pan_recognizer_create"
.align 2
.thumb_func
.global pan_recognizer_create
.type pan_recognizer_create STT_FUNC
pan_recognizer_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2632    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.pan_recognizer_get_delta_since_prev"
.align 2
.thumb_func
.global pan_recognizer_get_delta_since_prev
.type pan_recognizer_get_delta_since_prev STT_FUNC
pan_recognizer_get_delta_since_prev:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2636    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.pan_recognizer_get_delta_since_start"
.align 2
.thumb_func
.global pan_recognizer_get_delta_since_start
.type pan_recognizer_get_delta_since_start STT_FUNC
pan_recognizer_get_delta_since_start:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2640    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.pan_recognizer_get_total_delta"
.align 2
.thumb_func
.global pan_recognizer_get_total_delta
.type pan_recognizer_get_total_delta STT_FUNC
pan_recognizer_get_total_delta:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2644    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.pan_recognizer_get_velocity"
.align 2
.thumb_func
.global pan_recognizer_get_velocity
.type pan_recognizer_get_velocity STT_FUNC
pan_recognizer_get_velocity:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2648    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.recognizer_destroy"
.align 2
.thumb_func
.global recognizer_destroy
.type recognizer_destroy STT_FUNC
recognizer_destroy:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2652    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.recognizer_set_fail_after"
.align 2
.thumb_func
.global recognizer_set_fail_after
.type recognizer_set_fail_after STT_FUNC
recognizer_set_fail_after:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2656    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.recognizer_set_simultaneous_with"
.align 2
.thumb_func
.global recognizer_set_simultaneous_with
.type recognizer_set_simultaneous_with STT_FUNC
recognizer_set_simultaneous_with:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2660    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.swipe_recognizer_create"
.align 2
.thumb_func
.global swipe_recognizer_create
.type swipe_recognizer_create STT_FUNC
swipe_recognizer_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2664    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.swipe_recognizer_get_direction"
.align 2
.thumb_func
.global swipe_recognizer_get_direction
.type swipe_recognizer_get_direction STT_FUNC
swipe_recognizer_get_direction:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2668    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.swipe_recognizer_get_velocity"
.align 2
.thumb_func
.global swipe_recognizer_get_velocity
.type swipe_recognizer_get_velocity STT_FUNC
swipe_recognizer_get_velocity:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2672    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.tap_recognizer_create"
.align 2
.thumb_func
.global tap_recognizer_create
.type tap_recognizer_create STT_FUNC
tap_recognizer_create:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2676    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.tap_recognizer_get_tap_point"
.align 2
.thumb_func
.global tap_recognizer_get_tap_point
.type tap_recognizer_get_tap_point STT_FUNC
tap_recognizer_get_tap_point:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2680    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_attach_recognizer"
.align 2
.thumb_func
.global window_attach_recognizer
.type window_attach_recognizer STT_FUNC
window_attach_recognizer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2684    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_detach_recognizer"
.align 2
.thumb_func
.global window_detach_recognizer
.type window_detach_recognizer STT_FUNC
window_detach_recognizer:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2688    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.window_set_touch_bridge_disabled"
.align 2
.thumb_func
.global window_set_touch_bridge_disabled
.type window_set_touch_bridge_disabled STT_FUNC
window_set_touch_bridge_disabled:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2692    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.app_touch_navigation_enable"
.align 2
.thumb_func
.global app_touch_navigation_enable
.type app_touch_navigation_enable STT_FUNC
app_touch_navigation_enable:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2696    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_peek_hrv_ppi_ms"
.align 2
.thumb_func
.global health_service_peek_hrv_ppi_ms
.type health_service_peek_hrv_ppi_ms STT_FUNC
health_service_peek_hrv_ppi_ms:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2700    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text.health_service_set_hrv_sample_period"
.align 2
.thumb_func
.global health_service_set_hrv_sample_period
.type health_service_set_hrv_sample_period STT_FUNC
health_service_set_hrv_sample_period:
        push {r0, r1, r2, r3}  @ Stack the original parameters. Remember that the caller
                               @ thinks they're calling a C function, not this shim function.
                               @ We don't want to touch these.
        ldr r1, =2704    @ Load up the index into the jump table array
        b jump_to_pbl_function @ See below...
 

.section ".text"
.type jump_to_pbl_function function
jump_to_pbl_function:
        adr r3, pbl_table_addr
        ldr r0, [r3]           @ r0 now holds the base address of the jump table
        add r0, r0, r1         @ add the offset to address the function pointer to the exported function
        ldr r2, [r0]           @ r2 now holds the address of the exported function
        mov r12, r2            @ r12 aka intra-procedure scratch register. We're allowed to
                               @ muck with this and not restore it
        pop {r0, r1, r2, r3}   @ Restore the original parameters to the exported C function
        bx r12                 @ And finally jump! Don't use branch and link, we want to
                               @ return to the original call site, not this shim

@ This pbl_table_addr variable will get compiled into our app binary. As part of our build process
@ the address of this variable will get poked into the PebbleProcessInfo meta data struct. Then, when
@ we load the app from flash we change the value of the variable to point the jump table exported
@ by the OS.
.align
pbl_table_addr:
.long 0xA8A8A8A8

