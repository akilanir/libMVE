package org.dmfs.android.xmlmagic.tokenresolvers;

import android.os.Bundle;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/tokenresolvers/BundleTokenResolver.class */
public class BundleTokenResolver implements ITokenResolver {
    private final Bundle mBundle;

    public BundleTokenResolver(Bundle bundle) {
        this.mBundle = bundle;
    }

    @Override // org.dmfs.android.xmlmagic.tokenresolvers.ITokenResolver
    public CharSequence resolveToken(String str) {
        if (str == null || !str.startsWith("@bundle:")) {
            return null;
        }
        String substring = str.substring(8);
        if (this.mBundle.containsKey(substring)) {
            Object obj = this.mBundle.get(substring);
            if (obj != null) {
                return obj.toString();
            }
            return null;
        }
        Bundle bundle = this.mBundle;
        do {
            int indexOf = substring.indexOf(46);
            if (indexOf <= 0) {
                return null;
            }
            bundle = bundle.getBundle(substring.substring(0, indexOf));
            if (bundle == null) {
                return null;
            }
            substring = substring.substring(indexOf + 1);
        } while (!bundle.containsKey(substring));
        Object obj2 = this.mBundle.get(substring);
        if (obj2 != null) {
            return obj2.toString();
        }
        return null;
    }
}
