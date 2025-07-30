# [Prague C++ meetup on 2025 07 29 - `Introduction to intrusive & visual profiling, focusing on constrained environments`](https://www.meetup.com/prague-cpp/events/310128881/)

This repository contains a LaTeX Beamer presentation about intrusive and visual profiling techniques, with a focus on their application in constrained environment(s).

## [License](LICENSE)

© 2025 Lukáš Růžička. This work is openly licensed via [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

## "Compiling" the presentation

First, build needed `docker` image:

```bash
$ scripts/docker_build.bash
...
```

If succesful, presentation can be "compiled" via:

```bash
$ scripts/make.bash
...
```

result, if successful, is [build/presentation.pdf](build/presentation.pdf).
