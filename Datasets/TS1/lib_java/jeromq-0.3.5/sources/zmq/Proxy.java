package zmq;

import java.io.IOException;
import java.nio.channels.Selector;
import zmq.ZError;

/* loaded from: jeromq-0.3.5.jar:zmq/Proxy.class */
public class Proxy {
    private Proxy() {
    }

    public static boolean proxy(SocketBase frontend, SocketBase backend, SocketBase capture) {
        long more;
        long more2;
        PollItem[] items = {new PollItem(frontend, 1), new PollItem(backend, 1)};
        try {
            Selector selector = Selector.open();
            while (!Thread.currentThread().isInterrupted()) {
                try {
                    int rc = ZMQ.poll(selector, items, -1L);
                    if (rc < 0) {
                        try {
                            selector.close();
                        } catch (Exception e) {
                        }
                        return false;
                    }
                    if (items[0].isReadable()) {
                        do {
                            Msg msg = frontend.recv(0);
                            if (msg == null) {
                                try {
                                    selector.close();
                                } catch (Exception e2) {
                                }
                                return false;
                            }
                            more2 = frontend.getSocketOpt(13);
                            if (more2 < 0) {
                                try {
                                    selector.close();
                                } catch (Exception e3) {
                                }
                                return false;
                            }
                            if (capture != null) {
                                Msg ctrl = new Msg(msg);
                                boolean success = capture.send(ctrl, more2 > 0 ? 2 : 0);
                                if (!success) {
                                    return false;
                                }
                            }
                            boolean success2 = backend.send(msg, more2 > 0 ? 2 : 0);
                            if (!success2) {
                                try {
                                    selector.close();
                                } catch (Exception e4) {
                                }
                                return false;
                            }
                        } while (more2 != 0);
                    }
                    if (items[1].isReadable()) {
                        do {
                            Msg msg2 = backend.recv(0);
                            if (msg2 == null) {
                                try {
                                    selector.close();
                                } catch (Exception e5) {
                                }
                                return false;
                            }
                            more = backend.getSocketOpt(13);
                            if (more < 0) {
                                try {
                                    selector.close();
                                } catch (Exception e6) {
                                }
                                return false;
                            }
                            if (capture != null) {
                                Msg ctrl2 = new Msg(msg2);
                                boolean success3 = capture.send(ctrl2, more > 0 ? 2 : 0);
                                if (!success3) {
                                    try {
                                        selector.close();
                                    } catch (Exception e7) {
                                    }
                                    return false;
                                }
                            }
                            boolean success4 = frontend.send(msg2, more > 0 ? 2 : 0);
                            if (!success4) {
                                try {
                                    selector.close();
                                } catch (Exception e8) {
                                }
                                return false;
                            }
                        } while (more != 0);
                    }
                } finally {
                    try {
                        selector.close();
                    } catch (Exception e9) {
                    }
                }
            }
            try {
                selector.close();
                return true;
            } catch (Exception e10) {
                return true;
            }
        } catch (IOException e11) {
            throw new ZError.IOException(e11);
        }
    }
}
