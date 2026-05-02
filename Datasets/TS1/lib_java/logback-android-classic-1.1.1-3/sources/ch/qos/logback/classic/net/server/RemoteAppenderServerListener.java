package ch.qos.logback.classic.net.server;

import ch.qos.logback.core.net.server.ServerSocketListener;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/net/server/RemoteAppenderServerListener.class */
class RemoteAppenderServerListener extends ServerSocketListener<RemoteAppenderClient> {
    public RemoteAppenderServerListener(ServerSocket serverSocket) {
        super(serverSocket);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* renamed from: createClient, reason: merged with bridge method [inline-methods] */
    public RemoteAppenderClient m10createClient(String str, Socket socket) throws IOException {
        return new RemoteAppenderStreamClient(str, socket);
    }
}
