package org.tukaani.xz;

/* loaded from: xz-1.5.jar:org/tukaani/xz/DeltaCoder.class */
abstract class DeltaCoder implements FilterCoder {
    public static final long FILTER_ID = 3;

    DeltaCoder() {
    }

    @Override // org.tukaani.xz.FilterCoder
    public boolean changesSize() {
        return false;
    }

    @Override // org.tukaani.xz.FilterCoder
    public boolean nonLastOK() {
        return true;
    }

    @Override // org.tukaani.xz.FilterCoder
    public boolean lastOK() {
        return false;
    }
}
