package okio;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Arrays;

/* loaded from: okio-1.3.0.jar:okio/SegmentedByteString.class */
final class SegmentedByteString extends ByteString {
    final transient byte[][] segments;
    final transient int[] directory;

    /* JADX WARN: Type inference failed for: r1v4, types: [byte[], byte[][]] */
    SegmentedByteString(Buffer buffer, int byteCount) {
        super(null);
        Util.checkOffsetAndCount(buffer.size, 0L, byteCount);
        int offset = 0;
        int segmentCount = 0;
        Segment segment = buffer.head;
        while (true) {
            Segment s = segment;
            if (offset < byteCount) {
                if (s.limit == s.pos) {
                    throw new AssertionError("s.limit == s.pos");
                }
                offset += s.limit - s.pos;
                segmentCount++;
                segment = s.next;
            } else {
                this.segments = new byte[segmentCount];
                this.directory = new int[segmentCount * 2];
                int offset2 = 0;
                int segmentCount2 = 0;
                Segment segment2 = buffer.head;
                while (true) {
                    Segment s2 = segment2;
                    if (offset2 < byteCount) {
                        this.segments[segmentCount2] = s2.data;
                        offset2 += s2.limit - s2.pos;
                        this.directory[segmentCount2] = offset2;
                        this.directory[segmentCount2 + this.segments.length] = s2.pos;
                        s2.shared = true;
                        segmentCount2++;
                        segment2 = s2.next;
                    } else {
                        return;
                    }
                }
            }
        }
    }

    @Override // okio.ByteString
    public String utf8() {
        return toByteString().utf8();
    }

    @Override // okio.ByteString
    public String base64() {
        return toByteString().base64();
    }

    @Override // okio.ByteString
    public String hex() {
        return toByteString().hex();
    }

    @Override // okio.ByteString
    public ByteString toAsciiLowercase() {
        return toByteString().toAsciiLowercase();
    }

    @Override // okio.ByteString
    public ByteString toAsciiUppercase() {
        return toByteString().toAsciiUppercase();
    }

    @Override // okio.ByteString
    public ByteString md5() {
        return toByteString().md5();
    }

    @Override // okio.ByteString
    public ByteString sha256() {
        return toByteString().sha256();
    }

    @Override // okio.ByteString
    public String base64Url() {
        return toByteString().base64Url();
    }

    @Override // okio.ByteString
    public ByteString substring(int beginIndex) {
        return toByteString().substring(beginIndex);
    }

    @Override // okio.ByteString
    public ByteString substring(int beginIndex, int endIndex) {
        return toByteString().substring(beginIndex, endIndex);
    }

    @Override // okio.ByteString
    public byte getByte(int pos) {
        Util.checkOffsetAndCount(this.directory[this.segments.length - 1], pos, 1L);
        int segment = segment(pos);
        int segmentOffset = segment == 0 ? 0 : this.directory[segment - 1];
        int segmentPos = this.directory[segment + this.segments.length];
        return this.segments[segment][(pos - segmentOffset) + segmentPos];
    }

    private int segment(int pos) {
        int i = Arrays.binarySearch(this.directory, 0, this.segments.length, pos + 1);
        return i >= 0 ? i : i ^ (-1);
    }

    @Override // okio.ByteString
    public int size() {
        return this.directory[this.segments.length - 1];
    }

    @Override // okio.ByteString
    public byte[] toByteArray() {
        byte[] result = new byte[this.directory[this.segments.length - 1]];
        int segmentOffset = 0;
        int segmentCount = this.segments.length;
        for (int s = 0; s < segmentCount; s++) {
            int segmentPos = this.directory[segmentCount + s];
            int nextSegmentOffset = this.directory[s];
            System.arraycopy(this.segments[s], segmentPos, result, segmentOffset, nextSegmentOffset - segmentOffset);
            segmentOffset = nextSegmentOffset;
        }
        return result;
    }

