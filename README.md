# Readme

## Description

This cookbook provisions a installation for the dotcom-v3 marketing QA website. It is configured to enable the 
[dotcom-v3 codebase](https://github.com/flatiron-labs/dotcom-v3) to be deployed via kitchen & capostrano directives.

## Supported Platforms

Ubuntu 16.04

## Usage

### fis-dotcom-v3::default

fis-dotcom-v3 will run on 3 servers, so a run-list like this is necessary:

```yml
{
  platforms:
  - name: ubuntu-16.04

  suites:
  - name: webserver
    run_list:
      - recipe[fis-vagrant::default]
      - recipe[fis-base::default]
      - recipe[sitio-cookbook::default]
    attributes:
}
```
### Kitchen + Vagrant + Berkshelf

We're using test-kitchen, vagrant, and Berkshelf for development:

* Install Gems: gem install berkshelf; gem install test-kitchen; gem install kitchen-vagrant;
* Clone the repo to your local machine.
* Update cookbook versions berkshelf installed: "berks install"
* Change de the pubic-key according to your user into the "kitchen_test_user.json" file.
* Get into the build-cookbook directory.
* Server build-up with kitchen: "kitchen converge".
* Login into the server as deployer user: "ssh -p 2222 deployer@127.0.0.1" or switch into this user after perform "kitchen login" directive.
* Go to the .ssh directory and create a id_rsa file with your private key with security level set to 600.
* Install capistrano gems into your local machine (gem install capistrano; gem install capistrano-ext) and install capistrano: "cap install".
* Proceed with the QA deployment from the build-cookbook directory: "cap qa deploy".
* Get into the server again and reload the apache2 service: "sudo service apache2 reload".

### License and Authors

Author:: Ozone (hello@ozoneops.com)

