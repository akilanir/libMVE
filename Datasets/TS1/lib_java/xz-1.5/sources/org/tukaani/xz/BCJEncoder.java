package org.tukaani.xz;

/* loaded from: xz-1.5.jar:org/tukaani/xz/BCJEncoder.class */
class BCJEncoder extends BCJCoder implements FilterEncoder {
    private final BCJOptions options;
    private final long filterID;
    private final byte[] props;
    static final boolean $assertionsDisabled;
    static Class class$org$tukaani$xz$BCJEncoder;

    BCJEncoder(BCJOptions bCJOptions, long j) {
        if (!$assertionsDisabled && !isBCJFilterID(j)) {
            throw new AssertionError();
        }
        int startOffset = bCJOptions.getStartOffset();
        if (startOffset == 0) {
            this.props = new byte[0];
        } else {
            this.props = new byte[4];
            for (int i = 0; i < 4; i++) {
                this.props[i] = (byte) (startOffset >>> (i * 8));
            }
        }
        this.filterID = j;
        this.options = (BCJOptions) bCJOptions.clone();
    }

    @Override // org.tukaani.xz.FilterEncoder
    public long getFilterID() {
        return this.filterID;
    }

    @Override // org.tukaani.xz.FilterEncoder
    public byte[] getFilterProps() {
        return this.props;
    }

    @Override // org.tukaani.xz.FilterEncoder
    public boolean supportsFlushing() {
        return false;
    }

    @Override // org.tukaani.xz.FilterEncoder
    public FinishableOutputStream getOutputStream(FinishableOutputStream finishableOutputStream) {
        return this.options.getOutputStream(finishableOutputStream);
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
        if (class$org$tukaani$xz$BCJEncoder == null) {
            cls = class$("org.tukaani.xz.BCJEncoder");
            class$org$tukaani$xz$BCJEncoder = cls;
        } else {
            cls = class$org$tukaani$xz$BCJEncoder;
        }
        $assertionsDisabled = !cls.desiredAssertionStatus();
    }
}
