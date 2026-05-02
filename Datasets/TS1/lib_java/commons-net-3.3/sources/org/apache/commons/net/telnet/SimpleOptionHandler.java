package org.apache.commons.net.telnet;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/telnet/SimpleOptionHandler.class */
public class SimpleOptionHandler extends TelnetOptionHandler {
    public SimpleOptionHandler(int optcode, boolean initlocal, boolean initremote, boolean acceptlocal, boolean acceptremote) {
        super(optcode, initlocal, initremote, acceptlocal, acceptremote);
    }

    public SimpleOptionHandler(int optcode) {
        super(optcode, false, false, false, false);
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
