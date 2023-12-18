CONFIGURATION MyConfiguration
    TASK Main (INTERVAL := T#1000ms, PRIORITY := 1);
    PROGRAM P1 WITH Main : MyProgram;
    VAR_GLOBAL
        Stop AT %I1.4 : BOOL;
        StopLight AT %Q1.3 : BOOL;
    END_VAR
END_CONFIGURATION
