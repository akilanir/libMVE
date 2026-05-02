package com.google.zxing.oned;

/* loaded from: core-3.2.1.jar:com/google/zxing/oned/UPCEANWriter.class */
public abstract class UPCEANWriter extends OneDimensionalCodeWriter {
    @Override // com.google.zxing.oned.OneDimensionalCodeWriter
    public int getDefaultMargin() {
        return UPCEANReader.START_END_PATTERN.length;
    }
}
