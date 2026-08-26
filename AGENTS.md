# Repository Guidelines

## Project Structure & Module Organization

Buildroot generates complete embedded Linux systems through cross-compilation.
Top-level `Config.in` and `Makefile` drive Kconfig and builds. Package recipes
live in `package/<name>/` (normally a `.mk`, `Config.in`, and hash/license
metadata); boot loaders, kernels, filesystems, and toolchains live in `boot/`,
`linux/`, `fs/`, and `toolchain/`. Board support belongs in
`board/<vendor>/<board>/`, with its matching minimal configuration in
`configs/<board>_defconfig`. Python runtime tests are under
`support/testing/tests/`; helper scripts are in `utils/` and `support/scripts/`.

Recent local history follows this split: the Stratix 10 defconfig adds a
`board/altera/stratix10/` directory containing image configuration, kernel
fragments, post-build/image scripts, and a rootfs overlay. Keep such board
assets together rather than placing board-specific logic in generic packages.

## Build, Test, and Development Commands

- `make list-defconfigs` lists available baseline configurations.
- `make <board>_defconfig && make` configures and builds; artifacts are in
  `output/images/`.
- `make menuconfig` changes Buildroot options interactively; follow with
  `make savedefconfig` before updating `configs/<board>_defconfig`.
- `./utils/check-package package/foo/*` checks a changed package; use
  `make check-package` for the tracked tree.
- `./utils/test-pkg -p foo` builds a package across representative toolchains.
- `support/testing/run-tests -l` lists Python tests; run a focused test with
  `support/testing/run-tests tests.core.test_rootfs_overlay`.

## Coding Style & Naming Conventions

Follow `.editorconfig`: four spaces for most files, tabs for `Config.in`,
`*.mk`, `Makefile*`, init scripts, and `DEVELOPERS`; keep LF endings and trim
trailing whitespace. Use lowercase package and board directory names. Name
defconfigs `configs/<board>_defconfig`; pair a board defconfig with files such
as `genimage.cfg`, `linux.fragment`, `post-build.sh`, and `rootfs_overlay/`
only when required.

## Testing Guidelines

Test the smallest affected surface first: run `check-package` for recipe or
shell changes, `test-pkg` for package integration, and focused tests in
`support/testing/tests/` for behavior changes. For board changes, rebuild the
matching defconfig and inspect `output/images/`; retain only minimal,
reproducible defconfig settings.

## Commit & Submission Guidelines

Local history uses concise imperative subjects with a component prefix, for
example `configs/socfpga: Add ...`, `package/ddcutil: New package`, or
`board: raspberrypi: ...`. Keep one logical change per commit and explain why
in the body when the subject is insufficient. Run `git commit -s`; add or
update `DEVELOPERS` when taking responsibility for a package or board path.
Buildroot contributions are normally submitted as a clean, rebased email patch
series to the mailing list rather than a pull request. Include rationale,
testing performed, relevant issue or upstream links, and maintainers from
`./utils/get-developers -e <patch>`.
