package org.zeromq;

import java.util.Arrays;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import org.zeromq.ZActor;
import org.zeromq.ZAgent;
import org.zeromq.ZMQ;
import zmq.Msg;
import zmq.SocketBase;

/* loaded from: jeromq-0.3.5.jar:org/zeromq/ZProxy.class */
public class ZProxy {
    private static final String START;
    private static final String PAUSE;
    private static final String STOP;
    private static final String RESTART;
    private static final String EXIT;
    private static final String STATUS;
    private static final String CONFIG;
    public static final String STARTED;
    public static final String PAUSED;
    public static final String STOPPED;
    public static final String EXITED;
    public static final String ALIVE;
    private static final AtomicInteger counter;
    private final ZAgent agent;
    static final /* synthetic */ boolean $assertionsDisabled;

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZProxy$Command.class */
    public enum Command {
        START,
        PAUSE,
        STOP,
        RESTART,
        EXIT,
        STATUS,
        CONFIG
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZProxy$Plug.class */
    public enum Plug {
        FRONT,
        BACK,
        CAPTURE
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZProxy$Pump.class */
    public interface Pump {
        boolean flow(Plug plug, ZMQ.Socket socket, ZMQ.Socket socket2, Plug plug2, ZMQ.Socket socket3);
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZProxy$State.class */
    public enum State {
        ALIVE,
        STARTED,
        PAUSED,
        STOPPED,
        EXITED
    }

