package zmq;

/* loaded from: jeromq-0.3.5.jar:zmq/Pipe.class */
class Pipe extends ZObject {
    private YPipe<Msg> inpipe;
    private YPipe<Msg> outpipe;
    private boolean inActive;
    private boolean outActive;
    private int hwm;
    private int lwm;
    private long msgsRead;
    private long msgsWritten;
    private long peersMsgsRead;
    private Pipe peer;
    private IPipeEvents sink;
    private State state;
    private boolean delay;
    private Blob identity;
    private ZObject parent;
    static final /* synthetic */ boolean $assertionsDisabled;

    /* loaded from: jeromq-0.3.5.jar:zmq/Pipe$IPipeEvents.class */
    interface IPipeEvents {
        void readActivated(Pipe pipe);

        void writeActivated(Pipe pipe);

        void hiccuped(Pipe pipe);

        void pipeTerminated(Pipe pipe);
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/Pipe$State.class */
    enum State {
        ACTIVE,
        DELIMITED,
        PENDING,
        TERMINATING,
        TERMINATED,
        DOUBLE_TERMINATED
    }

    static {
        $assertionsDisabled = !Pipe.class.desiredAssertionStatus();
    }

    private Pipe(ZObject parent, YPipe<Msg> inpipe, YPipe<Msg> outpipe, int inhwm, int outhwm, boolean delay) {
        super(parent);
        this.inpipe = inpipe;
        this.outpipe = outpipe;
        this.inActive = true;
        this.outActive = true;
        this.hwm = outhwm;
        this.lwm = computeLwm(inhwm);
        this.msgsRead = 0L;
        this.msgsWritten = 0L;
        this.peersMsgsRead = 0L;
        this.peer = null;
        this.sink = null;
        this.state = State.ACTIVE;
        this.delay = delay;
        this.parent = parent;
    }

    public static void pipepair(ZObject[] parents, Pipe[] pipes, int[] hwms, boolean[] delays) {
        YPipe<Msg> upipe1 = new YPipe<>(Config.MESSAGE_PIPE_GRANULARITY.getValue());
        YPipe<Msg> upipe2 = new YPipe<>(Config.MESSAGE_PIPE_GRANULARITY.getValue());
        pipes[0] = new Pipe(parents[0], upipe1, upipe2, hwms[1], hwms[0], delays[0]);
        pipes[1] = new Pipe(parents[1], upipe2, upipe1, hwms[0], hwms[1], delays[1]);
        pipes[0].setPeer(pipes[1]);
        pipes[1].setPeer(pipes[0]);
    }

    private void setPeer(Pipe peer) {
        if (!$assertionsDisabled && peer == null) {
            throw new AssertionError();
        }
        this.peer = peer;
    }

    public void setEventSink(IPipeEvents sink) {
        if (!$assertionsDisabled && this.sink != null) {
            throw new AssertionError();
        }
        this.sink = sink;
    }

    public void setIdentity(Blob identity) {
        this.identity = identity;
    }

    public Blob getIdentity() {
        return this.identity;
    }

    public boolean checkRead() {
        if (!this.inActive) {
            return false;
        }
        if (this.state != State.ACTIVE && this.state != State.PENDING) {
            return false;
        }
        if (!this.inpipe.checkRead()) {
            this.inActive = false;
            return false;
        }
        if (isDelimiter(this.inpipe.probe())) {
            Msg msg = this.inpipe.read();
            if (!$assertionsDisabled && msg == null) {
                throw new AssertionError();
            }
            delimit();
            return false;
        }
        return true;
    }

    public Msg read() {
        if (!this.inActive) {
            return null;
        }
        if (this.state != State.ACTIVE && this.state != State.PENDING) {
            return null;
        }
        Msg msg = this.inpipe.read();
        if (msg == null) {
            this.inActive = false;
            return null;
        }
        if (msg.isDelimiter()) {
            delimit();
            return null;
        }
        if (!msg.hasMore()) {
            this.msgsRead++;
        }
        if (this.lwm > 0 && this.msgsRead % this.lwm == 0) {
            sendActivateWrite(this.peer, this.msgsRead);
        }
        return msg;
    }

    public boolean checkWrite() {
        if (!this.outActive || this.state != State.ACTIVE) {
            return false;
        }
        boolean full = this.hwm > 0 && this.msgsWritten - this.peersMsgsRead == ((long) this.hwm);
        if (full) {
            this.outActive = false;
            return false;
        }
        return true;
    }

    public boolean write(Msg msg) {
        if (!checkWrite()) {
            return false;
        }
        boolean more = msg.hasMore();
        this.outpipe.write(msg, more);
        if (!more) {
            this.msgsWritten++;
            return true;
        }
        return true;
    }

