package com.google.zxing.datamatrix.encoder;

/* loaded from: core-3.2.1.jar:com/google/zxing/datamatrix/encoder/DataMatrixSymbolInfo144.class */
final class DataMatrixSymbolInfo144 extends SymbolInfo {
    DataMatrixSymbolInfo144() {
        super(false, 1558, 620, 22, 22, 36, -1, 62);
    }

    @Override // com.google.zxing.datamatrix.encoder.SymbolInfo
    public int getInterleavedBlockCount() {
        return 10;
    }

    @Override // com.google.zxing.datamatrix.encoder.SymbolInfo
    public int getDataLengthForInterleavedBlock(int index) {
        return index <= 8 ? 156 : 155;
    }
}
