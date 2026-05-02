package org.zeromq;

import org.zeromq.ZMQ;

/* loaded from: jeromq-0.3.5.jar:org/zeromq/ZMQQueue.class */
public class ZMQQueue implements Runnable {
    private final ZMQ.Socket inSocket;
    private final ZMQ.Socket outSocket;

    public ZMQQueue(ZMQ.Context context, ZMQ.Socket inSocket, ZMQ.Socket outSocket) {
        this.inSocket = inSocket;
        this.outSocket = outSocket;
    }

    @Override // java.lang.Runnable
    public void run() {
        zmq.ZMQ.proxy(this.inSocket.base(), this.outSocket.base(), null);
    }
}
