USING Siemens.Simatic.S71500.Hardware.Utilities;

PROGRAM MyProgram
    VAR_EXTERNAL
        Stop : BOOL;
        StopLight : BOOL;
    END_VAR
    VAR
    END_VAR
    VAR_TEMP
        Value : BYTE;
        ForCounter : INT;
        Value_01_DW : DWORD := DWORD#16#1223_5486;
        Value_02_DW : DWORD := DWORD#16#A6C9_D1F5;
    END_VAR
   
    // #Value:=PEEK(area := 16#82,dbNumber := 0,byteOffset := 511);
    ReadMemory(ReadArea#Output, 511, Value);
    // #Value := #Value + 1;
    Value := TO_BYTE(TO_INT(Value) + 1);
    // POKE(area := 16#82,dbNumber := 0,byteOffset := 511,value := #Value);
    WriteMemory(ReadArea#Output, 511, Value);
    // POKE(area := 16#82,dbNumber := 0,byteOffset := 1016,value := #Value_01_DW);
    // POKE(area := 16#82,dbNumber := 0,byteOffset := 1020,value := #Value_02_DW);
    WriteMemory(ReadArea#Output, 1016, Value_01_DW);
    WriteMemory(ReadArea#Output, 1020, Value_02_DW);
    // FOR #ForCounter := 0 TO 63 DO
    //  #Value:=PEEK(area := 16#1, dbNumber := 0, byteOffset := #ForCounter);
    //  POKE(area := 16#81, dbNumber := 0, byteOffset := #ForCounter, value := #Value);
    // END_FOR;
    FOR ForCounter := 0 TO 63 DO
        ReadMemory(ReadArea#PeripheryInput, ForCounter, Value);
        WriteMemory(ReadArea#Input, ForCounter, Value);
    END_FOR;
    // #Value := PEEK(area := 16#1, dbNumber := 0, byteOffset := 512);
    // POKE(area := 16#82, dbNumber := 0, byteOffset := 512, value := #Value);
    ReadMemory(ReadArea#PeripheryInput, 512, Value);
    WriteMemory(ReadArea#Output, 512, Value);
    
    StopLight := Stop;
END_PROGRAM
