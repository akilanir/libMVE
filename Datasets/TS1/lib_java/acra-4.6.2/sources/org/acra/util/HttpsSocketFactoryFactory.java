package org.acra.util;

import android.content.Context;
import org.apache.http.conn.scheme.SocketFactory;

/* loaded from: acra-4.6.2.jar:org/acra/util/HttpsSocketFactoryFactory.class */
public interface HttpsSocketFactoryFactory {
    SocketFactory create(Context context);
}
