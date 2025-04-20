set -x # Print the commands to console
sudo apt update # Current repo list
sudo apt upgrade # Get current version of packages
sudo apt dist-upgrade # Get current Ubuntu distribution
sudo apt-get check # Update the package lists and check for broken dependencies.
sudo apt autoclean # This command removes .deb files for packages that are no longer installed on your system.
# Other useful apt commands
# apt-get clean # The same as above, except it removes all packages from the package cache. This may not be desirable if you have a slow Internet connection, since it will cause you to redownload any packages you need to install a program.
# apt-get remove <package_name> # Removes an installed package, leaving configuration files intact.
# apt-get purge <package_name> # Completely removes a package and the associated configuration files. Configuration files residing in ~ are not usually affected by this command.
# sudo apt autoremove # Remove packages that were installed by other packages and are no longer needed. Warning: sometimes this will uninstall ROS. Haven't figured out why
# apt-get autoremove <package_name> # Remove an installed package and dependencies.
