package org.kore.kolab.notes.imap;

import com.sun.mail.imap.IMAPFolder;
import com.sun.mail.imap.IMAPStore;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import korex.activation.DataHandler;
import korex.mail.Authenticator;
import korex.mail.BodyPart;
import korex.mail.FetchProfile;
import korex.mail.Flags;
import korex.mail.Folder;
import korex.mail.Message;
import korex.mail.MessagingException;
import korex.mail.Multipart;
import korex.mail.NoSuchProviderException;
import korex.mail.Session;
import korex.mail.Store;
import korex.mail.internet.InternetAddress;
import korex.mail.internet.MimeBodyPart;
import korex.mail.internet.MimeMessage;
import korex.mail.internet.MimeMultipart;
import org.kore.kolab.notes.AccountInformation;
import org.kore.kolab.notes.Attachment;
import org.kore.kolab.notes.AuditInformation;
import org.kore.kolab.notes.Identification;
import org.kore.kolab.notes.KolabParser;
import org.kore.kolab.notes.Note;
import org.kore.kolab.notes.Notebook;
import org.kore.kolab.notes.RemoteNotesRepository;
import org.kore.kolab.notes.SharedNotebook;
import org.kore.kolab.notes.Tag;
import org.kore.kolab.notes.event.EventListener;
import org.kore.kolab.notes.imap.RemoteTags;
import org.kore.kolab.notes.local.LocalNotesRepository;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/ImapNotesRepository.class */
public class ImapNotesRepository extends LocalNotesRepository implements RemoteNotesRepository {
    static final String NOT_LOADED = "NOT_LOADED";
    static final String KOLAB_TEXT = "This is a Kolab Groupware object.\nTo view this object you will need a Kolab Groupware Client.\nFor a list of Kolab Groupware Clients please visit:\nhttp://www.kolab.org";
    private final AccountInformation account;
    private final KolabParser configurationParser;
    private RemoteTags remoteTags;
    private RemoteNotesRepository.Base64Coder coder;

    public ImapNotesRepository(KolabParser parser, AccountInformation account, String rootFolder, KolabParser configurationParser) {
        super(parser, rootFolder);
        this.account = account;
        this.configurationParser = configurationParser;
    }

    @Override // org.kore.kolab.notes.RemoteNotesRepository
    public void setBase64Coder(RemoteNotesRepository.Base64Coder coder) {
        this.coder = coder;
    }

    public RemoteTags getRemoteTags() {
        return this.remoteTags;
    }

    @Override // org.kore.kolab.notes.RemoteNotesRepository
    public void merge(Map<String, EventListener.Type> eventTypes, RemoteNotesRepository.Listener... listener) {
        this.eventCache.putAll(eventTypes);
        merge(listener);
    }

    @Override // org.kore.kolab.notes.RemoteNotesRepository
    public void refresh(RemoteNotesRepository.Listener... listener) {
        refresh(null, listener);
    }

    @Override // org.kore.kolab.notes.RemoteNotesRepository
    public void refresh(Date modificationDate, RemoteNotesRepository.Listener... listener) {
        this.notesCache.clear();
        this.notebookCache.clear();
        try {
            Store store = openConnection(this.account);
            this.remoteTags = new RemoteTags(this.configurationParser, this.account);
            this.remoteTags.init(store);
            Folder rFolder = store.getFolder(this.rootfolder);
            FetchProfile fetchProfile = new FetchProfile();
            rFolder.open(1);
            if (this.account.isFolderAnnotationEnabled()) {
                initNotesFromFolderWithAnnotationCheck(rFolder, fetchProfile, modificationDate);
            } else {
                initNotesFromFolder(rFolder, fetchProfile, modificationDate, false, new RemoteNotesRepository.Listener[0]);
            }
            Folder[] allFolders = rFolder.list("*");
            for (Folder folder : allFolders) {
                folder.open(1);
                if (this.account.isFolderAnnotationEnabled()) {
                    initNotesFromFolderWithAnnotationCheck(folder, fetchProfile, modificationDate);
                } else {
                    initNotesFromFolder(folder, fetchProfile, modificationDate, false, new RemoteNotesRepository.Listener[0]);
                }
                for (RemoteNotesRepository.Listener listen : listener) {
                    listen.onSyncUpdate(folder.getFullName());
                }
            }
            initSharedFolders(store, fetchProfile, modificationDate, this.account.isFolderAnnotationEnabled(), this.account.isSharedFoldersEnabled(), listener);
            store.close();
            this.eventCache.clear();
            this.deletedNotebookCache.clear();
            this.deletedNotesCache.clear();
        } catch (Exception e) {
            System.out.println(e);
            throw new IllegalStateException(e);
        }
    }

