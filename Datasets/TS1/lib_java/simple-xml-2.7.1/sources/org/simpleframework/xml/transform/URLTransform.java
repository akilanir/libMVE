package org.simpleframework.xml.transform;

import java.net.URL;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/URLTransform.class */
class URLTransform implements Transform<URL> {
    URLTransform() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.simpleframework.xml.transform.Transform
    public URL read(String target) throws Exception {
        return new URL(target);
    }

    @Override // org.simpleframework.xml.transform.Transform
    public String write(URL target) throws Exception {
        return target.toString();
    }
}
