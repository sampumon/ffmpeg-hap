HELLO
=====

we'll convert ur *.{mov,mp4,m4v} recursively into [*_hap.mov](http://vdmx.vidvox.net/blog/hap)

USAGE
-----

	ffmpeg-hap directory

homebrew note
-------------

[homebrew](http://brew.sh)'s [ffmpeg](https://github.com/Homebrew/homebrew-core/blob/master/Formula/ffmpeg.rb) does not currently have hap encoding built in, you need to reinstall with snappy:

	brew reinstall ffmpeg --with-snappy

(it takes some time)
