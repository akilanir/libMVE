package korex.mail;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/FolderNotFoundException.class */
public class FolderNotFoundException extends MessagingException {
    private transient Folder folder;
    private static final long serialVersionUID = 472612108891249403L;

    public FolderNotFoundException() {
    }

    public FolderNotFoundException(Folder folder) {
        this.folder = folder;
    }

    public FolderNotFoundException(Folder folder, String s) {
        super(s);
        this.folder = folder;
    }

    public FolderNotFoundException(Folder folder, String s, Exception e) {
        super(s, e);
        this.folder = folder;
    }

    public FolderNotFoundException(String s, Folder folder) {
        super(s);
        this.folder = folder;
    }

    public Folder getFolder() {
        return this.folder;
    }
}
