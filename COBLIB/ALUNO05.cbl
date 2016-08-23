       IDENTIFICATION DIVISION.
	   PROGRAM-ID.
	       ALUNO05.
	   AUTHOR.
	       PHILIPP.
	  ***************************************
	  *    ACHAR O NOME DA MAIOR VARIAVEL   *
	  ***************************************
	  *
	   ENVIRONMENT DIVISION.
	   CONFIGURATION SECTION.
	   SPECIAL-NAMES.
	       DECIMAL-POINT IS COMMA.
	  *
	   DATA DIVISION.
	   WORKING-STORAGE SECTION.
	   77  N1             PIC 99        VALUE ZEROS.
	   77  N2             PIC 99        VALUE ZEROS.
	   77  N3             PIC 99        VALUE ZEROS.
	  *
	   PROCEDURE DIVISION.
	   UNICA SECTION.
	   INICIO.
		   ACCEPT N1 FROM SYSIN.
		   ACCEPT N2 FROM SYSIN.
		   ACCEPT N3 FROM SYSIN.
		   DISPLAY 'NUMEROS INFORMADOS : ' N1
		           ', '                    N2
                   ' E '				   N3.
		   EVALUATE TRUE
		       WHEN N1 > N2 AND N1 > N3
			       DISPLAY 'A MAIOR VARIAVEL EH N1'
			   WHEN N2 > N1 AND N2 > N3
				   DISPLAY 'A MAIOR VARIAVEL EH N2'
			   WHEN N3 > N1 AND N3 > N2
				   DISPLAY 'A MAIOR VARIAVEL EH N3'
			   WHEN N1 = N2 AND N1 > N3
			       DISPLAY 'AS MAIORES VARIAVEIS SAO N1 E N2'
			   WHEN N1 = N3 AND N1 > N2
			       DISPLAY 'AS MAIORES VARIAVEIS SAO N1 E N3'
			   WHEN N2 = N3 AND N2 > N1
			       DISPLAY 'AS MAIORES VARIAVEIS SAO N2 E N3'
			   WHEN OTHER
			       DISPLAY 'AS MAIORES VARIAVEIS SAO N1, N2 E N3'
		   END-EVALUATE.		   
		   STOP RUN.