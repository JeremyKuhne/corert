// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

.assembly extern System.Runtime
{
}

.assembly Casting
{
}

// Provides tests for casting arrays
.class public auto ansi beforefieldinit ArrayCastingTestsType
       extends [System.Runtime]System.Object
{
    // Array<T> tests
    .method static public hidebysig void Casting.ArrayOfTToEnumerableOfT_Valid(int32[] test) cil managed
    {
        .locals init (
            class [System.Runtime]System.Collections.Generic.IEnumerable`1<int32> V_0
        )
        ldarg.0
        stloc.0
        ret
    }

    .method static public hidebysig void Casting.ArrayOfTToEnumerable_Valid(int32[] test) cil managed
    {
        .locals init (
            class [System.Runtime]System.Collections.IEnumerable V_0
        )
        ldarg.0
        stloc.0
        ret
    }

    .method static public hidebysig void Casting.ArrayOfTToICollectionOfT_Valid(int32[] test) cil managed
    {
        .locals init (
            class [System.Runtime]System.Collections.Generic.ICollection`1<int32> V_0
        )
        ldarg.0
        stloc.0
        ret
    }

    .method static public hidebysig void Casting.ArrayOfTToICollection_Valid(int32[] test) cil managed
    {
        .locals init (
            class [System.Runtime]System.Collections.ICollection V_0
        )
        ldarg.0
        stloc.0
        ret
    }

    .method static public hidebysig void Casting.ArrayOfTToIListOfT_Valid(int32[] test) cil managed
    {
        .locals init (
            class [System.Runtime]System.Collections.Generic.IList`1<int32> V_0
        )
        ldarg.0
        stloc.0
        ret
    }

    .method static public hidebysig void Casting.ArrayOfTToIList_Valid(int32[] test) cil managed
    {
        .locals init (
            class [System.Runtime]System.Collections.IList V_0
        )
        ldarg.0
        stloc.0
        ret
    }

    .method static public hidebysig void Casting.ArrayOfTToIReadOnlyCollectionOfT_Valid(int32[] test) cil managed
    {
        .locals init (
            class [System.Runtime]System.Collections.Generic.IReadOnlyCollection`1<int32> V_0
        )
        ldarg.0
        stloc.0
        ret
    }

    .method static public hidebysig void Casting.ArrayOfTToIReadOnlyListOfT_Valid(int32[] test) cil managed
    {
        .locals init (
            class [System.Runtime]System.Collections.Generic.IReadOnlyList`1<int32> V_0
        )
        ldarg.0
        stloc.0
        ret
    }

    .method static public hidebysig void Casting.ArrayOfTToArray_Valid(int32[] test) cil managed
    {
        .locals init (
            class [System.Runtime]System.Array V_0
        )
        ldarg.0
        stloc.0
        ret
    }
}

.class public sequential ansi beforefieldinit GenericOtherFieldsType`1<T>
       extends [System.Runtime]System.ValueType
{
    .field public !T GenericField;
    .field int32 IntField;
}

// Provides casting logic tests for stfld, ldfld, call, callvirt
.class public auto ansi beforefieldinit GenericCastingTestsType`1<T>
       extends [System.Runtime]System.Object
{
    .field private int32 ThisIntField
    .method public hidebysig  instance void Casting.StorePlainFieldInThisGenericType_Valid(int32 v) cil managed
    {
        ldarg.0
        ldarg.1
        stfld int32 class GenericCastingTestsType`1<!T>::ThisIntField
        ret
    }

    .method public hidebysig  instance void Casting.StorePlainFieldInOtherGenericType_Valid(int32 v) cil managed
    {
		.locals init (
			class GenericOtherFieldsType`1<!T> V_0
		)

        ldloc.0
        ldarg.1
        stfld !0 class GenericOtherFieldsType`1<!T>::IntField
        ret
    }

    .field private !T ThisGenericField
    .method public hidebysig  instance void Casting.StoreGenericFieldInThisGenericType_Valid(!T v) cil managed
    {
        ldarg.0
        ldarg.1
        stfld !0 class GenericCastingTestsType`1<!T>::ThisGenericField
        ret
    }

    .method public hidebysig  instance void Casting.StoreGenericFieldInOtherGenericType_Valid(!T v) cil managed
    {
		.locals init (
			class GenericOtherFieldsType`1<!T> V_0
		)
        ldloc.0
        ldarg.1
        stfld !0 class GenericOtherFieldsType`1<!T>::GenericField
        ret
    }

    .method public hidebysig  instance void Casting.CallPlainFunctionFromThisGenericType_Valid(int32 v) cil managed
    {
        ldarg.0
        ldarg.1
        callvirt instance void class GenericCastingTestsType`1<!T>::Casting.StorePlainFieldInThisGenericType_Valid(int32)
        ret
    }

    .method public hidebysig  instance void Casting.CallGenericFunctionFromThisGenericType_Valid(!T v) cil managed
    {
        ldarg.0
        ldarg.1
        callvirt instance void class GenericCastingTestsType`1<!T>::Casting.CallGenericFunctionFromOtherGenericType_Valid(!0)
        ret
    }

    .method public hidebysig  instance void Casting.CallGenericFunctionFromOtherGenericType_Valid(!T v) cil managed
    {
		.locals init (
			class [System.Runtime]System.Func`1<!T> V_0
		)
        
        ldarg.0
        ldloc.0
        callvirt  instance !0 class [System.Runtime]System.Func`1<!T>::Invoke()
        ret
    }

    .method public hidebysig instance void Casting.AssignThisToSameTypeWithOtherGenericArgs_Invalid_StackUnexpected() cil managed
    {
		.locals init (
			class GenericCastingTestsType`1<int32> V_0
		)
        
        ldarg.0
        stloc.0
        ret
    }

    .method public hidebysig static void Casting.AssignToSameTypeWithOtherGenericArgs_Invalid_StackUnexpected() cil managed
    {
		.locals init (
			class GenericCastingTestsType`1<int32> V_0,
            class GenericCastingTestsType`1<string> V_1
		)
        
        ldloc.0
        stloc.1
        ret
    }
}
