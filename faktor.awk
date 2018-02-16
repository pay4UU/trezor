#!/usr/bin/awk -f
function fc(num) {
    f = 1;
    for (i=1; i<num; f *= ++i)
        printf("faktorial %d : %\047d moznosti\n", i, f)
    printf("faktorial %d : %\047d moznosti\n", i, f)
    return f;
}
BEGIN {
    m=fc(ARGV[1])

    printf("\n%\047d moznosti\n", m)
}
