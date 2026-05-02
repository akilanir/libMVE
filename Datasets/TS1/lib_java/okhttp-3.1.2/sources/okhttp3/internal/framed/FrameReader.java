package okhttp3.internal.framed;

import java.io.Closeable;
import java.io.IOException;
import java.util.List;
import okio.BufferedSource;
import okio.ByteString;

/* loaded from: okhttp-3.1.2.jar:okhttp3/internal/framed/FrameReader.class */
public interface FrameReader extends Closeable {

    /* loaded from: okhttp-3.1.2.jar:okhttp3/internal/framed/FrameReader$Handler.class */
    public interface Handler {
        void data(boolean z, int i, BufferedSource bufferedSource, int i2) throws IOException;

        void headers(boolean z, boolean z2, int i, int i2, List<Header> list, HeadersMode headersMode);

        void rstStream(int i, ErrorCode errorCode);

        void settings(boolean z, Settings settings);

        void ackSettings();

        void ping(boolean z, int i, int i2);

        void goAway(int i, ErrorCode errorCode, ByteString byteString);

        void windowUpdate(int i, long j);

        void priority(int i, int i2, int i3, boolean z);

        void pushPromise(int i, int i2, List<Header> list) throws IOException;

        void alternateService(int i, String str, ByteString byteString, String str2, int i2, long j);
    }

    void readConnectionPreface() throws IOException;

    boolean nextFrame(Handler handler) throws IOException;
}
