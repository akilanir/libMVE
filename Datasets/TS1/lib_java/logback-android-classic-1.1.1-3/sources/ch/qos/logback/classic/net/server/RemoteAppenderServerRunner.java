package ch.qos.logback.classic.net.server;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.core.net.server.ConcurrentServerRunner;
import ch.qos.logback.core.net.server.ServerListener;
import java.util.concurrent.Executor;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/net/server/RemoteAppenderServerRunner.class */
class RemoteAppenderServerRunner extends ConcurrentServerRunner<RemoteAppenderClient> {
    public RemoteAppenderServerRunner(ServerListener<RemoteAppenderClient> serverListener, Executor executor) {
        super(serverListener, executor);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean configureClient(RemoteAppenderClient remoteAppenderClient) {
        remoteAppenderClient.setLoggerContext((LoggerContext) getContext());
        return true;
    }
}
