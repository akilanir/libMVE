package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/SftpProgressMonitor.class */
public interface SftpProgressMonitor {
    public static final int PUT = 0;
    public static final int GET = 1;
    public static final long UNKNOWN_SIZE = -1;

    void init(int i, String str, String str2, long j);

    boolean count(long j);

    void end();
}
