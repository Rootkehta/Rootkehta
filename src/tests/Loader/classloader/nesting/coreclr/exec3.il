// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

.assembly extern System.Console { }
.assembly extern xunit.core {}
// model revision #2
// To compile: ilasm exec3.il

.assembly exec {}
.assembly extern mscorlib {}

.assembly extern nesting3 {}

.class public Exec
{

  // entry point location: MainManagedType

  .method public static int32 Main()
  {
    .custom instance void [xunit.core]Xunit.FactAttribute::.ctor() = (
        01 00 00 00
    )
    .entrypoint
    .locals init (class [mscorlib]System.Exception V_0,
                  int32 V_1)

    .try
    {
      newobj instance void class [nesting3]Client<class [nesting3]EnclType<int32>>::.ctor()
      call instance void class [nesting3] Client<class [nesting3]EnclType<int32>>::method1()
      ldstr      "PASS"
      call       void [System.Console]System.Console::WriteLine(string)
      ldc.i4.s   100
      stloc.1
      leave.s    end
    }
    catch [mscorlib]System.Exception 
    {
      stloc.0
      ldstr      "{0}Caught unexpected exception."
      ldloc.0
      call void [System.Console]System.Console::WriteLine(string,object)
      ldstr      "FAIL"
      call       void [System.Console]System.Console::WriteLine(string)
      ldc.i4.s   101
      stloc.1
      leave.s    end
    }
    end: ldloc.1
    ret
  }
}