    static {
        $assertionsDisabled = !ZProxy.class.desiredAssertionStatus();
        START = Command.START.name();
        PAUSE = Command.PAUSE.name();
        STOP = Command.STOP.name();
        RESTART = Command.RESTART.name();
        EXIT = Command.EXIT.name();
        STATUS = Command.STATUS.name();
        CONFIG = Command.CONFIG.name();
        STARTED = State.STARTED.name();
        PAUSED = State.PAUSED.name();
        STOPPED = State.STOPPED.name();
        EXITED = State.EXITED.name();
        ALIVE = State.ALIVE.name();
        counter = new AtomicInteger();
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZProxy$Proxy.class */
    public interface Proxy {
        ZMQ.Socket create(ZContext zContext, Plug plug, Object[] objArr);

        void configure(ZMQ.Socket socket, Plug plug, Object[] objArr);

        boolean restart(ZMsg zMsg, ZMQ.Socket socket, Plug plug, Object[] objArr);

        boolean configure(ZMQ.Socket socket, ZMsg zMsg, ZMQ.Socket socket2, ZMQ.Socket socket3, ZMQ.Socket socket4, Object[] objArr);

        boolean custom(ZMQ.Socket socket, String str, ZMQ.Socket socket2, ZMQ.Socket socket3, ZMQ.Socket socket4, Object[] objArr);

        /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZProxy$Proxy$SimpleProxy.class */
        public static abstract class SimpleProxy implements Proxy {
            @Override // org.zeromq.ZProxy.Proxy
            public boolean restart(ZMsg cfg, ZMQ.Socket socket, Plug place, Object[] args) {
                return true;
            }

            @Override // org.zeromq.ZProxy.Proxy
            public boolean configure(ZMQ.Socket pipe, ZMsg cfg, ZMQ.Socket frontend, ZMQ.Socket backend, ZMQ.Socket capture, Object[] args) {
                return true;
            }

            @Override // org.zeromq.ZProxy.Proxy
            public boolean custom(ZMQ.Socket pipe, String cmd, ZMQ.Socket frontend, ZMQ.Socket backend, ZMQ.Socket capture, Object[] args) {
                return true;
            }
        }
    }

    public static ZProxy newZProxy(ZContext ctx, String name, ZAgent.SelectorCreator selector, Proxy sockets, String motdelafin, Object... args) {
        return new ZProxy(ctx, name, selector, sockets, new ZPump(), null, args);
    }

    public static ZProxy newZProxy(ZContext ctx, String name, Proxy sockets, String motdelafin, Object... args) {
        return new ZProxy(ctx, name, null, sockets, new ZPump(), motdelafin, args);
    }

    public static ZProxy newProxy(ZContext ctx, String name, ZAgent.SelectorCreator selector, Proxy sockets, String motdelafin, Object... args) {
        return new ZProxy(ctx, name, selector, sockets, new ZmqPump(), motdelafin, args);
    }

    public static ZProxy newProxy(ZContext ctx, String name, Proxy sockets, String motdelafin, Object... args) {
        return new ZProxy(ctx, name, null, sockets, new ZmqPump(), motdelafin, args);
    }

    public String start(boolean sync) {
        return command(START, sync);
    }

    public String pause(boolean sync) {
        return command(PAUSE, sync);
    }

    public String stop(boolean sync) {
        return command(STOP, sync);
    }

    public String command(String command, boolean sync) {
        if (!$assertionsDisabled && command.equals(CONFIG)) {
            throw new AssertionError();
        }
        if (!$assertionsDisabled && command.equals(RESTART)) {
            throw new AssertionError();
        }
        if (command.equals(STATUS)) {
            return status(sync);
        }
        if (command.equals(EXIT)) {
            return exit(sync);
        }
        String status = recvStatus();
        if (this.agent.send(command) && sync) {
            status(true);
        }
        return status;
    }

    public State command(Command command, boolean sync) {
        return State.valueOf(command(command.name(), sync));
    }

    public ZMsg command(Command command, ZMsg msg, boolean sync) {
        if (command == Command.CONFIG) {
            return configure(msg);
        }
        if (command == Command.RESTART) {
            String status = restart(msg);
            ZMsg msg2 = new ZMsg();
            msg2.add(status);
            return msg2;
        }
        return null;
    }

    public ZMsg configure(ZMsg msg) {
        msg.addFirst(CONFIG);
        if (this.agent.send(msg)) {
            recvStatus();
            ZMsg reply = this.agent.recv();
            if (!$assertionsDisabled && reply == null) {
                throw new AssertionError();
            }
            this.agent.send(STATUS);
            return reply;
        }
        return null;
    }

    public String restart(ZMsg hot) {
        ZMsg msg = new ZMsg();
        msg.add(RESTART);
        if (hot == null) {
            msg.add(Boolean.toString(false));
        } else {
            msg.add(Boolean.toString(true));
            for (int index = 0; index < hot.size(); index++) {
                ZFrame frame = hot.pop();
                msg.add(frame);
            }
        }
        String status = EXITED;
        if (this.agent.send(msg)) {
            status = status(false);
        }
        return status;
    }

    public String exit(boolean sync) {
        String status = EXITED;
        if (this.agent.send(EXIT)) {
            if (sync) {
                return await();
            }
            status = status(false);
        }
        return status;
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0036, code lost:
    
        return r4;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.lang.String await() {
        /*
            r3 = this;
            r0 = r3
            r1 = 1
            java.lang.String r0 = r0.status(r1)
            r4 = r0
        L6:
            java.lang.Thread r0 = java.lang.Thread.currentThread()
            boolean r0 = r0.isInterrupted()
            if (r0 != 0) goto L35
            java.lang.String r0 = org.zeromq.ZProxy.EXITED
            r1 = r4
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L1c
            goto L35
        L1c:
            r0 = r3
            org.zeromq.ZAgent r0 = r0.agent
            boolean r0 = r0.sign()
            if (r0 != 0) goto L2c
            java.lang.String r0 = org.zeromq.ZProxy.EXITED
            return r0
        L2c:
            r0 = r3
            r1 = 0
            java.lang.String r0 = r0.status(r1)
            r4 = r0
            goto L6
        L35:
            r0 = r4
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.zeromq.ZProxy.await():java.lang.String");
    }

    public String status() {
        return status(true);
    }

    public String status(boolean sync) {
        String status = recvStatus();
        if (this.agent.send(STATUS) && sync) {
            status = recvStatus();
            if (!this.agent.send(STATUS)) {
                throw new RuntimeException("Unable to send the status message");
            }
        }
        return status;
    }

    private String recvStatus() {
        if (!this.agent.sign()) {
            return EXITED;
        }
        ZMsg msg = this.agent.recv();
        if (msg == null) {
            return EXITED;
        }
        String status = msg.popString();
        msg.destroy();
        return status;
    }

    public boolean isStarted() {
        return started();
    }

    public boolean started() {
        String status = status(true);
        return STARTED.equals(status);
    }

    public ZProxy(ZAgent.SelectorCreator selector, Proxy creator, String motdelafin, Object... args) {
        this(null, null, selector, creator, null, motdelafin, args);
    }

    public ZProxy(String name, ZAgent.SelectorCreator selector, Proxy creator, String motdelafin, Object... args) {
        this(null, name, selector, creator, null, motdelafin, args);
    }

    public ZProxy(ZContext ctx, String name, ZAgent.SelectorCreator selector, Proxy sockets, Pump pump, String motdelafin, Object... args) {
        pump = pump == null ? new ZmqPump() : pump;
        int count = 1 + args.length;
        Object[] vars = new Object[count];
        vars[0] = sockets;
        ZActor.Actor shadow = null;
        for (int index = 0; index < args.length; index++) {
            Object arg = args[index];
            if (arg instanceof ZActor.Actor) {
                shadow = (ZActor.Actor) arg;
            }
            vars[index + 1] = arg;
        }
        int id = counter.incrementAndGet();
        ZActor.Actor actor = new ProxyActor(name, pump, id);
        ZActor zactor = new ZActor(ctx, selector, shadow != null ? new ZActor.Duo(actor, shadow) : actor, motdelafin, vars);
        this.agent = zactor.agent();
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZProxy$ProxyActor.class */
    private static final class ProxyActor extends ZActor.SimpleActor {
        private final State state = new State();
        private final Pump transport;
        private final String name;
        private Proxy provider;
        private Object[] args;
        private ZMQ.Socket frontend;
        private ZMQ.Socket backend;
        private ZMQ.Socket capture;
        static final /* synthetic */ boolean $assertionsDisabled;

        static {
            $assertionsDisabled = !ZProxy.class.desiredAssertionStatus();
        }

        /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZProxy$ProxyActor$State.class */
        private static final class State {
            private boolean alive;
            private boolean started;
            private boolean paused;
            private boolean restart;
            private ZMsg hot;

            private State() {
                this.alive = false;
                this.started = false;
                this.paused = false;
                this.restart = false;
            }
        }

        public ProxyActor(String name, Pump transport, int id) {
            if (name == null) {
                this.name = String.format("ZProxy-%sd", Integer.valueOf(id));
            } else {
                this.name = name;
            }
            this.transport = transport;
        }

        @Override // org.zeromq.ZActor.SimpleActor, org.zeromq.ZActor.Actor
        public String premiere(ZMQ.Socket pipe) {
            return this.name;
        }

        @Override // org.zeromq.ZActor.SimpleActor, org.zeromq.ZActor.Actor
        public List<ZMQ.Socket> createSockets(ZContext ctx, Object[] args) {
            this.provider = (Proxy) args[0];
            this.args = new Object[args.length - 1];
            System.arraycopy(args, 1, this.args, 0, this.args.length);
            this.frontend = this.provider.create(ctx, Plug.FRONT, this.args);
            this.capture = this.provider.create(ctx, Plug.CAPTURE, this.args);
            this.backend = this.provider.create(ctx, Plug.BACK, this.args);
            if (!$assertionsDisabled && this.frontend == null) {
                throw new AssertionError();
            }
            if ($assertionsDisabled || this.backend != null) {
                return Arrays.asList(this.frontend, this.backend);
            }
            throw new AssertionError();
        }

        @Override // org.zeromq.ZActor.SimpleActor, org.zeromq.ZActor.Actor
        public void start(ZMQ.Socket pipe, List<ZMQ.Socket> sockets, ZPoller poller) {
            this.state.alive = true;
            ZMsg reply = new ZMsg();
            reply.add(ZProxy.ALIVE);
            reply.send(pipe);
        }

        @Override // org.zeromq.ZActor.SimpleActor, org.zeromq.ZActor.Actor
        public boolean backstage(ZMQ.Socket pipe, ZPoller poller, int events) {
            if (!$assertionsDisabled && this.state.hot != null) {
                throw new AssertionError();
            }
            String cmd = pipe.recvStr();
            if (!ZProxy.START.equals(cmd)) {
                if (!ZProxy.STOP.equals(cmd)) {
                    if (!ZProxy.PAUSE.equals(cmd)) {
                        if (!ZProxy.RESTART.equals(cmd)) {
                            if (!ZProxy.STATUS.equals(cmd)) {
                                if (!ZProxy.CONFIG.equals(cmd)) {
                                    if (!ZProxy.EXIT.equals(cmd)) {
                                        return this.provider.custom(pipe, cmd, this.frontend, this.backend, this.capture, this.args);
                                    }
                                    return false;
                                }
                                ZMsg cfg = ZMsg.recvMsg(pipe);
                                boolean rc = this.provider.configure(pipe, cfg, this.frontend, this.backend, this.capture, this.args);
                                cfg.destroy();
                                return rc;
                            }
                            return status().send(pipe);
                        }
                        String val = pipe.recvStr();
                        boolean hot = Boolean.parseBoolean(val);
                        return restart(pipe, poller, hot);
                    }
                    pause(poller, true);
                    return status().send(pipe);
                }
                stop(poller);
                return status().send(pipe);
            }
            start(poller);
            return status().send(pipe);
        }

        private ZMsg status() {
            ZMsg reply = new ZMsg();
            if (this.state.alive) {
                if (this.state.started) {
                    if (this.state.paused) {
                        reply.add(ZProxy.PAUSED);
                    } else {
                        reply.add(ZProxy.STARTED);
                    }
                } else {
                    reply.add(ZProxy.STOPPED);
                }
                return reply;
            }
            reply.add(ZProxy.EXITED);
            return reply;
        }

        private boolean start(ZPoller poller) {
            if (!this.state.started) {
                this.state.started = true;
                this.provider.configure(this.frontend, Plug.FRONT, this.args);
                this.provider.configure(this.backend, Plug.BACK, this.args);
                this.provider.configure(this.capture, Plug.CAPTURE, this.args);
            }
            if (!this.state.paused) {
                pause(poller, false);
                return true;
            }
            return true;
        }

        private boolean pause(ZPoller poller, boolean pause) {
            this.state.paused = pause;
            if (pause) {
                poller.unregister(this.frontend);
                poller.unregister(this.backend);
                return true;
            }
            poller.register(this.frontend, 1);
            poller.register(this.backend, 1);
            return true;
        }

        private boolean stop(ZPoller poller) {
            this.state.started = false;
            this.state.restart = true;
            return true;
        }

        private boolean restart(ZMQ.Socket pipe, ZPoller poller, boolean hot) {
            if (!hot) {
                this.state.restart = true;
                return false;
            }
            if (!$assertionsDisabled && this.provider == null) {
                throw new AssertionError();
            }
            this.state.hot = ZMsg.recvMsg(pipe);
            this.state.restart = true;
            return true;
        }

        @Override // org.zeromq.ZActor.SimpleActor, org.zeromq.ZActor.Actor
        public long looping(ZMQ.Socket pipe, ZPoller poller) {
            this.state.hot = null;
            return super.looping(pipe, poller);
        }

        @Override // org.zeromq.ZActor.SimpleActor, org.zeromq.ZActor.Actor
        public boolean stage(ZMQ.Socket socket, ZMQ.Socket pipe, ZPoller poller, int events) {
            if (socket == this.frontend) {
                return this.transport.flow(Plug.FRONT, this.frontend, this.capture, Plug.BACK, this.backend);
            }
            if (socket == this.backend) {
                return this.transport.flow(Plug.BACK, this.backend, this.capture, Plug.FRONT, this.frontend);
            }
            return false;
        }

        @Override // org.zeromq.ZActor.SimpleActor, org.zeromq.ZActor.Actor
        public boolean looped(ZMQ.Socket pipe, ZPoller poller) {
            if (this.state.restart && this.state.hot != null) {
                ZMsg cfg = this.state.hot;
                this.state.hot = null;
                this.state.restart = false;
                ZMsg dup = cfg.duplicate();
                boolean cold = this.provider.restart(dup, this.frontend, Plug.FRONT, this.args);
                dup.destroy();
                ZMsg dup2 = cfg.duplicate();
                boolean cold2 = cold | this.provider.restart(dup2, this.backend, Plug.BACK, this.args);
                dup2.destroy();
                ZMsg dup3 = cfg.duplicate();
                boolean cold3 = cold2 | this.provider.restart(dup3, this.capture, Plug.CAPTURE, this.args);
                dup3.destroy();
                cfg.destroy();
                this.state.restart = cold3;
                return true;
            }
            return true;
        }

        @Override // org.zeromq.ZActor.SimpleActor, org.zeromq.ZActor.Actor
        public boolean destroyed(ZMQ.Socket pipe, ZPoller poller) {
            if (this.capture != null) {
                this.capture.close();
            }
            if (!this.state.restart) {
                this.state.alive = false;
                status().send(pipe);
            }
            return this.state.restart;
        }
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZProxy$ZPump.class */
    public static class ZPump implements Pump {
        private static final Identity IDENTITY = new Identity();
        private final Transformer transformer;

        /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZProxy$ZPump$Transformer.class */
        public interface Transformer {
            ZMsg transform(ZMsg zMsg, Plug plug, Plug plug2);
        }

        /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZProxy$ZPump$Identity.class */
        private static class Identity implements Transformer {
            private Identity() {
            }

            @Override // org.zeromq.ZProxy.ZPump.Transformer
            public ZMsg transform(ZMsg msg, Plug src, Plug dst) {
                return msg;
            }
        }

        public ZPump() {
            this(null);
        }

        public ZPump(Transformer transformer) {
            this.transformer = transformer == null ? IDENTITY : transformer;
        }

        @Override // org.zeromq.ZProxy.Pump
        public boolean flow(Plug splug, ZMQ.Socket source, ZMQ.Socket capture, Plug dplug, ZMQ.Socket destination) {
            ZMsg msg = ZMsg.recvMsg(source);
            if (msg == null) {
                return false;
            }
            if (capture != null) {
                ZMsg cpt = this.transformer.transform(msg, splug, Plug.CAPTURE);
                boolean destroy = msg != cpt;
                boolean success = cpt.send(capture, destroy);
                if (!success) {
                }
            }
            ZMsg dst = this.transformer.transform(msg, splug, dplug);
            boolean success2 = dst.send(destination);
            msg.destroy();
            return success2;
        }
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZProxy$ZmqPump.class */
    private static final class ZmqPump implements Pump {
        private ZmqPump() {
        }

        @Override // org.zeromq.ZProxy.Pump
        public boolean flow(Plug splug, ZMQ.Socket source, ZMQ.Socket capture, Plug dplug, ZMQ.Socket destination) {
            long more;
            SocketBase src = source.base();
            SocketBase dst = destination.base();
            SocketBase cpt = capture == null ? null : capture.base();
            do {
                Msg msg = src.recv(0);
                if (msg == null) {
                    return false;
                }
                more = src.getSocketOpt(13);
                if (more < 0) {
                    return false;
                }
                if (cpt != null) {
                    Msg ctrl = new Msg(msg);
                    boolean rc = cpt.send(ctrl, more > 0 ? 2 : 0);
                    if (!rc) {
                    }
                }
                boolean rc2 = dst.send(msg, more > 0 ? 2 : 0);
                if (!rc2) {
                    return false;
                }
            } while (more != 0);
            return true;
        }
    }
}
