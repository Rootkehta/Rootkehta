// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.


.assembly extern System.Console
{
  .publickeytoken = (B0 3F 5F 7F 11 D5 0A 3A )
  .ver 4:0:0:0
}
.assembly extern legacy library mscorlib {}
.assembly 'ldobj'{

}

.class public			_ldobj {

.method public static	int32 main() {
.entrypoint
.locals		(class [mscorlib]System.IO.TextWriter,value class valClass,value class valClass)
.maxstack		2
	call	    class [mscorlib]System.IO.TextWriter [System.Console]System.Console::get_Out()
	stloc	0

	newobj instance void valClass::.ctor()
	stloc		1
	newobj instance void valClass::.ctor()
	stloc		2
	ldloca		1
	ldc.i4		0xFAFAFAFA
	stfld		int32 valClass::Field
	ldc.i4		0xDBDBDBDB
	stsfld		int32 valClass::SField

	ldloca		2
	ldc.i4		0x00000000
	stfld		int32 valClass::Field

	ldloca		1
	ldfld		int32 valClass::Field
	ldc.i4		0xFAFAFAFA
	ceq
	brfalse		failInit
	ldsfld		int32 valClass::SField
	ldc.i4		0xDBDBDBDB
	ceq		
	brfalse		failInit
	ldloca		2
	ldfld		int32 valClass::Field
	ldc.i4		0x00000000
	ceq
	brtrue		ldlocaTest
failInit:
	ldloc	0
	ldstr		"one _or both val classes failed initialization."


	callvirt instance void [mscorlib]System.IO.TextWriter::WriteLine(class [mscorlib]System.String)
	br			fail

ldlocaTest:
	ldloca		1
	ldobj		valClass

	ldloca		2
	call		void _ldobj::changeData(value class valClass,value class valClass*)

	ldloca		1
	ldfld		int32 valClass::Field
	ldc.i4		0xFAFAFAFA
	ceq
	brfalse		failTest
	ldloca		2
	ldfld		int32 valClass::Field
	ldc.i4		0xBBBBBBBB
	ceq
	brfalse		failTest
	ldsfld		int32 valClass::SField
	ldc.i4		0xDDDDDDDD
	ceq		
	brtrue		pass
failTest:
	ldloc	0
	ldstr		"failure after initialization."




	callvirt instance void [mscorlib]System.IO.TextWriter::WriteLine(class [mscorlib]System.String)
	br			fail

pass:
	ldloc	0
	ldstr		"_ldobj tests PASS"


	callvirt instance void [mscorlib]System.IO.TextWriter::WriteLine(class [mscorlib]System.String)
	ldc.i4		100
	br			end
fail:
	ldloc	0
	ldstr		"!!! FAILURE !!!  LDOBJ TEST(S) FAILED !!! FAILURE !!!"


	callvirt instance void [mscorlib]System.IO.TextWriter::WriteLine(class [mscorlib]System.String)
	ldc.i4		0x0
	br			end
end:
	ret
}

.method public static	void changeData(value class valClass,value class valClass*) {
.maxstack		2
	ldarga		0
	ldc.i4		0xBBBBBBBB
	stfld		int32 valClass::Field
	ldc.i4		0xDDDDDDDD
	stsfld		int32 valClass::SField
	ldarg		1
	ldarga		0
	cpobj		valClass
	ret
}

}
.class public value sealed valClass {
.field public			int32 Field
.field public static	int32 SField

	.method public public void .ctor(){
		ret
	}
}
