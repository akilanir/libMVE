package ch.qos.logback.core.net.server;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.Executor;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/server/RemoteReceiverServerRunner.class */
class RemoteReceiverServerRunner extends ConcurrentServerRunner<RemoteReceiverClient> {
    private final int clientQueueSize;

    public RemoteReceiverServerRunner(ServerListener<RemoteReceiverClient> serverListener, Executor executor, int i) {
        super(serverListener, executor);
        this.clientQueueSize = i;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ch.qos.logback.core.net.server.ConcurrentServerRunner
    public boolean configureClient(RemoteReceiverClient remoteReceiverClient) {
        remoteReceiverClient.setContext(getContext());
        remoteReceiverClient.setQueue(new ArrayBlockingQueue(this.clientQueueSize));
        return true;
    }
}
