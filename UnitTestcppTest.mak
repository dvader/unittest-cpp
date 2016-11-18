# ---------------------------------------------------------------------------
!if !$d(BCB)
BCB = $(MAKEDIR)\..
!endif

# ---------------------------------------------------------------------------
# IDE SECTION
# ---------------------------------------------------------------------------
# The following section of the project makefile is managed by the BCB IDE.
# It is recommended to use the IDE to change any of the values in this
# section.
# ---------------------------------------------------------------------------

VERSION = BCB.05.03
# ---------------------------------------------------------------------------
PROJECT = UnitTestcppTest.exe
OBJFILES = tests\Main.obj tests\TestAssertHandler.obj tests\TestCheckMacros.obj \
    tests\TestChecks.obj tests\TestCompositeTestReporter.obj \
    tests\TestCurrentTest.obj tests\TestDeferredTestReporter.obj \
    tests\TestExceptions.obj tests\TestLongMacros.obj \
    tests\TestMemoryOutStream.obj tests\TestRequireMacrosWithExceptionsOff.obj \
    tests\TestRequireMacrosWithExceptionsOn.obj tests\TestTest.obj \
    tests\TestTestList.obj tests\TestTestMacros.obj tests\TestTestResults.obj \
    tests\TestTestRunner.obj tests\TestTestSuite.obj \
    tests\TestTimeConstraint.obj tests\TestTimeConstraintMacro.obj \
    tests\TestUnitTestPP.obj tests\TestXmlTestReporter.obj
RESFILES = 
MAINSOURCE = UnitTestcppTest.bpf
RESDEPEN = $(RESFILES)
LIBFILES = UnitTestcppLib.lib
IDLFILES = 
IDLGENFILES = 
LIBRARIES = 
PACKAGES = Vcl50.bpi Vclx50.bpi bcbsmp50.bpi Qrpt50.bpi Vcldb50.bpi Vclbde50.bpi \
    ibsmp50.bpi vcldbx50.bpi TeeUI50.bpi TeeDB50.bpi Tee50.bpi TeeQR50.bpi \
    VCLIB50.bpi bcbie50.bpi vclie50.bpi Inetdb50.bpi Inet50.bpi NMFast50.bpi \
    dclocx50.bpi bcb2kaxserver50.bpi
SPARELIBS = Vcl50.lib
DEFFILE = 
# ---------------------------------------------------------------------------
PATHCPP = .;tests
PATHASM = .;
PATHPAS = .;
PATHRC = .;
DEBUGLIBPATH = $(BCB)\lib\debug
RELEASELIBPATH = $(BCB)\lib\release
USERDEFINES = _DEBUG
SYSDEFINES = NO_STRICT;_RTLDLL;USEPACKAGES
INCLUDEPATH = tests;$(BCB)\include;$(BCB)\include\vcl
LIBPATH = tests;$(BCB)\lib\obj;$(BCB)\lib
WARNINGS= -w-par
# ---------------------------------------------------------------------------
CFLAG1 = -tWC -tWM -Od -H=$(BCB)\lib\vcl50.csm -Hc -Vx -Ve -X- -r- -a8 -b- -k -y -v \
    -vi- -c
IDLCFLAGS = 
PFLAGS = -$YD -$W -$O- -v -JPHNE -M
RFLAGS = 
AFLAGS = /mx /w2 /zd
LFLAGS = -Tpe -ap -D"" -x -Gn -v
# ---------------------------------------------------------------------------
ALLOBJ = c0x32.obj $(PACKAGES) Memmgr.Lib sysinit.obj $(OBJFILES)
ALLRES = $(RESFILES)
ALLLIB = $(LIBFILES) $(LIBRARIES) import32.lib cp32mti.lib
# ---------------------------------------------------------------------------
!ifdef IDEOPTIONS

[Version Info]
IncludeVerInfo=0
AutoIncBuild=0
MajorVer=1
MinorVer=0
Release=0
Build=0
Debug=0
PreRelease=0
Special=0
Private=0
DLL=0

[Version Info Keys]
CompanyName=
FileDescription=
FileVersion=1.0.0.0
InternalName=
LegalCopyright=
LegalTrademarks=
OriginalFilename=
ProductName=
ProductVersion=1.0.0.0
Comments=

[Debugging]
DebugSourceDirs=$(BCB)\source\vcl

!endif





# ---------------------------------------------------------------------------
# MAKE SECTION
# ---------------------------------------------------------------------------
# This section of the project file is not used by the BCB IDE.  It is for
# the benefit of building from the command-line using the MAKE utility.
# ---------------------------------------------------------------------------

.autodepend
# ---------------------------------------------------------------------------
!if "$(USERDEFINES)" != ""
AUSERDEFINES = -d$(USERDEFINES:;= -d)
!else
AUSERDEFINES =
!endif

!if !$d(BCC32)
BCC32 = bcc32
!endif

!if !$d(CPP32)
CPP32 = cpp32
!endif

!if !$d(DCC32)
DCC32 = dcc32
!endif

!if !$d(TASM32)
TASM32 = tasm32
!endif

!if !$d(LINKER)
LINKER = ilink32
!endif

!if !$d(BRCC32)
BRCC32 = brcc32
!endif


# ---------------------------------------------------------------------------
!if $d(PATHCPP)
.PATH.CPP = $(PATHCPP)
.PATH.C   = $(PATHCPP)
!endif

!if $d(PATHPAS)
.PATH.PAS = $(PATHPAS)
!endif

!if $d(PATHASM)
.PATH.ASM = $(PATHASM)
!endif

!if $d(PATHRC)
.PATH.RC  = $(PATHRC)
!endif
# ---------------------------------------------------------------------------
$(PROJECT): $(IDLGENFILES) $(OBJFILES) $(RESDEPEN) $(DEFFILE)
    $(BCB)\BIN\$(LINKER) @&&!
    $(LFLAGS) -L$(LIBPATH) +
    $(ALLOBJ), +
    $(PROJECT),, +
    $(ALLLIB), +
    $(DEFFILE), +
    $(ALLRES)
!
# ---------------------------------------------------------------------------
.pas.hpp:
    $(BCB)\BIN\$(DCC32) $(PFLAGS) -U$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -O$(INCLUDEPATH) --BCB {$< }

.pas.obj:
    $(BCB)\BIN\$(DCC32) $(PFLAGS) -U$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -O$(INCLUDEPATH) --BCB {$< }

.cpp.obj:
    $(BCB)\BIN\$(BCC32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n$(@D) {$< }

.c.obj:
    $(BCB)\BIN\$(BCC32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n$(@D) {$< }

.c.i:
    $(BCB)\BIN\$(CPP32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n. {$< }

.cpp.i:
    $(BCB)\BIN\$(CPP32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n. {$< }

.asm.obj:
    $(BCB)\BIN\$(TASM32) $(AFLAGS) -i$(INCLUDEPATH:;= -i) $(AUSERDEFINES) -d$(SYSDEFINES:;= -d) $<, $@

.rc.res:
    $(BCB)\BIN\$(BRCC32) $(RFLAGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -fo$@ $<
# ---------------------------------------------------------------------------




