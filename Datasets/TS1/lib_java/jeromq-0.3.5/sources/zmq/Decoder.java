package zmq;

import java.nio.ByteBuffer;

/* loaded from: jeromq-0.3.5.jar:zmq/Decoder.class */
public class Decoder extends DecoderBase {
    private static final int ONE_BYTE_SIZE_READY = 0;
    private static final int EIGHT_BYTE_SIZE_READY = 1;
    private static final int FLAGS_READY = 2;
    private static final int MESSAGE_READY = 3;
    private final byte[] tmpbuf;
    private Msg inProgress;
    private final long maxmsgsize;
    private IMsgSink msgSink;

    public Decoder(int bufsize, long maxmsgsize) {
        super(bufsize);
        this.maxmsgsize = maxmsgsize;
        this.tmpbuf = new byte[8];
        nextStep(this.tmpbuf, 1, 0);
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
        byte first = this.tmpbuf[0];
        if (first == -1) {
            nextStep(this.tmpbuf, 8, 1);
            return true;
        }
        if (first == 0) {
            decodingError();
            return false;
        }
        int size = first;
        if (size < 0) {
            size = 255 & first;
        }
        if (this.maxmsgsize >= 0 && size - 1 > this.maxmsgsize) {
            decodingError();
            return false;
        }
        this.inProgress = new Msg(size - 1);
        nextStep(this.tmpbuf, 1, 2);
        return true;
    }

    private boolean eightByteSizeReady() {
        long payloadLength = ByteBuffer.wrap(this.tmpbuf).getLong();
        if (payloadLength <= 0) {
            decodingError();
            return false;
        }
        if (this.maxmsgsize >= 0 && payloadLength - 1 > this.maxmsgsize) {
            decodingError();
            return false;
        }
        if (payloadLength - 1 > 2147483647L) {
            decodingError();
            return false;
        }
        int msgSize = (int) (payloadLength - 1);
        this.inProgress = new Msg(msgSize);
        nextStep(this.tmpbuf, 1, 2);
        return true;
    }

    private boolean flagsReady() {
        this.inProgress.setFlags(this.tmpbuf[0] & 1);
        nextStep(this.inProgress, 3);
        return true;
    }

    private boolean messageReady() {
        if (this.msgSink == null) {
            return false;
        }
        int rc = this.msgSink.pushMsg(this.inProgress);
        if (rc != 0) {
            return false;
        }
        nextStep(this.tmpbuf, 1, 0);
        return true;
    }
}