    public static Store openConnection(AccountInformation info) throws MessagingException, NoSuchProviderException {
        IMAPStore store;
        Properties props = new Properties();
        if (info.isSSLEnabled()) {
            props.put("mail.imaps.ssl.trust", "*");
        }
        try {
            Session session = Session.getInstance(props, (Authenticator) null);
            store = (IMAPStore) (info.isSSLEnabled() ? session.getStore("imaps") : session.getStore("imap"));
            store.connect(info.getHost(), info.getPort(), info.getUsername(), info.getPassword());
        } catch (MessagingException e) {
            if (info.isSSLEnabled()) {
                Properties props2 = new Properties();
                props2.put("mail.imap.ssl.trust", "*");
                props2.put("mail.imap.starttls.enable", "true");
                store = Session.getInstance(props2, (Authenticator) null).getStore("imap");
                store.connect(info.getHost(), info.getPort(), info.getUsername(), info.getPassword());
            } else {
                throw e;
            }
        }
        if (info.isFolderAnnotationEnabled()) {
            Map<String, String> clientParams = new HashMap<>();
            clientParams.put("name", "/Kolabnotes-java");
            clientParams.put("version", "3.3.4");
            clientParams.put("os", System.getProperty("os.name"));
            clientParams.put("support-url", "https://github.com/konradrenner/kolabnotes-java/issues");
            clientParams.put("os-version", System.getProperty("os.version"));
            clientParams.put("vendor", "kolabnotes-java");
            clientParams.put("environment", System.getProperty("java.vendor") + "; Java " + System.getProperty("java.version") + "; " + System.getProperty("java.vendor.url"));
            store.id(clientParams);
        }
        return store;
    }

    void initSharedFolders(Store store, FetchProfile fetchProfile, Date modificationDate, boolean folderAnnotationEnabled, boolean sharedFolderEnabled, RemoteNotesRepository.Listener... listener) throws MessagingException, IOException {
        if (!folderAnnotationEnabled || !sharedFolderEnabled) {
            return;
        }
        Folder defaultFolder = store.getDefaultFolder();
        for (IMAPFolder iMAPFolder : defaultFolder.list("*")) {
            if (iMAPFolder instanceof IMAPFolder) {
                IMAPFolder imapFolder = iMAPFolder;
                GetSharedFolderCommand metadataCommand = new GetSharedFolderCommand(iMAPFolder.getFullName());
                imapFolder.doCommand(metadataCommand);
                if (metadataCommand.isSharedNotesFolder()) {
                    GetFolderPermissionsCommand permissionsCommand = new GetFolderPermissionsCommand(iMAPFolder.getFullName());
                    imapFolder.doCommand(permissionsCommand);
                    iMAPFolder.open(1);
                    Notebook book = initNotesFromFolder(iMAPFolder, fetchProfile, modificationDate, true, new RemoteNotesRepository.Listener[0]);
                    if (book != null) {
                        SharedNotebook shared = (SharedNotebook) book;
                        shared.setNoteCreationAllowed(permissionsCommand.isIsNoteCreationAllowed());
                        shared.setNoteModificationAllowed(permissionsCommand.isIsNoteModificationAllowed());
                    }
                    for (RemoteNotesRepository.Listener listen : listener) {
                        listen.onSyncUpdate(iMAPFolder.getFullName());
                    }
                }
            }
        }
    }

