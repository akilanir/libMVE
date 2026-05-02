package org.tukaani.xz;

/* loaded from: xz-1.5.jar:org/tukaani/xz/FilterCoder.class */
interface FilterCoder {
    boolean changesSize();

    boolean nonLastOK();

    boolean lastOK();
}
