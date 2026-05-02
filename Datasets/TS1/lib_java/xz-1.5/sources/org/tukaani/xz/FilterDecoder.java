package org.tukaani.xz;

import java.io.InputStream;

/* loaded from: xz-1.5.jar:org/tukaani/xz/FilterDecoder.class */
interface FilterDecoder extends FilterCoder {
    int getMemoryUsage();

    InputStream getInputStream(InputStream inputStream);
}
