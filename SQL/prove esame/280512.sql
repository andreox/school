CREATE TABLE RISTORANTI( CODICE VARCHAR(3),
                            NOME VARCHAR(20),
                            INDIRIZZO VARCHAR(50),
                            QUARTIERE VARCHAR(10),
                            CONSTRAINT PK_RIS PRIMARY KEY(CODICE)) ;

CREATE TABLE PRENOTAZIONI( NOMINATIVOUTENTE VARCHAR(40),
                            RISTORANTE VARCHAR(3),
                            DATAPR DATE,
                            ORAARRIVO INTEGER , 
                            CONSTRAINT FK_PR FOREIGN KEY(RISTORANTE) REFERENCES RISTORANTI(CODICE),
                            CONSTRAINT PK_PR PRIMARY KEY( NOMINATIVOUTENTE, RISTORANTE, DATAPR )) ;*/
                            
INSERT INTO RISTORANTI VALUES( '001' , 'ORUSS' , 'VIA CAMALDOLI' , 'CAMALDOLI' ) ;
INSERT INTO RISTORANTI VALUES( '002' , 'DILEMMA' , 'VIA AVERSA' , 'AVERSA' ) ;
INSERT INTO RISTORANTI VALUES( '003' , 'GIANNI' , 'VIA GIANNI' , 'CAMALDOLI'  ) ;
INSERT INTO PRENOTAZIONI VALUES( 'ALESSIO ANDREOZZI' , '001' , '27-JUL-90' , 12 ) ;
INSERT INTO PRENOTAZIONI VALUES( 'VINCENZO MOSCATO' , '001' , '27-JUL-90' , 12 ) ;
INSERT INTO PRENOTAZIONI VALUES( 'PINO MAURO' , '001' , '27-JUL-90' , 12 ) ;
INSERT INTO PRENOTAZIONI VALUES( 'MARIO MINOCCHI' , '002' , '27-JUL-90' , 12 ) ;
INSERT INTO PRENOTAZIONI VALUES( 'MARIO MINOCCHIO' , '002' , '27-JUL-90' , 12 ) ;
INSERT INTO PRENOTAZIONI VALUES( 'MARIO ROSSI' , '003' , '27-JUL-90' , 12 ) ;
INSERT INTO PRENOTAZIONI VALUES( 'ALESSIO ANDREOZZI' , '002' , '27-JUL-90' , 12 ) ;
INSERT INTO PRENOTAZIONI VALUES( 'VINCENZO MOSCATO' , '003' , '27-JUL-90' , 12 ) ;

SELECT P.NOMINATIVOUTENTE, COUNT(*) AS NUM_PRENOTAZIONI
FROM RISTORANTI R, PRENOTAZIONI P
WHERE R.CODICE = P.RISTORANTE AND P.NOMINATIVOUTENTE = 'VINCENZO MOSCATO'
GROUP BY P.NOMINATIVOUTENTE ;

CREATE VIEW VISTA AS SELECT R.QUARTIERE AS NOME_Q , COUNT(*) AS NUM_PRENOTAZIONI
FROM RISTORANTI R, PRENOTAZIONI P
WHERE R.CODICE = P.RISTORANTE
GROUP BY R.QUARTIERE ;

SELECT R.QUARTIERE , COUNT(*) AS NUMP
FROM RISTORANTI R, PRENOTAZIONI P
WHERE R.CODICE = P.RISTORANTE
GROUP BY R.QUARTIERE
HAVING COUNT(*) = ( SELECT MAX(NUM_PRENOTAZIONI) FROM VISTA ) ;
