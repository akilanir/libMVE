package zmq;

import java.nio.ByteBuffer;

/* loaded from: jeromq-0.3.5.jar:zmq/Encoder.class */
public class Encoder extends EncoderBase {
    private static final int SIZE_READY = 0;
    private static final int MESSAGE_READY = 1;
    private Msg inProgress;
    private final byte[] tmpbuf;
    private IMsgSource msgSource;

    public Encoder(int bufsize) {
        super(bufsize);
        this.tmpbuf = new byte[10];
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
        int size = this.inProgress.size() + 1;
        if (size < 255) {
            this.tmpbuf[0] = (byte) size;
            this.tmpbuf[1] = (byte) (this.inProgress.flags() & 1);
            nextStep(this.tmpbuf, 2, 0, false);
            return true;
        }
        ByteBuffer b = ByteBuffer.wrap(this.tmpbuf);
        b.put((byte) -1);
        b.putLong(size);
        b.put((byte) (this.inProgress.flags() & 1));
        nextStep(this.tmpbuf, 10, 0, false);
        return true;
    }
}