    @Override // org.kore.kolab.notes.RemoteNotesRepository
    public void merge(RemoteNotesRepository.Listener... listener) {
        IMAPFolder folder;
        EventListener.Type event;
        Message findMessage;
        initCache();
        disableChangeListening();
        try {
            try {
                Store store = openConnection(this.account);
                if (this.remoteTags == null) {
                    this.remoteTags = new RemoteTags(this.configurationParser, this.account);
                }
                this.remoteTags.init(store);
                ArrayList<Notebook> notebooks = new ArrayList<>(getNotebooks());
                notebooks.addAll(this.deletedNotebookCache.values());
                IMAPFolder defaultFolder = store.getDefaultFolder();
                IMAPFolder rootFolder = store.getFolder(this.rootfolder);
                Flags deleted = new Flags(Flags.Flag.DELETED);
                Iterator<Notebook> it = notebooks.iterator();
                while (it.hasNext()) {
                    Notebook book = it.next();
                    try {
                        if (this.rootfolder.equals(book.getSummary())) {
                            folder = rootFolder;
                        } else if (book.isShared()) {
                            folder = defaultFolder.getFolder(book.getSummary());
                        } else {
                            folder = rootFolder.getFolder(book.getSummary());
                        }
                        event = getEvent(book.getIdentification().getUid());
                    } catch (Exception e) {
                        for (RemoteNotesRepository.Listener list : listener) {
                            list.onFolderSyncException(book.getSummary(), e);
                        }
                    }
                    if (event != null) {
                        if (event == EventListener.Type.DELETE) {
                            folder.delete(true);
                        } else if (event == EventListener.Type.NEW || event == EventListener.Type.UPDATE) {
                            if (event == EventListener.Type.NEW) {
                                folder.create(1);
                            } else {
                                folder.renameTo(folder);
                            }
                            if (this.account.isFolderAnnotationEnabled()) {
                                folder.doCommand(new SetMetadataCommand(folder.getFullName()));
                            }
                        }
                    }
                    if (folder.exists()) {
                        if (!folder.isOpen()) {
                            folder.open(2);
                        }
                        ArrayList<Note> notes = new ArrayList<>(book.getNotes());
                        Map<String, Note> deletedNotes = this.deletedNotesCache.get(book.getIdentification().getUid());
                        if (deletedNotes != null) {
                            notes.addAll(deletedNotes.values());
                        }
                        ArrayList<Message> messagesToAdd = new ArrayList<>();
                        Iterator<Note> it2 = notes.iterator();
                        while (it2.hasNext()) {
                            Note note = it2.next();
                            Message[] messages = folder.getMessages();
                            EventListener.Type event2 = getEvent(note.getIdentification().getUid());
                            if (event2 == EventListener.Type.UPDATE && (findMessage = findMessage(note.getIdentification().getUid(), messages)) != null) {
                                folder.setFlags(new Message[]{findMessage}, deleted, true);
                            }
                            if (event2 == EventListener.Type.NEW || event2 == EventListener.Type.UPDATE) {
                                MimeMessage message = createMessage(this.account, note.getIdentification(), note.getAuditInformation(), new IMAPKolabDataHandler(note, "APPLICATION/VND.KOLAB+XML", this.parser), "application/x-vnd.kolab.note");
                                addAttachments(message, note.getAttachments());
                                messagesToAdd.add(message);
                                String uid = note.getIdentification().getUid();
                                this.remoteTags.removeTags(uid);
                                this.remoteTags.attachTags(uid, (Tag[]) note.getCategories().toArray(new Tag[note.getCategories().size()]));
                            } else if (event2 == EventListener.Type.DELETE) {
                                Message message2 = findMessage(note.getIdentification().getUid(), messages);
                                if (message2 != null) {
                                    folder.setFlags(new Message[]{message2}, deleted, true);
                                }
                                this.remoteTags.removeTags(note.getIdentification().getUid());
                            }
                        }
                        folder.addMessages((Message[]) messagesToAdd.toArray(new Message[messagesToAdd.size()]));
                        folder.close(true);
                    }
                }
                this.remoteTags.merge();
                store.close();
                enableChangeListening();
            } catch (Exception e2) {
                throw new IllegalStateException(e2);
            }
        } catch (Throwable th) {
            enableChangeListening();
            throw th;
        }
    }

    @Override // org.kore.kolab.notes.RemoteNotesRepository
    public void fillUnloadedNote(Note note) {
        disableChangeListening();
        Note unloaded = this.notesCache.get(note.getIdentification().getUid());
        if (unloaded != null && NOT_LOADED.equals(unloaded.getSummary())) {
            unloaded.setClassification(note.getClassification());
            unloaded.setColor(note.getColor());
            unloaded.setDescription(note.getDescription());
            unloaded.setSummary(note.getSummary());
            unloaded.addCategories((Tag[]) note.getCategories().toArray(new Tag[note.getCategories().size()]));
            unloaded.getAuditInformation().setLastModificationDate(note.getAuditInformation().getLastModificationDate().getTime());
            unloaded.getAuditInformation().setCreationDate(note.getAuditInformation().getCreationDate().getTime());
            Collection<Attachment> attachments = note.getAttachments();
            unloaded.addAttachments((Attachment[]) attachments.toArray(new Attachment[attachments.size()]));
        }
        enableChangeListening();
    }

