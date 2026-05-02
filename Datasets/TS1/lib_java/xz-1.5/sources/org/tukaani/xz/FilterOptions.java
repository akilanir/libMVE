package org.tukaani.xz;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: xz-1.5.jar:org/tukaani/xz/FilterOptions.class */
public abstract class FilterOptions implements Cloneable {
    public static int getEncoderMemoryUsage(FilterOptions[] filterOptionsArr) {
        int i = 0;
        for (FilterOptions filterOptions : filterOptionsArr) {
            i += filterOptions.getEncoderMemoryUsage();
        }
        return i;
    }

    public static int getDecoderMemoryUsage(FilterOptions[] filterOptionsArr) {
        int i = 0;
        for (FilterOptions filterOptions : filterOptionsArr) {
            i += filterOptions.getDecoderMemoryUsage();
        }
        return i;
    }

    public abstract int getEncoderMemoryUsage();

    public abstract FinishableOutputStream getOutputStream(FinishableOutputStream finishableOutputStream);

    public abstract int getDecoderMemoryUsage();

    public abstract InputStream getInputStream(InputStream inputStream) throws IOException;

    abstract FilterEncoder getFilterEncoder();

    FilterOptions() {
    }
}
