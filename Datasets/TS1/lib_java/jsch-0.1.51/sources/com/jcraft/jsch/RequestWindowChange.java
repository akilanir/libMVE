package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/RequestWindowChange.class */
class RequestWindowChange extends Request {
    int width_columns = 80;
    int height_rows = 24;
    int width_pixels = 640;
    int height_pixels = 480;

    RequestWindowChange() {
    }

    void setSize(int col, int row, int wp, int hp) {
        this.width_columns = col;
        this.height_rows = row;
        this.width_pixels = wp;
        this.height_pixels = hp;
    }

    @Override // com.jcraft.jsch.Request
    public void request(Session session, Channel channel) throws Exception {
        super.request(session, channel);
        Buffer buf = new Buffer();
        Packet packet = new Packet(buf);
        packet.reset();
        buf.putByte((byte) 98);
        buf.putInt(channel.getRecipient());
        buf.putString(Util.str2byte("window-change"));
        buf.putByte((byte) (waitForReply() ? 1 : 0));
        buf.putInt(this.width_columns);
        buf.putInt(this.height_rows);
        buf.putInt(this.width_pixels);
        buf.putInt(this.height_pixels);
        write(packet);
    }
}
