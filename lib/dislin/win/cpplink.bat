@if not "%1" == ""  goto START
@ECHO    /****************************************************************/
@ECHO    /**                     C P P L I N K                          **/
@ECHO    /**                                                            **/
@ECHO    /** CPPLINK links programs using the DISLIN CPP-library.       **/
@ECHO    /**                                                            **/
@ECHO    /** Command:  CPPLINK  [option] [-ucrt]  main                  **/
@ECHO    /**                                                            **/
@ECHO    /** option    is an optional qualifier that may have one of    **/
@ECHO    /**           the following values:                            **/
@ECHO    /**      -c   to compile programs before linking               **/
@ECHO    /**      -r   to run programs after linking                    **/
@ECHO    /**      -a   to compile, link and run programs.               **/
@ECHO    /**                                                            **/
@ECHO    /** main      is the name of the main program.                 **/
@ECHO    /**                                                            **/
@ECHO    /** Example:  CPPLINK  -a   TEST                               **/
@ECHO    /** Version:  g++ MinGW 64-bit                                 **/
@ECHO    /****************************************************************/
@goto EXIT
:START
@set _dislin=%DISLIN%
@if "%DISLIN%" == "" set _dislin=c:\dislin
@set _opt1=%1
@if %1 ==  -c	shift
@if %1 ==  -a	shift
@if %1 ==  -r	shift
@set _opt2=%1
@if %1 ==  -ucrt shift
@rem
@set _cc=g++
@if %_opt1% ==  -c    goto COMP
@if %_opt1% ==  -a    goto COMP
@goto  LINK
:COMP
@set _ext=cpp
@set _inc=%_dislin%
%_cc% -c -I%_inc%  %1.%_ext%
@set _ext=
@set _inc=
@if errorlevel 1 goto ENDE
:LINK
@set _lib=discpp.a
@if %_opt2% == -ucrt      set _lib=discppu.a
%_cc% -o %1.exe %1.o %2 %3 %4 %5 %6  %_dislin%\%_lib% -luser32 -lgdi32 -lopengl32
@set _lib=
@if %_opt1% ==  -a  goto RUN
@if %_opt1% ==  -r  goto RUN
@goto ENDE
:RUN
@if errorlevel 1 goto ENDE
%1
:ENDE
@set _dislin=
@set _opt1=
@set _opt2=
@set _cc=
:EXIT
