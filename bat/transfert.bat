@ECHO OFF
REM *********************************************
REM *		Fonctions commutateurs		*
REM *********************************************
REM */R nombre de retry				*
REM */W temps avt retry				*
REM */copy:D uniquement les datas		*
REM */v log complet				*
REM */unicode format du fichier de log		*
REM */log fichier log 				*
REM */eta temps estimme de la copie		*
REM */xd exclusion de dossiers			*
REM */xf exclusion de fichiers			*
REM *********************************************

REM *********************************************
REM *		Declaration user source		*
REM *********************************************

set /p usr_src="nom de l'utilisateur : " 


REM *********************************************
REM *		Declaration IP destination	*
REM *********************************************

set /p ip_dst="IP du nouveau PC : " 


REM *********************************************
REM *		Copie du dossier user		*
REM *********************************************

REM Lignes de commande optimis�es pour le repertoire de l'utilisateur
robocopy c:\users\%usr_src%\Documents \\%ip_dst%\transfert\user\documents /R:1 /W:1 /S /copy:D /v /unicode /log:result.txt /eta /xd AppData /xd "Application Data" Downloads "Local Settings" /xf *.exe *.dat ntuser.* *.ini *.dll
robocopy c:\users\%usr_src%\Desktop \\%ip_dst%\transfert\user\desktop /R:1 /W:1 /S /copy:D /v /unicode /log:result.txt /eta /xd AppData /xd Downloads /xf  *.dat ntuser.* *.ini *.dll


REM *********************************************
REM *		Copie des autres dossiers	*
REM *********************************************

REM Creer une ligne par dossier a copier
REM Attention aux extensions de fichiers excluts
REM NE PAS OUBLIER DE MODIFIER LES DOSSIERS SOURCE & DESTINATION


REM robocopy c:\test \\%ip_dst%\transfert\test /R:1 /W:1 /S /copy:D /v /unicode /log+:result.txt /eta  /xf *.exe 



