package ch.qos.logback.core.net.server;

import ch.qos.logback.core.spi.ContextAware;
import java.io.Serializable;
import java.util.concurrent.BlockingQueue;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/server/RemoteReceiverClient.class */
interface RemoteReceiverClient extends Client, ContextAware {
    void setQueue(BlockingQueue<Serializable> blockingQueue);

    boolean offer(Serializable serializable);
}
