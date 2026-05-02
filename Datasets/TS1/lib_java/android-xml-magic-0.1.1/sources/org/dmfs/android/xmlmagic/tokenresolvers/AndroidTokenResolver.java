package org.dmfs.android.xmlmagic.tokenresolvers;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Build;
import java.util.Locale;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver.class */
public class AndroidTokenResolver implements ITokenResolver {
    private final Context mContext;
    private ITokenResolver[] mResolvers;

    public AndroidTokenResolver(Context context) {
        this.mContext = context.getApplicationContext();
    }

    public AndroidTokenResolver setResolvers(ITokenResolver... iTokenResolverArr) {
        this.mResolvers = iTokenResolverArr;
        return this;
    }

    @Override // org.dmfs.android.xmlmagic.tokenresolvers.ITokenResolver
    public CharSequence resolveToken(String str) {
        Resources resources;
        int identifier;
        if (str == null) {
            return null;
        }
        if (this.mResolvers != null && this.mResolvers.length > 0) {
            for (ITokenResolver iTokenResolver : this.mResolvers) {
                CharSequence resolveToken = iTokenResolver.resolveToken(str);
                if (resolveToken != null) {
                    return resolveToken;
                }
            }
        }
        if (str.startsWith("@android.")) {
            if (str.equals("@android.model")) {
                return Build.MODEL;
            }
            if (str.equals("@android.sdk")) {
                return Integer.toString(Build.VERSION.SDK_INT);
            }
            if (str.equals("@android.release")) {
                return Build.VERSION.RELEASE;
            }
            if (str.equals("@android.manufacturer")) {
                return Build.MANUFACTURER;
            }
            if (str.equals("@android.product")) {
                return Build.PRODUCT;
            }
            return null;
        }
        if (str.startsWith("@locale.")) {
            if (str.equals("@locale.lang")) {
                return Locale.getDefault().getLanguage();
            }
            if (str.equals("@locale.country")) {
                return Locale.getDefault().getCountry();
            }
            return null;
        }
        if (!str.startsWith("@app.")) {
            if (!str.startsWith("@string/") || (identifier = (resources = this.mContext.getResources()).getIdentifier(str.substring(1), null, this.mContext.getPackageName())) == 0) {
                return null;
            }
            return resources.getText(identifier);
        }
        PackageManager packageManager = this.mContext.getPackageManager();
        String packageName = this.mContext.getPackageName();
        try {
            PackageInfo packageInfo = packageManager.getPackageInfo(packageName, 0);
            if (str.equals("@app.package")) {
                return packageName;
            }
            if (str.equals("@app.title")) {
                CharSequence applicationLabel = packageManager.getApplicationLabel(this.mContext.getApplicationInfo());
                return applicationLabel == null ? packageName : applicationLabel.toString();
            }
            if (str.equals("@app.version")) {
                return packageInfo.versionName;
            }
            if (str.equals("@app.version_code")) {
                return Integer.toString(packageInfo.versionCode);
            }
            return null;
        } catch (PackageManager.NameNotFoundException e) {
            return null;
        }
    }
}
