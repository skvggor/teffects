# Popart

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/popart.png" /> 
</p>

## Options

```sh
Usage: teffects popart [options] [arguments]

Creates pop art texts.
All parameters accepts --param value and --param=value form.

  OPTIONS                     DESCRIPTION
  -a, --align ALIGN           Text alignment. Default: center.
  -b, --bcolor BCOLOR         Background color. Enclose with quotes. Default: #faff04
  -t, --text TEXT             Your text to print.
  -d, --dir OUTPUT_DIR        Output directory. Use an absolute path without a trailing slash. Default: /Users/shinichiokada/Bash_Projects/Teffects/teffects/outputs
  -s, --size SIZE             Font-size. Use a number without px. Default: 120px
  -w, --width WIDTH           Image width. Use a number without px. Default: 1600px.
  -e, --height HEIGHT         Image height. Default: 1200px.
  -h, --help
```

## Examples

```sh
$ teffects popart -H "Bold, bright and brash" -e 600
$ teffects popart -H "Bold, bright" -e 600 -b purple -s 200 -a left
```

## Credit

[Typo triple by creatz](https://codepen.io/creatz/pen/pooBeev)