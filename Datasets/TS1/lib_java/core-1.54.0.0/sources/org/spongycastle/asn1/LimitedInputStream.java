package org.spongycastle.asn1;

import java.io.InputStream;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/asn1/LimitedInputStream.class */
abstract class LimitedInputStream extends InputStream {
    protected final InputStream _in;
    private int _limit;

    LimitedInputStream(InputStream in, int limit) {
        this._in = in;
        this._limit = limit;
    }

    int getRemaining() {
        return this._limit;
    }

    protected void setParentEofDetect(boolean on) {
        if (this._in instanceof IndefiniteLengthInputStream) {
            ((IndefiniteLengthInputStream) this._in).setEofOn00(on);
        }
    }
}
