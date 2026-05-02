package org.apache.commons.digester;

import org.xml.sax.Attributes;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/Substitutor.class */
public abstract class Substitutor {
    public abstract Attributes substitute(Attributes attributes);

    public abstract String substitute(String str);
}
