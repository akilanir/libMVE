package org.tukaani.xz;

import java.io.InputStream;

/* loaded from: xz-1.5.jar:org/tukaani/xz/DeltaOptions.class */
public class DeltaOptions extends FilterOptions {
    public static final int DISTANCE_MIN = 1;
    public static final int DISTANCE_MAX = 256;
    private int distance = 1;
    static final boolean $assertionsDisabled;
    static Class class$org$tukaani$xz$DeltaOptions;

    public DeltaOptions() {
    }

    public DeltaOptions(int i) throws UnsupportedOptionsException {
        setDistance(i);
    }

    public void setDistance(int i) throws UnsupportedOptionsException {
        if (i < 1 || i > 256) {
            throw new UnsupportedOptionsException(new StringBuffer().append("Delta distance must be in the range [1, 256]: ").append(i).toString());
        }
        this.distance = i;
    }

    public int getDistance() {
        return this.distance;
    }

    @Override // org.tukaani.xz.FilterOptions
    public int getEncoderMemoryUsage() {
        return DeltaOutputStream.getMemoryUsage();
    }

    @Override // org.tukaani.xz.FilterOptions
    public FinishableOutputStream getOutputStream(FinishableOutputStream finishableOutputStream) {
        return new DeltaOutputStream(finishableOutputStream, this);
    }

    @Override // org.tukaani.xz.FilterOptions
    public int getDecoderMemoryUsage() {
        return 1;
    }

    @Override // org.tukaani.xz.FilterOptions
    public InputStream getInputStream(InputStream inputStream) {
        return new DeltaInputStream(inputStream, this.distance);
    }

    @Override // org.tukaani.xz.FilterOptions
    FilterEncoder getFilterEncoder() {
        return new DeltaEncoder(this);
    }

    public Object clone() {
        try {
            return super.clone();
        } catch (CloneNotSupportedException e) {
            if ($assertionsDisabled) {
                throw new RuntimeException();
            }
            throw new AssertionError();
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    static {
        Class cls;
        if (class$org$tukaani$xz$DeltaOptions == null) {
            cls = class$("org.tukaani.xz.DeltaOptions");
            class$org$tukaani$xz$DeltaOptions = cls;
        } else {
            cls = class$org$tukaani$xz$DeltaOptions;
        }
        $assertionsDisabled = !cls.desiredAssertionStatus();
    }
}
