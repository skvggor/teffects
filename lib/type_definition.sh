parser_definition_type() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} animate [options] [arguments]" ''

    msg -- 'Creates letter animations.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@on -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@no -- "$VAR_IMAGE"
    param ALIGN -a --align init=:"center" pattern:"$ALIGN_TYPES" -- "$VAR_ALIGN"
    param BCOLOR -b --bcolor init:="#111" -- "$VAR_BCOLOR Default: #111"
    param COLOR -c --color init:="#fff" -- "$VAR_COLOR Default: #fff"
    param BIMG -m --back-img init:="https://source.unsplash.com/lNxMcE8mvIM" -- "$VAR_BIMG Default: https://source.unsplash.com/lNxMcE8mvIM"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --title-size init:=6 validate:number -- "$VAR_SIZE Default: 6vw."
    param TEXT -t --text init:="Teffects transmission" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    param BOPACITY -y --back-opacity init:=0.1 -- "$VAR_BOPACITY Default:0.1"
    disp :usage -h --help
}
