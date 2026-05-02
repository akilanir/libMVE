package zmq;

import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: jeromq-0.3.5.jar:zmq/YPipe.class */
public class YPipe<T> {
    private final YQueue<T> queue;
    private int w;
    private int r;
    private int f;
    private final AtomicInteger c;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !YPipe.class.desiredAssertionStatus();
    }

    public YPipe(int qsize) {
        this.queue = new YQueue<>(qsize);
        int pos = this.queue.backPos();
        this.f = pos;
        this.r = pos;
        this.w = pos;
        this.c = new AtomicInteger(this.queue.backPos());
    }

    public void write(T value, boolean incomplete) {
        this.queue.push(value);
        if (!incomplete) {
            this.f = this.queue.backPos();
        }
    }

    public T unwrite() {
        if (this.f == this.queue.backPos()) {
            return null;
        }
        this.queue.unpush();
        return this.queue.back();
    }

    public boolean flush() {
        if (this.w == this.f) {
            return true;
        }
        if (!this.c.compareAndSet(this.w, this.f)) {
            this.c.set(this.f);
            this.w = this.f;
            return false;
        }
        this.w = this.f;
        return true;
    }

    public boolean checkRead() {
        int h = this.queue.frontPos();
        if (h != this.r) {
            return true;
        }
        if (!this.c.compareAndSet(h, -1)) {
            this.r = this.c.get();
        }
        if (h == this.r || this.r == -1) {
            return false;
        }
        return true;
    }

    public T read() {
        if (!checkRead()) {
            return null;
        }
        return this.queue.pop();
    }

    public T probe() {
        boolean rc = checkRead();
        if ($assertionsDisabled || rc) {
            return this.queue.front();
        }
        throw new AssertionError();
    }
}
