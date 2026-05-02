package org.msgpack.util.android;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/util/android/DalvikVmChecker.class */
public final class DalvikVmChecker {
    private static final boolean isDalvikVm;

    static {
        boolean isIt = false;
        try {
            isIt = System.getProperty("java.vm.name").equals("Dalvik");
            isDalvikVm = isIt;
        } catch (Throwable th) {
            isDalvikVm = isIt;
            throw th;
        }
    }

    public static boolean isDalvikVm() {
        return isDalvikVm;
    }
}
