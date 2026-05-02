package zmq;

import java.nio.ByteBuffer;

/* loaded from: jeromq-0.3.5.jar:zmq/V1Decoder.class */
public class V1Decoder extends DecoderBase {
    private static final int ONE_BYTE_SIZE_READY = 0;
    private static final int EIGHT_BYTE_SIZE_READY = 1;
    private static final int FLAGS_READY = 2;
    private static final int MESSAGE_READY = 3;
    private final byte[] tmpbuf;
    private Msg inProgress;
    private IMsgSink msgSink;
    private final long maxmsgsize;
    private int msgFlags;

    public V1Decoder(int bufsize, long maxmsgsize, IMsgSink session) {
        super(bufsize);
        this.maxmsgsize = maxmsgsize;
        this.msgSink = session;
        this.tmpbuf = new byte[8];
        nextStep(this.tmpbuf, 1, 2);
    }

    @Override // zmq.IDecoder
    public void setMsgSink(IMsgSink msgSink) {
        this.msgSink = msgSink;
    }

    @Override // zmq.DecoderBase
    protected boolean next() {
        switch (state()) {
            case 0:
                return oneByteSizeReady();
            case 1:
                return eightByteSizeReady();
            case 2:
                return flagsReady();
            case 3:
                return messageReady();
            default:
                return false;
        }
    }

    private boolean oneByteSizeReady() {
        int size = this.tmpbuf[0];
        if (size < 0) {
            size = 255 & size;
        }
        if (this.maxmsgsize >= 0 && size > this.maxmsgsize) {
            decodingError();
            return false;
        }
        this.inProgress = new Msg(size);
        this.inProgress.setFlags(this.msgFlags);
        nextStep(this.inProgress.data(), this.inProgress.size(), 3);
        return true;
    }

    private boolean eightByteSizeReady() {
        long msgSize = ByteBuffer.wrap(this.tmpbuf).getLong();
        if (this.maxmsgsize >= 0 && msgSize > this.maxmsgsize) {
            decodingError();
            return false;
        }
        if (msgSize > 2147483647L) {
            decodingError();
            return false;
        }
        this.inProgress = new Msg((int) msgSize);
        this.inProgress.setFlags(this.msgFlags);
        nextStep(this.inProgress.data(), this.inProgress.size(), 3);
        return true;
    }

    private boolean flagsReady() {
        this.msgFlags = 0;
        byte b = this.tmpbuf[0];
        if ((b & 1) > 0) {
            this.msgFlags |= 1;
        }
        if ((b & 2) > 0) {
            nextStep(this.tmpbuf, 8, 1);
            return true;
        }
        nextStep(this.tmpbuf, 1, 0);
        return true;
    }

    private boolean messageReady() {
        if (this.msgSink == null) {
            return false;
        }
        int rc = this.msgSink.pushMsg(this.inProgress);
        if (rc != 0) {
            if (rc != 35) {
                decodingError();
                return false;
            }
            return false;
        }
        nextStep(this.tmpbuf, 1, 2);
        return true;
    }
}
