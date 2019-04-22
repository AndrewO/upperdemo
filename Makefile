inputs=$(wildcard input/*.txt)
outputs=$(subst input,output,$(inputs))

all: $(outputs)

output/%.txt: input/%.txt
	tr [a-z] [A-Z] < $< > $@

.PHONY: clean

clean:
	rm -f $(outputs)