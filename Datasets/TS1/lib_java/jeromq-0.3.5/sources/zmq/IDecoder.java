package zmq;

import java.nio.ByteBuffer;

/* loaded from: jeromq-0.3.5.jar:zmq/IDecoder.class */
public interface IDecoder {
    void setMsgSink(IMsgSink iMsgSink);

    ByteBuffer getBuffer();

    int processBuffer(ByteBuffer byteBuffer, int i);

    boolean stalled();
}
