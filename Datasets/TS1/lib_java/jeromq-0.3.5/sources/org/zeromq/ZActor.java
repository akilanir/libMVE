package org.zeromq;

import java.nio.channels.SelectableChannel;
import java.nio.channels.Selector;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.zeromq.ZAgent;
import org.zeromq.ZMQ;
import org.zeromq.ZPoller;
import org.zeromq.ZStar;

/* loaded from: jeromq-0.3.5.jar:org/zeromq/ZActor.class */
public class ZActor extends ZStar {

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZActor$Actor.class */
    public interface Actor {
        String premiere(ZMQ.Socket socket);

        List<ZMQ.Socket> createSockets(ZContext zContext, Object[] objArr);

        void start(ZMQ.Socket socket, List<ZMQ.Socket> list, ZPoller zPoller);

        long looping(ZMQ.Socket socket, ZPoller zPoller);

        boolean backstage(ZMQ.Socket socket, ZPoller zPoller, int i);

        boolean stage(ZMQ.Socket socket, ZMQ.Socket socket2, ZPoller zPoller, int i);

        boolean looped(ZMQ.Socket socket, ZPoller zPoller);

        void closed(ZMQ.Socket socket);

        boolean destroyed(ZMQ.Socket socket, ZPoller zPoller);

        boolean finished(ZMQ.Socket socket);
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZActor$SimpleActor.class */
    public static class SimpleActor implements Actor {
        @Override // org.zeromq.ZActor.Actor
        public String premiere(ZMQ.Socket pipe) {
            return "?";
        }

        @Override // org.zeromq.ZActor.Actor
        public List<ZMQ.Socket> createSockets(ZContext ctx, Object[] args) {
            return Collections.emptyList();
        }

        @Override // org.zeromq.ZActor.Actor
        public void start(ZMQ.Socket pipe, List<ZMQ.Socket> sockets, ZPoller poller) {
        }

        @Override // org.zeromq.ZActor.Actor
        public long looping(ZMQ.Socket pipe, ZPoller poller) {
            return -1L;
        }

        @Override // org.zeromq.ZActor.Actor
        public boolean backstage(ZMQ.Socket pipe, ZPoller poller, int events) {
            return false;
        }

        @Override // org.zeromq.ZActor.Actor
        public boolean stage(ZMQ.Socket socket, ZMQ.Socket pipe, ZPoller poller, int events) {
            return false;
        }

        @Override // org.zeromq.ZActor.Actor
        public boolean looped(ZMQ.Socket pipe, ZPoller poller) {
            return true;
        }

        @Override // org.zeromq.ZActor.Actor
        public void closed(ZMQ.Socket socket) {
        }

        @Override // org.zeromq.ZActor.Actor
        public boolean destroyed(ZMQ.Socket pipe, ZPoller poller) {
            return false;
        }

        @Override // org.zeromq.ZActor.Actor
        public boolean finished(ZMQ.Socket pipe) {
            return true;
        }
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZActor$Duo.class */
    public static class Duo implements Actor {
        private final Actor main;
        private final Actor shadow;
        static final /* synthetic */ boolean $assertionsDisabled;

        static {
            $assertionsDisabled = !ZActor.class.desiredAssertionStatus();
        }

        public Duo(Actor main, Actor shadow) {
            if (!$assertionsDisabled && main == null) {
                throw new AssertionError();
            }
            if (!$assertionsDisabled && shadow == null) {
                throw new AssertionError();
            }
            this.main = main;
            this.shadow = shadow;
        }

        @Override // org.zeromq.ZActor.Actor
        public String premiere(ZMQ.Socket pipe) {
            this.shadow.premiere(pipe);
            return this.main.premiere(pipe);
        }

        @Override // org.zeromq.ZActor.Actor
        public List<ZMQ.Socket> createSockets(ZContext ctx, Object[] args) {
            this.shadow.createSockets(ctx, args);
            return this.main.createSockets(ctx, args);
        }

        @Override // org.zeromq.ZActor.Actor
        public void start(ZMQ.Socket pipe, List<ZMQ.Socket> sockets, ZPoller poller) {
            this.shadow.start(pipe, sockets, poller);
            this.main.start(pipe, sockets, poller);
        }

        @Override // org.zeromq.ZActor.Actor
        public long looping(ZMQ.Socket pipe, ZPoller poller) {
            this.shadow.looping(pipe, poller);
            return this.main.looping(pipe, poller);
        }

        @Override // org.zeromq.ZActor.Actor
        public boolean backstage(ZMQ.Socket pipe, ZPoller poller, int events) {
            this.shadow.backstage(pipe, poller, events);
            return this.main.backstage(pipe, poller, events);
        }

        @Override // org.zeromq.ZActor.Actor
        public boolean stage(ZMQ.Socket socket, ZMQ.Socket pipe, ZPoller poller, int events) {
            this.shadow.stage(socket, pipe, poller, events);
            return this.main.stage(socket, pipe, poller, events);
        }

