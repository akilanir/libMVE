package org.zeromq;

import java.io.IOException;
import java.nio.channels.Selector;
import java.util.Arrays;
import org.zeromq.ZMQ;

/* loaded from: jeromq-0.3.5.jar:org/zeromq/ZAgent.class */
public interface ZAgent {

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZAgent$SelectorCreator.class */
    public interface SelectorCreator {
        Selector create() throws IOException;

        void destroy(Selector selector) throws IOException;
    }

    ZMsg recv();

    ZMsg recv(boolean z);

    boolean send(ZMsg zMsg);

    boolean send(ZMsg zMsg, boolean z);

    boolean send(String str);

    boolean send(String str, boolean z);

    boolean sign();

    @Deprecated
    void nova();

    ZMQ.Socket pipe();

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZAgent$Creator.class */
    public static class Creator {
        public static ZAgent create(ZMQ.Socket pipe, String lock) {
            return new SimpleAgent(pipe, lock);
        }
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZAgent$SimpleAgent.class */
    public static final class SimpleAgent implements ZAgent {
        private final ZMQ.Socket pipe;
        private final byte[] lock;
        private boolean locked;

        public SimpleAgent(ZMQ.Socket pipe, String lock) {
            this.pipe = pipe;
            this.lock = lock == null ? null : lock.getBytes(ZMQ.CHARSET);
        }

        @Override // org.zeromq.ZAgent
        public boolean sign() {
            return !this.locked;
        }

        @Override // org.zeromq.ZAgent
        public ZMsg recv() {
            return recv(true);
        }

        @Override // org.zeromq.ZAgent
        public ZMsg recv(boolean wait) {
            if (this.locked) {
                return null;
            }
            ZMsg msg = ZMsg.recvMsg(this.pipe, wait ? 0 : 1);
            if (msg == null) {
                return null;
            }
            ZFrame frame = msg.peek();
            byte[] key = frame.getData();
            if (this.lock != null && Arrays.equals(this.lock, key)) {
                this.locked = true;
                msg = null;
                this.pipe.close();
            }
            return msg;
        }

        @Override // org.zeromq.ZAgent
        public boolean send(ZMsg message) {
            if (this.locked) {
                return false;
            }
            return message.send(this.pipe);
        }

        @Override // org.zeromq.ZAgent
        public boolean send(String word) {
            if (this.locked) {
                return false;
            }
            return this.pipe.send(word);
        }

        @Override // org.zeromq.ZAgent
        public boolean send(String word, boolean more) {
            if (this.locked) {
                return false;
            }
            return this.pipe.send(word, more ? 2 : 0);
        }

        @Override // org.zeromq.ZAgent
        public boolean send(ZMsg msg, boolean destroy) {
            if (this.locked) {
                return false;
            }
            return msg.send(this.pipe, destroy);
        }

        @Override // org.zeromq.ZAgent
        public ZMQ.Socket pipe() {
            return this.pipe;
        }

        @Override // org.zeromq.ZAgent
        public void nova() {
            this.pipe.close();
        }
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZAgent$VerySimpleSelectorCreator.class */
    public static class VerySimpleSelectorCreator implements SelectorCreator {
        @Override // org.zeromq.ZAgent.SelectorCreator
        public Selector create() throws IOException {
            return Selector.open();
        }

        @Override // org.zeromq.ZAgent.SelectorCreator
        public void destroy(Selector selector) throws IOException {
            if (selector != null) {
                selector.close();
            }
        }
    }
}
