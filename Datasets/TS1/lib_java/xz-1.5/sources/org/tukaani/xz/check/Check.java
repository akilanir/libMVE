package org.tukaani.xz.check;

import java.security.NoSuchAlgorithmException;
import org.tukaani.xz.UnsupportedOptionsException;
import org.tukaani.xz.XZ;

/* loaded from: xz-1.5.jar:org/tukaani/xz/check/Check.class */
public abstract class Check {
    int size;
    String name;

    public abstract void update(byte[] bArr, int i, int i2);

    public abstract byte[] finish();

    public void update(byte[] bArr) {
        update(bArr, 0, bArr.length);
    }

    public int getSize() {
        return this.size;
    }

    public String getName() {
        return this.name;
    }

    public static Check getInstance(int i) throws UnsupportedOptionsException {
        switch (i) {
            case 0:
                return new None();
            case 1:
                return new CRC32();
            case 4:
                return new CRC64();
            case XZ.CHECK_SHA256 /* 10 */:
                try {
                    return new SHA256();
                } catch (NoSuchAlgorithmException e) {
                    break;
                }
        }
        throw new UnsupportedOptionsException(new StringBuffer().append("Unsupported Check ID ").append(i).toString());
    }
}
