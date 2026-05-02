package uk.co.senab.photoview.log;

/* loaded from: com.github.chrisbanes.PhotoView.1.2.6.jar:uk/co/senab/photoview/log/Logger.class */
public interface Logger {
    int v(String str, String str2);

    int v(String str, String str2, Throwable th);

    int d(String str, String str2);

    int d(String str, String str2, Throwable th);

    int i(String str, String str2);

    int i(String str, String str2, Throwable th);

    int w(String str, String str2);

    int w(String str, String str2, Throwable th);

    int e(String str, String str2);

    int e(String str, String str2, Throwable th);
}
