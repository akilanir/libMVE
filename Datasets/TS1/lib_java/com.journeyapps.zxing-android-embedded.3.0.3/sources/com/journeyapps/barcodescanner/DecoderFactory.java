package com.journeyapps.barcodescanner;

import com.google.zxing.DecodeHintType;
import java.util.Map;

/* loaded from: com.journeyapps.zxing-android-embedded.3.0.3.jar:com/journeyapps/barcodescanner/DecoderFactory.class */
public interface DecoderFactory {
    Decoder createDecoder(Map<DecodeHintType, ?> map);
}
