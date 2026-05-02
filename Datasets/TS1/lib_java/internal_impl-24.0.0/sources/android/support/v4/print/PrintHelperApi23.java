package android.support.v4.print;

import android.content.Context;
import android.print.PrintAttributes;

/* loaded from: internal_impl-24.0.0.jar:android/support/v4/print/PrintHelperApi23.class */
class PrintHelperApi23 extends PrintHelperApi20 {
    @Override // android.support.v4.print.PrintHelperKitkat
    protected PrintAttributes.Builder copyAttributes(PrintAttributes other) {
        PrintAttributes.Builder b = super.copyAttributes(other);
        if (other.getDuplexMode() != 0) {
            b.setDuplexMode(other.getDuplexMode());
        }
        return b;
    }

    PrintHelperApi23(Context context) {
        super(context);
        this.mIsMinMarginsHandlingCorrect = false;
    }
}
