package okhttp3;

import java.io.IOException;

/* loaded from: okhttp-3.1.2.jar:okhttp3/Callback.class */
public interface Callback {
    void onFailure(Call call, IOException iOException);

    void onResponse(Call call, Response response) throws IOException;
}