        @Override // org.zeromq.ZActor.Actor
        public boolean looped(ZMQ.Socket pipe, ZPoller poller) {
            this.shadow.looped(pipe, poller);
            return this.main.looped(pipe, poller);
        }

        @Override // org.zeromq.ZActor.Actor
        public void closed(ZMQ.Socket socket) {
            this.shadow.closed(socket);
            this.main.closed(socket);
        }

        @Override // org.zeromq.ZActor.Actor
        public boolean destroyed(ZMQ.Socket pipe, ZPoller poller) {
            this.shadow.destroyed(pipe, poller);
            return this.main.destroyed(pipe, poller);
        }

        @Override // org.zeromq.ZActor.Actor
        public boolean finished(ZMQ.Socket pipe) {
            this.shadow.finished(pipe);
            return this.main.finished(pipe);
        }
    }

    public ZActor(Actor actor, String motdelafin, Object... args) {
        this(null, null, actor, motdelafin, args);
    }

    public ZActor(ZAgent.SelectorCreator selector, Actor actor, String motdelafin, Object... args) {
        this(null, selector, actor, motdelafin, args);
    }

    public ZActor(ZContext context, ZAgent.SelectorCreator selector, Actor actor, String motdelafin, Object[] args) {
        super(context, selector, new ActorFortune(actor), motdelafin, args);
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZActor$ActorFortune.class */
    private static final class ActorFortune implements ZStar.Fortune {
        private final Actor actor;
        static final /* synthetic */ boolean $assertionsDisabled;

        static {
            $assertionsDisabled = !ZActor.class.desiredAssertionStatus();
        }

        public ActorFortune(Actor actor) {
            if (!$assertionsDisabled && actor == null) {
                throw new AssertionError();
            }
            this.actor = actor;
        }

        @Override // org.zeromq.ZStar.Fortune
        public String premiere(ZMQ.Socket mic, Object[] args) {
            return this.actor.premiere(mic);
        }

        @Override // org.zeromq.ZStar.Fortune
        public ZStar.Star create(ZContext ctx, ZMQ.Socket pipe, Selector sel, int count, ZStar.Star previous, Object[] args) {
            ZStar.Star star = new Double(ctx, pipe, sel, this.actor, args);
            return star;
        }

        @Override // org.zeromq.ZStar.Fortune
        public boolean interview(ZMQ.Socket mic) {
            return this.actor.finished(mic);
        }

        @Override // org.zeromq.ZStar.TimeTaker
        public void party(ZContext ctx) {
        }
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZActor$Double.class */
    private static final class Double implements ZPoller.EventsHandler, ZStar.Star {
        private final ZPoller poller;
        private final ZMQ.Socket pipe;
        private final List<ZMQ.Socket> sockets;
        private final Actor actor;
        static final /* synthetic */ boolean $assertionsDisabled;

        static {
            $assertionsDisabled = !ZActor.class.desiredAssertionStatus();
        }

        public Double(ZContext ctx, ZMQ.Socket pipe, Selector selector, Actor actor, Object[] args) {
            this.pipe = pipe;
            this.actor = actor;
            List<ZMQ.Socket> created = actor.createSockets(ctx, args);
            if (!$assertionsDisabled && created == null) {
                throw new AssertionError();
            }
            this.sockets = new ArrayList(created);
            this.poller = new ZPoller(selector);
            this.poller.setGlobalHandler(this);
        }

        @Override // org.zeromq.ZStar.Star
        public void prepare() {
            this.poller.register(this.pipe, 1);
            this.actor.start(this.pipe, Collections.unmodifiableList(this.sockets), this.poller);
        }

        @Override // org.zeromq.ZStar.Star
        public int breathe() {
            long timeout = this.actor.looping(this.pipe, this.poller);
            return this.poller.poll(timeout);
        }

        @Override // org.zeromq.ZStar.Star
        public boolean act(int events) {
            return events >= 0;
        }

        @Override // org.zeromq.ZStar.Star
        public boolean entract() {
            return this.actor.looped(this.pipe, this.poller);
        }

        @Override // org.zeromq.ZStar.Star
        public boolean renews() {
            Iterator<ZMQ.Socket> iter = this.sockets.iterator();
            while (iter.hasNext()) {
                ZMQ.Socket socket = iter.next();
                iter.remove();
                if (socket != null) {
                    this.poller.unregister(socket);
                    socket.close();
                    this.actor.closed(socket);
                }
            }
            return this.actor.destroyed(this.pipe, this.poller);
        }

        @Override // org.zeromq.ZPoller.EventsHandler
        public boolean events(SelectableChannel channel, int events) {
            return true;
        }

        @Override // org.zeromq.ZPoller.EventsHandler
        public boolean events(ZMQ.Socket socket, int events) {
            if (socket != this.pipe) {
                return this.actor.stage(socket, this.pipe, this.poller, events);
            }
            return this.actor.backstage(this.pipe, this.poller, events);
        }
    }
}
