use strict;
use warnings;
use Test::More 0.98;
use lib '../lib', 'lib';
#
use Termbox qw[:all];
#
my @chars = split //, 'hello, world!';
my $code  = tb_init();
ok !$code, 'termbox init';
ok tb_select_output_mode(TB_OUTPUT_NORMAL);
tb_clear_screen();
my @rows = (
    [ TB_WHITE,   TB_BLACK ],
    [ TB_BLACK,   TB_DEFAULT ],
    [ TB_RED,     TB_GREEN ],
    [ TB_GREEN,   TB_RED ],
    [ TB_YELLOW,  TB_BLUE ],
    [ TB_MAGENTA, TB_CYAN ]
);
for my $row ( 0 .. $#rows ) {
    for my $col ( 0 .. $#chars ) {
        tb_char( $col, $row, @{ $rows[$row] }, ord $chars[$col] );
    }
}
tb_render();
diag 'Hold it for a second...';
sleep 1;
tb_shutdown();
pass 'That works!';
done_testing;
