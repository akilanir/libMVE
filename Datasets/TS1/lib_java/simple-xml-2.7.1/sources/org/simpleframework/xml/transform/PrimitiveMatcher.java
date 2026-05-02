package org.simpleframework.xml.transform;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/PrimitiveMatcher.class */
class PrimitiveMatcher implements Matcher {
    @Override // org.simpleframework.xml.transform.Matcher
    public Transform match(Class type) throws Exception {
        if (type == Integer.TYPE) {
            return new IntegerTransform();
        }
        if (type == Boolean.TYPE) {
            return new BooleanTransform();
        }
        if (type == Long.TYPE) {
            return new LongTransform();
        }
        if (type == Double.TYPE) {
            return new DoubleTransform();
        }
        if (type == Float.TYPE) {
            return new FloatTransform();
        }
        if (type == Short.TYPE) {
            return new ShortTransform();
        }
        if (type == Byte.TYPE) {
            return new ByteTransform();
        }
        if (type == Character.TYPE) {
            return new CharacterTransform();
        }
        return null;
    }
}
