#!/usr/bin/awk -f
function fc(num) {
    f = 1;
    for (i=1; i<num; f *= ++i)
        ;
#        print i, " faktorial : ", f;
#    print i, " faktorial : ", f;

    return f;
}

function variacia(k,n) {
    m=fc(n)/fc(n-k);
    return m;
}

function printvar(k,n,m) {
    s=365*24*60*60  # pocet sekund v roku
    vv = 13.798e9   # doba trvania vesmiru
    doba = 100      # cas v sekundach na zadanie seedu
    trvanie = doba*m/s
    nasobok = trvanie/vv

    printf("Uhadnutie poradia %d slov z %d\n", k, n);
    printf("* treba vyskusat %s moznosti\n", printfract(m));
    #printMil( mil )
    printf("* trvalo by to asi %s rokov\n", printfract(trvanie));
    printf("\033[0;32m* alebo %s nasobkov veku vesmiru\033[0m\n", printfract(nasobok));
}

function printmulty(d,r) {
    printf(Cyan);
    printf("\nPridat %d navyse znamena %\047.f krat dlhsie hadat\n", d, r);
    printf(Color_Off);
}

function log2(r){

    return log(r)/log(2)
}

function ceil(valor)
{
  return (valor == int(valor)) ? valor : int(valor)+1
}

function printfract(r) {
    zcel=int(r);
    zzlom=(r-zcel);
    
    if ( zcel <= 1 && zzlom > 0.0 )
    {
        menovatel = int(ceil(log2(1/zzlom)))

        return sprintf("%d/%\047d", r*2^menovatel, 2^menovatel)  
    }       
    else
    {
        # return sprintf("BIG")
        if ( r < 10000000 )
            return sprintf(" %\047d ", zcel)
        else
            return sprintf(" %\0479.3G", r)
    }
    
}

function printcol(sep,horiz,col) {
    printf(sep horiz)
    for (j = 0; j< col; j++){
        printf(sep horiz)
    }
}

function printusage() {
    printf(Green);

    printf("Pouzitie:\n\t %s pocetPlatnychSlov pocetCelkom zvysPocetCelkom\n", ENVIRON["_"]);
    printf("\tpocetPlatnychSlov (%d) nesmie byt vacsi ako pocetCelkom (%d)\n", ARGV[1], ARGV[2]);
    printf("\tpriklad: %s 5 5 1\n", ENVIRON["_"]);

        printf("\tPočet možných kľúčov: %G\n", 256^32);
        printf("\tPočet možných kľúčov: %G\n", 2^160); 
        #There are exactly 2^160 possible addresses as long as we keep using RIPE-MD160. 2^160 is 1,461,501,637,330,902,918,203,684,832,716,283,019,655,932,542,976.
        printf("\tTrafit nahodne: %G\n", 2^32);
}

function printLeftCulomn( ind ) {
    printf(Yellow);
    printf("%8d  |", ind)
    printf(Color_Off);
}


function printRow( ind ) {
    printMil( variacia( ind, ind +0) );
    for (j = 0; j< 6; j++)
        printMil( variacia(ind,ind+2^j) )
    printMil( variacia(ind,60) )
    print ""
}

function printMil( mil ) {
    if ( mil < 1E7)
        printf("%\04710d|", mil );
    else
        printf("%\04710.4G|", mil );
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
    ColumnSep="__________"
    EmptySep="          "
    
    if ( ARGC > 1 && n >= k ){
        m1 = variacia(k,n)
        printvar(k,n,m1)    
        if ( d > 0){
            m2=variacia(k,n+d);
            printvar(k,n+d,m2);
            printmulty(d,m2/m1);
         }    
    }
    else{
        printusage();

        printf(Yellow);
        printcol(ColumnSep, " ",8)
        printf("\npočet Slov|faktorial |")
        
        printcol(EmptySep,"|",6)
        printf("\n    (k)   | n=k      |");
        for (j = 0; j< 6; j++)
            printf(" n= k+%3d |",2^j )
        printf(" n=k+%3d  |\n",36 )
        
        printcol(ColumnSep , "|",8)
        printf(Color_Off);
    
        print             
        for ( ind = 1; ind < 10 ; ind++ ){
            printLeftCulomn( ind )
            printRow( ind )
        }
        for ( ind = 10; ind < 30 ; ind+=2 ){
            printLeftCulomn( ind )
            printRow( ind )   
        }
        for ( ind = 30; ind < 100 ; ind+=10 ){
            printLeftCulomn( ind )
            printRow( ind )   
        }
    }
}

	
