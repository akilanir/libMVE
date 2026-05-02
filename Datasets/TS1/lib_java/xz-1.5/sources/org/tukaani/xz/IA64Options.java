package org.tukaani.xz;

import java.io.InputStream;
import org.tukaani.xz.simple.IA64;

/* loaded from: xz-1.5.jar:org/tukaani/xz/IA64Options.class */
public class IA64Options extends BCJOptions {
    private static final int ALIGNMENT = 16;

    public IA64Options() {
        super(ALIGNMENT);
    }

    @Override // org.tukaani.xz.FilterOptions
    public FinishableOutputStream getOutputStream(FinishableOutputStream finishableOutputStream) {
        return new SimpleOutputStream(finishableOutputStream, new IA64(true, this.startOffset));
    }

    @Override // org.tukaani.xz.FilterOptions
    public InputStream getInputStream(InputStream inputStream) {
        return new SimpleInputStream(inputStream, new IA64(false, this.startOffset));
    }

    @Override // org.tukaani.xz.FilterOptions
    FilterEncoder getFilterEncoder() {
        return new BCJEncoder(this, 6L);
    }
}
