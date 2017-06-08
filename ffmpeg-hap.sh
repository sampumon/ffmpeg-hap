[[ ! "$1" ]] && {
	cat <<-TAC
	convert *.{mov,mp4,m4v} recursively into hap.

	usage: $0 directory ['output_template.mov']

	here's what components you can inject in output_template
	  INPUT lol/cats/tiger.h246.mov
	  \$path lol/cats
	  \$name          tiger.h264.mov
	  \$base          tiger.h264
	  \$ext                      mov

	default: \$path/\${base}_hap.mov → lol/cats/tiger.h246_hap.mov

	GOOD~LUCK~~!
	TAC
	exit 1
}

# process one movie
do_ffmpeg () {
	path=${1%/*}
	name=${1##*/}
	base=${name%.*}
	ext=${name##*.}

	eval out=$2
	outpath=${out%/*}
	mkdir -p $outpath

	if command -v pv >/dev/null ; then
		# TODO: this fails when mov atom is at end of file, as it usually is.
		# we could preprocess with ffmpeg -movflags faststart
		pv -N "$1" "$1" | ffmpeg -hide_banner -i - -analyzeduration 5000 -c:v hap -an "$out" >>ffmpeg-hap.out 2>&1
	else
		ffmpeg -hide_banner -i "$1" -c:v hap -an "$out"
	fi
}

# default output
out=${2:-'$path/${base}_hap.mov'}
>ffmpeg-hap.out

# find *.mov
export -f do_ffmpeg
find "$1" \( -name "*.mov" -o -name "*.mp4" -o -name "*.m4v" \) -exec bash -c "do_ffmpeg '{}' '$out'" \;
