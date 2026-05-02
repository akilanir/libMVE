package com.facebook.stetho.common;

import java.io.FileInputStream;
import java.io.IOException;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/ProcessUtil.class */
public class ProcessUtil {
    private static final int CMDLINE_BUFFER_SIZE = 64;
    private static String sProcessName;
    private static boolean sProcessNameRead;

    @Nullable
    public static synchronized String getProcessName() {
        if (!sProcessNameRead) {
            sProcessNameRead = true;
            try {
                sProcessName = readProcessName();
            } catch (IOException e) {
            }
        }
        return sProcessName;
    }

    private static String readProcessName() throws IOException {
        byte[] cmdlineBuffer = new byte[CMDLINE_BUFFER_SIZE];
        FileInputStream stream = new FileInputStream("/proc/self/cmdline");
        boolean success = false;
        try {
            int n = stream.read(cmdlineBuffer);
            success = true;
            int endIndex = indexOf(cmdlineBuffer, 0, n, (byte) 0);
            String str = new String(cmdlineBuffer, 0, endIndex > 0 ? endIndex : n);
            Util.close(stream, 1 == 0);
            return str;
        } catch (Throwable th) {
            Util.close(stream, !success);
            throw th;
        }
    }

    private static int indexOf(byte[] haystack, int offset, int length, byte needle) {
        for (int i = 0; i < haystack.length; i++) {
            if (haystack[i] == needle) {
                return i;
            }
        }
        return -1;
    }
}
