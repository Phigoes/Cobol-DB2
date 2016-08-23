       IDENTIFICATION DIVISION.
	   PROGRAM-ID.
	       ALUNO03.
	   AUTHOR.
	       PHILIPP.
	  ***************************************
	  *     OPERACOES ARITMERICAS           *
	  ***************************************
	  *
	   ENVIRONMENT DIVISION.
	   CONFIGURATION SECTION.
	   SPECIAL-NAMES.
	       DECIMAL-POINT IS COMMA.
	  *
	   DATA DIVISION.
	   WORKING-STORAGE SECTION.
	   77  N1             PIC 99V99        VALUE ZEROS.
	   77  N2             PIC 99V99        VALUE ZEROS.
	   77  N3             PIC S999V99      VALUE ZEROS.
	   77  N1-EDIT        PIC Z9,9         VALUE ZEROS.
	   77  N2-EDIT        PIC Z9,9         VALUE ZEROS.
	   77  N3-EDIT        PIC -ZZ9,9       VALUE ZEROS.
	   77  N4             PIC 99           VALUE ZEROS.
	   77  N5             PIC 99           VALUE ZEROS.
	   77  N6             PIC 99           VALUE ZEROS.
	   77  N7             PIC 99           VALUE ZEROS.
	  *
	   PROCEDURE DIVISION.
	   UNICA SECTION.
	   INICIO.
		   ACCEPT N1 FROM SYSIN.
		   ACCEPT N2 FROM SYSIN.
		   ACCEPT N4 FROM SYSIN.
		   ACCEPT N5 FROM SYSIN.
		   MOVE   N1 TO N1-EDIT.
		   MOVE   N2 TO N2-EDIT.
	  *	     SOMA USANDO TO (ACUMULAR)
	       MOVE 10 TO N3.
		   ADD N1 N2 TO N3.
		   MOVE N3 TO N3-EDIT.
		   DISPLAY 'A SOMA DE ' N1-EDIT
				   ' COM '      N2-EDIT
				   ' MAIS 10 = ' N3-EDIT.
	  *	     SOMA USANDO GIVING (NAO ACUMULAR)
		   ADD N1 N2 GIVING N3.
		   MOVE N3 TO N3-EDIT.
		   DISPLAY 'A SOMA DE ' N1-EDIT
				   ' COM '      N2-EDIT
				   ' = '        N3-EDIT.	
	  *	     SUBTRACAO
		   SUBTRACT N2 FROM N1 GIVING N3.
		   MOVE N3 TO N3-EDIT.
		   DISPLAY 'A DIFERENCA DE ' N1-EDIT
				   ' E '             N2-EDIT
				   ' = '             N3-EDIT.
	   *	 MULTIPLICACAO
		   MULTIPLY N1 BY N2 GIVING N3 ROUNDED
		       ON SIZE ERROR
			       DISPLAY 'ESTOURO DO RESULTADO DA MULTIPLICACAO'
			   NOT ON SIZE ERROR
		           MOVE N3 TO N3-EDIT.
		           DISPLAY 'O PRODUTO DE ' N1-EDIT
				           ' E '           N2-EDIT
				           ' = '           N3-EDIT.
	       END-MULTIPLY.
	   *	 DIVISAO
		   DIVIDE N1 BY N2 GIVING N3.
		   MOVE N3 TO N3-EDIT.
		   DISPLAY 'A DIVISAO DE ' N1-EDIT
				   ' POR '         N2-EDIT
				   ' = '           N3-EDIT.
       *	 DIVISAO COM RESTO
		   DIVIDE N4 BY N5 GIVING N6 REMAINDER N7.
		   DISPLAY 'A DIVISAO DE ' N4
				   ' POR '         N5
				   ' = '           N6
				   ' COM RESTO = ' N7.
	   *     CALCULAR A MEDIA ENTRE N1 E N2
		   COMPUTE N3 = (N1 + N2) / 2.
		   MOVE N3 TO N3-EDIT.
		   DISPLAY 'A MEDIA DE '   N1-EDIT
		           ' E '           N2-EDIT
				   ' = '           N3-EDIT.
		   STOP RUN.