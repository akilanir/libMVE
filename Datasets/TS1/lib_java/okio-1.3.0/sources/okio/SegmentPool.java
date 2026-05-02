package okio;

/* loaded from: okio-1.3.0.jar:okio/SegmentPool.class */
final class SegmentPool {
    static final long MAX_SIZE = 65536;
    static Segment next;
    static long byteCount;

    private SegmentPool() {
    }

    static Segment take() {
        synchronized (SegmentPool.class) {
            if (next != null) {
                Segment result = next;
                next = result.next;
                result.next = null;
                byteCount -= 2048;
                return result;
            }
            return new Segment();
        }
    }

    static void recycle(Segment segment) {
        if (segment.next != null || segment.prev != null) {
            throw new IllegalArgumentException();
        }
        if (segment.shared) {
            return;
        }
        synchronized (SegmentPool.class) {
            if (byteCount + 2048 > MAX_SIZE) {
                return;
            }
            byteCount += 2048;
            segment.next = next;
            segment.limit = 0;
            segment.pos = 0;
            next = segment;
        }
    }
}
