package com.google.zxing.client.result;

import com.google.zxing.Result;

/* loaded from: core-3.2.0.jar:com/google/zxing/client/result/URLTOResultParser.class */
public final class URLTOResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    public URIParsedResult parse(Result result) {
        int titleEnd;
        String rawText = getMassagedText(result);
        if ((!rawText.startsWith("urlto:") && !rawText.startsWith("URLTO:")) || (titleEnd = rawText.indexOf(58, 6)) < 0) {
            return null;
        }
        String title = titleEnd <= 6 ? null : rawText.substring(6, titleEnd);
        String uri = rawText.substring(titleEnd + 1);
        return new URIParsedResult(uri, title);
    }
}
