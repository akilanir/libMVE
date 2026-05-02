package ch.qos.logback.core.recovery;

import ch.qos.logback.core.net.SyslogOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.SocketException;
import java.net.UnknownHostException;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/recovery/ResilientSyslogOutputStream.class */
public class ResilientSyslogOutputStream extends ResilientOutputStreamBase {
    String syslogHost;
    int port;

    public ResilientSyslogOutputStream(String str, int i) throws UnknownHostException, SocketException {
        this.syslogHost = str;
        this.port = i;
        this.os = new SyslogOutputStream(str, i);
        this.presumedClean = true;
    }

    @Override // ch.qos.logback.core.recovery.ResilientOutputStreamBase
    String getDescription() {
        return "syslog [" + this.syslogHost + ":" + this.port + "]";
    }

    @Override // ch.qos.logback.core.recovery.ResilientOutputStreamBase
    OutputStream openNewOutputStream() throws IOException {
        return new SyslogOutputStream(this.syslogHost, this.port);
    }

    public String toString() {
        return "c.q.l.c.recovery.ResilientSyslogOutputStream@" + System.identityHashCode(this);
    }
}
