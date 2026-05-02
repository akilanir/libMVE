package org.tukaani.xz;

/* loaded from: xz-1.5.jar:org/tukaani/xz/FilterEncoder.class */
interface FilterEncoder extends FilterCoder {
    long getFilterID();

    byte[] getFilterProps();

    boolean supportsFlushing();

    FinishableOutputStream getOutputStream(FinishableOutputStream finishableOutputStream);
}
