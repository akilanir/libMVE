package org.apache.james.mime4j.util;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/util/EmptyByteSequence.class */
final class EmptyByteSequence implements ByteSequence {
    private static final byte[] EMPTY_BYTES = new byte[0];

    EmptyByteSequence() {
    }

    @Override // org.apache.james.mime4j.util.ByteSequence
    public int length() {
        return 0;
    }

    @Override // org.apache.james.mime4j.util.ByteSequence
    public byte byteAt(int index) {
        throw new IndexOutOfBoundsException();
    }

    @Override // org.apache.james.mime4j.util.ByteSequence
    public byte[] toByteArray() {
        return EMPTY_BYTES;
    }
}
