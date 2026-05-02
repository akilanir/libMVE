package org.spongycastle.crypto.tls;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;
import org.spongycastle.util.Integers;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/DTLSReliableHandshake.class */
class DTLSReliableHandshake {
    private static final int MAX_RECEIVE_AHEAD = 10;
    private final DTLSRecordLayer recordLayer;
    private Hashtable currentInboundFlight = new Hashtable();
    private Hashtable previousInboundFlight = null;
    private Vector outboundFlight = new Vector();
    private boolean sending = true;
    private int message_seq = 0;
    private int next_receive_seq = 0;
    private TlsHandshakeHash handshakeHash = new DeferredHash();

    DTLSReliableHandshake(TlsContext context, DTLSRecordLayer transport) {
        this.recordLayer = transport;
        this.handshakeHash.init(context);
    }

    void notifyHelloComplete() {
        this.handshakeHash = this.handshakeHash.notifyPRFDetermined();
    }

    TlsHandshakeHash getHandshakeHash() {
        return this.handshakeHash;
    }

    TlsHandshakeHash prepareToFinish() {
        TlsHandshakeHash result = this.handshakeHash;
        this.handshakeHash = this.handshakeHash.stopTracking();
        return result;
    }

    void sendMessage(short msg_type, byte[] body) throws IOException {
        TlsUtils.checkUint24(body.length);
        if (!this.sending) {
            checkInboundFlight();
            this.sending = true;
            this.outboundFlight.removeAllElements();
        }
        int i = this.message_seq;
        this.message_seq = i + 1;
        Message message = new Message(i, msg_type, body);
        this.outboundFlight.addElement(message);
        writeMessage(message);
        updateHandshakeMessagesDigest(message);
    }

    byte[] receiveMessageBody(short msg_type) throws IOException {
        Message message = receiveMessage();
        if (message.getType() != msg_type) {
            throw new TlsFatalAlert((short) 10);
        }
        return message.getBody();
    }

    Message receiveMessage() throws IOException {
        int seq;
        byte[] body;
        byte[] body2;
        if (this.sending) {
            this.sending = false;
            prepareInboundFlight();
        }
        DTLSReassembler next = (DTLSReassembler) this.currentInboundFlight.get(Integers.valueOf(this.next_receive_seq));
        if (next != null && (body2 = next.getBodyIfComplete()) != null) {
            this.previousInboundFlight = null;
            int i = this.next_receive_seq;
            this.next_receive_seq = i + 1;
            return updateHandshakeMessagesDigest(new Message(i, next.getMsgType(), body2));
        }
        byte[] buf = null;
        int i2 = 1000;
        while (true) {
            int readTimeoutMillis = i2;
            int receiveLimit = this.recordLayer.getReceiveLimit();
            if (buf == null || buf.length < receiveLimit) {
                buf = new byte[receiveLimit];
            }
            while (true) {
                try {
                    int received = this.recordLayer.receive(buf, 0, receiveLimit, readTimeoutMillis);
                    if (received < 0) {
                        break;
                    }
                    if (received >= 12) {
                        int fragment_length = TlsUtils.readUint24(buf, 9);
                        if (received == fragment_length + 12 && (seq = TlsUtils.readUint16(buf, 4)) <= this.next_receive_seq + 10) {
                            short msg_type = TlsUtils.readUint8(buf, 0);
                            int length = TlsUtils.readUint24(buf, 1);
                            int fragment_offset = TlsUtils.readUint24(buf, 6);
                            if (fragment_offset + fragment_length <= length) {
                                if (seq < this.next_receive_seq) {
                                    if (this.previousInboundFlight != null) {
                                        DTLSReassembler reassembler = (DTLSReassembler) this.previousInboundFlight.get(Integers.valueOf(seq));
                                        if (reassembler != null) {
                                            reassembler.contributeFragment(msg_type, length, buf, 12, fragment_offset, fragment_length);
                                            if (checkAll(this.previousInboundFlight)) {
                                                resendOutboundFlight();
                                                readTimeoutMillis = Math.min(readTimeoutMillis * 2, 60000);
                                                resetAll(this.previousInboundFlight);
                                            }
                                        }
                                    }
                                } else {
                                    DTLSReassembler reassembler2 = (DTLSReassembler) this.currentInboundFlight.get(Integers.valueOf(seq));
                                    if (reassembler2 == null) {
                                        reassembler2 = new DTLSReassembler(msg_type, length);
                                        this.currentInboundFlight.put(Integers.valueOf(seq), reassembler2);
                                    }
                                    reassembler2.contributeFragment(msg_type, length, buf, 12, fragment_offset, fragment_length);
                                    if (seq == this.next_receive_seq && (body = reassembler2.getBodyIfComplete()) != null) {
                                        this.previousInboundFlight = null;
                                        int i3 = this.next_receive_seq;
                                        this.next_receive_seq = i3 + 1;
                                        return updateHandshakeMessagesDigest(new Message(i3, reassembler2.getMsgType(), body));
                                    }
                                }
                            }
                        }
                    }
                } catch (IOException e) {
                }
            }
            resendOutboundFlight();
            i2 = Math.min(readTimeoutMillis * 2, 60000);
        }
    }

