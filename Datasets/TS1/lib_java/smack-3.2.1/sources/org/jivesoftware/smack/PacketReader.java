package org.jivesoftware.smack;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.packet.PrivacyItem;
import org.jivesoftware.smack.packet.XMPPError;
import org.jivesoftware.smack.sasl.SASLMechanism;
import org.jivesoftware.smack.util.PacketParserUtils;
import org.xmlpull.mxp1.MXParser;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/PacketReader.class */
class PacketReader {
    private Thread readerThread;
    private ExecutorService listenerExecutor;
    private XMPPConnection connection;
    private XmlPullParser parser;
    private boolean done;
    private String connectionID = null;
    private Semaphore connectionSemaphore;

    protected PacketReader(XMPPConnection connection) {
        this.connection = connection;
        init();
    }

    protected void init() {
        this.done = false;
        this.connectionID = null;
        this.readerThread = new Thread() { // from class: org.jivesoftware.smack.PacketReader.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                PacketReader.this.parsePackets(this);
            }
        };
        this.readerThread.setName("Smack Packet Reader (" + this.connection.connectionCounterValue + ")");
        this.readerThread.setDaemon(true);
        this.listenerExecutor = Executors.newSingleThreadExecutor(new ThreadFactory() { // from class: org.jivesoftware.smack.PacketReader.2
            @Override // java.util.concurrent.ThreadFactory
            public Thread newThread(Runnable runnable) {
                Thread thread = new Thread(runnable, "Smack Listener Processor (" + PacketReader.this.connection.connectionCounterValue + ")");
                thread.setDaemon(true);
                return thread;
            }
        });
        resetParser();
    }

    public void startup() throws XMPPException {
        this.connectionSemaphore = new Semaphore(1);
        this.readerThread.start();
        try {
            this.connectionSemaphore.acquire();
            int waitTime = SmackConfiguration.getPacketReplyTimeout();
            this.connectionSemaphore.tryAcquire(3 * waitTime, TimeUnit.MILLISECONDS);
        } catch (InterruptedException e) {
        }
        if (this.connectionID == null) {
            throw new XMPPException("Connection failed. No response from server.");
        }
        this.connection.connectionID = this.connectionID;
    }

    public void shutdown() {
        if (!this.done) {
            for (ConnectionListener listener : this.connection.getConnectionListeners()) {
                try {
                    listener.connectionClosed();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        this.done = true;
        this.listenerExecutor.shutdown();
    }

    void cleanup() {
        this.connection.recvListeners.clear();
        this.connection.collectors.clear();
    }

    void notifyConnectionError(Exception e) {
        this.done = true;
        this.connection.shutdown(new Presence(Presence.Type.unavailable));
        e.printStackTrace();
        for (ConnectionListener listener : this.connection.getConnectionListeners()) {
            try {
                listener.connectionClosedOnError(e);
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

    protected void notifyReconnection() {
        for (ConnectionListener listener : this.connection.getConnectionListeners()) {
            try {
                listener.reconnectionSuccessful();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private void resetParser() {
        try {
            this.parser = new MXParser();
            this.parser.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES, true);
            this.parser.setInput(this.connection.reader);
        } catch (XmlPullParserException xppe) {
            xppe.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void parsePackets(Thread thread) {
        try {
            int eventType = this.parser.getEventType();
            do {
                if (eventType == 2) {
                    if (this.parser.getName().equals("message")) {
                        processPacket(PacketParserUtils.parseMessage(this.parser));
                    } else if (this.parser.getName().equals("iq")) {
                        processPacket(PacketParserUtils.parseIQ(this.parser, this.connection));
                    } else if (this.parser.getName().equals("presence")) {
                        processPacket(PacketParserUtils.parsePresence(this.parser));
                    } else if (this.parser.getName().equals("stream")) {
                        if ("jabber:client".equals(this.parser.getNamespace(null))) {
                            for (int i = 0; i < this.parser.getAttributeCount(); i++) {
                                if (this.parser.getAttributeName(i).equals("id")) {
                                    this.connectionID = this.parser.getAttributeValue(i);
                                    if (!"1.0".equals(this.parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "version"))) {
                                        releaseConnectionIDLock();
                                    }
                                } else if (this.parser.getAttributeName(i).equals(PrivacyItem.PrivacyRule.SUBSCRIPTION_FROM)) {
                                    this.connection.config.setServiceName(this.parser.getAttributeValue(i));
                                }
                            }
                        }
                    } else {
                        if (this.parser.getName().equals("error")) {
                            throw new XMPPException(PacketParserUtils.parseStreamError(this.parser));
                        }
                        if (this.parser.getName().equals("features")) {
                            parseFeatures(this.parser);
                        } else if (this.parser.getName().equals("proceed")) {
                            this.connection.proceedTLSReceived();
                            resetParser();
                        } else if (this.parser.getName().equals("failure")) {
                            String namespace = this.parser.getNamespace(null);
                            if ("urn:ietf:params:xml:ns:xmpp-tls".equals(namespace)) {
                                throw new Exception("TLS negotiation has failed");
                            }
                            if ("http://jabber.org/protocol/compress".equals(namespace)) {
                                this.connection.streamCompressionDenied();
                            } else {
                                SASLMechanism.Failure failure = PacketParserUtils.parseSASLFailure(this.parser);
                                processPacket(failure);
                                this.connection.getSASLAuthentication().authenticationFailed(failure.getCondition());
                            }
                        } else if (this.parser.getName().equals("challenge")) {
                            String challengeData = this.parser.nextText();
                            processPacket(new SASLMechanism.Challenge(challengeData));
                            this.connection.getSASLAuthentication().challengeReceived(challengeData);
                        } else if (this.parser.getName().equals("success")) {
                            processPacket(new SASLMechanism.Success(this.parser.nextText()));
                            this.connection.packetWriter.openStream();
                            resetParser();
                            this.connection.getSASLAuthentication().authenticated();
                        } else if (this.parser.getName().equals("compressed")) {
                            this.connection.startStreamCompression();
                            resetParser();
                        }
                    }
                } else if (eventType == 3 && this.parser.getName().equals("stream")) {
                    this.connection.disconnect();
                }
                eventType = this.parser.next();
                if (this.done || eventType == 1) {
                    break;
                }
            } while (thread == this.readerThread);
        } catch (Exception e) {
            if (!this.done) {
                notifyConnectionError(e);
            }
        }
    }

    private void releaseConnectionIDLock() {
        this.connectionSemaphore.release();
    }

    private void processPacket(Packet packet) {
        if (packet == null) {
            return;
        }
        for (PacketCollector collector : this.connection.getPacketCollectors()) {
            collector.processPacket(packet);
        }
        this.listenerExecutor.submit(new ListenerNotification(packet));
    }

    private void parseFeatures(XmlPullParser parser) throws Exception {
        boolean startTLSReceived = false;
        boolean startTLSRequired = false;
        boolean done = false;
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                if (parser.getName().equals("starttls")) {
                    startTLSReceived = true;
                } else if (parser.getName().equals("mechanisms")) {
                    this.connection.getSASLAuthentication().setAvailableSASLMethods(PacketParserUtils.parseMechanisms(parser));
                } else if (parser.getName().equals("bind")) {
                    this.connection.getSASLAuthentication().bindingRequired();
                } else if (parser.getName().equals("session")) {
                    this.connection.getSASLAuthentication().sessionsSupported();
                } else if (parser.getName().equals("compression")) {
                    this.connection.setAvailableCompressionMethods(PacketParserUtils.parseCompressionMethods(parser));
                } else if (parser.getName().equals("register")) {
                    this.connection.getAccountManager().setSupportsAccountCreation(true);
                }
            } else if (eventType == 3) {
                if (parser.getName().equals("starttls")) {
                    this.connection.startTLSReceived(startTLSRequired);
                } else if (parser.getName().equals("required") && startTLSReceived) {
                    startTLSRequired = true;
                } else if (parser.getName().equals("features")) {
                    done = true;
                }
            }
        }
        if (!this.connection.isSecureConnection() && !startTLSReceived && this.connection.getConfiguration().getSecurityMode() == ConnectionConfiguration.SecurityMode.required) {
            throw new XMPPException("Server does not support security (TLS), but security required by connection configuration.", new XMPPError(XMPPError.Condition.forbidden));
        }
        if (!startTLSReceived || this.connection.getConfiguration().getSecurityMode() == ConnectionConfiguration.SecurityMode.disabled) {
            releaseConnectionIDLock();
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/PacketReader$ListenerNotification.class */
    private class ListenerNotification implements Runnable {
        private Packet packet;

        public ListenerNotification(Packet packet) {
            this.packet = packet;
        }

        @Override // java.lang.Runnable
        public void run() {
            for (Connection.ListenerWrapper listenerWrapper : PacketReader.this.connection.recvListeners.values()) {
                listenerWrapper.notifyListener(this.packet);
            }
        }
    }
}
