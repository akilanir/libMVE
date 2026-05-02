package okhttp3;

import java.io.IOException;

/* loaded from: okhttp-3.2.0.jar:okhttp3/Call.class */
public interface Call {

    /* loaded from: okhttp-3.2.0.jar:okhttp3/Call$Factory.class */
    public interface Factory {
        Call newCall(Request request);
    }

    Request request();

    Response execute() throws IOException;

    void enqueue(Callback callback);

    void cancel();

    boolean isExecuted();

    boolean isCanceled();
}
