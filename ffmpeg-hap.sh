[[ ! "$1" ]] && {
	echo "convert *.{mov,mp4,m4v} recursively into hap"
	echo "output is same directory as input"
	echo "usage: $0 directory"
	exit 1
}

# process one movie
do_ffmpeg () {
	dirplusbase=${1%.*}
	filename=${1##*/}
	out=${dirplusbase}_hap.mov
	ffmpeg -i "$1" -c:v hap -an "$out"
}

# find *.mov
export -f do_ffmpeg
find "$1" \( -name "*.mov" -o -name "*.mp4" -o -name "*.m4v" \) -exec bash -c 'do_ffmpeg "{}"' \;
