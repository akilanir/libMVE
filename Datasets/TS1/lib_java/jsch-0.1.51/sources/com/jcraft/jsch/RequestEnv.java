package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/RequestEnv.class */
class RequestEnv extends Request {
    byte[] name = new byte[0];
    byte[] value = new byte[0];

    RequestEnv() {
    }

    void setEnv(byte[] name, byte[] value) {
        this.name = name;
        this.value = value;
    }

    @Override // com.jcraft.jsch.Request
    public void request(Session session, Channel channel) throws Exception {
        super.request(session, channel);
        Buffer buf = new Buffer();
        Packet packet = new Packet(buf);
        packet.reset();
        buf.putByte((byte) 98);
        buf.putInt(channel.getRecipient());
        buf.putString(Util.str2byte("env"));
        buf.putByte((byte) (waitForReply() ? 1 : 0));
        buf.putString(this.name);
        buf.putString(this.value);
        write(packet);
    }
}
