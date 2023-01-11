use strict;
use warnings;
use Test::More 0.98;
use lib '../lib', 'lib';
#
use Termbox qw[:all];
plan skip_all => 'Need interactive stdin, stderr' unless -t STDIN and -t STDERR;
#
my $code = tb_init();
if ( !$code && Termbox::tb_last_errno() == 6 ) {
    diag 'errno: ' . Termbox::tb_last_errno();
    diag 'error: ' . Termbox::tb_strerror( Termbox::tb_last_errno() );
}
ok !$code, 'termbox init';
my $y = 0;
tb_printf( 0, $y++, TB_GREEN, 0, "hello from termbox" );
tb_printf( 0, $y++, 0,        0, "width=%d height=%d", tb_width(), tb_height() );
tb_printf( 0, $y++, 0,        0, "press any key..." );
tb_present();
diag 'Hold it for a few seconds...';
sleep 3;
tb_shutdown();
pass 'That works!';
done_testing;
