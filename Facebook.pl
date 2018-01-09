#!/usr/bin/perl

use strict;
use Win32::IEAutomation;
my $VERSION = "1.0";

if($#ARGV != 1)
	{
		print "\n";
		print "************************************************************\n";
		print "Usage: Facebook.pl <username> <password>\n";
		print "Facebook.pl - Login to facebook account with Internet Explorer.\n";
		print "- Chetan Giridhar \n";
		print "************************************************************\n";
		exit(0);
	}
        
# Creating new instance of Internet Explorer.
my $ie = Win32::IEAutomation->new( visible => 1, maximize => 1);
        
# Navigating to www.facebook.com.
$ie->gotoURL('http://www.facebook.com');
        
my $user = $ARGV[0];
my $password = $ARGV[1];

# Using 'name:' option ( <input type="text" name="username" .......> )
$ie->getTextBox('name:', "email")->SetValue($user);
$ie->getTextBox('name:', "pass")->SetValue($password);


# Finding button and clicking it
# using 'caption:' option
$ie->getButton('caption:', "Login")->Click;

=head1 NAME

Facebook.pl - Utility Perl Script to log in to facebook account using Internet Explorer 7.0 browser.

=head1 DESCRIPTION

This script helps users to login to their facebook account using IE browser.

=head1 README

Facebook.pl - Utility Perl Script to log in to facebook account using Internet Explorer.
This script helps users to login to their facebook account using IE browser.

I wrote this script so that I need not manually write my username and password to login to facebook.
Please email me at cjgiridhar@gmail.com with feature requests and bugs. 
Enjoy!

Facebook.pl is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License v3 as published by
the Free Software Foundation; 

Facebook.pl is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

=head1 PREREQUISITES

This script requires the Win32::IEAutomation module.
Internet Explorer browser.
Windows XP and above OS.

=head1 COREQUISITES

Win32::IEAutomation.

=pod OSNAMES

Windows XP/ Vista and Win7. IE7.0.

=pod SCRIPT CATEGORIES

Fun/Educational

=cut