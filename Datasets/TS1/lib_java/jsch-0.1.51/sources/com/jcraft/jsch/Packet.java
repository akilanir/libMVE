package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/Packet.class */
public class Packet {
    private static Random random = null;
    Buffer buffer;
    byte[] ba4 = new byte[4];

    static void setRandom(Random foo) {
        random = foo;
    }

    public Packet(Buffer buffer) {
        this.buffer = buffer;
    }

    public void reset() {
        this.buffer.index = 5;
    }

    void padding(int bsize) {
        int len = this.buffer.index;
        int pad = (-len) & (bsize - 1);
        if (pad < bsize) {
            pad += bsize;
        }
        int len2 = (len + pad) - 4;
        this.ba4[0] = (byte) (len2 >>> 24);
        this.ba4[1] = (byte) (len2 >>> 16);
        this.ba4[2] = (byte) (len2 >>> 8);
        this.ba4[3] = (byte) len2;
        System.arraycopy(this.ba4, 0, this.buffer.buffer, 0, 4);
        this.buffer.buffer[4] = (byte) pad;
        synchronized (random) {
            random.fill(this.buffer.buffer, this.buffer.index, pad);
        }
        this.buffer.skip(pad);
    }

    int shift(int len, int bsize, int mac) {
        int s = len + 5 + 9;
        int pad = (-s) & (bsize - 1);
        if (pad < bsize) {
            pad += bsize;
        }
        int s2 = s + pad + mac + 32;
        if (this.buffer.buffer.length < (((s2 + this.buffer.index) - 5) - 9) - len) {
            byte[] foo = new byte[(((s2 + this.buffer.index) - 5) - 9) - len];
            System.arraycopy(this.buffer.buffer, 0, foo, 0, this.buffer.buffer.length);
            this.buffer.buffer = foo;
        }
        System.arraycopy(this.buffer.buffer, len + 5 + 9, this.buffer.buffer, s2, ((this.buffer.index - 5) - 9) - len);
        this.buffer.index = 10;
        this.buffer.putInt(len);
        this.buffer.index = len + 5 + 9;
        return s2;
    }

    void unshift(byte command, int recipient, int s, int len) {
        System.arraycopy(this.buffer.buffer, s, this.buffer.buffer, 14, len);
        this.buffer.buffer[5] = command;
        this.buffer.index = 6;
        this.buffer.putInt(recipient);
        this.buffer.putInt(len);
        this.buffer.index = len + 5 + 9;
    }

    Buffer getBuffer() {
        return this.buffer;
    }
}
