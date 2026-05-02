package org.tukaani.xz;

/* loaded from: xz-1.5.jar:org/tukaani/xz/LZMA2Coder.class */
abstract class LZMA2Coder implements FilterCoder {
    public static final long FILTER_ID = 33;

    LZMA2Coder() {
    }

    @Override // org.tukaani.xz.FilterCoder
    public boolean changesSize() {
        return true;
    }

    @Override // org.tukaani.xz.FilterCoder
    public boolean nonLastOK() {
        return false;
    }

    @Override // org.tukaani.xz.FilterCoder
    public boolean lastOK() {
        return true;
    }
}
