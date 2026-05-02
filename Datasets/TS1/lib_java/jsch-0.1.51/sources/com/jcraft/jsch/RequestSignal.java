package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/RequestSignal.class */
class RequestSignal extends Request {
    private String signal = "KILL";

    RequestSignal() {
    }

    public void setSignal(String foo) {
        this.signal = foo;
    }

    @Override // com.jcraft.jsch.Request
    public void request(Session session, Channel channel) throws Exception {
        super.request(session, channel);
        Buffer buf = new Buffer();
        Packet packet = new Packet(buf);
        packet.reset();
        buf.putByte((byte) 98);
        buf.putInt(channel.getRecipient());
        buf.putString(Util.str2byte("signal"));
        buf.putByte((byte) (waitForReply() ? 1 : 0));
        buf.putString(Util.str2byte(this.signal));
        write(packet);
    }
}
