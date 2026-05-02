package com.journeyapps.barcodescanner;

import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;

/* loaded from: com.journeyapps.zxing-android-embedded.3.0.3.jar:com/journeyapps/barcodescanner/DecoderResultPointCallback.class */
public class DecoderResultPointCallback implements ResultPointCallback {
    private Decoder decoder;

    public DecoderResultPointCallback(Decoder decoder) {
        this.decoder = decoder;
    }

    public DecoderResultPointCallback() {
    }

    public Decoder getDecoder() {
        return this.decoder;
    }

    public void setDecoder(Decoder decoder) {
        this.decoder = decoder;
    }

    public void foundPossibleResultPoint(ResultPoint point) {
        if (this.decoder != null) {
            this.decoder.foundPossibleResultPoint(point);
        }
    }
}
