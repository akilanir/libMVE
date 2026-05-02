package cz.msebera.android.httpclient.conn.scheme;

import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/scheme/LayeredSchemeSocketFactory.class */
public interface LayeredSchemeSocketFactory extends SchemeSocketFactory {
    Socket createLayeredSocket(Socket socket, String str, int i, boolean z) throws IOException, UnknownHostException;
}
