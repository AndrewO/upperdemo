inputs=$(wildcard input/*.txt)
outputs=$(subst input,output,$(inputs))

all: output/ $(outputs)

output/:
	mkdir -p output

output/%.txt: input/%.txt
	tr [a-z] [A-Z] < $< > $@

.PHONY: clean

clean:
	rm -rf output