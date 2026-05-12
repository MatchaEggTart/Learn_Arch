export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# The script clones the nvm repository to ~/.nvm, and attempts to add the source lines from the snippet below to the correct profile file (~/.bashrc, ~/.bash_profile, ~/.zshrc, or ~/.profile). If you find the install script is updating the wrong profile file, set the $PROFILE env var to the profile file’s path, and then rerun the installation script.
