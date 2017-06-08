HELLO
=====

we'll convert ur *.{mov,mp4,m4v} recursively into [*_hap.mov](http://vdmx.vidvox.net/blog/hap)

USAGE
-----

	ffmpeg-hap directory ['output_template.mov']

these are the components you can inject into _output_template_. they're bash variables, so escape with ' 😅

	INPUT lol/cats/tiger.h246.mov
	$path lol/cats
	$name          tiger.h264.mov
	$base          tiger.h264
	$ext                      mov

default: `$path/${base}_hap.mov` → `lol/cats/tiger.h246_hap.mov`

homebrew note
-------------

[homebrew](http://brew.sh)'s [ffmpeg](https://github.com/Homebrew/homebrew-core/blob/master/Formula/ffmpeg.rb) does not currently have hap encoding built in, you need to reinstall with snappy:

	brew reinstall ffmpeg --with-snappy

(it takes some time)
