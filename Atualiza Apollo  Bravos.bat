@echo off
@echo  

title *** Atualiza Apollo/Bravos ***
MODE CON COLS=80 LINES=23
COLOR 1F

set CREDENCIAIS= /user:orletti\catalogo /pass:orvel1,
set SERVORVTO=192.168.5.201
set SERVORVSM=192.168.3.100
set SERVORVEU=192.168.11.222
set SERVORVCI=192.168.20.222
set SERVBELCL=192.168.7.202
set SERVBELBF=192.168.7.202
set SERVATLVT=192.168.31.201
set SERVATLSR=192.168.13.201
set SERVATLLN=192.168.4.202
set SERVATLVV=192.168.16.222
set SERVATLCI=192.168.11.222
set SERVATLGU=192.168.16.222
set SERVMANLN=192.168.4.202
set SERVMANCI=192.168.20.222
set SERVHICAR=192.168.16.222
set SERVNOVA=192.168.3.100
set SERVDIVGV=192.168.3.100
set SERVDIVIP=192.168.3.100
set SERVVIRTUS=192.168.3.100




:inicio

ECHO ###############################################################################
ECHO #              ESCOLHA A OPCAO REFERENTE A LOJA QUE VOCE ESTA                 #
ECHO ###############################################################################
echo .
echo 1. Orvel TO
echo 2. Orvel SM
echo 3. Orvel EU
echo 4. Orvel CI
echo 5. Belle CL
echo 6. Belle BF
echo 7. Atlantica VT
echo 8. Atlantica SR
echo 9. Atlantica LN
echo 10. MAN LN
echo 11. MAN CI
echo 12. HiCar
echo 13. Nova Ford
echo 14. Divva GV
echo 15. Divva IP
echo 16. Atlantica VV
echo 17. Atlantica CI
echo 18. Atlantica GU



set EXECUTADO=%EXECUTADO%%resp%...


@echo  

set /p resp=Digite o numero da opcao e pressione ENTER: 
if %resp%== 1 goto proc1
if %resp%== 2 goto proc2
if %resp%== 3 goto proc3
if %resp%== 4 goto proc4
if %resp%== 5 goto proc5
if %resp%== 6 goto proc6
if %resp%== 7 goto proc7
if %resp%== 8 goto proc8
if %resp%== 9 goto proc9
if %resp%== 10 goto proc10
if %resp%== 11 goto proc11
if %resp%== 12 goto proc12
if %resp%== 13 goto proc13
if %resp%== 14 goto proc14
if %resp%== 15 goto proc15
if %resp%== 16 goto proc16
if %resp%== 17 goto proc17
if %resp%== 18 goto proc18

REM --------------------------------------------------------------------------------------
REM ------------------------------------  ORVEL TO  --------------------------------------
:proc1

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns
CLS
ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVATLVV%
cmdkey /delete:%SERVATLCI%
cmdkey /delete:%SERVATLGU%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVATLVV% %CREDENCIAIS%
cmdkey /add:%SERVATLCI% %CREDENCIAIS%
cmdkey /add:%SERVATLGU% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%



CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVORVTO%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVORVTO%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################

IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\arq\ATUALIZA\3CAMADAS\ConexaoCliente\Apollo\ConexaoCliente.dat C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BRAVOSClient.exe xcopy \\%SERVVIRTUS%\arq\ATUALIZA\3CAMADAS\ConexaoCliente\Bravos\ConexaoCliente.dat C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVORVTO%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVORVTO%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y
CLS
goto limpeza

REM --------------------------------------------------------------------------------------
REM ------------------------------------  ORVEL SM  --------------------------------------
:proc2

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%
CLS


ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVORVSM%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVORVSM%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ

CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################

IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVORVSM%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVORVSM%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y
CLS
goto limpeza

REM --------------------------------------------------------------------------------------
REM ------------------------------------  ORVEL EU  --------------------------------------
:proc3

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%

CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVORVEU%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVORVEU%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
net use j: \\%SERVORVEU%\atualiza
CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################

IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVORVEU%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVORVEU%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y

goto limpeza

REM --------------------------------------------------------------------------------------
REM ------------------------------------  ORVEL CI  --------------------------------------
:proc4

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%

CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVORVCI%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVORVCI%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
net use j: \\%SERVORVCI%\atualiza
CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################

IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVORVCI%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVORVCI%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y

goto limpeza

REM --------------------------------------------------------------------------------------
REM ------------------------------------  BELLE CL  --------------------------------------
:proc5

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%
CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVBELCL%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVBELCL%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
net use j: \\%SERVBELCL%\atualiza
CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################

IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVBELCL%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVBELCL%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y

goto limpeza

REM --------------------------------------------------------------------------------------
REM ------------------------------------  BELLE BF  --------------------------------------
:proc6

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%
CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVBELBF%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVBELBF%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
net use j: \\%SERVBELBF%\atualiza
CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################

IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVBELBF%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVBELBF%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y

goto limpeza

