# Ghost Update
This is the repository I created to both learn more about the workings of Git and to house this (small) script file, which updates a running instance of the Ghost blog.

# Usage instructions
This section is split into three sub-sections. The first sub-section covers how to download just the script file and nothing else. The second sub-section describes how to get the repository and how to extract the necessary file(s). The third sub-section shows how to make the script file an executable and how to run it.
## Downloading just the script file
Downloading only the script file can be accomplished by either navigating to the script file in GitHub, clicking on Raw and continuing by your own methods, or by pasting the following command into the terminal:

`wget https://github.com/melomaan/ghost-update/raw/master/update.sh`

After completing the download proceed to the last sub-section titled **Making into an executable**.
## Obtaining entire repository
To get the entire repository you can clone the repository with the command:

`git clone https://github.com/melomaan/ghost-update.git`

which creates a directory called *ghost-update*, initializes a *.git* directory inside it and pulls down all the files associated with that repository, but it does require a working installation of Git. If the cloning was successful, you can now navigate to the aforementioned folder and move on to the sub-section **Making into an executable**.

The second option involves just clicking the **Download ZIP** button or copying the link and using *wget*:

`wget https://github.com/melomaan/ghost-update/archive/master.zip`

Both will download a *.zip* file of the master branch, which includes all the files necessary. Once the download has completed, extract the archive using:

`unzip master.zip`

Navigate to the now created *ghost-update-master* directory and proceed to the last sub-section titled **Making into an executable**.
## Making into an executable
Confirm you are in the correct directory by executing:

`ls`

and seeing in the output either just *update.sh*, or both *README.md* and *update.sh*. Next, type or paste in the command:

`chmod +x update.sh`

which will turn the script file into a file you can easily execute. Execution can be done via:

`./update.sh`

after which you can follow all the prompts to update your Ghost blog.

# Change Log
All notable changes to this project will be documented in this section. Inspired by [Keep a CHANGELOG](http://keepachangelog.com/).

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