    void finish() {
        DTLSHandshakeRetransmit retransmit = null;
        if (!this.sending) {
            checkInboundFlight();
        } else if (this.currentInboundFlight != null) {
            retransmit = new DTLSHandshakeRetransmit() { // from class: org.spongycastle.crypto.tls.DTLSReliableHandshake.1
                @Override // org.spongycastle.crypto.tls.DTLSHandshakeRetransmit
                public void receivedHandshakeRecord(int epoch, byte[] buf, int off, int len) throws IOException {
                    int seq;
                    DTLSReassembler reassembler;
                    if (len < 12) {
                        return;
                    }
                    int fragment_length = TlsUtils.readUint24(buf, off + 9);
                    if (len != fragment_length + 12 || (seq = TlsUtils.readUint16(buf, off + 4)) >= DTLSReliableHandshake.this.next_receive_seq) {
                        return;
                    }
                    short msg_type = TlsUtils.readUint8(buf, off);
                    int expectedEpoch = msg_type == 20 ? 1 : 0;
                    if (epoch != expectedEpoch) {
                        return;
                    }
                    int length = TlsUtils.readUint24(buf, off + 1);
                    int fragment_offset = TlsUtils.readUint24(buf, off + 6);
                    if (fragment_offset + fragment_length <= length && (reassembler = (DTLSReassembler) DTLSReliableHandshake.this.currentInboundFlight.get(Integers.valueOf(seq))) != null) {
                        reassembler.contributeFragment(msg_type, length, buf, off + 12, fragment_offset, fragment_length);
                        if (DTLSReliableHandshake.checkAll(DTLSReliableHandshake.this.currentInboundFlight)) {
                            DTLSReliableHandshake.this.resendOutboundFlight();
                            DTLSReliableHandshake.resetAll(DTLSReliableHandshake.this.currentInboundFlight);
                        }
                    }
                }
            };
        }
        this.recordLayer.handshakeSuccessful(retransmit);
    }

    void resetHandshakeMessagesDigest() {
        this.handshakeHash.reset();
    }

