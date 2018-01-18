#!/usr/bin/awk -f
function fc(num) {
    f = 1;
    for (i=1; i<num; f *= ++i)
        print i, " faktorial : ", f;
    print i, " faktorial : ", f;
    return f;
}
BEGIN {
    m=fc(ARGV[1])

    printf("\n%\047d moznosti\n", m)
    printf("%\04710.10g rokov\n", m/365/24/60/60*10)
}
