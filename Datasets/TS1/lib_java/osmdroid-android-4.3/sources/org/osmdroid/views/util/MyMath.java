package org.osmdroid.views.util;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/views/util/MyMath.class */
public class MyMath {
    private MyMath() {
    }

    public static int getNextSquareNumberAbove(float factor) {
        int out = 0;
        int cur = 1;
        int i = 1;
        while (cur <= factor) {
            out = i;
            cur *= 2;
            i++;
        }
        return out;
    }
}
