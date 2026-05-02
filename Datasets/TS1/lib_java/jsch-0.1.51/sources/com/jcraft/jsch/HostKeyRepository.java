package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/HostKeyRepository.class */
public interface HostKeyRepository {
    public static final int OK = 0;
    public static final int NOT_INCLUDED = 1;
    public static final int CHANGED = 2;

    int check(String str, byte[] bArr);

    void add(HostKey hostKey, UserInfo userInfo);

    void remove(String str, String str2);

    void remove(String str, String str2, byte[] bArr);

    String getKnownHostsRepositoryID();

    HostKey[] getHostKey();

    HostKey[] getHostKey(String str, String str2);
}
