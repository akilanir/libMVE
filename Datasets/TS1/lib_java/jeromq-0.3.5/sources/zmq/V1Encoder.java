package zmq;

import java.nio.ByteBuffer;

/* loaded from: jeromq-0.3.5.jar:zmq/V1Encoder.class */
public class V1Encoder extends EncoderBase {
    private static final int SIZE_READY = 0;
    private static final int MESSAGE_READY = 1;
    private Msg inProgress;
    private final byte[] tmpbuf;
    private IMsgSource msgSource;

    public V1Encoder(int bufsize, IMsgSource session) {
        super(bufsize);
        this.tmpbuf = new byte[9];
        this.msgSource = session;
        nextStep((byte[]) null, 0, 1, true);
    }

    @Override // zmq.IEncoder
    public void setMsgSource(IMsgSource msgSource) {
        this.msgSource = msgSource;
    }

    @Override // zmq.EncoderBase
    protected boolean next() {
        switch (state()) {
            case 0:
                return sizeReady();
            case 1:
                return messageReady();
            default:
                return false;
        }
    }

    private boolean sizeReady() {
        nextStep(this.inProgress.data(), this.inProgress.size(), 1, !this.inProgress.hasMore());
        return true;
    }

    private boolean messageReady() {
        if (this.msgSource == null) {
            return false;
        }
        this.inProgress = this.msgSource.pullMsg();
        if (this.inProgress == null) {
            return false;
        }
        int protocolFlags = 0;
        if (this.inProgress.hasMore()) {
            protocolFlags = 0 | 1;
        }
        if (this.inProgress.size() > 255) {
            protocolFlags |= 2;
        }
        this.tmpbuf[0] = (byte) protocolFlags;
        int size = this.inProgress.size();
        if (size > 255) {
            ByteBuffer b = ByteBuffer.wrap(this.tmpbuf);
            b.position(1);
            b.putLong(size);
            nextStep(this.tmpbuf, 9, 0, false);
            return true;
        }
        this.tmpbuf[1] = (byte) size;
        nextStep(this.tmpbuf, 2, 0, false);
        return true;
    }
}
