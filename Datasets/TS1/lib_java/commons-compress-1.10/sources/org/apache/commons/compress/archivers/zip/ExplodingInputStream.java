package org.apache.commons.compress.archivers.zip;

import java.io.IOException;
import java.io.InputStream;
import org.apache.commons.compress.archivers.cpio.CpioConstants;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/zip/ExplodingInputStream.class */
class ExplodingInputStream extends InputStream {
    private final InputStream in;
    private BitStream bits;
    private final int dictionarySize;
    private final int numberOfTrees;
    private final int minimumMatchLength;
    private BinaryTree literalTree;
    private BinaryTree lengthTree;
    private BinaryTree distanceTree;
    private final CircularBuffer buffer = new CircularBuffer(32768);

    public ExplodingInputStream(int dictionarySize, int numberOfTrees, InputStream in) {
        if (dictionarySize != 4096 && dictionarySize != 8192) {
            throw new IllegalArgumentException("The dictionary size must be 4096 or 8192");
        }
        if (numberOfTrees != 2 && numberOfTrees != 3) {
            throw new IllegalArgumentException("The number of trees must be 2 or 3");
        }
        this.dictionarySize = dictionarySize;
        this.numberOfTrees = numberOfTrees;
        this.minimumMatchLength = numberOfTrees;
        this.in = in;
    }

    private void init() throws IOException {
        if (this.bits == null) {
            if (this.numberOfTrees == 3) {
                this.literalTree = BinaryTree.decode(this.in, CpioConstants.C_IRUSR);
            }
            this.lengthTree = BinaryTree.decode(this.in, 64);
            this.distanceTree = BinaryTree.decode(this.in, 64);
            this.bits = new BitStream(this.in);
        }
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        if (!this.buffer.available()) {
            fillBuffer();
        }
        return this.buffer.get();
    }

    private void fillBuffer() throws IOException {
        int literal;
        init();
        int bit = this.bits.nextBit();
        if (bit == 1) {
            if (this.literalTree != null) {
                literal = this.literalTree.read(this.bits);
            } else {
                literal = this.bits.nextByte();
            }
            if (literal == -1) {
                return;
            }
            this.buffer.put(literal);
            return;
        }
        if (bit == 0) {
            int distanceLowSize = this.dictionarySize == 4096 ? 6 : 7;
            int distanceLow = (int) this.bits.nextBits(distanceLowSize);
            int distanceHigh = this.distanceTree.read(this.bits);
            if (distanceHigh == -1 && distanceLow <= 0) {
                return;
            }
            int distance = (distanceHigh << distanceLowSize) | distanceLow;
            int length = this.lengthTree.read(this.bits);
            if (length == 63) {
                length = (int) (length + this.bits.nextBits(8));
            }
            this.buffer.copy(distance + 1, length + this.minimumMatchLength);
        }
    }
}