    /* JADX WARN: Removed duplicated region for block: B:5:0x0011  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void checkInboundFlight() {
        /*
            r3 = this;
            r0 = r3
            java.util.Hashtable r0 = r0.currentInboundFlight
            java.util.Enumeration r0 = r0.keys()
            r4 = r0
        L8:
            r0 = r4
            boolean r0 = r0.hasMoreElements()
            if (r0 == 0) goto L29
            r0 = r4
            java.lang.Object r0 = r0.nextElement()
            java.lang.Integer r0 = (java.lang.Integer) r0
            r5 = r0
            r0 = r5
            int r0 = r0.intValue()
            r1 = r3
            int r1 = r1.next_receive_seq
            if (r0 < r1) goto L26
        L26:
            goto L8
        L29:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: org.spongycastle.crypto.tls.DTLSReliableHandshake.checkInboundFlight():void");
    }

    private void prepareInboundFlight() {
        resetAll(this.currentInboundFlight);
        this.previousInboundFlight = this.currentInboundFlight;
        this.currentInboundFlight = new Hashtable();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void resendOutboundFlight() throws IOException {
        this.recordLayer.resetWriteEpoch();
        for (int i = 0; i < this.outboundFlight.size(); i++) {
            writeMessage((Message) this.outboundFlight.elementAt(i));
        }
    }

    private Message updateHandshakeMessagesDigest(Message message) throws IOException {
        if (message.getType() != 0) {
            byte[] body = message.getBody();
            byte[] buf = new byte[12];
            TlsUtils.writeUint8(message.getType(), buf, 0);
            TlsUtils.writeUint24(body.length, buf, 1);
            TlsUtils.writeUint16(message.getSeq(), buf, 4);
            TlsUtils.writeUint24(0, buf, 6);
            TlsUtils.writeUint24(body.length, buf, 9);
            this.handshakeHash.update(buf, 0, buf.length);
            this.handshakeHash.update(body, 0, body.length);
        }
        return message;
    }

    private void writeMessage(Message message) throws IOException {
        int sendLimit = this.recordLayer.getSendLimit();
        int fragmentLimit = sendLimit - 12;
        if (fragmentLimit < 1) {
            throw new TlsFatalAlert((short) 80);
        }
        int length = message.getBody().length;
        int fragment_offset = 0;
        do {
            int fragment_length = Math.min(length - fragment_offset, fragmentLimit);
            writeHandshakeFragment(message, fragment_offset, fragment_length);
            fragment_offset += fragment_length;
        } while (fragment_offset < length);
    }

    private void writeHandshakeFragment(Message message, int fragment_offset, int fragment_length) throws IOException {
        RecordLayerBuffer fragment = new RecordLayerBuffer(12 + fragment_length);
        TlsUtils.writeUint8(message.getType(), (OutputStream) fragment);
        TlsUtils.writeUint24(message.getBody().length, fragment);
        TlsUtils.writeUint16(message.getSeq(), fragment);
        TlsUtils.writeUint24(fragment_offset, fragment);
        TlsUtils.writeUint24(fragment_length, fragment);
        fragment.write(message.getBody(), fragment_offset, fragment_length);
        fragment.sendToRecordLayer(this.recordLayer);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean checkAll(Hashtable inboundFlight) {
        Enumeration e = inboundFlight.elements();
        while (e.hasMoreElements()) {
            if (((DTLSReassembler) e.nextElement()).getBodyIfComplete() == null) {
                return false;
            }
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void resetAll(Hashtable inboundFlight) {
        Enumeration e = inboundFlight.elements();
        while (e.hasMoreElements()) {
            ((DTLSReassembler) e.nextElement()).reset();
        }
    }

    /* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/DTLSReliableHandshake$Message.class */
    static class Message {
        private final int message_seq;
        private final short msg_type;
        private final byte[] body;

        private Message(int message_seq, short msg_type, byte[] body) {
            this.message_seq = message_seq;
            this.msg_type = msg_type;
            this.body = body;
        }

        public int getSeq() {
            return this.message_seq;
        }

        public short getType() {
            return this.msg_type;
        }

        public byte[] getBody() {
            return this.body;
        }
    }

    /* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/DTLSReliableHandshake$RecordLayerBuffer.class */
    static class RecordLayerBuffer extends ByteArrayOutputStream {
        RecordLayerBuffer(int size) {
            super(size);
        }

        void sendToRecordLayer(DTLSRecordLayer recordLayer) throws IOException {
            recordLayer.send(this.buf, 0, this.count);
            this.buf = null;
        }
    }
}