    @Override // okio.ByteString
    public void write(OutputStream out) throws IOException {
        if (out == null) {
            throw new IllegalArgumentException("out == null");
        }
        int segmentOffset = 0;
        int segmentCount = this.segments.length;
        for (int s = 0; s < segmentCount; s++) {
            int segmentPos = this.directory[segmentCount + s];
            int nextSegmentOffset = this.directory[s];
            out.write(this.segments[s], segmentPos, nextSegmentOffset - segmentOffset);
            segmentOffset = nextSegmentOffset;
        }
    }

    @Override // okio.ByteString
    void write(Buffer buffer) {
        int segmentOffset = 0;
        int segmentCount = this.segments.length;
        for (int s = 0; s < segmentCount; s++) {
            int segmentPos = this.directory[segmentCount + s];
            int nextSegmentOffset = this.directory[s];
            Segment segment = new Segment(this.segments[s], segmentPos, (segmentPos + nextSegmentOffset) - segmentOffset);
            if (buffer.head == null) {
                segment.prev = segment;
                segment.next = segment;
                buffer.head = segment;
            } else {
                buffer.head.prev.push(segment);
            }
            segmentOffset = nextSegmentOffset;
        }
        buffer.size += segmentOffset;
    }

    @Override // okio.ByteString
    public boolean rangeEquals(int offset, ByteString other, int otherOffset, int byteCount) {
        if (offset > size() - byteCount) {
            return false;
        }
        int s = segment(offset);
        while (byteCount > 0) {
            int segmentOffset = s == 0 ? 0 : this.directory[s - 1];
            int segmentSize = this.directory[s] - segmentOffset;
            int stepSize = Math.min(byteCount, (segmentOffset + segmentSize) - offset);
            int segmentPos = this.directory[this.segments.length + s];
            int arrayOffset = (offset - segmentOffset) + segmentPos;
            if (!other.rangeEquals(otherOffset, this.segments[s], arrayOffset, stepSize)) {
                return false;
            }
            offset += stepSize;
            otherOffset += stepSize;
            byteCount -= stepSize;
            s++;
        }
        return true;
    }

    @Override // okio.ByteString
    public boolean rangeEquals(int offset, byte[] other, int otherOffset, int byteCount) {
        if (offset > size() - byteCount || otherOffset > other.length - byteCount) {
            return false;
        }
        int s = segment(offset);
        while (byteCount > 0) {
            int segmentOffset = s == 0 ? 0 : this.directory[s - 1];
            int segmentSize = this.directory[s] - segmentOffset;
            int stepSize = Math.min(byteCount, (segmentOffset + segmentSize) - offset);
            int segmentPos = this.directory[this.segments.length + s];
            int arrayOffset = (offset - segmentOffset) + segmentPos;
            if (!Util.arrayRangeEquals(this.segments[s], arrayOffset, other, otherOffset, stepSize)) {
                return false;
            }
            offset += stepSize;
            otherOffset += stepSize;
            byteCount -= stepSize;
            s++;
        }
        return true;
    }

    private ByteString toByteString() {
        return new ByteString(toByteArray());
    }

    @Override // okio.ByteString
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        return (o instanceof ByteString) && ((ByteString) o).size() == size() && rangeEquals(0, (ByteString) o, 0, size());
    }

    @Override // okio.ByteString
    public int hashCode() {
        int result = this.hashCode;
        if (result != 0) {
            return result;
        }
        int result2 = 1;
        int segmentOffset = 0;
        int segmentCount = this.segments.length;
        for (int s = 0; s < segmentCount; s++) {
            byte[] segment = this.segments[s];
            int segmentPos = this.directory[segmentCount + s];
            int nextSegmentOffset = this.directory[s];
            int segmentSize = nextSegmentOffset - segmentOffset;
            int limit = segmentPos + segmentSize;
            for (int i = segmentPos; i < limit; i++) {
                result2 = (31 * result2) + segment[i];
            }
            segmentOffset = nextSegmentOffset;
        }
        int i2 = result2;
        this.hashCode = i2;
        return i2;
    }

    @Override // okio.ByteString
    public String toString() {
        return toByteString().toString();
    }

    private Object writeReplace() {
        return toByteString();
    }
}
