// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

using System;
using System.Diagnostics;
using System.Security.Cryptography;
using Internal.NativeCrypto;

namespace Internal.Cryptography
{
    internal static class RC2BCryptModes
    {
        internal static SafeAlgorithmHandle GetHandle(CipherMode cipherMode, int effectiveKeyLength) =>
            // Windows 8 added support to set CipherMode and EffectiveKeyLength on a key,
            // but Windows 7 requires that they be set on the algorithm before key creation.
            // Unlike the other SymmetricAlgorithm types that cache the algorithm based on CipherMode,
            // RC2 creates a new algorithm each time since it must set EffectiveKeyLength.
            cipherMode switch
            {
                CipherMode.CBC => OpenRC2Algorithm(Cng.BCRYPT_CHAIN_MODE_CBC, effectiveKeyLength),
                CipherMode.ECB => OpenRC2Algorithm(Cng.BCRYPT_CHAIN_MODE_ECB, effectiveKeyLength),
                _ => throw new NotSupportedException(),
            };

        private static SafeAlgorithmHandle OpenRC2Algorithm(string cipherMode, int effectiveKeyLength)
        {
            SafeAlgorithmHandle hAlg = Cng.BCryptOpenAlgorithmProvider(Cng.BCRYPT_RC2_ALGORITHM, null, Cng.OpenAlgorithmProviderFlags.NONE);
            hAlg.SetCipherMode(cipherMode);

            Debug.Assert(effectiveKeyLength > 0);
            Cng.SetEffectiveKeyLength(hAlg, effectiveKeyLength);

            return hAlg;
        }
    }
}
