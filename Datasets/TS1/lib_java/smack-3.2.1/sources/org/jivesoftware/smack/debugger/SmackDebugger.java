package org.jivesoftware.smack.debugger;

import java.io.Reader;
import java.io.Writer;
import org.jivesoftware.smack.PacketListener;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/debugger/SmackDebugger.class */
public interface SmackDebugger {
    void userHasLogged(String str);

    Reader getReader();

    Writer getWriter();

    Reader newConnectionReader(Reader reader);

    Writer newConnectionWriter(Writer writer);

    PacketListener getReaderListener();

    PacketListener getWriterListener();
}
