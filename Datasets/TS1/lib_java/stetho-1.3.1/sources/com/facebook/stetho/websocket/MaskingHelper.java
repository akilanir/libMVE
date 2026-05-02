package com.facebook.stetho.websocket;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/websocket/MaskingHelper.class */
class MaskingHelper {
    MaskingHelper() {
    }

    public static void unmask(byte[] key, byte[] data, int offset, int count) {
        int index = 0;
        while (true) {
            int i = count;
            count--;
            if (i > 0) {
                int i2 = offset;
                offset++;
                int i3 = index;
                index++;
                data[i2] = (byte) (data[i2] ^ key[i3 % key.length]);
            } else {
                return;
            }
        }
    }
}
