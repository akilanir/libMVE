package org.osmdroid.util;

import org.osmdroid.util.constants.UtilConstants;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/util/NetworkLocationIgnorer.class */
public class NetworkLocationIgnorer implements UtilConstants {
    private long mLastGps = 0;

    public boolean shouldIgnore(String pProvider, long pTime) {
        if ("gps".equals(pProvider)) {
            this.mLastGps = pTime;
            return false;
        }
        if (pTime < this.mLastGps + UtilConstants.GPS_WAIT_TIME) {
            return true;
        }
        return false;
    }
}
