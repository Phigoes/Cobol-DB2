//EAD316CL JOB 'EAD316',CLASS=C,MSGCLASS=X,NOTIFY=EAD316,TIME=(0,10)
//*****************************************************
//*      APAGAR CLIENTEN                              *
//*****************************************************
//APAGAR   EXEC PGM=IEFBR14
//ARQUIVO  DD   DSN=GR.EAD316.CLIENTEN,DISP=(MOD,DELETE,DELETE),
//         UNIT=SYSDA,SPACE=(TRK,0)
//*****************************************************
//*      EXECUTAR BALANCE LINE                        *
//*****************************************************
//EXECUTE  EXEC PGM=ALUNO09
//STEPLIB  DD   DSN=GR.GERAL.LOADLIB,DISP=SHR
//CLIENTES DD   DSN=GR.EAD316.CLIENTES,DISP=OLD
//LANCAM   DD   DSN=GR.EAD316.LANCAM,DISP=OLD
//CLIENTEN DD   DSN=GR.EAD316.CLIENTEN,DISP=(NEW,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(TRK,(1,1),RLSE),
//         DCB=(RECFM=FB,LRECL=37,BLKSIZE=0)