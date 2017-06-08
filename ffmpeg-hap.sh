[[ ! "$1" ]] && {
	echo "convert *.mov recursively into hap"
	echo "output is current directory"
	echo "usage: $0 directory"
	exit 1
}

# process one movie
do_ffmpeg () {
	out=${1##*/}
	ffmpeg -i "$1" -c:v hap -an "$out"
}

# find *.mov
export -f do_ffmpeg
find "$1" -name "*.mov" -exec bash -c 'do_ffmpeg "{}"' \;
