package com.journeyapps.barcodescanner;

import com.google.zxing.ResultPoint;
import java.util.List;

/* loaded from: com.journeyapps.zxing-android-embedded.3.0.3.jar:com/journeyapps/barcodescanner/BarcodeCallback.class */
public interface BarcodeCallback {
    void barcodeResult(BarcodeResult barcodeResult);

    void possibleResultPoints(List<ResultPoint> list);
}
