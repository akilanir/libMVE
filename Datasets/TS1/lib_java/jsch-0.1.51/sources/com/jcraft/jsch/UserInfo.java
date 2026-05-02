package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/UserInfo.class */
public interface UserInfo {
    String getPassphrase();

    String getPassword();

    boolean promptPassword(String str);

    boolean promptPassphrase(String str);

    boolean promptYesNo(String str);

    void showMessage(String str);
}
