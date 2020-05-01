# ca_expiry_check


#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with ca_expiry_check](#setup)
    * [Beginning with ca_expiry_check](#beginning-with-ca_expiry_check)
3. [Usage - Configuration options and additional functionality](#usage)
5. [Development - Guide for contributing to the module](#development)

## Description

This Module Provides facts and a class that are designed to inform and notify in the instance the Puppet CA is due to expire 

## Setup

### Beginning with ca_expiry_check

This Module Provides 2 Facts

ca_exp_seconds - the time in seconds between now and expiration time

ca_exp_date - The date the CA Expires

The Facts are confined to run only on systems running a Puppet CA

## Usage

The Facts can be used for direct consumption by monitoring tools such as splunk.

Alernativly assigning the class ca_expiry_check to nodes running a Puppet CA, Will "Notify" on Each Puppet run as soon as the certificate expiry is within a designated window.

This window by default is 90 days, but is configurabel through the use of the "alertwindow" parameter which takes an integer representing the desired alert window in seconds




## Development



