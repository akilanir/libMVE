package org.apache.commons.net.imap;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.net.SocketClient;
import org.apache.commons.net.io.CRLFLineReader;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/imap/IMAP.class */
public class IMAP extends SocketClient {
    public static final int DEFAULT_PORT = 143;
    protected static final String __DEFAULT_ENCODING = "ISO-8859-1";
    private IMAPState __state;
    protected BufferedWriter __writer;
    protected BufferedReader _reader;
    private int _replyCode;
    private final List<String> _replyLines;
    private final char[] _initialID = {'A', 'A', 'A', 'A'};

    /* loaded from: commons-net-3.3.jar:org/apache/commons/net/imap/IMAP$IMAPState.class */
    public enum IMAPState {
        DISCONNECTED_STATE,
        NOT_AUTH_STATE,
        AUTH_STATE,
        LOGOUT_STATE
    }

    public IMAP() {
        setDefaultPort(DEFAULT_PORT);
        this.__state = IMAPState.DISCONNECTED_STATE;
        this._reader = null;
        this.__writer = null;
        this._replyLines = new ArrayList();
        createCommandSupport();
    }

    private void __getReply() throws IOException {
        __getReply(true);
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x006b, code lost:
    
        r6 = r4._reader.readLine();
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0074, code lost:
    
        if (r6 != null) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0080, code lost:
    
        throw new java.io.EOFException("Connection closed without indication.");
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0081, code lost:
    
        r4._replyLines.add(r6);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void __getReply(boolean r5) throws java.io.IOException {
        /*
            r4 = this;
            r0 = r4
            java.util.List<java.lang.String> r0 = r0._replyLines
            r0.clear()
            r0 = r4
            java.io.BufferedReader r0 = r0._reader
            java.lang.String r0 = r0.readLine()
            r6 = r0
            r0 = r6
            if (r0 != 0) goto L1f
            java.io.EOFException r0 = new java.io.EOFException
            r1 = r0
            java.lang.String r2 = "Connection closed without indication."
            r1.<init>(r2)
            throw r0
        L1f:
            r0 = r4
            java.util.List<java.lang.String> r0 = r0._replyLines
            r1 = r6
            boolean r0 = r0.add(r1)
            r0 = r5
            if (r0 == 0) goto L9a
        L2e:
            r0 = r6
            boolean r0 = org.apache.commons.net.imap.IMAPReply.isUntagged(r0)
            if (r0 == 0) goto L8f
            r0 = r6
            int r0 = org.apache.commons.net.imap.IMAPReply.literalCount(r0)
            r7 = r0
        L3a:
            r0 = r7
            if (r0 < 0) goto L6b
            r0 = r4
            java.io.BufferedReader r0 = r0._reader
            java.lang.String r0 = r0.readLine()
            r6 = r0
            r0 = r6
            if (r0 != 0) goto L54
            java.io.EOFException r0 = new java.io.EOFException
            r1 = r0
            java.lang.String r2 = "Connection closed without indication."
            r1.<init>(r2)
            throw r0
        L54:
            r0 = r4
            java.util.List<java.lang.String> r0 = r0._replyLines
            r1 = r6
            boolean r0 = r0.add(r1)
            r0 = r7
            r1 = r6
            int r1 = r1.length()
            r2 = 2
            int r1 = r1 + r2
            int r0 = r0 - r1
            r7 = r0
            goto L3a
        L6b:
            r0 = r4
            java.io.BufferedReader r0 = r0._reader
            java.lang.String r0 = r0.readLine()
            r6 = r0
            r0 = r6
            if (r0 != 0) goto L81
            java.io.EOFException r0 = new java.io.EOFException
            r1 = r0
            java.lang.String r2 = "Connection closed without indication."
            r1.<init>(r2)
            throw r0
        L81:
            r0 = r4
            java.util.List<java.lang.String> r0 = r0._replyLines
            r1 = r6
            boolean r0 = r0.add(r1)
            goto L2e
        L8f:
            r0 = r4
            r1 = r6
            int r1 = org.apache.commons.net.imap.IMAPReply.getReplyCode(r1)
            r0._replyCode = r1
            goto La2
        L9a:
            r0 = r4
            r1 = r6
            int r1 = org.apache.commons.net.imap.IMAPReply.getUntaggedReplyCode(r1)
            r0._replyCode = r1
        La2:
            r0 = r4
            r1 = r4
            int r1 = r1._replyCode
            r2 = r4
            java.lang.String r2 = r2.getReplyString()
            r0.fireReplyReceived(r1, r2)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.net.imap.IMAP.__getReply(boolean):void");
    }

    @Override // org.apache.commons.net.SocketClient
    protected void _connectAction_() throws IOException {
        super._connectAction_();
        this._reader = new CRLFLineReader(new InputStreamReader(this._input_, "ISO-8859-1"));
        this.__writer = new BufferedWriter(new OutputStreamWriter(this._output_, "ISO-8859-1"));
        int tmo = getSoTimeout();
        if (tmo <= 0) {
            setSoTimeout(this.connectTimeout);
        }
        __getReply(false);
        if (tmo <= 0) {
            setSoTimeout(tmo);
        }
        setState(IMAPState.NOT_AUTH_STATE);
    }

    protected void setState(IMAPState state) {
        this.__state = state;
    }

    public IMAPState getState() {
        return this.__state;
    }

    @Override // org.apache.commons.net.SocketClient
    public void disconnect() throws IOException {
        super.disconnect();
        this._reader = null;
        this.__writer = null;
        this._replyLines.clear();
        setState(IMAPState.DISCONNECTED_STATE);
    }

    private int sendCommandWithID(String commandID, String command, String args) throws IOException {
        StringBuilder __commandBuffer = new StringBuilder();
        if (commandID != null) {
            __commandBuffer.append(commandID);
            __commandBuffer.append(' ');
        }
        __commandBuffer.append(command);
        if (args != null) {
            __commandBuffer.append(' ');
            __commandBuffer.append(args);
        }
        __commandBuffer.append(SocketClient.NETASCII_EOL);
        String message = __commandBuffer.toString();
        this.__writer.write(message);
        this.__writer.flush();
        fireCommandSent(command, message);
        __getReply();
        return this._replyCode;
    }

    public int sendCommand(String command, String args) throws IOException {
        return sendCommandWithID(generateCommandID(), command, args);
    }

    public int sendCommand(String command) throws IOException {
        return sendCommand(command, (String) null);
    }

    public int sendCommand(IMAPCommand command, String args) throws IOException {
        return sendCommand(command.getIMAPCommand(), args);
    }

    public boolean doCommand(IMAPCommand command, String args) throws IOException {
        return IMAPReply.isSuccess(sendCommand(command, args));
    }

    public int sendCommand(IMAPCommand command) throws IOException {
        return sendCommand(command, (String) null);
    }

    public boolean doCommand(IMAPCommand command) throws IOException {
        return IMAPReply.isSuccess(sendCommand(command));
    }

    public int sendData(String command) throws IOException {
        return sendCommandWithID(null, command, null);
    }

    public String[] getReplyStrings() {
        return (String[]) this._replyLines.toArray(new String[this._replyLines.size()]);
    }

    public String getReplyString() {
        StringBuilder buffer = new StringBuilder(256);
        for (String s : this._replyLines) {
            buffer.append(s);
            buffer.append(SocketClient.NETASCII_EOL);
        }
        return buffer.toString();
    }

    protected String generateCommandID() {
        String res = new String(this._initialID);
        boolean carry = true;
        for (int i = this._initialID.length - 1; carry && i >= 0; i--) {
            if (this._initialID[i] == 'Z') {
                this._initialID[i] = 'A';
            } else {
                char[] cArr = this._initialID;
                int i2 = i;
                cArr[i2] = (char) (cArr[i2] + 1);
                carry = false;
            }
        }
        return res;
    }
}
