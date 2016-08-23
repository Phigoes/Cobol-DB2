       IDENTIFICATION DIVISION.
	   PROGRAM-ID.
	       ALUNO11.
	   AUTHOR.
	       PHILIPP.
	  ***************************************
	  *    EXIBIR TOTAL DE VENDAS POR MES   *
	  ***************************************
	  *
	   ENVIRONMENT DIVISION.
	   CONFIGURATION SECTION.
	   SPECIAL-NAMES.
	       DECIMAL-POINT IS COMMA.
	   INPUT-OUTPUT SECTION.
	   FILE-CONTROL.
	       SELECT ARQ-VENDAS ASSIGN TO VENDAS
		       FILE STATUS IS WK-FS-VENDAS.
	  *
	   DATA DIVISION.
	   FILE SECTION.
	   FD   ARQ-VENDAS
	        RECORDING MODE IS F.
	   01  REG-VENDAS.
	       05 FD-NOTA               PIC 9(6).
		   05 FD-MES                PIC 99.   
		   05 FD-VALOR              PIC 9(6)V99.
	   WORKING-STORAGE SECTION.
	   77  WK-FS-VENDAS    PIC XX             VALUE SPACES.
	   77  WK-TOT-01       PIC 9(8)V99        VALUE ZEROS.
	   77  WK-TOT-02       PIC 9(8)V99        VALUE ZEROS.
	   77  WK-TOT-03       PIC 9(8)V99        VALUE ZEROS.
	   77  WK-TOT-04       PIC 9(8)V99        VALUE ZEROS.
	   77  WK-TOT-05       PIC 9(8)V99        VALUE ZEROS.
	   77  WK-TOT-06       PIC 9(8)V99        VALUE ZEROS.
   	   77  WK-TOT-07       PIC 9(8)V99        VALUE ZEROS.
	   77  WK-TOT-08       PIC 9(8)V99        VALUE ZEROS.
	   77  WK-TOT-09       PIC 9(8)V99        VALUE ZEROS.
	   77  WK-TOT-10       PIC 9(8)V99        VALUE ZEROS.
	   77  WK-TOT-11       PIC 9(8)V99        VALUE ZEROS.
	   77  WK-TOT-12       PIC 9(8)V99        VALUE ZEROS.
	   77  WK-TOT-EDIT     PIC ZZ.ZZZ.ZZ9,99  VALUE ZEROS.
	   77  WK-MES          PIC 99             VALUE ZEROS.
	  *
	   PROCEDURE DIVISION.
	   000-PRINCIPAL SECTION.
	   001-PRINCIPAL.
	       PERFORM 101-INICIAR.
		   PERFORM 201-PROCESSAR UNTIL WK-FS-VENDAS = '10'.
		   PERFORM 901-FINALIZAR.
		   STOP RUN.
	  ***************************************	   
	   100-INICIAR SECTION.
	   101-INICIAR.
	       OPEN INPUT ARQ-VENDAS.
		   EVALUATE WK-FS-VENDAS
		       WHEN '00'
			       PERFORM 301-LER-VENDAS
			   WHEN '35'
				   DISPLAY 'ARQUIVO VENDAS NAO ENCONTRADO'
				   MOVE 12 TO RETURN-CODE
				   STOP RUN
			   WHEN OTHER
			       DISPLAY 'ERRO ' WK-FS-VENDAS
				           ' NO COMANDO OPEN VENDAS'
				   MOVE 12 TO RETURN-CODE
				   STOP RUN
		   END-EVALUATE.
	  ***************************************
	   200-PROCESSAR SECTION.
	   201-PROCESSAR.
	       EVALUATE FD-MES            
		       WHEN 01
		           ADD FD-VALOR  TO WK-TOT-01
		       WHEN 02
		           ADD FD-VALOR  TO WK-TOT-02
		       WHEN 03
		           ADD FD-VALOR  TO WK-TOT-03
			   WHEN 04
		           ADD FD-VALOR  TO WK-TOT-04
		       WHEN 05
		           ADD FD-VALOR  TO WK-TOT-05
		       WHEN 06
		           ADD FD-VALOR  TO WK-TOT-06
			   WHEN 07
		           ADD FD-VALOR  TO WK-TOT-07
		       WHEN 08
		           ADD FD-VALOR  TO WK-TOT-08
		       WHEN 09
		           ADD FD-VALOR  TO WK-TOT-09
			   WHEN 10
		           ADD FD-VALOR  TO WK-TOT-10
		       WHEN 11
		           ADD FD-VALOR  TO WK-TOT-11
		       WHEN 12
		           ADD FD-VALOR  TO WK-TOT-12
		   END-EVALUATE.
		   PERFORM 301-LER-VENDAS.
	  ***************************************
	   300-LER-VENDAS SECTION.
	   301-LER-VENDAS.
	       READ ARQ-VENDAS.
		   EVALUATE WK-FS-VENDAS
		       WHEN '00'
			       CONTINUE
			   WHEN '10'
			       CONTINUE
			   WHEN OTHER
			       DISPLAY 'ERRO ' WK-FS-VENDAS
				           ' NO COMANDO READ VENDAS'
				   MOVE 12 TO RETURN-CODE
				   STOP RUN
           END-EVALUATE.
      ***************************************
       900-FINALIZAR SECTION.
       901-FINALIZAR.
	       PERFORM VARYING WK-MES FROM 1 BY 1 UNTIL WK-MES > 12
		       EVALUATE WK-MES
			       WHEN 01
				       MOVE WK-TOT-01  TO WK-TOT-EDIT
					   DISPLAY 'TOTAL DE VENDAS DO MES ' WK-MES
					           ' = ' WK-TOT-EDIT
				   WHEN 02
				       MOVE WK-TOT-02  TO WK-TOT-EDIT
					   DISPLAY 'TOTAL DE VENDAS DO MES ' WK-MES
					           ' = ' WK-TOT-EDIT
				   WHEN 03
				       MOVE WK-TOT-03  TO WK-TOT-EDIT
					   DISPLAY 'TOTAL DE VENDAS DO MES ' WK-MES
					           ' = ' WK-TOT-EDIT
				   WHEN 04
				       MOVE WK-TOT-04  TO WK-TOT-EDIT
					   DISPLAY 'TOTAL DE VENDAS DO MES ' WK-MES
					           ' = ' WK-TOT-EDIT
				   WHEN 05
				       MOVE WK-TOT-05  TO WK-TOT-EDIT
					   DISPLAY 'TOTAL DE VENDAS DO MES ' WK-MES
					           ' = ' WK-TOT-EDIT
				   WHEN 06
				       MOVE WK-TOT-06  TO WK-TOT-EDIT
					   DISPLAY 'TOTAL DE VENDAS DO MES ' WK-MES
					           ' = ' WK-TOT-EDIT
				   WHEN 07
				       MOVE WK-TOT-07  TO WK-TOT-EDIT
					   DISPLAY 'TOTAL DE VENDAS DO MES ' WK-MES
					           ' = ' WK-TOT-EDIT
				   WHEN 08
				       MOVE WK-TOT-08  TO WK-TOT-EDIT
					   DISPLAY 'TOTAL DE VENDAS DO MES ' WK-MES
					           ' = ' WK-TOT-EDIT
				   WHEN 09
				       MOVE WK-TOT-09  TO WK-TOT-EDIT
					   DISPLAY 'TOTAL DE VENDAS DO MES ' WK-MES
					           ' = ' WK-TOT-EDIT
				   WHEN 10
				       MOVE WK-TOT-10  TO WK-TOT-EDIT
					   DISPLAY 'TOTAL DE VENDAS DO MES ' WK-MES
					           ' = ' WK-TOT-EDIT
				   WHEN 11
				       MOVE WK-TOT-11  TO WK-TOT-EDIT
					   DISPLAY 'TOTAL DE VENDAS DO MES ' WK-MES
					           ' = ' WK-TOT-EDIT
				   WHEN 12
				       MOVE WK-TOT-12  TO WK-TOT-EDIT
					   DISPLAY 'TOTAL DE VENDAS DO MES ' WK-MES
					           ' = ' WK-TOT-EDIT
			   END-EVALUATE
		   END-PERFORM.
		   CLOSE ARQ-VENDAS.