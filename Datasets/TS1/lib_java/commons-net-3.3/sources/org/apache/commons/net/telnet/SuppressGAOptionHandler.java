package org.apache.commons.net.telnet;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/telnet/SuppressGAOptionHandler.class */
public class SuppressGAOptionHandler extends TelnetOptionHandler {
    public SuppressGAOptionHandler(boolean initlocal, boolean initremote, boolean acceptlocal, boolean acceptremote) {
        super(3, initlocal, initremote, acceptlocal, acceptremote);
    }

    public SuppressGAOptionHandler() {
        super(3, false, false, false, false);
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
