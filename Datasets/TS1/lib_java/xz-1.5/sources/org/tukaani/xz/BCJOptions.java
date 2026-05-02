package org.tukaani.xz;

/* loaded from: xz-1.5.jar:org/tukaani/xz/BCJOptions.class */
abstract class BCJOptions extends FilterOptions {
    private final int alignment;
    int startOffset = 0;
    static final boolean $assertionsDisabled;
    static Class class$org$tukaani$xz$BCJOptions;

    BCJOptions(int i) {
        this.alignment = i;
    }

    public void setStartOffset(int i) throws UnsupportedOptionsException {
        if ((i & (this.alignment - 1)) != 0) {
            throw new UnsupportedOptionsException(new StringBuffer().append("Start offset must be a multiple of ").append(this.alignment).toString());
        }
        this.startOffset = i;
    }

    public int getStartOffset() {
        return this.startOffset;
    }

    @Override // org.tukaani.xz.FilterOptions
    public int getEncoderMemoryUsage() {
        return SimpleOutputStream.getMemoryUsage();
    }

    @Override // org.tukaani.xz.FilterOptions
    public int getDecoderMemoryUsage() {
        return SimpleInputStream.getMemoryUsage();
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
        if (class$org$tukaani$xz$BCJOptions == null) {
            cls = class$("org.tukaani.xz.BCJOptions");
            class$org$tukaani$xz$BCJOptions = cls;
        } else {
            cls = class$org$tukaani$xz$BCJOptions;
        }
        $assertionsDisabled = !cls.desiredAssertionStatus();
    }
}
