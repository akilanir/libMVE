package org.jivesoftware.smack.debugger;

import java.io.Reader;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionListener;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.util.ObservableReader;
import org.jivesoftware.smack.util.ObservableWriter;
import org.jivesoftware.smack.util.ReaderListener;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smack.util.WriterListener;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/debugger/ConsoleDebugger.class */
public class ConsoleDebugger implements SmackDebugger {
    public static boolean printInterpreted = false;
    private Connection connection;
    private Writer writer;
    private Reader reader;
    private ReaderListener readerListener;
    private WriterListener writerListener;
    private SimpleDateFormat dateFormatter = new SimpleDateFormat("hh:mm:ss aaa");
    private PacketListener listener = null;
    private ConnectionListener connListener = null;

    public ConsoleDebugger(Connection connection, Writer writer, Reader reader) {
        this.connection = null;
        this.connection = connection;
        this.writer = writer;
        this.reader = reader;
        createDebug();
    }

    private void createDebug() {
        ObservableReader debugReader = new ObservableReader(this.reader);
        this.readerListener = new ReaderListener() { // from class: org.jivesoftware.smack.debugger.ConsoleDebugger.1
            @Override // org.jivesoftware.smack.util.ReaderListener
            public void read(String str) {
                System.out.println(ConsoleDebugger.this.dateFormatter.format(new Date()) + " RCV  (" + ConsoleDebugger.this.connection.hashCode() + "): " + str);
            }
        };
        debugReader.addReaderListener(this.readerListener);
        ObservableWriter debugWriter = new ObservableWriter(this.writer);
        this.writerListener = new WriterListener() { // from class: org.jivesoftware.smack.debugger.ConsoleDebugger.2
            @Override // org.jivesoftware.smack.util.WriterListener
            public void write(String str) {
                System.out.println(ConsoleDebugger.this.dateFormatter.format(new Date()) + " SENT (" + ConsoleDebugger.this.connection.hashCode() + "): " + str);
            }
        };
        debugWriter.addWriterListener(this.writerListener);
        this.reader = debugReader;
        this.writer = debugWriter;
        this.listener = new PacketListener() { // from class: org.jivesoftware.smack.debugger.ConsoleDebugger.3
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                if (ConsoleDebugger.printInterpreted) {
                    System.out.println(ConsoleDebugger.this.dateFormatter.format(new Date()) + " RCV PKT (" + ConsoleDebugger.this.connection.hashCode() + "): " + packet.toXML());
                }
            }
        };
        this.connListener = new ConnectionListener() { // from class: org.jivesoftware.smack.debugger.ConsoleDebugger.4
            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosed() {
                System.out.println(ConsoleDebugger.this.dateFormatter.format(new Date()) + " Connection closed (" + ConsoleDebugger.this.connection.hashCode() + ")");
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosedOnError(Exception e) {
                System.out.println(ConsoleDebugger.this.dateFormatter.format(new Date()) + " Connection closed due to an exception (" + ConsoleDebugger.this.connection.hashCode() + ")");
                e.printStackTrace();
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectionFailed(Exception e) {
                System.out.println(ConsoleDebugger.this.dateFormatter.format(new Date()) + " Reconnection failed due to an exception (" + ConsoleDebugger.this.connection.hashCode() + ")");
                e.printStackTrace();
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectionSuccessful() {
                System.out.println(ConsoleDebugger.this.dateFormatter.format(new Date()) + " Connection reconnected (" + ConsoleDebugger.this.connection.hashCode() + ")");
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectingIn(int seconds) {
                System.out.println(ConsoleDebugger.this.dateFormatter.format(new Date()) + " Connection (" + ConsoleDebugger.this.connection.hashCode() + ") will reconnect in " + seconds);
            }
        };
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public Reader newConnectionReader(Reader newReader) {
        ((ObservableReader) this.reader).removeReaderListener(this.readerListener);
        ObservableReader debugReader = new ObservableReader(newReader);
        debugReader.addReaderListener(this.readerListener);
        this.reader = debugReader;
        return this.reader;
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public Writer newConnectionWriter(Writer newWriter) {
        ((ObservableWriter) this.writer).removeWriterListener(this.writerListener);
        ObservableWriter debugWriter = new ObservableWriter(newWriter);
        debugWriter.addWriterListener(this.writerListener);
        this.writer = debugWriter;
        return this.writer;
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public void userHasLogged(String user) {
        boolean isAnonymous = XmlPullParser.NO_NAMESPACE.equals(StringUtils.parseName(user));
        String title = "User logged (" + this.connection.hashCode() + "): " + (isAnonymous ? XmlPullParser.NO_NAMESPACE : StringUtils.parseBareAddress(user)) + "@" + this.connection.getServiceName() + ":" + this.connection.getPort();
        System.out.println(title + "/" + StringUtils.parseResource(user));
        this.connection.addConnectionListener(this.connListener);
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public Reader getReader() {
        return this.reader;
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public Writer getWriter() {
        return this.writer;
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public PacketListener getReaderListener() {
        return this.listener;
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public PacketListener getWriterListener() {
        return null;
    }
}
