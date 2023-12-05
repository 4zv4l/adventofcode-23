#!/usr/bin/perl

while (<>)
{
    my (%win, %get, %same);

    $_ =~ qr{[:]([^|]+)(?{ @win{$^N =~ /(\d+)/g} = () })[|]};
    $_ =~ qr{[|](.+)(?{ @get{$^N =~ /(\d+)/g} = () })$};

    @same{ grep { exists $get{$_} } keys %win } = ();

    $part1 += int 2**((scalar keys %same)-1);

    my $value = scalar keys %same;
    for (1..++$copies{$.})
    {
        @copies{$.+1..$.+$value} = map {$_+1} @copies{$.+1..$.+$value};
    }
    $part2 += $copies{$.};
}

print "part1: $part1\n";
print "part2: $part2\n";
