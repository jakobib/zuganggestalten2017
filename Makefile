# requires Pandoc::Elements

slides.html: slides.md
	pandoc -s -S -t revealjs -V revealjs-url=http://lab.hakim.se/reveal-js \
		-V theme=black -V transition=fade -V backgroundTransition=fade \
		--css style.css $< -o $@
