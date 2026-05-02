package org.tukaani.xz;

import java.io.InputStream;
import org.tukaani.xz.simple.X86;

/* loaded from: xz-1.5.jar:org/tukaani/xz/X86Options.class */
public class X86Options extends BCJOptions {
    private static final int ALIGNMENT = 1;

    public X86Options() {
        super(1);
    }

    @Override // org.tukaani.xz.FilterOptions
    public FinishableOutputStream getOutputStream(FinishableOutputStream finishableOutputStream) {
        return new SimpleOutputStream(finishableOutputStream, new X86(true, this.startOffset));
    }

    @Override // org.tukaani.xz.FilterOptions
    public InputStream getInputStream(InputStream inputStream) {
        return new SimpleInputStream(inputStream, new X86(false, this.startOffset));
    }

    @Override // org.tukaani.xz.FilterOptions
    FilterEncoder getFilterEncoder() {
        return new BCJEncoder(this, 4L);
    }
}