    public void rollback() {
        if (this.outpipe == null) {
            return;
        }
        while (true) {
            Msg msg = this.outpipe.unwrite();
            if (msg != null) {
                if (!$assertionsDisabled && (msg.flags() & 1) <= 0) {
                    throw new AssertionError();
                }
            } else {
                return;
            }
        }
    }

    public void flush() {
        if (this.state != State.TERMINATING && this.outpipe != null && !this.outpipe.flush()) {
            sendActivateRead(this.peer);
        }
    }

    @Override // zmq.ZObject
    protected void processActivateRead() {
        if (this.inActive) {
            return;
        }
        if (this.state == State.ACTIVE || this.state == State.PENDING) {
            this.inActive = true;
            this.sink.readActivated(this);
        }
    }

    @Override // zmq.ZObject
    protected void processActivateWrite(long msgsRead) {
        this.peersMsgsRead = msgsRead;
        if (!this.outActive && this.state == State.ACTIVE) {
            this.outActive = true;
            this.sink.writeActivated(this);
        }
    }

    @Override // zmq.ZObject
    protected void processHiccup(Object pipe) {
        if (!$assertionsDisabled && this.outpipe == null) {
            throw new AssertionError();
        }
        this.outpipe.flush();
        while (this.outpipe.read() != null) {
        }
        if (!$assertionsDisabled && pipe == null) {
            throw new AssertionError();
        }
        this.outpipe = (YPipe) pipe;
        this.outActive = true;
        if (this.state == State.ACTIVE) {
            this.sink.hiccuped(this);
        }
    }

    @Override // zmq.ZObject
    protected void processPipeTerm() {
        if (this.state == State.ACTIVE) {
            if (!this.delay) {
                this.state = State.TERMINATING;
                this.outpipe = null;
                sendPipeTermAck(this.peer);
                return;
            }
            this.state = State.PENDING;
            return;
        }
        if (this.state == State.DELIMITED) {
            this.state = State.TERMINATING;
            this.outpipe = null;
            sendPipeTermAck(this.peer);
        } else if (this.state == State.TERMINATED) {
            this.state = State.DOUBLE_TERMINATED;
            this.outpipe = null;
            sendPipeTermAck(this.peer);
        } else if (!$assertionsDisabled) {
            throw new AssertionError();
        }
    }

    @Override // zmq.ZObject
    protected void processPipeTermAck() {
        if (!$assertionsDisabled && this.sink == null) {
            throw new AssertionError();
        }
        this.sink.pipeTerminated(this);
        if (this.state == State.TERMINATED) {
            this.outpipe = null;
            sendPipeTermAck(this.peer);
        } else if (!$assertionsDisabled && this.state != State.TERMINATING && this.state != State.DOUBLE_TERMINATED) {
            throw new AssertionError();
        }
        while (this.inpipe.read() != null) {
        }
        this.inpipe = null;
    }

    public void terminate(boolean delay) {
        this.delay = delay;
        if (this.state == State.TERMINATED || this.state == State.DOUBLE_TERMINATED || this.state == State.TERMINATING) {
            return;
        }
        if (this.state == State.ACTIVE) {
            sendPipeTerm(this.peer);
            this.state = State.TERMINATED;
        } else if (this.state == State.PENDING && !this.delay) {
            this.outpipe = null;
            sendPipeTermAck(this.peer);
            this.state = State.TERMINATING;
        } else if (this.state != State.PENDING) {
            if (this.state == State.DELIMITED) {
                sendPipeTerm(this.peer);
                this.state = State.TERMINATED;
            } else if (!$assertionsDisabled) {
                throw new AssertionError();
            }
        }
        this.outActive = false;
        if (this.outpipe != null) {
            rollback();
            Msg msg = new Msg();
            msg.initDelimiter();
            this.outpipe.write(msg, false);
            flush();
        }
    }

    private static boolean isDelimiter(Msg msg) {
        return msg.isDelimiter();
    }

    private static int computeLwm(int hwm) {
        return hwm > Config.MAX_WM_DELTA.getValue() * 2 ? hwm - Config.MAX_WM_DELTA.getValue() : (hwm + 1) / 2;
    }

    private void delimit() {
        if (this.state == State.ACTIVE) {
            this.state = State.DELIMITED;
            return;
        }
        if (this.state == State.PENDING) {
            this.outpipe = null;
            sendPipeTermAck(this.peer);
            this.state = State.TERMINATING;
        } else if (!$assertionsDisabled) {
            throw new AssertionError();
        }
    }

    public void hiccup() {
        if (this.state != State.ACTIVE) {
            return;
        }
        this.inpipe = null;
        this.inpipe = new YPipe<>(Config.MESSAGE_PIPE_GRANULARITY.getValue());
        this.inActive = true;
        sendHiccup(this.peer, this.inpipe);
    }

    public String toString() {
        return super.toString() + "[" + this.parent + "]";
    }
}
