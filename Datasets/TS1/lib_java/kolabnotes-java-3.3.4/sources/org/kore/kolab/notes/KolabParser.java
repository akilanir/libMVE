package org.kore.kolab.notes;

import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/KolabParser.class */
public interface KolabParser extends Serializable {
    Object parse(InputStream inputStream);

    void write(Object obj, OutputStream outputStream);
}
