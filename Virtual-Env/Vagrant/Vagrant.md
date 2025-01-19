# Vagrant/Vagrant.md

## Guides
* [Saving Vagrant States Using Snapshots](https://www.thisprogrammingthing.com/2021/Saving-Vagrant-States-Using-Snapshots/)

## Error and Solution
Error Message:
The private key to connect to this box via SSH has invalid permissions
set on it. The permissions of the private key should be set to 0600, otherwise SSH will
ignore the key. Vagrant tried to do this automatically for you but failed. Please set the
permissions on the following file to 0600 and then try running this command again:

/media/user_name/Software_Drive/my_vagrant/homestead/.vagrant/machines/homestead/virtualbox/private_key

Note that this error occurs after Vagrant automatically tries to
do this for you. The likely cause of this error is a lack of filesystem
permissions or even filesystem functionality. For example, if your
Vagrant data is on a USB stick, a common case is that chmod is
not supported. The key will need to be moved to a filesystem that
supports chmod.

Reason:
".vagrant" folder's "private_key" does not work from usb/external partition where "chmod" commands does not work.

Solution:
Place Homestead folder into User directory. (Similarly Docker Toolbox only works from user directory in Windows OS)
Open "Homestead.yaml" file and in "folders - map" point the full path of usb/external partition project folder.
 This working method is for Ubuntu.