package org.dmfs.android.xmlmagic.tokenresolvers;

import android.content.Intent;
import android.os.Bundle;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/tokenresolvers/IntentTokenResolver.class */
public class IntentTokenResolver implements ITokenResolver {
    private final Intent mIntent;

    public IntentTokenResolver(Intent intent) {
        this.mIntent = intent;
    }

    @Override // org.dmfs.android.xmlmagic.tokenresolvers.ITokenResolver
    public CharSequence resolveToken(String str) {
        if (str == null || !str.startsWith("@intent.")) {
            return null;
        }
        if (str.equals("@intent.data")) {
            return this.mIntent.getDataString();
        }
        if (str.equals("@intent.data.scheme")) {
            return this.mIntent.getScheme();
        }
        if (str.equals("@intent.action")) {
            return this.mIntent.getAction();
        }
        if (str.equals("@intent.type")) {
            return this.mIntent.getType();
        }
        if (!str.startsWith("@intent.extra:")) {
            return null;
        }
        Bundle extras = this.mIntent.getExtras();
        String substring = str.substring(14);
        if (extras.containsKey(substring)) {
            Object obj = extras.get(substring);
            if (obj != null) {
                return obj.toString();
            }
            return null;
        }
        do {
            int indexOf = substring.indexOf(46);
            if (indexOf <= 0) {
                return null;
            }
            extras = extras.getBundle(substring.substring(0, indexOf));
            if (extras == null) {
                return null;
            }
            substring = substring.substring(indexOf + 1);
        } while (!extras.containsKey(substring));
        Object obj2 = extras.get(substring);
        if (obj2 != null) {
            return obj2.toString();
        }
        return null;
    }
}
