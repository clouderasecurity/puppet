Description
===========

This is a puppet module that will install and configure Gazzang's zNcrypt encryption utility.

Requirements
============

Platform
--------

* Debian, Ubuntu
* CentOS, Red Hat
* SLES, OpenSUSE

Tested on:

* Ubuntu 12.04
* CentOS 6.4

Puppet Module Dependencies
--------------------------

For Ubuntu and Debian support:

* puppetlabs-apt

For SUSE support:

* darin-zypprepo

Connectivity
------------

An internet connection is required for package resolution.

Usage
=====

There are a couple of parameters that need to be changed prior to running:

zTrustee Registration/Activation Options
----------------------------------------

$keyserver = ""

This will be the zTrustee Key Management server that the zNcrypt client will attempt to register with.

$organization = ""
$authorization = ""

These are the credentials passed to the keyserver upon registration. These are generated server-side, and should be kept secret. 

If you do not know where to find your `organization` or `authorization` code, then please contact support@gazzang.com.

zNcrypt Configuration Options
-----------------------------

$passphrase = ""

$passphrase2 = ""

These will be the passphrases used to control access to the encrypted data. These passwords are hard-coded for testing purposes, but should be changed and randomized per-machine for production environments.

$zncrypt_prefix = "/var/lib/zncrypt"

$zncrypt_mount = "$zncrypt_prefix/encrypted"

$zncrypt_storage = "$zncrypt_prefix/.private"

These are the directories that will hold the zNcrypt encrypted file system.

License and Author
==================

Copyright:: 2014 Gazzang, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Special Thanks
==============

- Darin Perusich (deadpoint)

