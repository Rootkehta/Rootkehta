// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

using System;
using System.Runtime.InteropServices;
using Microsoft.Win32.SafeHandles;

internal static partial class Interop
{
    internal static partial class Crypto
    {
        internal static bool EcDsaSign(ReadOnlySpan<byte> dgst, Span<byte> sig, out int siglen, SafeEcKeyHandle ecKey) =>
            EcDsaSign(ref MemoryMarshal.GetReference(dgst), dgst.Length, ref MemoryMarshal.GetReference(sig), out siglen, ecKey);

        [GeneratedDllImport(Libraries.CryptoNative, EntryPoint = "CryptoNative_EcDsaSign")]
        [return: MarshalAs(UnmanagedType.Bool)]
        private static partial bool EcDsaSign(ref byte dgst, int dlen, ref byte sig, out int siglen, SafeEcKeyHandle ecKey);

        internal static int EcDsaVerify(ReadOnlySpan<byte> dgst, ReadOnlySpan<byte> sigbuf, SafeEcKeyHandle ecKey)
        {
            int ret = EcDsaVerify(
                ref MemoryMarshal.GetReference(dgst),
                dgst.Length,
                ref MemoryMarshal.GetReference(sigbuf),
                sigbuf.Length,
                ecKey);

            if (ret < 0)
            {
                ErrClearError();
            }

            return ret;
        }

        /*-
         * returns
         *      1: correct signature
         *      0: incorrect signature
         *     -1: error
         */
        [GeneratedDllImport(Libraries.CryptoNative, EntryPoint = "CryptoNative_EcDsaVerify")]
        private static partial int EcDsaVerify(ref byte dgst, int dgst_len, ref byte sigbuf, int sig_len, SafeEcKeyHandle ecKey);

        // returns the maximum length of a DER encoded ECDSA signature created with this key.
        [GeneratedDllImport(Libraries.CryptoNative, EntryPoint = "CryptoNative_EcDsaSize")]
        private static partial int CryptoNative_EcDsaSize(SafeEcKeyHandle ecKey);

        internal static int EcDsaSize(SafeEcKeyHandle ecKey)
        {
            int ret = CryptoNative_EcDsaSize(ecKey);

            if (ret == 0)
            {
                throw CreateOpenSslCryptographicException();
            }

            return ret;
        }
    }
}
