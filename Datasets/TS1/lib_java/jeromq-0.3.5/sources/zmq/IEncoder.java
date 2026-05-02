package zmq;

import java.nio.ByteBuffer;

/* loaded from: jeromq-0.3.5.jar:zmq/IEncoder.class */
public interface IEncoder {
    void setMsgSource(IMsgSource iMsgSource);

    Transfer getData(ByteBuffer byteBuffer);

    boolean hasData();
}
