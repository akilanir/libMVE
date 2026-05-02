package org.dmfs.android.xmlmagic.tokenresolvers;

import android.database.Cursor;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/tokenresolvers/CursorTokenResolver.class */
public class CursorTokenResolver implements ITokenResolver {
    private final Cursor mCursor;

    public CursorTokenResolver(Cursor cursor) {
        this.mCursor = cursor;
    }

    @Override // org.dmfs.android.xmlmagic.tokenresolvers.ITokenResolver
    public CharSequence resolveToken(String str) {
        if (str == null || !str.startsWith("@cursor:")) {
            return null;
        }
        int columnIndex = this.mCursor.getColumnIndex(str.substring(8));
        if (columnIndex < 0) {
            return null;
        }
        return this.mCursor.getString(columnIndex);
    }
}
