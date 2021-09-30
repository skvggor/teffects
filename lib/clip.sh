GFONT="${FONT_NAME// /+}"
# BROWSER_HEIGHT=$(($HEIGHT - 200))
GF="https://fonts.googleapis.com/css2?family=${GFONT}${FONT_ATT}&display=swap"

# check_bg
echo "$BKIMG"
if [ ! -f "$BKIMG" ]; then
  echo "You image is not found."
  echo "Please use the absolute path to your image. /Path/to/image.jpg"
  exit 1
fi

fn_clip() {

  cat <<EOF >"${script_dir}/outputs/clip.html"
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<style>
    @import url("$GF");
html {
    position: relative;
    height: 100%;
}

body {
  padding:0;
  margin:0;
  font-family: "Luckiest Guy";
  background-color:#eee;
}

/* wkhtmltoimage doesn't support flex. */
/*.center{
  display: flex;
  justify-content: center;
  align-items: center;
  height:${HEIGHT}px;
}*/

h1 {
  font-size: ${SIZE}px;
  background-image: url($BKIMG);
  background-size: cover;
  background-clip: text;
  -webkit-background-clip: text;
  color: transparent;
  padding: 0 50px;
  text-align:center;
}
</style>
</head>
<body>
<h1 class="center">${TEXT}</h1>
</body>
</html>
EOF

  wkhtmltoimage --width "$WIDTH" --height "$HEIGHT" --enable-local-file-access "${script_dir}/outputs/clip.html" "${OUTPUT_DIR}/clip.png" >/dev/null 2>&1 || {
    echo "Something weng wrong."
    exit
  }
  # echo "$CHROME"

  # eval '"$CHROME"' --headless --screenshot="${script_dir}/outputs/${CLIP_OUTPUT}.png" "${script_dir}/outputs/clip.html" >/dev/null 2>&1 || {
  #     echo "Something went wrong."
  #     exit
  # }

  # eval "$FIREFOX" --headless --screenshot "${script_dir}/outputs/${CLIP_OUTPUT}.png" "file:///${script_dir}/outputs/clip.html" >/dev/null 2>&1 || exit

  echo "Clip image is done! Open $OUTPUT_DIR/clip.png."
}
