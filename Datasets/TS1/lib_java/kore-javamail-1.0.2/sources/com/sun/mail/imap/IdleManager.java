package com.sun.mail.imap;

import com.sun.mail.util.MailLogger;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.nio.channels.SelectableChannel;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.SocketChannel;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;
import java.util.logging.Level;
import korex.mail.Folder;
import korex.mail.MessagingException;
import korex.mail.Session;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/IdleManager.class */
public class IdleManager {
    private Executor es;
    private MailLogger logger;
    private volatile boolean die = false;
    private Queue<IMAPFolder> toWatch = new ConcurrentLinkedQueue();
    private Queue<IMAPFolder> toAbort = new ConcurrentLinkedQueue();
    private Selector selector = Selector.open();

    public IdleManager(Session session, Executor es) throws IOException {
        this.logger = new MailLogger(getClass(), "DEBUG IMAP", session);
        this.es = es;
        es.execute(new Runnable() { // from class: com.sun.mail.imap.IdleManager.1
            @Override // java.lang.Runnable
            public void run() {
                IdleManager.this.select();
            }
        });
    }

    public synchronized void watch(Folder folder) throws IOException, MessagingException {
        if (!(folder instanceof IMAPFolder)) {
            throw new MessagingException("Can only watch IMAP folders");
        }
        IMAPFolder ifolder = (IMAPFolder) folder;
        SocketChannel sc = ifolder.getChannel();
        if (sc == null) {
            throw new MessagingException("Folder is not using SocketChannels");
        }
        this.logger.log(Level.FINEST, "IdleManager watching {0}", ifolder);
        ifolder.startIdle(this);
        this.toWatch.add(ifolder);
        this.selector.wakeup();
    }

    synchronized void requestAbort(IMAPFolder folder) {
        this.toAbort.add(folder);
        this.selector.wakeup();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void select() {
        this.die = false;
        while (!this.die) {
            try {
                try {
                    try {
                        watchAll();
                        this.logger.finest("IdleManager waiting...");
                        int ns = this.selector.select();
                        if (this.logger.isLoggable(Level.FINEST)) {
                            this.logger.log(Level.FINEST, "IdleManager selected {0} channels", Integer.valueOf(ns));
                        }
                        if (this.die || Thread.currentThread().isInterrupted()) {
                            break;
                        }
                        while (processKeys() && this.selector.selectNow() > 0) {
                        }
                    } catch (InterruptedIOException ex) {
                        this.logger.log(Level.FINE, "IdleManager interrupted", (Throwable) ex);
                        try {
                            unwatchAll();
                            this.selector.close();
                        } catch (IOException e) {
                        }
                        this.logger.fine("IdleManager exiting");
                        return;
                    }
                } finally {
                    try {
                        unwatchAll();
                        this.selector.close();
                    } catch (IOException e2) {
                    }
                    this.logger.fine("IdleManager exiting");
                }
            } catch (IOException ex2) {
                this.logger.log(Level.FINE, "IdleManager got exception", (Throwable) ex2);
                try {
                    unwatchAll();
                    this.selector.close();
                } catch (IOException e3) {
                }
                this.logger.fine("IdleManager exiting");
                return;
            }
        }
    }

    private void watchAll() {
        while (true) {
            IMAPFolder folder = this.toWatch.poll();
            if (folder != null) {
                this.logger.log(Level.FINEST, "IdleManager adding {0} to selector", folder);
                SocketChannel sc = folder.getChannel();
                if (sc != null) {
                    try {
                        sc.configureBlocking(false);
                        sc.register(this.selector, 1, folder);
                    } catch (IOException ex) {
                        this.logger.log(Level.FINEST, "IdleManager can't register folder", (Throwable) ex);
                    }
                }
            } else {
                return;
            }
        }
    }

    private boolean processKeys() throws IOException {
        boolean more = false;
        while (true) {
            IMAPFolder folder = this.toAbort.poll();
            if (folder == null) {
                break;
            }
            this.logger.log(Level.FINE, "IdleManager aborting IDLE for folder: {0}", folder);
            SocketChannel sc = folder.getChannel();
            if (sc != null) {
                SelectionKey sk = sc.keyFor(this.selector);
                if (sk != null) {
                    sk.cancel();
                }
                sc.configureBlocking(true);
                folder.idleAbort();
                this.toWatch.add(folder);
                more = true;
            }
        }
        Set<SelectionKey> selectedKeys = this.selector.selectedKeys();
        for (SelectionKey sk2 : selectedKeys) {
            selectedKeys.remove(sk2);
            sk2.cancel();
            IMAPFolder folder2 = (IMAPFolder) sk2.attachment();
            this.logger.log(Level.FINE, "IdleManager selected folder: {0}", folder2);
            sk2.channel().configureBlocking(true);
            try {
                if (folder2.handleIdle(false)) {
                    this.toWatch.add(folder2);
                    more = true;
                } else {
                    this.logger.log(Level.FINE, "IdleManager done watching folder {0}", folder2);
                }
            } catch (MessagingException ex) {
                this.logger.log(Level.FINE, "IdleManager got exception for folder: " + folder2, (Throwable) ex);
            }
        }
        return more;
    }

    private void unwatchAll() {
        Set<SelectionKey> keys = this.selector.keys();
        for (SelectionKey sk : keys) {
            sk.cancel();
            IMAPFolder folder = (IMAPFolder) sk.attachment();
            this.logger.log(Level.FINE, "IdleManager no longer watching folder: {0}", folder);
            SelectableChannel sc = sk.channel();
            try {
                sc.configureBlocking(true);
            } catch (IOException e) {
            }
        }
    }

    public synchronized void stop() {
        this.die = true;
        this.logger.finest("IdleManager stopping");
        this.selector.wakeup();
    }
}
