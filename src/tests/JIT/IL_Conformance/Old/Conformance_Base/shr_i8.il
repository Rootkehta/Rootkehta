// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

.assembly extern legacy library mscorlib {}

.class public Shr_I8 {
.method public static	int32 _shr(int64,int32,int64) {
.maxstack		20
	ldarg	0
	ldarg	1
	shr
	ldarg	2
	ceq
	ret
}


.method public static	int32 main(class [mscorlib]System.String[]) {
.entrypoint
.maxstack		20
	ldc.i8		0x0000000000000000
	ldc.i4		0x00000000
	ldc.i8		0x0000000000000000
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL
	
	ldc.i8		0x0000000000000000
	ldc.i4		0x00000001
	ldc.i8		0x0000000000000000
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL

	ldc.i8		0x0000000000000000
	ldc.i4		0x0000003F
	ldc.i8		0x0000000000000000
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL



	ldc.i8		0xFFFFFFFFFFFFFFFF
	ldc.i4		0x00000000
	ldc.i8		0xFFFFFFFFFFFFFFFF
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL
	
	ldc.i8		0xFFFFFFFFFFFFFFFF
	ldc.i4		0x00000001
	ldc.i8		0xFFFFFFFFFFFFFFFF
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL

	ldc.i8		0xFFFFFFFFFFFFFFFF
	ldc.i4		0x0000003F
	ldc.i8		0xFFFFFFFFFFFFFFFF
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL



	ldc.i8		0x8000000000000000
	ldc.i4		0x00000000
	ldc.i8		0x8000000000000000
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL
	
	ldc.i8		0x8000000000000000
	ldc.i4		0x00000001
	ldc.i8		0xC000000000000000
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL

	ldc.i8		0x8000000000000000
	ldc.i4		0x0000003F
	ldc.i8		0xFFFFFFFFFFFFFFFF
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL

 


	ldc.i8		0x0000000000000001
	ldc.i4		0x00000000
	ldc.i8		0x0000000000000001
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL
	
	ldc.i8		0x0000000000000001
	ldc.i4		0x00000001
	ldc.i8		0x0000000000000000
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL

	ldc.i8		0x0000000000000001
	ldc.i4		0x0000003F
	ldc.i8		0x0000000000000000
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL


	ldc.i8		0xAAAAAAAAAAAAAAAA
	ldc.i4		0x00000000
	ldc.i8		0xAAAAAAAAAAAAAAAA
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL
	
	ldc.i8		0xAAAAAAAAAAAAAAAA
	ldc.i4		0x00000001
	ldc.i8		0xD555555555555555
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL

	ldc.i8		0xAAAAAAAAAAAAAAAA
	ldc.i4		0x0000003F
	ldc.i8		0xFFFFFFFFFFFFFFFF
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL



	ldc.i8		0x5555555555555555
	ldc.i4		0x00000000
	ldc.i8		0x5555555555555555
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL
	
	ldc.i8		0x5555555555555555
	ldc.i4		0x00000001
	ldc.i8		0x2AAAAAAAAAAAAAAA
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL

	ldc.i8		0x5555555555555555
	ldc.i4		0x0000003F
	ldc.i8		0x0000000000000000
	call	int32 Shr_I8::_shr(int64,int32,int64)
	brfalse		FAIL



TRY_START:
	ldc.i8		0x0000000000000000
	ldc.i4		0x00000040
	ldc.i8		0x0000000000000000
	call	int32 Shr_I8::_shr(int64,int32,int64)
	pop

	ldc.i8		0x0000000000000000
	ldc.i4		0x0000007F
	ldc.i8		0x0000000000000000
	call	int32 Shr_I8::_shr(int64,int32,int64)
	pop
	
	ldc.i8		0xFFFFFFFFFFFFFFFF
	ldc.i4		0x00000040
	ldc.i8		0xFFFFFFFFFFFFFFFF
	call	int32 Shr_I8::_shr(int64,int32,int64)
	pop

	ldc.i8		0xFFFFFFFFFFFFFFFF
	ldc.i4		0x0000007F
	ldc.i8		0xFFFFFFFFFFFFFFFF
	call	int32 Shr_I8::_shr(int64,int32,int64)
	pop
	
	ldc.i8		0x8000000000000000
	ldc.i4		0x00000040
	ldc.i8		0x8000000000000000
	call	int32 Shr_I8::_shr(int64,int32,int64)
	pop

	ldc.i8		0x8000000000000000
	ldc.i4		0x0000007F
	ldc.i8		0xFFFFFFFFFFFFFFFF
	call	int32 Shr_I8::_shr(int64,int32,int64)
	pop

	ldc.i8		0x0000000000000001
	ldc.i4		0x00000040
	ldc.i8		0x0000000000000001
	call	int32 Shr_I8::_shr(int64,int32,int64)
	pop

	ldc.i8		0x0000000000000001
	ldc.i4		0x0000007F
	ldc.i8		0x0000000000000000
	call	int32 Shr_I8::_shr(int64,int32,int64)
	pop
	
	ldc.i8		0xAAAAAAAAAAAAAAAA
	ldc.i4		0x00000040
	ldc.i8		0xAAAAAAAAAAAAAAAA
	call	int32 Shr_I8::_shr(int64,int32,int64)
	pop

	ldc.i8		0xAAAAAAAAAAAAAAAA
	ldc.i4		0x0000007F
	ldc.i8		0xFFFFFFFFFFFFFFFF
	call	int32 Shr_I8::_shr(int64,int32,int64)
	pop

	ldc.i8		0x5555555555555555
	ldc.i4		0x00000040
	ldc.i8		0x5555555555555555
	call	int32 Shr_I8::_shr(int64,int32,int64)
	pop

	ldc.i8		0x5555555555555555
	ldc.i4		0x0000007F
	ldc.i8		0x0000000000000000
	call	int32 Shr_I8::_shr(int64,int32,int64)
	pop

	ldc.i8		0x5555555555555555
	ldc.i4		0xFFFFFFFF
	ldc.i8		0x0000000000000000
	call	int32 Shr_I8::_shr(int64,int32,int64)
	pop

	leave.s	TRY_END
TRY_END:
	br		PASS
HANDLER:
	pop		//ref
	leave		END_HANDLER
END_HANDLER:
	br		PASS
PASS:
	ldc.i4 100
	ret
FAIL:
	ldc.i4	0x0
	ret
.try TRY_START to TRY_END catch [mscorlib]System.Exception handler HANDLER to END_HANDLER
}
}
.assembly shr_i8{}
