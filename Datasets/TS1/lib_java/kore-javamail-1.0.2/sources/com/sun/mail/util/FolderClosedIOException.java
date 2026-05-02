package com.sun.mail.util;

import java.io.IOException;
import korex.mail.Folder;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/FolderClosedIOException.class */
public class FolderClosedIOException extends IOException {
    private transient Folder folder;
    private static final long serialVersionUID = 4281122580365555735L;

    public FolderClosedIOException(Folder folder) {
        this(folder, null);
    }

    public FolderClosedIOException(Folder folder, String message) {
        super(message);
        this.folder = folder;
    }

    public Folder getFolder() {
        return this.folder;
    }
}
