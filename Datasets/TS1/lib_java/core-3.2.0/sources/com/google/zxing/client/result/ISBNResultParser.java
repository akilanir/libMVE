package com.google.zxing.client.result;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.Result;

/* loaded from: core-3.2.0.jar:com/google/zxing/client/result/ISBNResultParser.class */
public final class ISBNResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    public ISBNParsedResult parse(Result result) {
        BarcodeFormat format = result.getBarcodeFormat();
        if (format != BarcodeFormat.EAN_13) {
            return null;
        }
        String rawText = getMassagedText(result);
        int length = rawText.length();
        if (length != 13) {
            return null;
        }
        if (!rawText.startsWith("978") && !rawText.startsWith("979")) {
            return null;
        }
        return new ISBNParsedResult(rawText);
    }
}
