package zmq;

import java.util.ArrayList;
import java.util.List;

/* loaded from: jeromq-0.3.5.jar:zmq/Dist.class */
class Dist {
    private int matching = 0;
    private int active = 0;
    private int eligible = 0;
    private boolean more = false;
    private final List<Pipe> pipes = new ArrayList();

    public void attach(Pipe pipe) {
        if (this.more) {
            this.pipes.add(pipe);
            Utils.swap(this.pipes, this.eligible, this.pipes.size() - 1);
            this.eligible++;
        } else {
            this.pipes.add(pipe);
            Utils.swap(this.pipes, this.active, this.pipes.size() - 1);
            this.active++;
            this.eligible++;
        }
    }

    public void match(Pipe pipe) {
        int idx = this.pipes.indexOf(pipe);
        if (idx < this.matching || idx >= this.eligible) {
            return;
        }
        Utils.swap(this.pipes, idx, this.matching);
        this.matching++;
    }

    public void unmatch() {
        this.matching = 0;
    }

    public void terminated(Pipe pipe) {
        if (this.pipes.indexOf(pipe) < this.matching) {
            Utils.swap(this.pipes, this.pipes.indexOf(pipe), this.matching - 1);
            this.matching--;
        }
        if (this.pipes.indexOf(pipe) < this.active) {
            Utils.swap(this.pipes, this.pipes.indexOf(pipe), this.active - 1);
            this.active--;
        }
        if (this.pipes.indexOf(pipe) < this.eligible) {
            Utils.swap(this.pipes, this.pipes.indexOf(pipe), this.eligible - 1);
            this.eligible--;
        }
        this.pipes.remove(pipe);
    }

    public void activated(Pipe pipe) {
        Utils.swap(this.pipes, this.pipes.indexOf(pipe), this.eligible);
        this.eligible++;
        if (!this.more) {
            Utils.swap(this.pipes, this.eligible - 1, this.active);
            this.active++;
        }
    }

    public boolean sendToAll(Msg msg) {
        this.matching = this.active;
        return sendToMatching(msg);
    }

    public boolean sendToMatching(Msg msg) {
        boolean msgMore = msg.hasMore();
        distribute(msg);
        if (!msgMore) {
            this.active = this.eligible;
        }
        this.more = msgMore;
        return true;
    }

    private void distribute(Msg msg) {
        if (this.matching == 0) {
            return;
        }
        int i = 0;
        while (i < this.matching) {
            if (!write(this.pipes.get(i), msg)) {
                i--;
            }
            i++;
        }
    }

    public boolean hasOut() {
        return true;
    }

    private boolean write(Pipe pipe, Msg msg) {
        if (!pipe.write(msg)) {
            Utils.swap(this.pipes, this.pipes.indexOf(pipe), this.matching - 1);
            this.matching--;
            Utils.swap(this.pipes, this.pipes.indexOf(pipe), this.active - 1);
            this.active--;
            Utils.swap(this.pipes, this.active, this.eligible - 1);
            this.eligible--;
            return false;
        }
        if (!msg.hasMore()) {
            pipe.flush();
            return true;
        }
        return true;
    }
}
