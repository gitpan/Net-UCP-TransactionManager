package Net::UCP::TransactionManager;

use 5.008007;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);
our @EXPORT = qw();

our $VERSION = '0.01';

use constant HIGHEST_NBR => 99;
sub new { bless({}, shift())->_init(@_); }

sub next_trn {
    my $self = shift;

    $self->{TRN}++;
    ($self->{TRN} > HIGHEST_NBR) && do{ $self->{TRN} = 0 };
}

sub reset_trn {
    $_[0]->{TRN} = 0;
}

sub _init {
    $_[0]->reset_trn();
    $_[0];
}

1;
__END__

=head1 NAME

Net::UCP::TransactionManager - Perl extension to manage UCP session transaction numbers 

=head1 SYNOPSIS

  use Net::UCP::TransactionManager;

=head1 DESCRIPTION

    This module is used by Net::UCP - see Net::UCP Module 

=head2 EXPORT

None

=head1 SEE ALSO
 
  Net::UCP

=head1 AUTHOR

Marco Romano, E<lt>nemux@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Marco Romano

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.

=cut
