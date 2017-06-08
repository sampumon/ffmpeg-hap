HELLO
=====

we'll convert your *.{mov,mp4,m4v} recursively into *_[hap.mov](http://vdmx.vidvox.net/blog/hap).

USAGE
-----

	ffmpeg-hap directory [output_template.mov]

#### output_template

contains bash variables, so escape it with 'single quotes' 😅

	INPUT lol/cats/tiger.h246.mov
	$path lol/cats
	$name          tiger.h264.mov
	$base          tiger.h264
	$ext                      mov

default: `$path/${base}_hap.mov` ⟶ `lol/cats/tiger.h246_hap.mov`

we'll create your output directories for you.

TEST RUN
--------

if you have [pv](http://www.ivarch.com/programs/pv.shtml) installed, we do pretty output one file per line. ffmpeg output is aggregated to _./ffmpeg-hap.out_.

	$ ffmpeg-hap HULMU 'HAP/$base.mov'
	HULMU/hulmis.mov: 2.27MiB 0:00:01 [1.72MiB/s] [=============================================>] 100%
	HULMU/mehu_isi.mov: 1.91MiB 0:00:00 [2.06MiB/s] [===========================================>] 100%
	HULMU/speed_noutaja.mov: 2.57MiB 0:00:01 [2.27MiB/s] [======================================>] 100%

homebrew note
-------------

[homebrew](http://brew.sh)'s [ffmpeg](https://github.com/Homebrew/homebrew-core/blob/master/Formula/ffmpeg.rb) does not currently have hap encoding built in, you need to reinstall with snappy:

	brew reinstall ffmpeg --with-snappy

(it takes some time)
