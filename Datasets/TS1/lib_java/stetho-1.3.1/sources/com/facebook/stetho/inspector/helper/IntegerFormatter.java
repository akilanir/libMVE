package com.facebook.stetho.inspector.helper;

import android.annotation.TargetApi;
import android.os.Build;
import android.support.annotation.Nullable;
import android.view.ViewDebug;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/helper/IntegerFormatter.class */
public class IntegerFormatter {
    private static IntegerFormatter cachedFormatter;

    public static IntegerFormatter getInstance() {
        if (cachedFormatter == null) {
            synchronized (IntegerFormatter.class) {
                if (cachedFormatter == null) {
                    if (Build.VERSION.SDK_INT >= 21) {
                        cachedFormatter = new IntegerFormatterWithHex();
                    } else {
                        cachedFormatter = new IntegerFormatter();
                    }
                }
            }
        }
        return cachedFormatter;
    }

    private IntegerFormatter() {
    }

    public String format(Integer integer, @Nullable ViewDebug.ExportedProperty annotation) {
        return String.valueOf(integer);
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/helper/IntegerFormatter$IntegerFormatterWithHex.class */
    private static class IntegerFormatterWithHex extends IntegerFormatter {
        private IntegerFormatterWithHex() {
            super();
        }

        @Override // com.facebook.stetho.inspector.helper.IntegerFormatter
        @TargetApi(21)
        public String format(Integer integer, @Nullable ViewDebug.ExportedProperty annotation) {
            if (annotation != null && annotation.formatToHexString()) {
                return "0x" + Integer.toHexString(integer.intValue());
            }
            return super.format(integer, annotation);
        }
    }
}
