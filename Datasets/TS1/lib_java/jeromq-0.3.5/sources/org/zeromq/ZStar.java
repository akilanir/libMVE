package org.zeromq;

import java.io.IOException;
import java.nio.channels.Selector;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.LockSupport;
import org.zeromq.ZAgent;
import org.zeromq.ZMQ;
import org.zeromq.ZThread;

/* loaded from: jeromq-0.3.5.jar:org/zeromq/ZStar.class */
public class ZStar implements ZAgent {
    private final ZAgent agent;
    static final /* synthetic */ boolean $assertionsDisabled;

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZStar$Entourage.class */
    public interface Entourage extends TimeTaker {
        void breakaleg(ZContext zContext, Fortune fortune, ZMQ.Socket socket, Object[] objArr);
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZStar$Fortune.class */
    public interface Fortune extends TimeTaker {
        String premiere(ZMQ.Socket socket, Object[] objArr);

        Star create(ZContext zContext, ZMQ.Socket socket, Selector selector, int i, Star star, Object[] objArr);

        boolean interview(ZMQ.Socket socket);
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZStar$Set.class */
    public interface Set {
        void lights(String str, int i);

        boolean fire();
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZStar$Star.class */
    public interface Star {
        void prepare();

        int breathe();

        boolean act(int i);

        boolean entract();

        boolean renews();
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZStar$TimeTaker.class */
    public interface TimeTaker {
        void party(ZContext zContext);
    }

    static {
        $assertionsDisabled = !ZStar.class.desiredAssertionStatus();
    }

    public static void party(long time, TimeUnit unit) {
        LockSupport.parkNanos(TimeUnit.NANOSECONDS.convert(time, unit));
    }

    public ZAgent agent() {
        return this.agent;
    }

    public ZStar(Fortune actor, String lock, Object... args) {
        this(null, new ZAgent.VerySimpleSelectorCreator(), actor, lock, args);
    }

    public ZStar(ZAgent.SelectorCreator selector, Fortune fortune, String motdelafin, Object... args) {
        this(null, selector, fortune, motdelafin, args);
    }

    public ZStar(ZContext context, ZAgent.SelectorCreator selector, Fortune fortune, String motdelafin, Object[] bags) {
        if (!$assertionsDisabled && fortune == null) {
            throw new AssertionError();
        }
        ZAgent.SelectorCreator feather = selector;
        feather = selector == null ? new ZAgent.VerySimpleSelectorCreator() : feather;
        ZContext chef = context;
        ZContext producer = null;
        if (chef == null) {
            chef = new ZContext();
            producer = chef;
        }
        Set set = null;
        Entourage entourage = null;
        for (Object bag : bags) {
            set = bag instanceof Set ? (Set) bag : set;
            if (bag instanceof Entourage) {
                entourage = (Entourage) bag;
            }
        }
        set = set == null ? new SimpleSet() : set;
        List<Object> train = new ArrayList<>(6 + bags.length);
        train.add(set);
        train.add(fortune);
        train.add(feather);
        train.add(producer);
        train.add(entourage);
        train.add(motdelafin);
        train.addAll(Arrays.asList(bags));
        ZMQ.Socket phone = ZThread.fork(chef, new Plateau(), train.toArray());
        this.agent = agent(phone, motdelafin);
    }

