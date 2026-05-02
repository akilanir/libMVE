package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/RequestSubsystem.class */
public class RequestSubsystem extends Request {
    private String subsystem = null;

    public void request(Session session, Channel channel, String subsystem, boolean want_reply) throws Exception {
        setReply(want_reply);
        this.subsystem = subsystem;
        request(session, channel);
    }

    @Override // com.jcraft.jsch.Request
    public void request(Session session, Channel channel) throws Exception {
        super.request(session, channel);
        Buffer buf = new Buffer();
        Packet packet = new Packet(buf);
        packet.reset();
        buf.putByte((byte) 98);
        buf.putInt(channel.getRecipient());
        buf.putString(Util.str2byte("subsystem"));
        buf.putByte((byte) (waitForReply() ? 1 : 0));
        buf.putString(Util.str2byte(this.subsystem));
        write(packet);
    }
}
