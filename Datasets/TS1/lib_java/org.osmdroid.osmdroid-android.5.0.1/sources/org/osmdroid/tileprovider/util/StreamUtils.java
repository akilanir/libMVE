package org.osmdroid.tileprovider.util;

import android.util.Log;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.osmdroid.api.IMapView;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/util/StreamUtils.class */
public class StreamUtils {
    public static final int IO_BUFFER_SIZE = 8192;

    private StreamUtils() {
    }

    public static long copy(InputStream in, OutputStream out) throws IOException {
        long length = 0;
        byte[] b = new byte[IO_BUFFER_SIZE];
        while (true) {
            int read = in.read(b);
            if (read != -1) {
                out.write(b, 0, read);
                length += read;
            } else {
                return length;
            }
        }
    }

    public static void closeStream(Closeable stream) {
        if (stream != null) {
            try {
                stream.close();
            } catch (IOException e) {
                Log.e(IMapView.LOGTAG, "Could not close stream", e);
            }
        }
    }
}
