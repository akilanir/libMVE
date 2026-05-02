package cz.msebera.android.httpclient.message;

import cz.msebera.android.httpclient.ProtocolVersion;
import cz.msebera.android.httpclient.StatusLine;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.CharArrayBuffer;
import java.io.Serializable;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/message/BasicStatusLine.class */
public class BasicStatusLine implements StatusLine, Cloneable, Serializable {
    private static final long serialVersionUID = -2443303766890459269L;
    private final ProtocolVersion protoVersion;
    private final int statusCode;
    private final String reasonPhrase;

    public BasicStatusLine(ProtocolVersion version, int statusCode, String reasonPhrase) {
        this.protoVersion = (ProtocolVersion) Args.notNull(version, "Version");
        this.statusCode = Args.notNegative(statusCode, "Status code");
        this.reasonPhrase = reasonPhrase;
    }

    @Override // cz.msebera.android.httpclient.StatusLine
    public int getStatusCode() {
        return this.statusCode;
    }

    @Override // cz.msebera.android.httpclient.StatusLine
    public ProtocolVersion getProtocolVersion() {
        return this.protoVersion;
    }

    @Override // cz.msebera.android.httpclient.StatusLine
    public String getReasonPhrase() {
        return this.reasonPhrase;
    }

    public String toString() {
        return BasicLineFormatter.INSTANCE.formatStatusLine((CharArrayBuffer) null, this).toString();
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
