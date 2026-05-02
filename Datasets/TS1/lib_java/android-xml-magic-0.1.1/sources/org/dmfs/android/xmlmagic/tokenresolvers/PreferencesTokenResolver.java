package org.dmfs.android.xmlmagic.tokenresolvers;

import android.content.Context;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/tokenresolvers/PreferencesTokenResolver.class */
public class PreferencesTokenResolver implements ITokenResolver {
    private final Context mContext;

    public PreferencesTokenResolver(Context context) {
        this.mContext = context;
    }

    @Override // org.dmfs.android.xmlmagic.tokenresolvers.ITokenResolver
    public CharSequence resolveToken(String str) {
        String substring;
        int indexOf;
        if (str != null && str.startsWith("@prefs:") && (indexOf = (substring = str.substring(7)).indexOf(47)) > 0 && indexOf < substring.length() - 1) {
            return this.mContext.getSharedPreferences(substring.substring(0, indexOf - 1), 0).getString(substring.substring(indexOf + 1), null);
        }
        return null;
    }
}
