MODULE="slide"

fn_slide() {
	cat <<EOF >"${script_dir}/outputs/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Bungee+Shade" rel="stylesheet">
<style>
html {
	 height: 100%;
}
 body {
	 width: 100%;
	 height: 100%;
	 display: flex;
	 align-items: center;  
	 justify-content: center;  
	 font-family: 'Bungee Shade', cursive;
	 background: ${BCOLOR};
}

 h1 {
	 font-weight: normal;
	 width: 100%;
	 text-align: center;
	 font-size: ${SIZE}vw;
	 background: linear-gradient(-45deg, #4bc0c8 25%, #feac5e 25%, #feac5e 50%, #4bc0c8 50%, #4bc0c8 75%, #feac5e 75%, #feac5e);
	 -webkit-background-clip: text;
	 -webkit-text-fill-color: transparent;
	 background-size: 20px 20px;
	 background-position: 0 0;
	 animation: stripes 1s linear infinite;
}
 @keyframes stripes {
	 100% {
		 background-position: 20px 0, 20px 0, 20px 0;
	}
}
img{
    
}
</style>
</head>
<body>
<div class="container">
	<h1 data-heading="Slide">${TEXT}</h1> 
</div>
</body>
</html>
EOF

	# check if $RETRO_OUTPUT exist
	if [ ! -d "$OUTPUT_DIR" ]; then
		mkdir -p "$OUTPUT_DIR"
	fi
	eval "$FIREFOX" --headless --screenshot "${OUTPUT_DIR}/${MODULE}.png" "file:///${script_dir}/outputs/${MODULE}.html" --window-size="${WIDTH},${HEIGHT}" >/dev/null 2>&1 || {
		echo "Something went wrong."
		exit
	}

	echo "${MODULE} image is done! Open $OUTPUT_DIR/${MODULE}.png."
}
