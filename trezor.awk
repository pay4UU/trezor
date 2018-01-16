#!/usr/bin/awk -f
function fc(num) {
    f = 1;
    for (i=1; i<num; f *= ++i)
        ;
#        print i, " faktorial : ", f;
#    print i, " faktorial : ", f;

    return f;
}

function var(k,n,s) {
    m=fc(n)/fc(n-k);
    return m;
}

function printvar(k,n,m,s) {
    vv = 13.798e9

    printf("Uhadnutie poradia %d slov z %d\n", k, n);
    printf("* treba vyskusat %\047.0f moznosti (%1.2e)\n", m, m);
    printf("* trvalo by to asi %\0471.2f rokov (%1.2e)\n", 10*m/s, 10*m/s);
    printf("\033[0;32m* alebo %\047.1f nasobkov veku vesmiru (%1.2e)\033[0m\n", 10*m/s/vv, 10*m/s/vv);
}

function printmulty(d,r) {
    printf(Cyan);
    printf("\nPridat %d navyse znamena %\047.f krat dlhsie hadat\n", d, r);
    printf(Color_Off);
}

function printcol(sep) {
    printf(sep)
    printf(sep)
    for (j = 0; j< 7; j++){
        printf(sep)
        printf(sep)
    }
}

BEGIN {
    k=ARGV[1];
    n=ARGV[2]?ARGV[2]:ARGV[1];
    d=ARGV[3];

    Red="\033[0;31m"          # Red
    Cyan="\033[1;31m"
    Green="\033[0;32m"        # Green
    Yellow="\033[0;33m"       # Yellow
    Color_Off="\033[0m"       # Text Reset
    BBlack="\033[1;30m"
    BWhite="\033[1;37m"       # White

    
    ThouSep=""
    ColumnSep="________"

    if ( ARGC > 1 && n >= k ){
        s=365*24*60*60;
        m1 = var(k,n,s)
        printvar(k,n,m1,s)    
        if ( d > 0){
            m2=var(k,n+d,s);
            printvar(k,n+d,m2,s);
            printmulty(d,m2/m1);
 #           printf("zaokruhlene %\047.f krat dlhsie \n",fc(n+d)/fc(n)/fc(d));
        }    
    }
    else{
        printf(Green);

        printf("Pouzitie:\n\t %s pocetPlatnychSlov pocetCelkom zvysPocetCelkom\n", ENVIRON["_"]);
        printf("\tpocetPlatnychSlov (%d) nesmie byt vacsi ako pocetCelkom (%d)\n", ARGV[1], ARGV[2]);
        printf("\tpriklad: %s 5 5 1\n", ENVIRON["_"]);

        printf(Yellow);
        printcol(ColumnSep)
        printf("\npočet\t\tfakt\t\nSlov(k)\t\tn=k");
        for (j = 0; j< 6; j++)
            printf("\t\tn=k+%d",2^j )
        print
        printcol(ColumnSep)
        printf(Color_Off);
        print             
        for ( ind = 1; ind < 10 ; ind++ ){
            printf("%2d|\t%\04712.10G\t", ind, var( ind, ind +0, 0) );
            for (j = 0; j< 6; j++)
                printf("%\04712.10G\t",var(ind,ind+2^j,0) )
            print ""
        }

        for ( ind = 10; ind < 30 ; ind+=2 ){
            printf("%2d|\t%\04710.10G\t", ind, var( ind, ind +0, 0) );
            for (j = 0; j< 6; j++){
                if ( ind == 24 )
                    printf(BWhite)
                printf("%\04710.10G\t",var(ind,ind+2^j,0) )
                printf(Color_Off);
            }
            print ""
        }
        print
    }
}

	
