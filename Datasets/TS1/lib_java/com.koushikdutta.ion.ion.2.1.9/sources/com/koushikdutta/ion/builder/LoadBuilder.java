package com.koushikdutta.ion.builder;

import java.io.File;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/builder/LoadBuilder.class */
public interface LoadBuilder<B> {
    B load(String str);

    B load(String str, String str2);

    B load(File file);
}
