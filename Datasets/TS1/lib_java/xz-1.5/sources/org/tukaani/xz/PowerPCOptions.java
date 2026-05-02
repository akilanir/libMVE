package org.tukaani.xz;

import java.io.InputStream;
import org.tukaani.xz.simple.PowerPC;

/* loaded from: xz-1.5.jar:org/tukaani/xz/PowerPCOptions.class */
public class PowerPCOptions extends BCJOptions {
    private static final int ALIGNMENT = 4;

    public PowerPCOptions() {
        super(4);
    }

    @Override // org.tukaani.xz.FilterOptions
    public FinishableOutputStream getOutputStream(FinishableOutputStream finishableOutputStream) {
        return new SimpleOutputStream(finishableOutputStream, new PowerPC(true, this.startOffset));
    }

    @Override // org.tukaani.xz.FilterOptions
    public InputStream getInputStream(InputStream inputStream) {
        return new SimpleInputStream(inputStream, new PowerPC(false, this.startOffset));
    }

    @Override // org.tukaani.xz.FilterOptions
    FilterEncoder getFilterEncoder() {
        return new BCJEncoder(this, 5L);
    }
}
