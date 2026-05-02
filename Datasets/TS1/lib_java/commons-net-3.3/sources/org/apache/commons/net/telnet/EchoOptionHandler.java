package org.apache.commons.net.telnet;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/telnet/EchoOptionHandler.class */
public class EchoOptionHandler extends TelnetOptionHandler {
    public EchoOptionHandler(boolean initlocal, boolean initremote, boolean acceptlocal, boolean acceptremote) {
        super(1, initlocal, initremote, acceptlocal, acceptremote);
    }

    public EchoOptionHandler() {
        super(1, false, false, false, false);
    }

    @Override // org.apache.commons.net.telnet.TelnetOptionHandler
    public int[] answerSubnegotiation(int[] suboptionData, int suboptionLength) {
        return null;
    }

    @Override // org.apache.commons.net.telnet.TelnetOptionHandler
    public int[] startSubnegotiationLocal() {
        return null;
    }

    @Override // org.apache.commons.net.telnet.TelnetOptionHandler
    public int[] startSubnegotiationRemote() {
        return null;
    }
}
