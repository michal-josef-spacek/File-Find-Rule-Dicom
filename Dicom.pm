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