    private void addAttachments(MimeMessage message, Collection<Attachment> attachments) throws MessagingException, IOException {
        Object content = message.getContent();
        if (content instanceof Multipart) {
            Multipart multipart = (Multipart) content;
            for (Attachment attachment : attachments) {
                MimeBodyPart newContent = new MimeBodyPart();
                newContent.setFileName(attachment.getFileName());
                KolabByteArrayDataSource dataSource = new KolabByteArrayDataSource(attachment);
                DataHandler handler = new DataHandler(dataSource);
                newContent.setDataHandler(handler);
                newContent.addHeader("Content-Disposition", attachment.getFileName());
                newContent.addHeader("Content-ID", attachment.getId());
                newContent.addHeader("Content-Transfer-Encoding", "base64");
                multipart.addBodyPart(newContent, 1);
            }
        }
    }

    static MimeMessage createMessage(AccountInformation account, Identification ident, AuditInformation audit, DataHandler handler, String type) throws MessagingException {
        MimeMessage message = new MimeMessage(Session.getInstance(System.getProperties()));
        message.setFrom(new InternetAddress(account.getUsername()));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(account.getUsername()));
        message.setSentDate(audit.getLastModificationDate());
        message.setSubject(ident.getUid(), "UTF-8");
        message.setHeader("X-Kolab-Type", type);
        message.setHeader("X-Kolab-Mime-Version", "3.0");
        message.setHeader("User-Agent", "kolabnotes-java");
        MimeMultipart mimeMultipart = new MimeMultipart();
        MimeBodyPart textPart = new MimeBodyPart();
        textPart.setText(KOLAB_TEXT, "UTF-8");
        mimeMultipart.addBodyPart(textPart);
        setKolabXML(mimeMultipart, handler);
        message.setContent(mimeMultipart);
        message.saveChanges();
        return message;
    }

    static void setKolabXML(Multipart content, DataHandler handler) throws MessagingException {
        if (content == null) {
            return;
        }
        for (int i = 0; i < content.getCount(); i++) {
            BodyPart bodyPart = content.getBodyPart(i);
            if (bodyPart.getContentType().startsWith("APPLICATION/VND.KOLAB+XML")) {
                content.removeBodyPart(i);
            }
        }
        MimeBodyPart newContent = new MimeBodyPart();
        newContent.setFileName("kolab.xml");
        newContent.setDataHandler(handler);
        content.addBodyPart(newContent, 1);
    }

    MimeMessage findMessage(String uid, Message[] messages) throws Exception {
        for (Message m : messages) {
            if (m.getSubject() != null && m.getSubject().contains(uid)) {
                return (MimeMessage) m;
            }
        }
        return null;
    }

    @Override // org.kore.kolab.notes.local.LocalNotesRepository
    protected void initCache() {
        if (this.notesCache.isEmpty()) {
            refresh(new RemoteNotesRepository.Listener[0]);
        }
    }

    @Override // org.kore.kolab.notes.local.LocalNotesRepository
    protected void addNotebook(String uid, Notebook notebook) {
        super.addNotebook(uid, notebook);
    }

    @Override // org.kore.kolab.notes.local.LocalNotesRepository
    protected void addNote(String uid, Note note) {
        super.addNote(uid, note);
    }

    void initNotesFromFolderWithAnnotationCheck(Folder folder, FetchProfile fetchProfile, Date parseDate) throws MessagingException, IOException {
        if (folder instanceof IMAPFolder) {
            GetMetadataCommand metadataCommand = new GetMetadataCommand(folder.getFullName());
            ((IMAPFolder) folder).doCommand(metadataCommand);
            if (!metadataCommand.isNotesFolder()) {
                return;
            }
        }
        initNotesFromFolder(folder, fetchProfile, parseDate, false, new RemoteNotesRepository.Listener[0]);
    }

    @Override // org.kore.kolab.notes.RemoteNotesRepository
    public boolean noteCompletelyLoaded(Note note) {
        return !NOT_LOADED.equals(note.getSummary());
    }

    Notebook initNotesFromFolder(Folder folder, FetchProfile fetchProfile, Date parseDate, boolean sharedFolder, RemoteNotesRepository.Listener... listener) throws MessagingException, IOException {
        Notebook notebook;
        try {
            Message[] messages = folder.getMessages();
            fetchProfile.add(FetchProfile.Item.CONTENT_INFO);
            fetchProfile.add(FetchProfile.Item.FLAGS);
            fetchProfile.add(FetchProfile.Item.ENVELOPE);
            folder.fetch(messages, fetchProfile);
            Timestamp now = new Timestamp(System.currentTimeMillis());
            Identification id = new Identification(Long.toString(System.currentTimeMillis()), "kolabnotes-java");
            AuditInformation audit = new AuditInformation(now, now);
            if (sharedFolder) {
                SharedNotebook nb = new SharedNotebook(id, audit, Note.Classification.PUBLIC, folder.getFullName());
                notebook = nb;
            } else {
                notebook = new Notebook(id, audit, Note.Classification.PUBLIC, folder.getName());
            }
            addNotebook(notebook.getIdentification().getUid(), notebook);
            for (Message m : messages) {
                Date sentDate = m.getSentDate();
                if (parseDate != null && parseDate.after(sentDate)) {
                    Timestamp tst = new Timestamp(sentDate.getTime());
                    Identification noteLoadedId = new Identification(m.getSubject(), "kolabnotes-java");
                    AuditInformation notLoadedAudit = new AuditInformation(tst, tst);
                    Note note = new Note(noteLoadedId, notLoadedAudit, Note.Classification.PUBLIC, NOT_LOADED);
                    notebook.addNote(note);
                    addNote(note.getIdentification().getUid(), note);
                } else {
                    Multipart content = (Multipart) m.getContent();
                    Map<String, byte[]> attachmentContents = new LinkedHashMap<>();
                    loadFromMessage(content, notebook, attachmentContents);
                }
            }
            return notebook;
        } catch (Exception e) {
            for (RemoteNotesRepository.Listener listen : listener) {
                listen.onFolderSyncException(folder.getFullName(), e);
            }
            return null;
        }
    }

    private void loadFromMessage(Multipart content, Notebook notebook, Map<String, byte[]> attachmentContents) throws IOException, MessagingException {
        Note note = null;
        for (int i = 0; i < content.getCount(); i++) {
            BodyPart bodyPart = content.getBodyPart(i);
            if (bodyPart.getContentType().startsWith("APPLICATION/VND.KOLAB+XML")) {
                note = loadNoteFromMessage(bodyPart, notebook);
            } else {
                createAttachmentContent(bodyPart, attachmentContents);
            }
        }
        fillAttachmentOfNote(note, attachmentContents);
    }

    private void fillAttachmentOfNote(Note note, Map<String, byte[]> attachmentContents) {
        if (note != null) {
            for (Map.Entry<String, byte[]> attContent : attachmentContents.entrySet()) {
                Attachment attachment = note.getAttachment(attContent.getKey());
                if (attachment != null) {
                    attachment.setData(attContent.getValue());
                }
            }
        }
    }

    private void createAttachmentContent(BodyPart bodyPart, Map<String, byte[]> attachmentContents) throws MessagingException, IOException {
        String attId;
        String[] header = bodyPart.getHeader("Content-ID");
        if (header == null || header.length == 0) {
            attId = bodyPart.getFileName();
        } else {
            attId = header[0];
        }
        byte[] buffer = new byte[1024];
        InputStream inputStream = bodyPart.getInputStream();
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        while (true) {
            int bytes = inputStream.read(buffer);
            if (bytes != -1) {
                output.write(buffer, 0, bytes);
            } else {
                attachmentContents.put(attId, output.toByteArray());
                inputStream.close();
                output.close();
                return;
            }
        }
    }

    private Note loadNoteFromMessage(BodyPart bodyPart, Notebook notebook) throws IOException, MessagingException {
        InputStream inputStream = bodyPart.getInputStream();
        Note note = (Note) this.parser.parse(inputStream);
        inputStream.close();
        notebook.addNote(note);
        addNote(note.getIdentification().getUid(), note);
        Set<RemoteTags.TagDetails> tagsFromNote = this.remoteTags.getTagsFromNote(note.getIdentification().getUid());
        for (RemoteTags.TagDetails tag : tagsFromNote) {
            note.addCategories(tag.getTag());
        }
        return note;
    }
}
