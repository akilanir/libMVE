package com.google.zxing.datamatrix.encoder;

/* loaded from: core-3.2.1.jar:com/google/zxing/datamatrix/encoder/Encoder.class */
interface Encoder {
    int getEncodingMode();

    void encode(EncoderContext encoderContext);
}
