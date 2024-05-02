package AdminScripts::CMS;
use strict;
use warnings;

use MT::Util qw( trim );

sub template_source_footer {
    my ( $cb, $app, $tmpl ) = @_;
    my $plugin = MT->component('AdminScripts');

    my $path = $plugin->get_config_value( 'filepath' );
    $path = MT->config->FilePath if MT->config->FilePath;
    ( $path =  $app->base ) =~ s!https?://!! unless $path;
    $path = trim($path);
    return unless ($path);

    my $position = quotemeta(q{</body>});
    my $plugin_tmpl = File::Spec->catdir( $plugin->path, 'tmpl', 'insert.tmpl' );
    my $insert = qq{<mt:include name="$plugin_tmpl" component="AdminScripts" content="$path">\n};
    $$tmpl =~ s/($position)/$insert$1/;
}

1;