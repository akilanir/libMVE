package org.simpleframework.xml.transform;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/EmptyMatcher.class */
class EmptyMatcher implements Matcher {
    EmptyMatcher() {
    }

    @Override // org.simpleframework.xml.transform.Matcher
    public Transform match(Class type) throws Exception {
        return null;
    }
}
