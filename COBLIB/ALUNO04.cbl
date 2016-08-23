       IDENTIFICATION DIVISION.
	   PROGRAM-ID.
	       ALUNO04.
	   AUTHOR.
	       PHILIPP.
	  ***************************************
	  *     ACHAR MAIOR DE 3 NUMEROS        *
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
		   IF N1 > N2
		       IF N1 > N3
			       DISPLAY 'O MAIOR NUMERO EH ' N1
			   ELSE
			       DISPLAY 'O MAIOR NUMERO EH ' N3
			   END-IF
		   ELSE
		       IF N2 GREATER N3
                   DISPLAY 'O MAIOR NUMERO EH ' N2
			   ELSE
			       DISPLAY 'O MAIOR NUMERO EH ' N3
			   END-IF
           END-IF.			   
		   STOP RUN.