package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/RequestAgentForwarding.class */
class RequestAgentForwarding extends Request {
    RequestAgentForwarding() {
    }

    @Override // com.jcraft.jsch.Request
    public void request(Session session, Channel channel) throws Exception {
        super.request(session, channel);
        setReply(false);
        Buffer buf = new Buffer();
        Packet packet = new Packet(buf);
        packet.reset();
        buf.putByte((byte) 98);
        buf.putInt(channel.getRecipient());
        buf.putString(Util.str2byte("auth-agent-req@openssh.com"));
        buf.putByte((byte) (waitForReply() ? 1 : 0));
        write(packet);
        session.agent_forwarding = true;
    }
}
