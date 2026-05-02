package com.jcraft.jsch;

import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/ForwardedTCPIPDaemon.class */
public interface ForwardedTCPIPDaemon extends Runnable {
    void setChannel(ChannelForwardedTCPIP channelForwardedTCPIP, InputStream inputStream, OutputStream outputStream);

    void setArg(Object[] objArr);
}
