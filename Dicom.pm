package File::Find::Rule::Dicom;

# Pragmas.
use base qw(File::Find::Rule);
use strict;
use warnings;

# Modules.
use Dicom::File::Detect qw(dicom_detect_file);

# Version.
our $VERSION = 0.01;

# Detect DICOM file.
sub File::Find::Rule::dicom_file {
	my $file_find_rule = shift;
	my $self = $file_find_rule->_force_object;
	return $self->file->exec(sub{
		my $file = shift;
		return dicom_detect_file($file);
	});
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

File::Find::Rule::Dicom - Common rules for searching for DICOM things.

=head1 SYNOPSIS

 use File::Find::Rule;
 use File::Find::Rule::Dicom;
 my @files = File::Find::Rule->dicom_file->in($dir);

=head1 SUBROUTINES

=over 8

=item C<dicom_file()>

 The C<dicom_file()> rule detect DICOM files by DICM magic string.

=back

=head1 ERRORS

 dicom_file():
         From Dicom::File::Detect::dicom_detect_file():
                 Cannot close file '%s'.
                 Cannot open file '%s'.

=head1 EXAMPLE

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use File::Find::Rule;
 use File::Find::Rule::Dicom;

 # Arguments.
 if (@ARGV < 1) {
         print STDERR "Usage: $0 dir\n";
         exit 1;
 }
 my $dir = $ARGV[0];

 # Print all DICOM files in directory.
 foreach my $file (File::Find::Rule->dicom_file->in($dir)) {
         print "$file\n";
 }

 # Output like:
 # Usage: qr{[\w\/]+} dir

=head1 DEPENDENCIES

L<Dicom::File::Detect>,
L<File::Find::Rule>.

=head1 SEE ALSO

L<File::Find::Rule>.

=head1 REPOSITORY

L<https://github.com/tupinek/File-Find-Rule-Dicom>

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

BSD license.

=head1 VERSION

0.01

=cut
