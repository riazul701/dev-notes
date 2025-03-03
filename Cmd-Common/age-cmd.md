# Commands/Usage

## `age` command

**Generate a new identity, encrypt data, and decrypt: <sup>{2}</sup>**

* `age-keygen -o key.txt` : In order to create public & private keypair, run this command <sup>{2} {3}</sup>

* `tar cvz ~/data | age -r age1ql3z7hjy54pw3hyww5ayyfg7zqgvc7w3j2elw8zmrj2kg5sfn9aqmcac8p > data.tar.gz.age` : Encrypt `data` folder using public key <sup>{2}</sup>

* `age -d -o data.tar.gz -i key.txt data.tar.gz.age` : Decrypt `data.tar.gz.age` file into `data.tar.gz` using public & private keypair <sup>{2}</sup>

**Encrypt and decrypt a file using a passphrase: <sup>{2}</sup>**

* `age -p secrets.txt > secrets.txt.age` : Encrypt file using a passphrase <sup>{2}</sup>

* `age -d secrets.txt.age > secrets.txt` : Decrypt file using passphrase <sup>{2}</sup>

**Encrypt and decrypt with a passphrase-protected identity file: <sup>{2}</sup>**

* `age-keygen | age -p > key.age` : Create passphrase-protected identity file <sup>{2}</sup>

* `age -r age1yhm4gctwfmrpz87tdslm550wrx6m79y9f2hdzt0lndjnehwj0ukqrjpyx5 secrets.txt > secrets.txt.age` : Encrypt `secrets.txt` file using public key <sup>{2}</sup>

* `age -d -i key.age secrets.txt.age > secrets.txt` : Decrypt `secrets.txt` file using passphrase-protected identity file <sup>{2}</sup>

**Encrypt `example.jpg` to multiple recipients and output to `example.jpg.age`: <sup>{2}</sup>**

**Encrypt and decrypt with an SSH public key: <sup>{2}</sup>**

**Encrypt and decrypt with age-plugin-yubikey: <sup>{2}</sup>**

**Encrypt to the SSH keys of a GitHub user: <sup>{2}</sup>**

# age.md

# References

* next-sl: {6}

## Websites

* {1} [FiloSottile/age GitHub](https://github.com/FiloSottile/age)

## Commands From

* {2} [FiloSottile/age/doc/age.1.ronn](https://github.com/FiloSottile/age/blob/main/doc/age.1.ronn)
* {4} [FiloSottile/age/doc/age-keygen.1.ronn](https://github.com/FiloSottile/age/blob/main/doc/age-keygen.1.ronn)

## Tutorials

* {3} [How to Encrypt and Decrypt Files and Data With Age - Part IV](https://tech.serhatteker.com/post/2022-12/encrypt-and-decrypt-files-with-ssh-part-4/)

## YouTube Tutorials

* {5} [Age File Encryption Tool - Installation Process on Windows, Linux - Github BY Tech Namit](https://www.youtube.com/watch?v=1s0y1p3A3XM)
