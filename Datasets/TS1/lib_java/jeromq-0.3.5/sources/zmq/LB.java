package zmq;

import java.util.ArrayList;
import java.util.List;

/* loaded from: jeromq-0.3.5.jar:zmq/LB.class */
public class LB {
    static final /* synthetic */ boolean $assertionsDisabled;
    private int active = 0;
    private int current = 0;
    private boolean more = false;
    private boolean dropping = false;
    private final List<Pipe> pipes = new ArrayList();

    static {
        $assertionsDisabled = !LB.class.desiredAssertionStatus();
    }

    public void attach(Pipe pipe) {
        this.pipes.add(pipe);
        activated(pipe);
    }

    public void terminated(Pipe pipe) {
        int index = this.pipes.indexOf(pipe);
        if (index == this.current && this.more) {
            this.dropping = true;
        }
        if (index < this.active) {
            this.active--;
            Utils.swap(this.pipes, index, this.active);
            if (this.current == this.active) {
                this.current = 0;
            }
        }
        this.pipes.remove(pipe);
    }

    public void activated(Pipe pipe) {
        Utils.swap(this.pipes, this.pipes.indexOf(pipe), this.active);
        this.active++;
    }

    public boolean send(Msg msg, ValueReference<Integer> errno) {
        if (this.dropping) {
            this.more = msg.hasMore();
            this.dropping = this.more;
            return true;
        }
        while (this.active > 0 && !this.pipes.get(this.current).write(msg)) {
            if (!$assertionsDisabled && this.more) {
                throw new AssertionError();
            }
            this.active--;
            if (this.current < this.active) {
                Utils.swap(this.pipes, this.current, this.active);
            } else {
                this.current = 0;
            }
        }
        if (this.active == 0) {
            errno.set(35);
            return false;
        }
        this.more = msg.hasMore();
        if (!this.more) {
            this.pipes.get(this.current).flush();
            int i = this.current + 1;
            this.current = i;
            if (i >= this.active) {
                this.current = 0;
                return true;
            }
            return true;
        }
        return true;
    }

    public boolean hasOut() {
        if (this.more) {
            return true;
        }
        while (this.active > 0) {
            if (this.pipes.get(this.current).checkWrite()) {
                return true;
            }
            this.active--;
            Utils.swap(this.pipes, this.current, this.active);
            if (this.current == this.active) {
                this.current = 0;
            }
        }
        return false;
    }
}
