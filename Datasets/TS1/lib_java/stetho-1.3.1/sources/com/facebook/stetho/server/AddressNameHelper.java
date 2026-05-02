package com.facebook.stetho.server;

import com.facebook.stetho.common.ProcessUtil;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/AddressNameHelper.class */
public class AddressNameHelper {
    private static final String PREFIX = "stetho_";

    public static String createCustomAddress(String suffix) {
        return PREFIX + ProcessUtil.getProcessName() + suffix;
    }
}
