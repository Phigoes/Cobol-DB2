       IDENTIFICATION DIVISION.
	   PROGRAM-ID.
	       ALUNO13.
	   AUTHOR.
	       PHILIPP.
	  *********************************************************
	  *    EXIBIR TOTAL DE VENDAS POR MES(3 NIVEIS DE TABELAS)*
	  *********************************************************
	  *
	   ENVIRONMENT DIVISION.
	   CONFIGURATION SECTION.
	   SPECIAL-NAMES.
	       DECIMAL-POINT IS COMMA.
	   INPUT-OUTPUT SECTION.
	   FILE-CONTROL.
	       SELECT ARQ-VENDAS3N ASSIGN TO VENDAS3N
		       FILE STATUS IS WK-FS-VENDAS3N.
	  *
	   DATA DIVISION.
	   FILE SECTION.
	   FD   ARQ-VENDAS3N
	        RECORDING MODE IS F.
	   01  REG-VENDAS3N.
	       05 FD-VENDEDOR           PIC 99.
		   05 FD-ESTADO             PIC XX.
		   05 FD-MES                PIC 99.
	       05 FD-NOTA               PIC 9(6).   
		   05 FD-VALOR              PIC 9(6)V99.
	   WORKING-STORAGE SECTION.
	   77  WK-FS-VENDAS3N    PIC XX           VALUE SPACES.
	   01  TABELAS.
	       02 TOT-VENDEDOR              OCCURS 2 TIMES.
		      03 TOT-ESTADO             OCCURS 3 TIMES.
			     04 TOT-MES             OCCURS 4 TIMES.
				    05 TOTAL        PIC 9(8)V99.
	   77  WK-TOT-EDIT     PIC ZZ.ZZZ.ZZ9,99  VALUE ZEROS.
	   77  WK-VENDEDOR     PIC 99             VALUE ZEROS.
	   77  WK-ESTADO       PIC 99             VALUE ZEROS.
	   77  WK-MES          PIC 99             VALUE ZEROS.
	  *
	   PROCEDURE DIVISION.
	   000-PRINCIPAL SECTION.
	   001-PRINCIPAL.
	       PERFORM 101-INICIAR.
		   PERFORM 201-PROCESSAR UNTIL WK-FS-VENDAS3N = '10'.
		   PERFORM 901-FINALIZAR.
		   STOP RUN.
	  ***************************************	   
	   100-INICIAR SECTION.
	   101-INICIAR.
	       OPEN INPUT ARQ-VENDAS3N.
		   EVALUATE WK-FS-VENDAS3N
		       WHEN '00'
			       PERFORM 301-LER-VENDAS3N
			   WHEN '35'
				   DISPLAY 'ARQUIVO VENDAS3N NAO ENCONTRADO'
				   MOVE 12 TO RETURN-CODE
				   STOP RUN
			   WHEN OTHER
			       DISPLAY 'ERRO ' WK-FS-VENDAS3N
				           ' NO COMANDO OPEN VENDAS3N'
				   MOVE 12 TO RETURN-CODE
				   STOP RUN
		   END-EVALUATE.
		   INITIALIZE TABELAS.
	  ***************************************
	   200-PROCESSAR SECTION.
	   201-PROCESSAR.
	       PERFORM 202-FD-WK-ESTADO.
	       ADD FD-VALOR  TO TOTAL(FD-VENDEDOR, WK-ESTADO, FD-MES).
		   PERFORM 301-LER-VENDAS3N.
	   202-FD-WK-ESTADO.
	       EVALUATE FD-ESTADO
		       WHEN 'SP'
			       MOVE 01  TO WK-ESTADO
			   WHEN 'RJ'
			       MOVE 02  TO WK-ESTADO
			   WHEN 'MG'
			       MOVE 03  TO WK-ESTADO
			   WHEN OTHER
			       DISPLAY 'ESTADO ' FD-ESTADO ' INVALIDO'
				   STOP RUN
		   END-EVALUATE.
	  ***************************************
	   300-LER-VENDAS3N SECTION.
	   301-LER-VENDAS3N.
	       READ ARQ-VENDAS3N.
		   EVALUATE WK-FS-VENDAS3N
		       WHEN '00'
			       CONTINUE
			   WHEN '10'
			       CONTINUE
			   WHEN OTHER
			       DISPLAY 'ERRO ' WK-FS-VENDAS3N
				           ' NO COMANDO READ VENDAS3N'
				   MOVE 12 TO RETURN-CODE
				   STOP RUN
           END-EVALUATE.
      ***************************************
       900-FINALIZAR SECTION.
       901-FINALIZAR.
	       PERFORM VARYING WK-VENDEDOR FROM 1 BY 1 
		                   UNTIL WK-VENDEDOR > 2
		       PERFORM VARYING WK-ESTADO FROM 1 BY 1 
		                       UNTIL WK-ESTADO > 3
			       PERFORM VARYING WK-MES FROM 1 BY 1 
		                           UNTIL WK-MES > 4
					  PERFORM 902-WK-FD-ESTADO
		              MOVE TOTAL(WK-VENDEDOR, WK-ESTADO, WK-MES)
			               TO WK-TOT-EDIT
			          DISPLAY 'TOTAL DE VENDAS DO VENDEDOR ' WK-VENDEDOR
						      ' NO ESTADO '                  FD-ESTADO
							  ', NO MES '                    WK-MES
							  ' = '                          WK-TOT-EDIT
				   END-PERFORM
			   END-PERFORM
		   END-PERFORM.
		   CLOSE ARQ-VENDAS3N.
	   902-WK-FD-ESTADO.
	       EVALUATE WK-ESTADO
		       WHEN 01
			       MOVE 'SP' TO FD-ESTADO
			   WHEN 02
			       MOVE 'RJ' TO FD-ESTADO
			   WHEN 03
			       MOVE 'MG' TO FD-ESTADO
		   END-EVALUATE.