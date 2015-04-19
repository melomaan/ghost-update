# Ghost Update
I created this script to make it easier on myself when updating my Ghost blog instance on Amazon's EC2. The reason why I created a separate repository just for this is because I wanted to learn a little more git via the command line and to motivate myself to keep updating this script with more functionality. The script should be ran from one directory above the Ghost installation directory in order for everything to work properly.

## [Unreleased]
### Changed
- Add intermediary update if difference between current and latest version is too large.
- Optimize code if at all possible.

### [0.0.2] – 2015-04-19
#### Added
- A check that returns latest version number before proceeding.
- Wrote comments for obscure parts of the script that might need further explanation.

#### Changed
- Edited version check loop so that it doesn't echo version number all the time.
- Edited comment and code in regards to the regular expression's parentheses.

### [0.0.1] – 2015-04-16
#### Added
- Prompt for a clean-up of downloaded .zip file and/or backup.

#### Changed
- Rewrote prompts to be "while true" loops.