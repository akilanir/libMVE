package org.ligi.axt.extensions;

import android.content.Context;
import android.content.pm.ResolveInfo;
import org.ligi.axt.BuildConfig;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/extensions/ResolveInfoAXT.class */
public class ResolveInfoAXT {
    public final ResolveInfo resolveInfo;

    public ResolveInfoAXT(ResolveInfo resolveInfo) {
        this.resolveInfo = resolveInfo;
    }

    public String getLabelSafely(Context context) {
        CharSequence charSequence = this.resolveInfo.loadLabel(context.getPackageManager());
        if (charSequence == null) {
            return BuildConfig.FLAVOR;
        }
        return charSequence.toString();
    }
}
