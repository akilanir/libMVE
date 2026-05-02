package org.tukaani.xz;

import java.io.InputStream;
import org.tukaani.xz.simple.ARM;
import org.tukaani.xz.simple.ARMThumb;
import org.tukaani.xz.simple.IA64;
import org.tukaani.xz.simple.PowerPC;
import org.tukaani.xz.simple.SPARC;
import org.tukaani.xz.simple.SimpleFilter;
import org.tukaani.xz.simple.X86;

/* loaded from: xz-1.5.jar:org/tukaani/xz/BCJDecoder.class */
class BCJDecoder extends BCJCoder implements FilterDecoder {
    private final long filterID;
    private final int startOffset;
    static final boolean $assertionsDisabled;
    static Class class$org$tukaani$xz$BCJDecoder;

    BCJDecoder(long j, byte[] bArr) throws UnsupportedOptionsException {
        if (!$assertionsDisabled && !isBCJFilterID(j)) {
            throw new AssertionError();
        }
        this.filterID = j;
        if (bArr.length == 0) {
            this.startOffset = 0;
            return;
        }
        if (bArr.length != 4) {
            throw new UnsupportedOptionsException("Unsupported BCJ filter properties");
        }
        int i = 0;
        for (int i2 = 0; i2 < 4; i2++) {
            i |= (bArr[i2] & 255) << (i2 * 8);
        }
        this.startOffset = i;
    }

    @Override // org.tukaani.xz.FilterDecoder
    public int getMemoryUsage() {
        return SimpleInputStream.getMemoryUsage();
    }

    @Override // org.tukaani.xz.FilterDecoder
    public InputStream getInputStream(InputStream inputStream) {
        SimpleFilter simpleFilter = null;
        if (this.filterID == 4) {
            simpleFilter = new X86(false, this.startOffset);
        } else if (this.filterID == 5) {
            simpleFilter = new PowerPC(false, this.startOffset);
        } else if (this.filterID == 6) {
            simpleFilter = new IA64(false, this.startOffset);
        } else if (this.filterID == 7) {
            simpleFilter = new ARM(false, this.startOffset);
        } else if (this.filterID == 8) {
            simpleFilter = new ARMThumb(false, this.startOffset);
        } else if (this.filterID == 9) {
            simpleFilter = new SPARC(false, this.startOffset);
        } else if (!$assertionsDisabled) {
            throw new AssertionError();
        }
        return new SimpleInputStream(inputStream, simpleFilter);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    static {
        Class cls;
        if (class$org$tukaani$xz$BCJDecoder == null) {
            cls = class$("org.tukaani.xz.BCJDecoder");
            class$org$tukaani$xz$BCJDecoder = cls;
        } else {
            cls = class$org$tukaani$xz$BCJDecoder;
        }
        $assertionsDisabled = !cls.desiredAssertionStatus();
    }
}