    protected ZAgent agent(ZMQ.Socket phone, String secret) {
        return ZAgent.Creator.create(phone, secret);
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZStar$Plateau.class */
    private static final class Plateau implements ZThread.IAttachedRunnable {
        private static final AtomicInteger shows = new AtomicInteger();
        private final int number;

        private Plateau() {
            this.number = shows.incrementAndGet();
        }

        @Override // org.zeromq.ZThread.IAttachedRunnable
        public void run(Object[] train, ZContext chef, ZMQ.Socket mic) {
            Fortune star = (Fortune) train[1];
            Entourage entourage = (Entourage) train[4];
            ZContext producer = (ZContext) train[3];
            ZAgent.SelectorCreator feather = (ZAgent.SelectorCreator) train[2];
            Set set = (Set) train[0];
            String gossip = (String) train[5];
            Object[] bags = new Object[train.length - 6];
            System.arraycopy(train, 6, bags, 0, bags.length);
            if (entourage != null) {
                entourage.breakaleg(chef, star, mic, bags);
            }
            Selector story = null;
            try {
                try {
                    story = feather.create();
                    String name = star.premiere(mic, bags);
                    set.lights(name, this.number);
                    showMustGoOn(chef, set, story, mic, star, bags);
                    boolean tell = star.interview(mic);
                    if (tell && gossip != null) {
                        mic.send(gossip);
                    }
                    star.party(chef);
                    star = null;
                    if (entourage != null) {
                        entourage.party(chef);
                    }
                    chef.close();
                    if (producer != null) {
                        producer.close();
                    }
                    try {
                        feather.destroy(story);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                } catch (IOException e2) {
                    e2.printStackTrace();
                    boolean tell2 = star.interview(mic);
                    if (tell2 && gossip != null) {
                        mic.send(gossip);
                    }
                    star.party(chef);
                    star = null;
                    if (entourage != null) {
                        entourage.party(chef);
                    }
                    chef.close();
                    if (producer != null) {
                        producer.close();
                    }
                    try {
                        feather.destroy(story);
                    } catch (IOException e3) {
                        e3.printStackTrace();
                    }
                }
            } catch (Throwable th) {
                boolean tell3 = star.interview(mic);
                if (tell3 && gossip != null) {
                    mic.send(gossip);
                }
                star.party(chef);
                if (entourage != null) {
                    entourage.party(chef);
                }
                chef.close();
                if (producer != null) {
                    producer.close();
                }
                try {
                    feather.destroy(story);
                } catch (IOException e4) {
                    e4.printStackTrace();
                }
                throw th;
            }
        }

        private void showMustGoOn(ZContext chef, Set set, Selector story, ZMQ.Socket phone, Fortune fortune, Object[] bags) {
            int shows2 = 0;
            Star actor = null;
            do {
                int i = shows2;
                shows2++;
                actor = fortune.create(chef, phone, story, i, actor, bags);
                actor.prepare();
                while (!set.fire()) {
                    int events = actor.breathe();
                    if (!actor.act(events) || !actor.entract()) {
                        break;
                    }
                }
            } while (actor.renews());
        }
    }

    @Override // org.zeromq.ZAgent
    public ZMsg recv() {
        return this.agent.recv();
    }

    @Override // org.zeromq.ZAgent
    public ZMsg recv(boolean wait) {
        return this.agent.recv(wait);
    }

    @Override // org.zeromq.ZAgent
    public boolean send(ZMsg message) {
        return this.agent.send(message);
    }

    @Override // org.zeromq.ZAgent
    public boolean send(ZMsg msg, boolean destroy) {
        return this.agent.send(msg, destroy);
    }

    @Override // org.zeromq.ZAgent
    public boolean send(String word) {
        return this.agent.send(word);
    }

    @Override // org.zeromq.ZAgent
    public boolean send(String word, boolean more) {
        return this.agent.send(word, more);
    }

    @Override // org.zeromq.ZAgent
    public ZMQ.Socket pipe() {
        return this.agent.pipe();
    }

    @Override // org.zeromq.ZAgent
    public boolean sign() {
        return this.agent.sign();
    }

    @Override // org.zeromq.ZAgent
    public void nova() {
        this.agent.nova();
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZStar$SimpleSet.class */
    public static class SimpleSet implements Set {
        @Override // org.zeromq.ZStar.Set
        public boolean fire() {
            return Thread.currentThread().isInterrupted();
        }

        @Override // org.zeromq.ZStar.Set
        public void lights(String name, int id) {
            if (name == null) {
                name = createDefaultName("Star-%d", id);
            }
            Thread.currentThread().setName(name);
        }

        public static String createDefaultName(String format, int id) {
            return String.format(format, Integer.valueOf(id));
        }
    }
}
