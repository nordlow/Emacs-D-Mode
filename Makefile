emacs ?= emacs
all: test

test: clean
	cask exec emacs -Q -batch -l d-mode-test.el -l d-mode.el -f ert-run-tests-batch-and-exit

compile:
	$(emacs) -Q -batch -f batch-byte-compile d-mode.el

clean:
	rm -f d-mode.elc
	find tests -name '*.res.*' -delete

# Show just the differences between the actual and expected results.
test-diff:
	for f in tests/*.res.* ; do diff --color -u "$${f/.res/}" "$$f" ; done

# Accept any mismatching actual output as the expected output.
test-accept:
	for f in tests/*.res.* ; do mv "$$f" "$${f/.res/}" ; done

.PHONY:	all test compile clean test-diff test-accept
