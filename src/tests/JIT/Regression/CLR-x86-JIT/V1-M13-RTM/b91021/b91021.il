// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

.assembly extern legacy library mscorlib {}
.assembly extern System.Console
{
  .publickeytoken = (B0 3F 5F 7F 11 D5 0A 3A )
  .ver 4:0:0:0
}
.assembly ILGEN_0x85bc9d9b {}
.assembly extern xunit.core {}
.class ILGEN_0x85bc9d9b {
.method static int32 Main() {
.custom instance void [xunit.core]Xunit.FactAttribute::.ctor() = (
    01 00 00 00
)
.entrypoint
.maxstack	9
.try {
ldc.r8 float64(0xfc921388d5e5427e) 
  conv.r4
    ldc.r8 float64(0xd4e763fd8fbb362e)
 rem 
conv.ovf.u8
conv.i4
 pop
leave END
} catch [mscorlib]System.OverflowException {
pop
leave END
}
END:
ldc.i4 100
ret

}

}
