fn_split() {
    cat <<EOF >"${script_dir}/outputs/split.html"
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<style>
*,
*:after,
*:before {
	box-sizing: border-box;
}

body {
	font-family: "Inter", sans-serif;
	background-color: #FFF;
}

.text-box {
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center;
}

h1 {
	font-size: 8vw;
	font-weight: 900;
	background-color: ${BCOLOR};
	color: ${COLOR};
	display: block;
	padding: .5em;
}

h1:nth-child(2) {
	position: absolute;
	background-color: ${COLOR};
	color: ${BCOLOR};
	clip-path: inset(-1% -1% 50% -1%); // Added the negative values to prevent icky "bleed" in Chrome
}

p {
	font-size: 2vw;
	font-weight: 900;
	margin-top: 1em;
	text-align: center;
	span {
		display: block;
		transform: rotate(90deg);
		margin-top: .25em;
	}
}

// only to center the elements in the pen preview and viewport
.container {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
}
</style>
</head>
<body>
<div class="container">
	<div class="text-box">
		<h1>${HEADER}</h1>
		<h1>${HEADER}</h1>
	</div>
</div>
</body>
</html>
EOF

    # check if $RETRO_OUTPUT exist
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir -p "$OUTPUT_DIR"
    fi
    eval "$FIREFOX" --headless --screenshot "${OUTPUT_DIR}/split.png" "file:///${script_dir}/outputs/split.html" >/dev/null 2>&1 || {
        echo "Something went wrong."
        exit
    }

    echo "Split image is done! Open $OUTPUT_DIR/retro.png."
}
