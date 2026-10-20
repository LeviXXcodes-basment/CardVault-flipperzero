# CardVault — convenience wrappers around ufbt
# Requires: pip install ufbt

.PHONY: build launch clean update format

build:        ## Build dist/cardvault.fap
	ufbt

launch:       ## Build, upload and run on a connected Flipper
	ufbt launch

update:       ## Update the ufbt SDK (release channel)
	ufbt update --channel=release

clean:        ## Remove build artifacts
	ufbt -c || true
	rm -rf dist build .ufbt/build

format:       ## Format the source with clang-format (if available)
	clang-format -i cardvault.c || true
