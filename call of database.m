con=database ('test','root','smart1999');
curs=exec(conn,'SELECT* FROM text');
curs=exec(con,'SELECT* FROM text');
curs=fetch(curs);
curs.data