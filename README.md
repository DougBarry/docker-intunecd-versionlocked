# docker-intunecd-versionlocked

A container for using IntuneCD with version locked pipenv to try and mitigate supply chain attack posibilities

## Table of Contents

- [Information](#information)
- [Installation](#installation)
- [Usage](#usage)
- [Support](#support)
- [Contributing](#contributing)

## Information

[IntuneCD](https://github.com/almenscorner/IntuneCD
) or, Intune Continuous Delivery as it stands for is a Python package that is used to back up and update configurations in Intune.

Pipenv has been used here because of the specificity of the Pipfile.lock syntax. While not as easily human readable as other methods of python dependancy version/hasing, it is easier to get to an installed and working environment.

## Installation

Clone this repo to somewhere, and build it with ```docker-compose build```

## Usage

I recommend making modifications to the docker-compose.yml file and adding in appropriate command line switches in the ```command:``` section, for your tenancy. Alternatively if you wish to supply information via the environment variables method as per [official documentation](https://github.com/almenscorner/IntuneCD#run-from-a-pipeline) then do so within the ```environment:```section.

## Support
Please [open an issue](/issues/new) for support

## Contributing
Please contribute using [Github Flow](https://guides.github.com/introduction/flow/). Create a branch, add commits, and [open a pull request](/compare)