REM --------------------------------------------------------------------------------------
REM ----------------------------------  ATLANTICA VT  ------------------------------------
:proc7

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%
CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVATLVT%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVATLVT%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
net use j: \\%SERVATLVT%\atualiza
CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
 
IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVATLVT%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVATLVT%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y

goto limpeza

REM --------------------------------------------------------------------------------------
REM ------------------------------------  ATLANTICA SR  -----------------------------------
:proc8

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%
CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVATLSR%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVATLSR%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
net use j: \\%SERVATLSR%\atualiza
CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
 
IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVATLSR%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVATLSR%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y

goto limpeza

REM --------------------------------------------------------------------------------------
REM ----------------------------------  ATLANTICA LN  ------------------------------------
:proc9

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%
CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVATLLN%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVATLLN%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
net use j: \\%SERVATLLN%\atualiza
CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
 
IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVATLLN%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVATLLN%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y

goto limpeza

REM --------------------------------------------------------------------------------------
REM --------------------------------------  MAN LN  --------------------------------------
:proc10

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%

CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVMANLN%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVMANLN%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
net use j: \\%SERVMANLN%\atualiza
CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
 
IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVMANLN%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVMANLN%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y

goto limpeza

REM --------------------------------------------------------------------------------------
REM ------------------------------------  MAN CI  ----------------------------------------
:proc11

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%

CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVMANCI%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVMANCI%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
net use j: \\%SERVMANCI%\atualiza
CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
 
IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVMANCI%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVMANCI%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y

goto limpeza

REM --------------------------------------------------------------------------------------
REM -----------------------------------  HICAR       -------------------------------------
:proc12

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%

CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVHICAR%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVHICAR%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
net use j: \\%SERVHICAR%\atualiza
CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
 
IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVHICAR%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVHICAR%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y

goto limpeza

REM --------------------------------------------------------------------------------------
REM -----------------------------------  NOVA FORD  --------------------------------------
:proc13
ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%
CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVNOVA%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVNOVA%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
net use j: \\%SERVNOVA%\atualiza
CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
 
IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVNOVA%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVNOVA%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y

goto limpeza

REM --------------------------------------------------------------------------------------
REM -----------------------------------  DIVVA GV  ---------------------------------------
:proc14
ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%
CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVDIVGV%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVDIVGV%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
net use j: \\%SERVDIVGV%\atualiza
CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
 
IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVDIVGV%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVDIVGV%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y

goto limpeza

REM --------------------------------------------------------------------------------------
REM -----------------------------------  DIVVA IP  ---------------------------------------
:proc15

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################


COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%
CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVDIVIP%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVDIVIP%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
net use j: \\%SERVDIVIP%\atualiza
CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################

IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVDIVIP%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVDIVIP%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y

goto limpeza

REM --------------------------------------------------------------------------------------
REM -----------------------------------  ATLANTICA VV  -----------------------------------
:proc16
ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete

CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /delete:%SERVATLVV%
cmdkey /delete:%SERVATLCI%
cmdkey /delete:%SERVATLGU%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%
cmdkey /add:%SERVATLVV% %CREDENCIAIS%
cmdkey /add:%SERVATLCI% %CREDENCIAIS%
cmdkey /add:%SERVATLGU% %CREDENCIAIS%


CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVATLVV%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVATLVV%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
net use j: \\%SERVATLVV%\atualiza

CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
 
IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVATLVV%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVATLVV%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y

goto limpeza

REM --------------------------------------------------------------------------------------
REM -----------------------------------  ATLANTICA CI  -----------------------------------
:proc17
ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /delete:%SERVATLVV%
cmdkey /delete:%SERVATLCI%
cmdkey /delete:%SERVATLGU%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%
cmdkey /add:%SERVATLVV% %CREDENCIAIS%
cmdkey /add:%SERVATLCI% %CREDENCIAIS%
cmdkey /add:%SERVATLGU% %CREDENCIAIS%
CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVATLCI%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVATLCI%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
net use j: \\%SERVATLCI%\atualiza
CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
 
IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVATLCI%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVATLCI%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y

goto limpeza

REM --------------------------------------------------------------------------------------
REM -----------------------------------  ATLANTICA GU  -----------------------------------
:proc18
ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                        Mapeando as unidades de rede                         #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
COLOR 1F

ECHO ###############################################################################
ECHO Limpar a Cache do DNS...
ipconfig /flushdns
ipconfig /registerdns

ECHO ###############################################################################
ECHO Removendo as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: /delete
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: /delete

