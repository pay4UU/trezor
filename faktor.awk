#!/usr/bin/awk -f
function fc(num) {
    f = 1;
    for (i=1; i<num; f *= ++i)
        printf("faktorial %d : %\047d moznosti\n", i, f)
    printf("faktorial %d : %\047d moznosti\n", i, f)
    return f;
}
BEGIN {
    s=365*24*60*60  # pocet sekund v roku
    vv = 13.798e9   # doba trvania vesmiru
    doba = 100

    m=fc(ARGV[1])
    printf("\n%\047d moznosti", m)
    printf("\n%\047d rokov\n", 100*m/s)
}
