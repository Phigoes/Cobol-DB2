       IDENTIFICATION DIVISION.
	   PROGRAM-ID.
	       ALUNO17.
	   AUTHOR.
	       PHILIPP.
	  *************************************************
	  *    LER E EXIBIR TODOS OS FUNCIONARIOS (DB2)   *
	  *************************************************
	  *
	   ENVIRONMENT DIVISION.
	   CONFIGURATION SECTION.
	   SPECIAL-NAMES.
	       DECIMAL-POINT IS COMMA.
	   INPUT-OUTPUT SECTION.
	   FILE-CONTROL.
	  *
	   DATA DIVISION.
	   FILE SECTION.
	   WORKING-STORAGE SECTION.
	       EXEC SQL
		       INCLUDE BOOKFUNC
		   END-EXEC.
		   EXEC SQL
		       INCLUDE SQLCA
		   END-EXEC.
		   EXEC SQL
		       DECLARE FUNCTEMP CURSOR FOR
			       SELECT * FROM EAD316.FUNCIONARIOS
				   ORDER BY CODFUN
		   END-EXEC.
	   77  WK-INDICATOR-EMAIL PIC S9(4)  COMP    VALUE ZEROS.
	   77  WK-SALARIO-EDIT    PIC ZZZ.ZZ9,99     VALUE ZEROS.
	   77  WK-SQLCODE-EDIT    PIC -999           VALUE ZEROS.
	  *
	   PROCEDURE DIVISION.
	   000-PRINCIPAL SECTION.
	   001-PRINCIPAL.
	       PERFORM 101-INICIAR.
		   PERFORM 201-PROCESSAR UNTIL SQLCODE = 100.
		   PERFORM 901-FINALIZAR.
		   STOP RUN.
	  ***************************************	   
	   100-INICIAR SECTION.
	   101-INICIAR.
	       EXEC SQL
		       OPEN FUNCTEMP
		   END-EXEC.
		   EVALUATE SQLCODE        
		       WHEN 0
			       PERFORM 301-LER-FUNCIONARIOS
			   WHEN 100 
				   DISPLAY 'FIM DA TABELA'                 
			   WHEN OTHER
			       MOVE SQLCODE  TO WK-SQLCODE-EDIT
			       DISPLAY 'ERRO ' WK-SQLCODE-EDIT
				           ' NO COMANDO OPEN CURSOR'
				   MOVE 12 TO RETURN-CODE
				   STOP RUN
		   END-EVALUATE.
	  ***************************************
	   200-PROCESSAR SECTION.
	   201-PROCESSAR.
	       DISPLAY 'CODIGO      : ' DB2-CODFUN.             
		   DISPLAY 'NOME        : ' DB2-NOMEFUN-TEXT.     
		   MOVE DB2-SALARIOFUN  TO WK-SALARIO-EDIT.
		   DISPLAY 'SALARIO     : ' WK-SALARIO-EDIT.
		   DISPLAY 'DEPARTAMENTO: ' DB2-DEPTOFUN. 
		   DISPLAY 'ADMISSAO    : ' DB2-ADMISSFUN.
		   DISPLAY 'IDADE       : ' DB2-IDADEFUN.
		   DISPLAY 'EMAIL       : ' DB2-EMAILFUN-TEXT.
		   DISPLAY '**************************************'.
		   PERFORM 301-LER-FUNCIONARIOS.
	  ***************************************
	   300-LER-FUNCIONARIOS SECTION.
	   301-LER-FUNCIONARIOS.
		   MOVE SPACES  TO DB2-NOMEFUN-TEXT.
		   MOVE SPACES  TO DB2-EMAILFUN-TEXT.
	       EXEC SQL
		       FETCH FUNCTEMP
			       INTO :DB2-CODFUN,
				        :DB2-NOMEFUN,
						:DB2-SALARIOFUN,
						:DB2-DEPTOFUN,
						:DB2-ADMISSFUN,
						:DB2-IDADEFUN,
						:DB2-EMAILFUN INDICATOR :WK-INDICATOR-EMAIL
		   END-EXEC.
		   IF WK-INDICATOR-EMAIL = -1
               MOVE '--------------------'  TO DB2-EMAILFUN
		   END-IF.
   		   EVALUATE SQLCODE           
		       WHEN 0
			       CONTINUE
			   WHEN 100 
			       DISPLAY 'FIM DA TABELA'          
			   WHEN OTHER
			       MOVE SQLCODE  TO WK-SQLCODE-EDIT
			       DISPLAY 'ERRO ' WK-SQLCODE-EDIT
				           ' NO COMANDO FETCH'            
				   MOVE 12 TO RETURN-CODE
				   STOP RUN
           END-EVALUATE.		
      ***************************************
       900-FINALIZAR SECTION.
       901-FINALIZAR.
	       EXEC SQL
		       CLOSE FUNCTEMP
		   END-EXEC.