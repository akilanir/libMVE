package com.koushikdutta.ion.bitmap;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/bitmap/Exif.class */
public class Exif {
    private static final String TAG = "CameraExif";

    /* JADX WARN: Code restructure failed: missing block: B:28:0x0075, code lost:
    
        android.util.Log.e(com.koushikdutta.ion.bitmap.Exif.TAG, "Invalid length");
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static int getOrientation(byte[] r5, int r6, int r7) {
        /*
            Method dump skipped, instructions count: 426
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.koushikdutta.ion.bitmap.Exif.getOrientation(byte[], int, int):int");
    }

    private static int pack(byte[] bytes, int offset, int length, boolean littleEndian) {
        int step = 1;
        if (littleEndian) {
            offset += length - 1;
            step = -1;
        }
        int value = 0;
        while (true) {
            int i = length;
            length--;
            if (i > 0) {
                value = (value << 8) | (bytes[offset] & 255);
                offset += step;
            } else {
                return value;
            }
        }
    }
}
