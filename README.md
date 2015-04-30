# Ghost Update
I created this script to make it easier on myself when updating my Ghost blog instance on Amazon's EC2. The reason why I created a separate repository just for this is because I wanted to learn a little more git via the command line and to motivate myself to keep updating this script with more functionality.

Download the script via
`wget https://github.com/melomaan/ghost-update/raw/master/update.sh`
or clone the repository, make the .sh file an executable with `chmod +x update.sh`, run with `./update.sh`, and follow prompts to what will hopefully be a clean update of your Ghost blog.

## [Unreleased]
### Changed
- Add intermediary update if difference between current and latest version is too large.

## [0.0.4] – 2015-04-30
### Changed
- No longer required to run script from parent directory of Ghost installation directory.

## [0.0.3] – 2015-04-25
### Added
- Gzip compression flag to the backup prompt.

## [0.0.2] – 2015-04-19
### Added
- A check that returns latest version number before proceeding.
- Wrote comments for obscure parts of the script that might need further explanation.

### Changed
- Edited version check loop so that it doesn't echo version number all the time.
- Edited comment and code in regards to the regular expression's parentheses.

## [0.0.1] – 2015-04-16
### Added
- Prompt for a clean-up of downloaded .zip file and/or backup.

### Changed
- Rewrote prompts to be "while true" loops.