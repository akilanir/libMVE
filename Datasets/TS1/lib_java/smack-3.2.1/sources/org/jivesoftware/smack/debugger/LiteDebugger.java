package org.jivesoftware.smack.debugger;

import java.awt.Color;
import java.awt.GridLayout;
import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.ClipboardOwner;
import java.awt.datatransfer.StringSelection;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.Reader;
import java.io.Writer;
import javax.swing.JFrame;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTextArea;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.util.ObservableReader;
import org.jivesoftware.smack.util.ObservableWriter;
import org.jivesoftware.smack.util.ReaderListener;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smack.util.WriterListener;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/debugger/LiteDebugger.class */
public class LiteDebugger implements SmackDebugger {
    private static final String NEWLINE = "\n";
    private Connection connection;
    private Writer writer;
    private Reader reader;
    private ReaderListener readerListener;
    private WriterListener writerListener;
    private JFrame frame = null;
    private PacketListener listener = null;

    public LiteDebugger(Connection connection, Writer writer, Reader reader) {
        this.connection = null;
        this.connection = connection;
        this.writer = writer;
        this.reader = reader;
        createDebug();
    }

    private void createDebug() {
        this.frame = new JFrame("Smack Debug Window -- " + this.connection.getServiceName() + ":" + this.connection.getPort());
        this.frame.addWindowListener(new WindowAdapter() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.1
            public void windowClosing(WindowEvent evt) {
                LiteDebugger.this.rootWindowClosing(evt);
            }
        });
        JTabbedPane tabbedPane = new JTabbedPane();
        JPanel allPane = new JPanel();
        allPane.setLayout(new GridLayout(3, 1));
        tabbedPane.add("All", allPane);
        final JTextArea sentText1 = new JTextArea();
        final JTextArea sentText2 = new JTextArea();
        sentText1.setEditable(false);
        sentText2.setEditable(false);
        sentText1.setForeground(new Color(112, 3, 3));
        sentText2.setForeground(new Color(112, 3, 3));
        allPane.add(new JScrollPane(sentText1));
        tabbedPane.add("Sent", new JScrollPane(sentText2));
        JPopupMenu menu = new JPopupMenu();
        JMenuItem menuItem1 = new JMenuItem("Copy");
        menuItem1.addActionListener(new ActionListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.2
            public void actionPerformed(ActionEvent e) {
                Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
                clipboard.setContents(new StringSelection(sentText1.getText()), (ClipboardOwner) null);
            }
        });
        JMenuItem menuItem2 = new JMenuItem("Clear");
        menuItem2.addActionListener(new ActionListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.3
            public void actionPerformed(ActionEvent e) {
                sentText1.setText(XmlPullParser.NO_NAMESPACE);
                sentText2.setText(XmlPullParser.NO_NAMESPACE);
            }
        });
        PopupListener popupListener = new PopupListener(menu);
        sentText1.addMouseListener(popupListener);
        sentText2.addMouseListener(popupListener);
        menu.add(menuItem1);
        menu.add(menuItem2);
        final JTextArea receivedText1 = new JTextArea();
        final JTextArea receivedText2 = new JTextArea();
        receivedText1.setEditable(false);
        receivedText2.setEditable(false);
        receivedText1.setForeground(new Color(6, 76, 133));
        receivedText2.setForeground(new Color(6, 76, 133));
        allPane.add(new JScrollPane(receivedText1));
        tabbedPane.add("Received", new JScrollPane(receivedText2));
        JPopupMenu menu2 = new JPopupMenu();
        JMenuItem menuItem12 = new JMenuItem("Copy");
        menuItem12.addActionListener(new ActionListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.4
            public void actionPerformed(ActionEvent e) {
                Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
                clipboard.setContents(new StringSelection(receivedText1.getText()), (ClipboardOwner) null);
            }
        });
        JMenuItem menuItem22 = new JMenuItem("Clear");
        menuItem22.addActionListener(new ActionListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.5
            public void actionPerformed(ActionEvent e) {
                receivedText1.setText(XmlPullParser.NO_NAMESPACE);
                receivedText2.setText(XmlPullParser.NO_NAMESPACE);
            }
        });
        PopupListener popupListener2 = new PopupListener(menu2);
        receivedText1.addMouseListener(popupListener2);
        receivedText2.addMouseListener(popupListener2);
        menu2.add(menuItem12);
        menu2.add(menuItem22);
        final JTextArea interpretedText1 = new JTextArea();
        final JTextArea interpretedText2 = new JTextArea();
        interpretedText1.setEditable(false);
        interpretedText2.setEditable(false);
        interpretedText1.setForeground(new Color(1, 94, 35));
        interpretedText2.setForeground(new Color(1, 94, 35));
        allPane.add(new JScrollPane(interpretedText1));
        tabbedPane.add("Interpreted", new JScrollPane(interpretedText2));
        JPopupMenu menu3 = new JPopupMenu();
        JMenuItem menuItem13 = new JMenuItem("Copy");
        menuItem13.addActionListener(new ActionListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.6
            public void actionPerformed(ActionEvent e) {
                Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
                clipboard.setContents(new StringSelection(interpretedText1.getText()), (ClipboardOwner) null);
            }
        });
        JMenuItem menuItem23 = new JMenuItem("Clear");
        menuItem23.addActionListener(new ActionListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.7
            public void actionPerformed(ActionEvent e) {
                interpretedText1.setText(XmlPullParser.NO_NAMESPACE);
                interpretedText2.setText(XmlPullParser.NO_NAMESPACE);
            }
        });
        PopupListener popupListener3 = new PopupListener(menu3);
        interpretedText1.addMouseListener(popupListener3);
        interpretedText2.addMouseListener(popupListener3);
        menu3.add(menuItem13);
        menu3.add(menuItem23);
        this.frame.getContentPane().add(tabbedPane);
        this.frame.setSize(550, 400);
        this.frame.setVisible(true);
        ObservableReader debugReader = new ObservableReader(this.reader);
        this.readerListener = new ReaderListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.8
            @Override // org.jivesoftware.smack.util.ReaderListener
            public void read(String str) {
                int index = str.lastIndexOf(">");
                if (index != -1) {
                    receivedText1.append(str.substring(0, index + 1));
                    receivedText2.append(str.substring(0, index + 1));
                    receivedText1.append(LiteDebugger.NEWLINE);
                    receivedText2.append(LiteDebugger.NEWLINE);
                    if (str.length() > index) {
                        receivedText1.append(str.substring(index + 1));
                        receivedText2.append(str.substring(index + 1));
                        return;
                    }
                    return;
                }
                receivedText1.append(str);
                receivedText2.append(str);
            }
        };
        debugReader.addReaderListener(this.readerListener);
        ObservableWriter debugWriter = new ObservableWriter(this.writer);
        this.writerListener = new WriterListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.9
            @Override // org.jivesoftware.smack.util.WriterListener
            public void write(String str) {
                sentText1.append(str);
                sentText2.append(str);
                if (str.endsWith(">")) {
                    sentText1.append(LiteDebugger.NEWLINE);
                    sentText2.append(LiteDebugger.NEWLINE);
                }
            }
        };
        debugWriter.addWriterListener(this.writerListener);
        this.reader = debugReader;
        this.writer = debugWriter;
        this.listener = new PacketListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.10
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                interpretedText1.append(packet.toXML());
                interpretedText2.append(packet.toXML());
                interpretedText1.append(LiteDebugger.NEWLINE);
                interpretedText2.append(LiteDebugger.NEWLINE);
            }
        };
    }

    public void rootWindowClosing(WindowEvent evt) {
        this.connection.removePacketListener(this.listener);
        ((ObservableReader) this.reader).removeReaderListener(this.readerListener);
        ((ObservableWriter) this.writer).removeWriterListener(this.writerListener);
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/debugger/LiteDebugger$PopupListener.class */
    private class PopupListener extends MouseAdapter {
        JPopupMenu popup;

        PopupListener(JPopupMenu popupMenu) {
            this.popup = popupMenu;
        }

        public void mousePressed(MouseEvent e) {
            maybeShowPopup(e);
        }

        public void mouseReleased(MouseEvent e) {
            maybeShowPopup(e);
        }

        private void maybeShowPopup(MouseEvent e) {
            if (e.isPopupTrigger()) {
                this.popup.show(e.getComponent(), e.getX(), e.getY());
            }
        }
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
        String title = "Smack Debug Window -- " + (isAnonymous ? XmlPullParser.NO_NAMESPACE : StringUtils.parseBareAddress(user)) + "@" + this.connection.getServiceName() + ":" + this.connection.getPort();
        this.frame.setTitle(title + "/" + StringUtils.parseResource(user));
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
