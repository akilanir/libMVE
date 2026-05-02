package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/RequestExec.class */
class RequestExec extends Request {
    private byte[] command;

    RequestExec(byte[] command) {
        this.command = new byte[0];
        this.command = command;
    }

    @Override // com.jcraft.jsch.Request
    public void request(Session session, Channel channel) throws Exception {
        super.request(session, channel);
        Buffer buf = new Buffer();
        Packet packet = new Packet(buf);
        packet.reset();
        buf.putByte((byte) 98);
        buf.putInt(channel.getRecipient());
        buf.putString(Util.str2byte("exec"));
        buf.putByte((byte) (waitForReply() ? 1 : 0));
        buf.checkFreeSize(4 + this.command.length);
        buf.putString(this.command);
        write(packet);
    }
}
