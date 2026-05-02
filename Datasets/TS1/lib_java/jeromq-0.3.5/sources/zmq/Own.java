package zmq;

import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: jeromq-0.3.5.jar:zmq/Own.class */
abstract class Own extends ZObject {
    protected final Options options;
    private boolean terminating;
    private final AtomicLong sendSeqnum;
    private long processedSeqnum;
    private Own owner;
    private final Set<Own> owned;
    private int termAcks;
    static final /* synthetic */ boolean $assertionsDisabled;

    public abstract void destroy();

    static {
        $assertionsDisabled = !Own.class.desiredAssertionStatus();
    }

    public Own(Ctx parent, int tid) {
        super(parent, tid);
        this.terminating = false;
        this.sendSeqnum = new AtomicLong(0L);
        this.processedSeqnum = 0L;
        this.owner = null;
        this.termAcks = 0;
        this.options = new Options();
        this.owned = new HashSet();
    }

    public Own(IOThread ioThread, Options options) {
        super(ioThread);
        this.options = options;
        this.terminating = false;
        this.sendSeqnum = new AtomicLong(0L);
        this.processedSeqnum = 0L;
        this.owner = null;
        this.termAcks = 0;
        this.owned = new HashSet();
    }

    protected void processDestroy() {
        destroy();
    }

    private void setOwner(Own owner) {
        if (!$assertionsDisabled && this.owner != null) {
            throw new AssertionError();
        }
        this.owner = owner;
    }

    void incSeqnum() {
        this.sendSeqnum.incrementAndGet();
    }

    @Override // zmq.ZObject
    protected void processSeqnum() {
        this.processedSeqnum++;
        checkTermAcks();
    }

    protected void launchChild(Own object) {
        object.setOwner(this);
        sendPlug(object);
        sendOwn(this, object);
    }

    protected void termChild(Own object) {
        processTermReq(object);
    }

    @Override // zmq.ZObject
    protected void processTermReq(Own object) {
        if (this.terminating || !this.owned.contains(object)) {
            return;
        }
        this.owned.remove(object);
        registerTermAcks(1);
        sendTerm(object, this.options.linger);
    }

    @Override // zmq.ZObject
    protected void processOwn(Own object) {
        if (this.terminating) {
            registerTermAcks(1);
            sendTerm(object, 0);
        } else {
            this.owned.add(object);
        }
    }

    protected void terminate() {
        if (this.terminating) {
            return;
        }
        if (this.owner == null) {
            processTerm(this.options.linger);
        } else {
            sendTermReq(this.owner, this);
        }
    }

    protected boolean isTerminating() {
        return this.terminating;
    }

    @Override // zmq.ZObject
    protected void processTerm(int linger) {
        if (!$assertionsDisabled && this.terminating) {
            throw new AssertionError();
        }
        for (Own it : this.owned) {
            sendTerm(it, linger);
        }
        registerTermAcks(this.owned.size());
        this.owned.clear();
        this.terminating = true;
        checkTermAcks();
    }

    public void registerTermAcks(int count) {
        this.termAcks += count;
    }

    public void unregisterTermAck() {
        if (!$assertionsDisabled && this.termAcks <= 0) {
            throw new AssertionError();
        }
        this.termAcks--;
        checkTermAcks();
    }

    @Override // zmq.ZObject
    protected void processTermAck() {
        unregisterTermAck();
    }

    private void checkTermAcks() {
        if (this.terminating && this.processedSeqnum == this.sendSeqnum.get() && this.termAcks == 0) {
            if (!$assertionsDisabled && !this.owned.isEmpty()) {
                throw new AssertionError();
            }
            if (this.owner != null) {
                sendTermAck(this.owner);
            }
            processDestroy();
        }
    }
}
