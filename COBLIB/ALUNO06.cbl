       IDENTIFICATION DIVISION.
	   PROGRAM-ID.
	       ALUNO06.
	   AUTHOR.
	       PHILIPP.
	  ***************************************
	  *    CALCULAR SALDO DE INVESTIMENTO   *
	  ***************************************
	  *
	   ENVIRONMENT DIVISION.
	   CONFIGURATION SECTION.
	   SPECIAL-NAMES.
	       DECIMAL-POINT IS COMMA.
	  *
	   DATA DIVISION.
	   WORKING-STORAGE SECTION.
	   77  DEPOSITO       PIC 9(5)V99      VALUE ZEROS.
	   77  PRAZO          PIC 999          VALUE ZEROS.
	   77  TAXA           PIC 9V99         VALUE ZEROS.
	   77  SALDO          PIC 9(7)V99      VALUE ZEROS.
	   77  SALDO-EDIT     PIC Z.ZZZ.ZZ9,99 VALUE ZEROS.
	   77  RENDA          PIC 9(5)V99      VALUE ZEROS.
	   77  MES            PIC 999          VALUE ZEROS.
	  *
	   PROCEDURE DIVISION.
	   UNICA SECTION.
	   INICIO.
		   ACCEPT DEPOSITO FROM SYSIN.
		   ACCEPT PRAZO    FROM SYSIN.
		   ACCEPT TAXA     FROM SYSIN.
		   PERFORM CALCULO PRAZO TIMES.
		   MOVE SALDO      TO SALDO-EDIT.
		   DISPLAY 'SALDO APOS '    PRAZO
				   ' MESES = '      SALDO-EDIT.
		   STOP RUN.
	   CALCULO.
           COMPUTE RENDA = SALDO * TAXA / 100.
           ADD RENDA     TO SALDO.
           ADD DEPOSITO  TO SALDO.
           ADD 1         TO MES.
           MOVE SALDO    TO SALDO-EDIT.
           DISPLAY 'SALDO NO MES '  MES
                   ' = '            SALDO-EDIT.		   