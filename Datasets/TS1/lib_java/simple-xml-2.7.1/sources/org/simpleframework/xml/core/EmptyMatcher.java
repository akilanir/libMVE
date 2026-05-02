package org.simpleframework.xml.core;

import org.simpleframework.xml.transform.Matcher;
import org.simpleframework.xml.transform.Transform;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/EmptyMatcher.class */
class EmptyMatcher implements Matcher {
    EmptyMatcher() {
    }

    @Override // org.simpleframework.xml.transform.Matcher
    public Transform match(Class type) throws Exception {
        return null;
    }
}
