// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

.assembly extern legacy library mscorlib {}



.class public _ldarg {

.method public		void _ldarg() {
.maxstack	0
	ret
}

.method public	class _ldarg args(class _ldarg) {
.maxstack	5
	ldarg	0
	ret
}


.method public static	int32 main(class [mscorlib]System.String[]) {
.entrypoint
.locals(class _ldarg)
.maxstack		2
	newobj		instance void _ldarg::_ldarg()
	stloc		0
	ldloc		0
	ldloc		0
	call		instance class _ldarg _ldarg::args(class _ldarg)
	ldloc		0
	ceq
	brfalse		FAIL

	ldc.i4 100
	ret
FAIL:
	ldc.i4	0x0
	ret
}
}

.assembly ldarg_ref{}
