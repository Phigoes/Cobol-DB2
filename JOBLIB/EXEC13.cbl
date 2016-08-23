//EAD316CL JOB 'EAD316',CLASS=C,MSGCLASS=X,NOTIFY=EAD316,TIME=(0,10)
//*****************************************************
//*      EXIBIR VENDAS POR MES (3 NIVEIS DE TABELA    *
//*****************************************************
//EXECUTE  EXEC PGM=ALUNO13
//STEPLIB  DD   DSN=GR.GERAL.LOADLIB,DISP=SHR
//VENDAS3N DD   DSN=GR.EAD316.VENDAS3N,DISP=OLD