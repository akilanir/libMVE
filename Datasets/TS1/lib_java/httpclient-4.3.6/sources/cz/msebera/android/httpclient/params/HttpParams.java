package cz.msebera.android.httpclient.params;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/params/HttpParams.class */
public interface HttpParams {
    Object getParameter(String str);

    HttpParams setParameter(String str, Object obj);

    HttpParams copy();

    boolean removeParameter(String str);

    long getLongParameter(String str, long j);

    HttpParams setLongParameter(String str, long j);

    int getIntParameter(String str, int i);

    HttpParams setIntParameter(String str, int i);

    double getDoubleParameter(String str, double d);

    HttpParams setDoubleParameter(String str, double d);

    boolean getBooleanParameter(String str, boolean z);

    HttpParams setBooleanParameter(String str, boolean z);

    boolean isParameterTrue(String str);

    boolean isParameterFalse(String str);
}
