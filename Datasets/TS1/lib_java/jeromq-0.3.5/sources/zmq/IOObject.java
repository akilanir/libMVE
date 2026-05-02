package zmq;

import java.nio.channels.SelectableChannel;

/* loaded from: jeromq-0.3.5.jar:zmq/IOObject.class */
public class IOObject implements IPollEvents {
    private Poller poller;
    private IPollEvents handler;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !IOObject.class.desiredAssertionStatus();
    }

    public IOObject(IOThread ioThread) {
        if (ioThread != null) {
            plug(ioThread);
        }
    }

    public void plug(IOThread ioThread) {
        if (!$assertionsDisabled && ioThread == null) {
            throw new AssertionError();
        }
        if (!$assertionsDisabled && this.poller != null) {
            throw new AssertionError();
        }
        this.poller = ioThread.getPoller();
    }

    public void unplug() {
        if (!$assertionsDisabled && this.poller == null) {
            throw new AssertionError();
        }
        this.poller = null;
        this.handler = null;
    }

    public final void addHandle(SelectableChannel handle) {
        this.poller.addHandle(handle, this);
    }

    public final void removeHandle(SelectableChannel handle) {
        this.poller.removeHandle(handle);
    }

    public final void setPollIn(SelectableChannel handle) {
        this.poller.setPollIn(handle);
    }

    public final void setPollOut(SelectableChannel handle) {
        this.poller.setPollOut(handle);
    }

    public final void setPollConnect(SelectableChannel handle) {
        this.poller.setPollConnect(handle);
    }

    public final void setPollAccept(SelectableChannel handle) {
        this.poller.setPollAccept(handle);
    }

    public final void resetPollIn(SelectableChannel handle) {
        this.poller.resetPollOn(handle);
    }

    public final void resetPollOut(SelectableChannel handle) {
        this.poller.resetPollOut(handle);
    }

    @Override // zmq.IPollEvents
    public final void inEvent() {
        this.handler.inEvent();
    }

    @Override // zmq.IPollEvents
    public final void outEvent() {
        this.handler.outEvent();
    }

    @Override // zmq.IPollEvents
    public final void connectEvent() {
        this.handler.connectEvent();
    }

    @Override // zmq.IPollEvents
    public final void acceptEvent() {
        this.handler.acceptEvent();
    }

    @Override // zmq.IPollEvents
    public final void timerEvent(int id) {
        this.handler.timerEvent(id);
    }

    public final void addTimer(long timeout, int id) {
        this.poller.addTimer(timeout, this, id);
    }

    public final void setHandler(IPollEvents handler) {
        this.handler = handler;
    }

    public void cancelTimer(int id) {
        this.poller.cancelTimer(this, id);
    }
}
