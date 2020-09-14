use ACME::EyeDrops qw(sightly);
print sightly( { Shape       => 'window',
                 Gap         => 1,
                 SourceFile  => 'e17_source.pl',
                 Regex       => 1 } );
