package org.tukaani.xz;

import java.io.InputStream;

/* loaded from: xz-1.5.jar:org/tukaani/xz/DeltaDecoder.class */
class DeltaDecoder extends DeltaCoder implements FilterDecoder {
    private final int distance;

    DeltaDecoder(byte[] bArr) throws UnsupportedOptionsException {
        if (bArr.length != 1) {
            throw new UnsupportedOptionsException("Unsupported Delta filter properties");
        }
        this.distance = (bArr[0] & 255) + 1;
    }

    @Override // org.tukaani.xz.FilterDecoder
    public int getMemoryUsage() {
        return 1;
    }

    @Override // org.tukaani.xz.FilterDecoder
    public InputStream getInputStream(InputStream inputStream) {
        return new DeltaInputStream(inputStream, this.distance);
    }
}
