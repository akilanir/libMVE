package zmq;

/* loaded from: jeromq-0.3.5.jar:zmq/YQueue.class */
public class YQueue<T> {
    private Chunk<T> beginChunk;
    private int beginPos;
    private Chunk<T> backChunk;
    private int backPos;
    private Chunk<T> endChunk;
    private int endPos;
    private volatile Chunk<T> spareChunk;
    private final int size;
    private int memoryPtr = 0;

    /* loaded from: jeromq-0.3.5.jar:zmq/YQueue$Chunk.class */
    private static class Chunk<T> {
        final T[] values;
        final int[] pos;
        Chunk<T> prev;
        Chunk<T> next;

        public Chunk(int i, int i2) {
            this.values = (T[]) new Object[i];
            this.pos = new int[i];
            for (int i3 = 0; i3 != this.values.length; i3++) {
                this.pos[i3] = i2;
                i2++;
            }
        }
    }

    public YQueue(int size) {
        this.size = size;
        this.beginChunk = new Chunk<>(size, this.memoryPtr);
        this.memoryPtr += size;
        this.beginPos = 0;
        this.backPos = 0;
        this.backChunk = this.beginChunk;
        this.spareChunk = this.beginChunk;
        this.endChunk = this.beginChunk;
        this.endPos = 1;
    }

    public int frontPos() {
        return this.beginChunk.pos[this.beginPos];
    }

    public T front() {
        return this.beginChunk.values[this.beginPos];
    }

    public int backPos() {
        return this.backChunk.pos[this.backPos];
    }

    public T back() {
        return this.backChunk.values[this.backPos];
    }

    public T pop() {
        T val = this.beginChunk.values[this.beginPos];
        this.beginChunk.values[this.beginPos] = null;
        this.beginPos++;
        if (this.beginPos == this.size) {
            this.beginChunk = this.beginChunk.next;
            this.beginChunk.prev = null;
            this.beginPos = 0;
        }
        return val;
    }

    public void push(T val) {
        this.backChunk.values[this.backPos] = val;
        this.backChunk = this.endChunk;
        this.backPos = this.endPos;
        this.endPos++;
        if (this.endPos != this.size) {
            return;
        }
        Chunk<T> sc = this.spareChunk;
        if (sc != this.beginChunk) {
            this.spareChunk = this.spareChunk.next;
            this.endChunk.next = sc;
            sc.prev = this.endChunk;
        } else {
            this.endChunk.next = new Chunk<>(this.size, this.memoryPtr);
            this.memoryPtr += this.size;
            this.endChunk.next.prev = this.endChunk;
        }
        this.endChunk = this.endChunk.next;
        this.endPos = 0;
    }

    public void unpush() {
        if (this.backPos > 0) {
            this.backPos--;
        } else {
            this.backPos = this.size - 1;
            this.backChunk = this.backChunk.prev;
        }
        if (this.endPos > 0) {
            this.endPos--;
            return;
        }
        this.endPos = this.size - 1;
        this.endChunk = this.endChunk.prev;
        this.endChunk.next = null;
    }
}
