package org.apache.commons.net.bsd;

import java.io.IOException;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/bsd/RLoginClient.class */
public class RLoginClient extends RCommandClient {
    public static final int DEFAULT_PORT = 513;

    public RLoginClient() {
        setDefaultPort(DEFAULT_PORT);
    }

    public void rlogin(String localUsername, String remoteUsername, String terminalType, int terminalSpeed) throws IOException {
        rexec(localUsername, remoteUsername, terminalType + "/" + terminalSpeed, false);
    }

    public void rlogin(String localUsername, String remoteUsername, String terminalType) throws IOException {
        rexec(localUsername, remoteUsername, terminalType, false);
    }
}