net use I: /delete
net use j: /delete
CLS
ECHO ###############################################################################
ECHO Salvando CREDENCIAIS...
cmdkey /delete:%SERVORVTO%
cmdkey /delete:%SERVORVSM%
cmdkey /delete:%SERVORVEU%
cmdkey /delete:%SERVORVCI%
cmdkey /delete:%SERVBELCL%
cmdkey /delete:%SERVBELBF%
cmdkey /delete:%SERVATLVT%
cmdkey /delete:%SERVATLSR%
cmdkey /delete:%SERVATLLN%
cmdkey /delete:%SERVMANLN%
cmdkey /delete:%SERVMANCI%
cmdkey /delete:%SERVHICAR%
cmdkey /delete:%SERVNOVA%
cmdkey /delete:%SERVDIVGV%
cmdkey /delete:%SERVDIVIP%
cmdkey /delete:%SERVVIRTUS%
cmdkey /delete:%SERVATLVV%
cmdkey /delete:%SERVATLCI%
cmdkey /delete:%SERVATLGU%
cmdkey /add:%SERVORVTO% %CREDENCIAIS%
cmdkey /add:%SERVORVSM% %CREDENCIAIS%
cmdkey /add:%SERVORVEU% %CREDENCIAIS%
cmdkey /add:%SERVORVCI% %CREDENCIAIS%
cmdkey /add:%SERVBELCL% %CREDENCIAIS%
cmdkey /add:%SERVBELBF% %CREDENCIAIS%
cmdkey /add:%SERVATLVT% %CREDENCIAIS%
cmdkey /add:%SERVATLSR% %CREDENCIAIS%
cmdkey /add:%SERVATLLN% %CREDENCIAIS%
cmdkey /add:%SERVMANLN% %CREDENCIAIS%
cmdkey /add:%SERVMANCI% %CREDENCIAIS%
cmdkey /add:%SERVHICAR% %CREDENCIAIS%
cmdkey /add:%SERVNOVA% %CREDENCIAIS%
cmdkey /add:%SERVDIVGV% %CREDENCIAIS%
cmdkey /add:%SERVDIVIP% %CREDENCIAIS%
cmdkey /add:%SERVVIRTUS% %CREDENCIAIS%
cmdkey /add:%SERVATLVV% %CREDENCIAIS%
cmdkey /add:%SERVATLCI% %CREDENCIAIS%
cmdkey /add:%SERVATLGU% %CREDENCIAIS%
CLS
ECHO ###############################################################################
ECHO Mapeando as Unidades de Rede...

IF EXIST C:\APOLLO\ApolloClient.exe net use A: \\%SERVATLGU%\ATUALIZA\APOLLO
IF EXIST C:\BRAVOS\BRAVOSClient.exe net use B: \\%SERVATLGU%\ATUALIZA\BRAVOS

net use I: \\%SERVVIRTUS%\ARQ
net use j: \\%SERVATLGU%\atualiza
CLS

COLOR 1F

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    Atualizando APOLLO/BRAVOS 3 CAMADAS                      #
ECHO #                                                                             #
ECHO #                           N A O   E N C E R R E                             #
ECHO #                                                                             #
ECHO ###############################################################################
 
IF EXIST C:\APOLLO\ApolloClient.exe del C:\APOLLO\*.bpl
IF EXIST C:\BRAVOS\BRAVOSClient.exe del C:\BRAVOS\*.bpl

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVATLGU%\atualiza\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVATLGU%\atualiza\Bravos\*.* C:\BRAVOS\ /D /E /Y

IF EXIST C:\APOLLO\ApolloClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Apollo\*.* C:\APOLLO\ /D /E /Y
IF EXIST C:\BRAVOS\BravosClient.exe xcopy \\%SERVVIRTUS%\ARQ\ATUALIZA\3CAMADAS\Bravos\*.* C:\BRAVOS\ /D /E /Y

goto limpeza

REM -----------------------------------------------------------------------------
COLOR 2F

ping localhost -n 3 >NUL

CLS

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    P R O C E S S O   F I N A L I Z A D O                    #
ECHO #                               O B R I G A D O                               #
ECHO #                                                                             #
ECHO ###############################################################################

ping localhost -n 5 >NUL


:limpeza
CD C:\Bravos
MKDIR C:\Bravos\bkp_temp
XCOPY LinxDmsWsConexao.xml C:\Bravos\bkp_temp /Y
XCOPY *.bat C:\Bravos\bkp_temp /Y
DEL /Q C:\Bravos\*.pdf
DEL /Q C:\Bravos\*.xml
DEL /Q C:\Bravos\*.xls
DEL /Q C:\Bravos\*.rpf
DEL /Q C:\Bravos\*.txt
COPY C:\Bravos\bkp_temp\*.* C:\Bravos /Y
DEL /Q C:\Bravos\bkp_temp
CD..
CD C:\Apollo
MKDIR C:\Apollo\bkp_temp
XCOPY LinxDmsWsConexao.xml C:\Apollo\bkp_temp /Y
XCOPY *.bat C:\Apollo\bkp_temp /Y
DEL /Q C:\Apollo\*.pdf
DEL /Q C:\Apollo\*.xml
DEL /Q C:\Apollo\*.xls
DEL /Q C:\Apollo\*.rpf
DEL /Q C:\Apollo\*.txt
COPY C:\Apollo\bkp_temp\*.* C:\Apollo /Y
DEL /Q C:\Apollo\bkp_temp

cls

ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                    P R O C E S S O   F I N A L I Z A D O                    #
ECHO #                               O B R I G A D O                               #
ECHO #                                                                             #
ECHO ###############################################################################
ping localhost -n 5 >NUL
exit 