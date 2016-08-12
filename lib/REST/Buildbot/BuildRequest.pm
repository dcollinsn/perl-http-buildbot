package REST::Buildbot::BuildRequest;

use strict;
use warnings;
use Moose;

has 'builderid'           => (is => 'rw', isa => 'Int');
has 'buildrequestid'      => (is => 'rw', isa => 'Int');
has 'buildsetid'          => (is => 'rw', isa => 'Int');
has 'claimed_at'          => (is => 'rw', isa => 'Maybe[Int]');
has 'claimed_by_masterid' => (is => 'rw', isa => 'Maybe[Int]');
has 'complete_at'         => (is => 'rw', isa => 'Maybe[Int]');
has 'priority'            => (is => 'rw', isa => 'Int');
has 'results'             => (is => 'rw', isa => 'Int');
has 'submitted_at'        => (is => 'rw', isa => 'Int');
has 'claimed'             => (is => 'rw', isa => 'Bool');
has 'complete'            => (is => 'rw', isa => 'Bool');
has 'waited_for'          => (is => 'rw', isa => 'Bool');

=head1 NAME

REST::Buildbot::BuildRequest - The great new REST::Buildbot::BuildRequest!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use REST::Buildbot::BuildRequest;

    my $foo = REST::Buildbot::BuildRequest->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

sub function1 {
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Dan Collins, C<< <DCOLLINS at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-rest-buildbot at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=REST-Buildbot>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc REST::Buildbot::BuildRequest


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=REST-Buildbot>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/REST-Buildbot>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/REST-Buildbot>

=item * Search CPAN

L<http://search.cpan.org/dist/REST-Buildbot/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2016 Dan Collins.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see L<http://www.gnu.org/licenses/>.


=cut

1; # End of REST::Buildbot::BuildRequest
