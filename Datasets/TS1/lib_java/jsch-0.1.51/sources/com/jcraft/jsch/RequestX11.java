package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/RequestX11.class */
class RequestX11 extends Request {
    RequestX11() {
    }

    public void setCookie(String cookie) {
        ChannelX11.cookie = Util.str2byte(cookie);
    }

    @Override // com.jcraft.jsch.Request
    public void request(Session session, Channel channel) throws Exception {
        super.request(session, channel);
        Buffer buf = new Buffer();
        Packet packet = new Packet(buf);
        packet.reset();
        buf.putByte((byte) 98);
        buf.putInt(channel.getRecipient());
        buf.putString(Util.str2byte("x11-req"));
        buf.putByte((byte) (waitForReply() ? 1 : 0));
        buf.putByte((byte) 0);
        buf.putString(Util.str2byte("MIT-MAGIC-COOKIE-1"));
        buf.putString(ChannelX11.getFakedCookie(session));
        buf.putInt(0);
        write(packet);
        session.x11_forwarding = true;
    }
}
