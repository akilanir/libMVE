package com.jcraft.jsch;

import java.io.IOException;
import java.util.Vector;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/ChannelAgentForwarding.class */
class ChannelAgentForwarding extends Channel {
    private static final int LOCAL_WINDOW_SIZE_MAX = 131072;
    private static final int LOCAL_MAXIMUM_PACKET_SIZE = 16384;
    private Buffer rbuf;
    private Buffer mbuf;
    private final byte SSH_AGENTC_REQUEST_RSA_IDENTITIES = 1;
    private final byte SSH_AGENT_RSA_IDENTITIES_ANSWER = 2;
    private final byte SSH_AGENTC_RSA_CHALLENGE = 3;
    private final byte SSH_AGENT_RSA_RESPONSE = 4;
    private final byte SSH_AGENT_FAILURE = 5;
    private final byte SSH_AGENT_SUCCESS = 6;
    private final byte SSH_AGENTC_ADD_RSA_IDENTITY = 7;
    private final byte SSH_AGENTC_REMOVE_RSA_IDENTITY = 8;
    private final byte SSH_AGENTC_REMOVE_ALL_RSA_IDENTITIES = 9;
    private final byte SSH2_AGENTC_REQUEST_IDENTITIES = 11;
    private final byte SSH2_AGENT_IDENTITIES_ANSWER = 12;
    private final byte SSH2_AGENTC_SIGN_REQUEST = 13;
    private final byte SSH2_AGENT_SIGN_RESPONSE = 14;
    private final byte SSH2_AGENTC_ADD_IDENTITY = 17;
    private final byte SSH2_AGENTC_REMOVE_IDENTITY = 18;
    private final byte SSH2_AGENTC_REMOVE_ALL_IDENTITIES = 19;
    private final byte SSH2_AGENT_FAILURE = 30;
    boolean init = true;
    private Buffer wbuf = null;
    private Packet packet = null;

    ChannelAgentForwarding() {
        this.rbuf = null;
        this.mbuf = null;
        setLocalWindowSizeMax(LOCAL_WINDOW_SIZE_MAX);
        setLocalWindowSize(LOCAL_WINDOW_SIZE_MAX);
        setLocalPacketSize(LOCAL_MAXIMUM_PACKET_SIZE);
        this.type = Util.str2byte("auth-agent@openssh.com");
        this.rbuf = new Buffer();
        this.rbuf.reset();
        this.mbuf = new Buffer();
        this.connected = true;
    }

    @Override // com.jcraft.jsch.Channel, java.lang.Runnable
    public void run() {
        try {
            sendOpenConfirmation();
        } catch (Exception e) {
            this.close = true;
            disconnect();
        }
    }

    @Override // com.jcraft.jsch.Channel
    void write(byte[] foo, int s, int l) throws IOException {
        String _passphrase;
        if (this.packet == null) {
            this.wbuf = new Buffer(this.rmpsize);
            this.packet = new Packet(this.wbuf);
        }
        this.rbuf.shift();
        if (this.rbuf.buffer.length < this.rbuf.index + l) {
            byte[] newbuf = new byte[this.rbuf.s + l];
            System.arraycopy(this.rbuf.buffer, 0, newbuf, 0, this.rbuf.buffer.length);
            this.rbuf.buffer = newbuf;
        }
        this.rbuf.putByte(foo, s, l);
        int mlen = this.rbuf.getInt();
        if (mlen > this.rbuf.getLength()) {
            this.rbuf.s -= 4;
            return;
        }
        int typ = this.rbuf.getByte();
        try {
            Session _session = getSession();
            IdentityRepository irepo = _session.getIdentityRepository();
            UserInfo userinfo = _session.getUserInfo();
            this.mbuf.reset();
            if (typ == 11) {
                this.mbuf.putByte((byte) 12);
                Vector identities = irepo.getIdentities();
                synchronized (identities) {
                    int count = 0;
                    for (int i = 0; i < identities.size(); i++) {
                        Identity identity = (Identity) identities.elementAt(i);
                        if (identity.getPublicKeyBlob() != null) {
                            count++;
                        }
                    }
                    this.mbuf.putInt(count);
                    for (int i2 = 0; i2 < identities.size(); i2++) {
                        Identity identity2 = (Identity) identities.elementAt(i2);
                        byte[] pubkeyblob = identity2.getPublicKeyBlob();
                        if (pubkeyblob != null) {
                            this.mbuf.putString(pubkeyblob);
                            this.mbuf.putString(Util.empty);
                        }
                    }
                }
            } else if (typ == 1) {
                this.mbuf.putByte((byte) 2);
                this.mbuf.putInt(0);
            } else if (typ == 13) {
                byte[] blob = this.rbuf.getString();
                byte[] data = this.rbuf.getString();
                this.rbuf.getInt();
                Vector identities2 = irepo.getIdentities();
                Identity identity3 = null;
                synchronized (identities2) {
                    int i3 = 0;
                    while (true) {
                        if (i3 >= identities2.size()) {
                            break;
                        }
                        Identity _identity = (Identity) identities2.elementAt(i3);
                        if (_identity.getPublicKeyBlob() != null && Util.array_equals(blob, _identity.getPublicKeyBlob())) {
                            if (_identity.isEncrypted()) {
                                if (userinfo != null) {
                                    while (_identity.isEncrypted() && userinfo.promptPassphrase("Passphrase for " + _identity.getName()) && (_passphrase = userinfo.getPassphrase()) != null) {
                                        byte[] passphrase = Util.str2byte(_passphrase);
                                        try {
                                            if (_identity.setPassphrase(passphrase)) {
                                                break;
                                            }
                                        } catch (JSchException e) {
                                        }
                                    }
                                }
                            }
                            if (!_identity.isEncrypted()) {
                                identity3 = _identity;
                                break;
                            }
                        }
                        i3++;
                    }
                }
                byte[] signature = null;
                if (identity3 != null) {
                    signature = identity3.getSignature(data);
                }
                if (signature == null) {
                    this.mbuf.putByte((byte) 30);
                } else {
                    this.mbuf.putByte((byte) 14);
                    this.mbuf.putString(signature);
                }
            } else if (typ == 18) {
                byte[] blob2 = this.rbuf.getString();
                irepo.remove(blob2);
                this.mbuf.putByte((byte) 6);
            } else if (typ == 9) {
                this.mbuf.putByte((byte) 6);
            } else if (typ == 19) {
                irepo.removeAll();
                this.mbuf.putByte((byte) 6);
            } else if (typ == 17) {
                int fooo = this.rbuf.getLength();
                byte[] tmp = new byte[fooo];
                this.rbuf.getByte(tmp);
                boolean result = irepo.add(tmp);
                this.mbuf.putByte(result ? (byte) 6 : (byte) 5);
            } else {
                this.rbuf.skip(this.rbuf.getLength() - 1);
                this.mbuf.putByte((byte) 5);
            }
            byte[] response = new byte[this.mbuf.getLength()];
            this.mbuf.getByte(response);
            send(response);
        } catch (JSchException e2) {
            throw new IOException(e2.toString());
        }
    }

    private void send(byte[] message) {
        this.packet.reset();
        this.wbuf.putByte((byte) 94);
        this.wbuf.putInt(this.recipient);
        this.wbuf.putInt(4 + message.length);
        this.wbuf.putString(message);
        try {
            getSession().write(this.packet, this, 4 + message.length);
        } catch (Exception e) {
        }
    }

    @Override // com.jcraft.jsch.Channel
    void eof_remote() {
        super.eof_remote();
        eof();
    }
}
