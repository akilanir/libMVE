package zmq;

import java.util.ArrayList;
import java.util.List;

/* loaded from: jeromq-0.3.5.jar:zmq/FQ.class */
class FQ {
    static final /* synthetic */ boolean $assertionsDisabled;
    private int active = 0;
    private int current = 0;
    private boolean more = false;
    private final List<Pipe> pipes = new ArrayList();

    static {
        $assertionsDisabled = !FQ.class.desiredAssertionStatus();
    }

    public void attach(Pipe pipe) {
        this.pipes.add(pipe);
        Utils.swap(this.pipes, this.active, this.pipes.size() - 1);
        this.active++;
    }

    public void terminated(Pipe pipe) {
        int index = this.pipes.indexOf(pipe);
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

    public Msg recv(ValueReference<Integer> errno) {
        return recvPipe(errno, null);
    }

    public Msg recvPipe(ValueReference<Integer> errno, ValueReference<Pipe> pipe) {
        while (this.active > 0) {
            Msg msg = this.pipes.get(this.current).read();
            boolean fetched = msg != null;
            if (fetched) {
                if (pipe != null) {
                    pipe.set(this.pipes.get(this.current));
                }
                this.more = msg.hasMore();
                if (!this.more) {
                    this.current = (this.current + 1) % this.active;
                }
                return msg;
            }
            if (!$assertionsDisabled && this.more) {
                throw new AssertionError();
            }
            this.active--;
            Utils.swap(this.pipes, this.current, this.active);
            if (this.current == this.active) {
                this.current = 0;
            }
        }
        errno.set(35);
        return null;
    }

    public boolean hasIn() {
        if (this.more) {
            return true;
        }
        while (this.active > 0) {
            if (this.pipes.get(this.current).checkRead()) {
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
