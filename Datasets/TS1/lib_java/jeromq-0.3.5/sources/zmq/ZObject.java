package zmq;

import zmq.Command;
import zmq.Ctx;

/* loaded from: jeromq-0.3.5.jar:zmq/ZObject.class */
public abstract class ZObject {
    private final Ctx ctx;
    private final int tid;

    protected ZObject(Ctx ctx, int tid) {
        this.ctx = ctx;
        this.tid = tid;
    }

    protected ZObject(ZObject parent) {
        this(parent.ctx, parent.tid);
    }

    protected int getTid() {
        return this.tid;
    }

    protected Ctx getCtx() {
        return this.ctx;
    }

    /* renamed from: zmq.ZObject$1, reason: invalid class name */
    /* loaded from: jeromq-0.3.5.jar:zmq/ZObject$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$zmq$Command$Type = new int[Command.Type.values().length];

        static {
            try {
                $SwitchMap$zmq$Command$Type[Command.Type.ACTIVATE_READ.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$zmq$Command$Type[Command.Type.ACTIVATE_WRITE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$zmq$Command$Type[Command.Type.STOP.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$zmq$Command$Type[Command.Type.PLUG.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$zmq$Command$Type[Command.Type.OWN.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$zmq$Command$Type[Command.Type.ATTACH.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$zmq$Command$Type[Command.Type.BIND.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$zmq$Command$Type[Command.Type.HICCUP.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$zmq$Command$Type[Command.Type.PIPE_TERM.ordinal()] = 9;
            } catch (NoSuchFieldError e9) {
            }
            try {
                $SwitchMap$zmq$Command$Type[Command.Type.PIPE_TERM_ACK.ordinal()] = 10;
            } catch (NoSuchFieldError e10) {
            }
            try {
                $SwitchMap$zmq$Command$Type[Command.Type.TERM_REQ.ordinal()] = 11;
            } catch (NoSuchFieldError e11) {
            }
            try {
                $SwitchMap$zmq$Command$Type[Command.Type.TERM.ordinal()] = 12;
            } catch (NoSuchFieldError e12) {
            }
            try {
                $SwitchMap$zmq$Command$Type[Command.Type.TERM_ACK.ordinal()] = 13;
            } catch (NoSuchFieldError e13) {
            }
            try {
                $SwitchMap$zmq$Command$Type[Command.Type.REAP.ordinal()] = 14;
            } catch (NoSuchFieldError e14) {
            }
            try {
                $SwitchMap$zmq$Command$Type[Command.Type.REAPED.ordinal()] = 15;
            } catch (NoSuchFieldError e15) {
            }
        }
    }

    protected void processCommand(Command cmd) {
        switch (AnonymousClass1.$SwitchMap$zmq$Command$Type[cmd.type().ordinal()]) {
            case 1:
                processActivateRead();
                return;
            case 2:
                processActivateWrite(((Long) cmd.arg).longValue());
                return;
            case 3:
                processStop();
                return;
            case 4:
                processPlug();
                processSeqnum();
                return;
            case 5:
                processOwn((Own) cmd.arg);
                processSeqnum();
                return;
            case 6:
                processAttach((IEngine) cmd.arg);
                processSeqnum();
                return;
            case 7:
                processBind((Pipe) cmd.arg);
                processSeqnum();
                return;
            case 8:
                processHiccup(cmd.arg);
                return;
            case 9:
                processPipeTerm();
                return;
            case 10:
                processPipeTermAck();
                return;
            case ZMQ.ZMQ_SNDBUF /* 11 */:
                processTermReq((Own) cmd.arg);
                return;
            case ZMQ.ZMQ_RCVBUF /* 12 */:
                processTerm(((Integer) cmd.arg).intValue());
                return;
            case 13:
                processTermAck();
                return;
            case 14:
                processReap((SocketBase) cmd.arg);
                return;
            case ZMQ.ZMQ_EVENTS /* 15 */:
                processReaped();
                return;
            default:
                throw new IllegalArgumentException();
        }
    }

    protected boolean registerEndpoint(String addr, Ctx.Endpoint endpoint) {
        return this.ctx.registerEndpoint(addr, endpoint);
    }

    protected void unregisterEndpoints(SocketBase socket) {
        this.ctx.unregisterEndpoints(socket);
    }

    protected Ctx.Endpoint findEndpoint(String addr) {
        return this.ctx.findEndpoint(addr);
    }

    protected void destroySocket(SocketBase socket) {
        this.ctx.destroySocket(socket);
    }

    protected IOThread chooseIoThread(long affinity) {
        return this.ctx.chooseIoThread(affinity);
    }

    protected void sendStop() {
        Command cmd = new Command(this, Command.Type.STOP);
        this.ctx.sendCommand(this.tid, cmd);
    }

    protected void sendPlug(Own destination) {
        sendPlug(destination, true);
    }

    protected void sendPlug(Own destination, boolean incSeqnum) {
        if (incSeqnum) {
            destination.incSeqnum();
        }
        Command cmd = new Command(destination, Command.Type.PLUG);
        sendCommand(cmd);
    }

    protected void sendOwn(Own destination, Own object) {
        destination.incSeqnum();
        Command cmd = new Command(destination, Command.Type.OWN, object);
        sendCommand(cmd);
    }

    protected void sendAttach(SessionBase destination, IEngine engine) {
        sendAttach(destination, engine, true);
    }

    protected void sendAttach(SessionBase destination, IEngine engine, boolean incSeqnum) {
        if (incSeqnum) {
            destination.incSeqnum();
        }
        Command cmd = new Command(destination, Command.Type.ATTACH, engine);
        sendCommand(cmd);
    }

    protected void sendBind(Own destination, Pipe pipe) {
        sendBind(destination, pipe, true);
    }

    protected void sendBind(Own destination, Pipe pipe, boolean incSeqnum) {
        if (incSeqnum) {
            destination.incSeqnum();
        }
        Command cmd = new Command(destination, Command.Type.BIND, pipe);
        sendCommand(cmd);
    }

    protected void sendActivateRead(Pipe destination) {
        Command cmd = new Command(destination, Command.Type.ACTIVATE_READ);
        sendCommand(cmd);
    }

    protected void sendActivateWrite(Pipe destination, long msgsRead) {
        Command cmd = new Command(destination, Command.Type.ACTIVATE_WRITE, Long.valueOf(msgsRead));
        sendCommand(cmd);
    }

    protected void sendHiccup(Pipe destination, Object pipe) {
        Command cmd = new Command(destination, Command.Type.HICCUP, pipe);
        sendCommand(cmd);
    }

    protected void sendPipeTerm(Pipe destination) {
        Command cmd = new Command(destination, Command.Type.PIPE_TERM);
        sendCommand(cmd);
    }

    protected void sendPipeTermAck(Pipe destination) {
        Command cmd = new Command(destination, Command.Type.PIPE_TERM_ACK);
        sendCommand(cmd);
    }

    protected void sendTermReq(Own destination, Own object) {
        Command cmd = new Command(destination, Command.Type.TERM_REQ, object);
        sendCommand(cmd);
    }

    protected void sendTerm(Own destination, int linger) {
        Command cmd = new Command(destination, Command.Type.TERM, Integer.valueOf(linger));
        sendCommand(cmd);
    }

    protected void sendTermAck(Own destination) {
        Command cmd = new Command(destination, Command.Type.TERM_ACK);
        sendCommand(cmd);
    }

    protected void sendReap(SocketBase socket) {
        Command cmd = new Command(this.ctx.getReaper(), Command.Type.REAP, socket);
        sendCommand(cmd);
    }

    protected void sendReaped() {
        Command cmd = new Command(this.ctx.getReaper(), Command.Type.REAPED);
        sendCommand(cmd);
    }

    protected void sendDone() {
        Command cmd = new Command(null, Command.Type.DONE);
        this.ctx.sendCommand(0, cmd);
    }

    protected void processStop() {
        throw new UnsupportedOperationException();
    }

    protected void processPlug() {
        throw new UnsupportedOperationException();
    }

    protected void processOwn(Own object) {
        throw new UnsupportedOperationException();
    }

    protected void processAttach(IEngine engine) {
        throw new UnsupportedOperationException();
    }

    protected void processBind(Pipe pipe) {
        throw new UnsupportedOperationException();
    }

    protected void processActivateRead() {
        throw new UnsupportedOperationException();
    }

    protected void processActivateWrite(long msgsRead) {
        throw new UnsupportedOperationException();
    }

    protected void processHiccup(Object hiccupPipe) {
        throw new UnsupportedOperationException();
    }

    protected void processPipeTerm() {
        throw new UnsupportedOperationException();
    }

    protected void processPipeTermAck() {
        throw new UnsupportedOperationException();
    }

    protected void processTermReq(Own object) {
        throw new UnsupportedOperationException();
    }

    protected void processTerm(int linger) {
        throw new UnsupportedOperationException();
    }

    protected void processTermAck() {
        throw new UnsupportedOperationException();
    }

    protected void processReap(SocketBase socket) {
        throw new UnsupportedOperationException();
    }

    protected void processReaped() {
        throw new UnsupportedOperationException();
    }

    protected void processSeqnum() {
        throw new UnsupportedOperationException();
    }

    private void sendCommand(Command cmd) {
        this.ctx.sendCommand(cmd.destination().getTid(), cmd);
    }
}
