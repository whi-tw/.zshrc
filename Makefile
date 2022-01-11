objects := $(patsubst %.zsh,%.zsh.zwc,$(wildcard *.zsh))

all: $(objects)

%.zsh.zwc: %.zsh
	libs/zcompile $<

clean:
	rm -f *.zsh.zwc
