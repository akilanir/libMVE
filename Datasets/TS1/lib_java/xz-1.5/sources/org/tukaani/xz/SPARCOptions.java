package org.tukaani.xz;

import java.io.InputStream;
import org.tukaani.xz.simple.SPARC;

/* loaded from: xz-1.5.jar:org/tukaani/xz/SPARCOptions.class */
public class SPARCOptions extends BCJOptions {
    private static final int ALIGNMENT = 4;

    public SPARCOptions() {
        super(4);
    }

    @Override // org.tukaani.xz.FilterOptions
    public FinishableOutputStream getOutputStream(FinishableOutputStream finishableOutputStream) {
        return new SimpleOutputStream(finishableOutputStream, new SPARC(true, this.startOffset));
    }

    @Override // org.tukaani.xz.FilterOptions
    public InputStream getInputStream(InputStream inputStream) {
        return new SimpleInputStream(inputStream, new SPARC(false, this.startOffset));
    }

    @Override // org.tukaani.xz.FilterOptions
    FilterEncoder getFilterEncoder() {
        return new BCJEncoder(this, 9L);
    }
}
