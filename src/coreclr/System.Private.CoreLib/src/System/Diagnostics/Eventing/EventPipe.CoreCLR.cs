// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Threading;

#if FEATURE_PERFTRACING

namespace System.Diagnostics.Tracing
{
    internal static partial class EventPipeInternal
    {
        //
        // These PInvokes are used by the configuration APIs to interact with EventPipe.
        //
        [DllImport(RuntimeHelpers.QCall, EntryPoint = "EventPipeInternal_Enable")]
        private static unsafe extern ulong Enable(
            char* outputFile,
            EventPipeSerializationFormat format,
            uint circularBufferSizeInMB,
            EventPipeProviderConfigurationNative* providers,
            uint numProviders);

        [DllImport(RuntimeHelpers.QCall, EntryPoint = "EventPipeInternal_Disable")]
        internal static extern void Disable(ulong sessionID);

        //
        // These PInvokes are used by EventSource to interact with the EventPipe.
        //
        [DllImport(RuntimeHelpers.QCall, EntryPoint = "EventPipeInternal_CreateProvider", CharSet = CharSet.Unicode)]
        internal static extern IntPtr CreateProvider(string providerName, Interop.Advapi32.EtwEnableCallback callbackFunc);

        [DllImport(RuntimeHelpers.QCall, EntryPoint = "EventPipeInternal_DefineEvent")]
        internal static extern unsafe IntPtr DefineEvent(IntPtr provHandle, uint eventID, long keywords, uint eventVersion, uint level, void *pMetadata, uint metadataLength);

        [DllImport(RuntimeHelpers.QCall, EntryPoint = "EventPipeInternal_GetProvider", CharSet = CharSet.Unicode)]
        internal static extern IntPtr GetProvider(string providerName);

        [DllImport(RuntimeHelpers.QCall, EntryPoint = "EventPipeInternal_DeleteProvider")]
        internal static extern void DeleteProvider(IntPtr provHandle);

        [DllImport(RuntimeHelpers.QCall, EntryPoint = "EventPipeInternal_EventActivityIdControl")]
        internal static extern int EventActivityIdControl(uint controlCode, ref Guid activityId);

        [DllImport(RuntimeHelpers.QCall, EntryPoint = "EventPipeInternal_WriteEventData")]
        internal static extern unsafe void WriteEventData(IntPtr eventHandle, EventProvider.EventData* pEventData, uint dataCount, Guid* activityId, Guid* relatedActivityId);

        //
        // These PInvokes are used as part of the EventPipeEventDispatcher.
        //
        [DllImport(RuntimeHelpers.QCall, EntryPoint = "EventPipeInternal_GetSessionInfo")]
        internal static extern unsafe bool GetSessionInfo(ulong sessionID, EventPipeSessionInfo* pSessionInfo);

        [DllImport(RuntimeHelpers.QCall, EntryPoint = "EventPipeInternal_GetNextEvent")]
        internal static extern unsafe bool GetNextEvent(ulong sessionID, EventPipeEventInstanceData* pInstance);

        [DllImport(RuntimeHelpers.QCall, EntryPoint = "EventPipeInternal_GetWaitHandle")]
        internal static extern unsafe IntPtr GetWaitHandle(ulong sessionID);
    }
}

#endif // FEATURE_PERFTRACING
