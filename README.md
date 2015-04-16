# Ghost Update
I created this script to make it easier on myself when updating my Ghost blog instance on Amazon's EC2. The reason why I created a separate repository just for this is because I wanted to learn a little more git via the command line and to motivate myself to keep updating this script with more functionality. The script should be ran from one directory above the Ghost installation directory in order for everything to work properly.

## [Unreleased]
### Changed
- Write a check that returns latest version number before proceeding.
- Add intermediary update if difference between current and latest version is too large.

### [0.0.1] – 2015-04-16
#### Added
- Prompt for a clean-up of downloaded .zip file and/or backup.

#### Changed
- Rewrote prompts to be "while true" loops.