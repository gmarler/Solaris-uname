package Solaris::uname;

use strict;
use warnings;

use XSLoader;

# VERSION

# ABSTRACT: A Perl interface to uname(2) 

=func uname()

Returns a hashref with the following keys:

=for :list
* sysname    (equivalent of calling uname -s)
* nodename   (equivalent of calling uname -n)
* release    (equivalent of calling uname -r)
* version    (equivalent of calling uname -v)
* machine    (equivalent of calling uname -m)

=cut

XSLoader::load('Solaris::uname', $VERSION);

1;
