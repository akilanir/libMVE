package com.readystatesoftware.sqliteasset;

import android.util.Log;
import com.readystatesoftware.sqliteasset.SQLiteAssetHelper;
import java.util.Comparator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: sqliteassethelper-2.0.1.jar:com/readystatesoftware/sqliteasset/VersionComparator.class */
class VersionComparator implements Comparator<String> {
    private static final String TAG = SQLiteAssetHelper.class.getSimpleName();
    private Pattern pattern = Pattern.compile(".*_upgrade_([0-9]+)-([0-9]+).*");

    VersionComparator() {
    }

    @Override // java.util.Comparator
    public int compare(String file0, String file1) {
        Matcher m0 = this.pattern.matcher(file0);
        Matcher m1 = this.pattern.matcher(file1);
        if (!m0.matches()) {
            Log.w(TAG, "could not parse upgrade script file: " + file0);
            throw new SQLiteAssetHelper.SQLiteAssetException("Invalid upgrade script file");
        }
        if (!m1.matches()) {
            Log.w(TAG, "could not parse upgrade script file: " + file1);
            throw new SQLiteAssetHelper.SQLiteAssetException("Invalid upgrade script file");
        }
        int v0_from = Integer.valueOf(m0.group(1)).intValue();
        int v1_from = Integer.valueOf(m1.group(1)).intValue();
        int v0_to = Integer.valueOf(m0.group(2)).intValue();
        int v1_to = Integer.valueOf(m1.group(2)).intValue();
        if (v0_from != v1_from) {
            return v0_from < v1_from ? -1 : 1;
        }
        if (v0_to == v1_to) {
            return 0;
        }
        return v0_to < v1_to ? -1 : 1;
    }
}
