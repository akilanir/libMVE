package org.kore.kolab.notes.imap;

import com.sun.mail.imap.IMAPFolder;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import korex.mail.BodyPart;
import korex.mail.FetchProfile;
import korex.mail.Flags;
import korex.mail.Folder;
import korex.mail.Message;
import korex.mail.MessagingException;
import korex.mail.Multipart;
import korex.mail.Store;
import org.kore.kolab.notes.AccountInformation;
import org.kore.kolab.notes.AuditInformation;
import org.kore.kolab.notes.Identification;
import org.kore.kolab.notes.KolabParser;
import org.kore.kolab.notes.Tag;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/RemoteTags.class */
public class RemoteTags {
    public static final String TYPE = "relation";
    public static final String RELATION_TYPE = "tag";
    private final AccountInformation account;
    private Set<TagDetails> remoteTags;
    private final KolabParser parser;
    private final Map<String, Set<TagDetails>> tagsPerNote = new HashMap();
    private final Map<String, TagDetails> tagPerTagname = new HashMap();
    private final Set<String> tagsForDeletion = new HashSet();

    public RemoteTags(KolabParser parser, AccountInformation login) {
        this.account = login;
        this.parser = parser;
    }

    public Set<TagDetails> getTags() {
        init(null);
        return Collections.unmodifiableSet(this.remoteTags);
    }

    public void applyLocalChanges(Tag... tags) {
        for (Tag tag : tags) {
            Iterator<TagDetails> it = this.remoteTags.iterator();
            while (true) {
                if (it.hasNext()) {
                    TagDetails detail = it.next();
                    if (detail.getIdentification().getUid().equals(tag.getIdentification().getUid())) {
                        detail.getTag().setColor(tag.getColor());
                        detail.getTag().setName(tag.getName());
                        detail.getTag().setPriority(tag.getPriority());
                        break;
                    }
                }
            }
        }
    }

    public void deleteTags(Identification... ident) {
        for (Identification i : ident) {
            this.tagsForDeletion.add(i.getUid());
        }
    }

    public Set<TagDetails> getTagsFromNote(String uid) {
        init(null);
        return this.tagsPerNote.get(uid) == null ? Collections.EMPTY_SET : Collections.unmodifiableSet(this.tagsPerNote.get(uid));
    }

    public TagDetails getTag(String name) {
        init(null);
        return this.tagPerTagname.get(name);
    }

    public void attachTags(String uid, Tag... tags) {
        for (Tag tag : tags) {
            TagDetails actDetail = this.tagPerTagname.get(tag.getName());
            if (actDetail == null) {
                LinkedHashSet<String> member = new LinkedHashSet<>();
                actDetail = new TagDetails(tag.getIdentification(), tag.getAuditInformation(), tag, member);
                this.tagPerTagname.put(tag.getName(), actDetail);
                if (this.remoteTags == null) {
                    this.remoteTags = new LinkedHashSet();
                }
                this.remoteTags.add(actDetail);
            }
            actDetail.addMember(uid);
            Set<TagDetails> perNote = this.tagsPerNote.get(uid);
            if (perNote == null) {
                perNote = new LinkedHashSet();
                this.tagsPerNote.put(uid, perNote);
            }
            perNote.add(actDetail);
        }
    }

    public void removeTags(String uid) {
        Set<TagDetails> tags = getTagsFromNote(uid);
        for (TagDetails tag : tags) {
            tag.removeMember(uid);
        }
        this.tagsPerNote.put(uid, new LinkedHashSet());
    }

    Store connect(Store store) throws MessagingException {
        if (store == null) {
            store = ImapNotesRepository.openConnection(this.account);
        }
        if (!store.isConnected()) {
            store.connect(this.account.getHost(), this.account.getPort(), this.account.getUsername(), this.account.getPassword());
        }
        return store;
    }

    void init(Store store) {
        TagDetails tag;
        if (this.remoteTags != null) {
            return;
        }
        this.remoteTags = new LinkedHashSet();
        try {
            Store lstore = connect(store);
            Folder rFolder = lstore.getDefaultFolder();
            Folder configFolder = searchConfigFolder(rFolder);
            if (configFolder != null) {
                configFolder.open(1);
                Message[] messages = configFolder.getMessages();
                FetchProfile fetchProfile = new FetchProfile();
                fetchProfile.add(FetchProfile.Item.CONTENT_INFO);
                fetchProfile.add(FetchProfile.Item.FLAGS);
                fetchProfile.add(FetchProfile.Item.ENVELOPE);
                configFolder.fetch(messages, fetchProfile);
                for (Message message : messages) {
                    String[] header = message.getHeader("X-Kolab-Type");
                    if (Arrays.toString(header).contains("application/x-vnd.kolab.configuration.relation") && (tag = getFromMessage(message)) != null) {
                        this.remoteTags.add(tag);
                        this.tagPerTagname.put(tag.getTag().getName(), tag);
                        addToNotesMap(tag);
                    }
                }
                configFolder.close(false);
            }
            if (store == null) {
                lstore.close();
            }
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
    }

    TagDetails getFromMessage(Message message) throws IOException, MessagingException {
        Multipart content = (Multipart) message.getContent();
        for (int i = 0; i < content.getCount(); i++) {
            BodyPart bodyPart = content.getBodyPart(i);
            if (bodyPart.getContentType().startsWith("APPLICATION/VND.KOLAB+XML")) {
                InputStream inputStream = bodyPart.getInputStream();
                TagDetails tag = (TagDetails) this.parser.parse(inputStream);
                inputStream.close();
                return tag;
            }
        }
        return null;
    }

    public void merge() {
        merge(null);
    }

    void merge(Store store) {
        init(store);
        try {
            Store lstore = connect(store);
            Folder rFolder = lstore.getDefaultFolder();
            IMAPFolder searchConfigFolder = searchConfigFolder(rFolder);
            if (searchConfigFolder == null) {
                searchConfigFolder = rFolder.getFolder("Configuration");
                searchConfigFolder.create(1);
                if (this.account.isFolderAnnotationEnabled()) {
                    searchConfigFolder.doCommand(new SetConfigurationCommand(searchConfigFolder.getFullName()));
                }
            }
            if (!searchConfigFolder.isOpen()) {
                searchConfigFolder.open(2);
            }
            Message[] serverTags = searchConfigFolder.getMessages();
            Flags deleted = new Flags(Flags.Flag.DELETED);
            ArrayList<Message> messagesToAdd = new ArrayList<>();
            boolean createMessage = true;
            for (TagDetails detail : this.remoteTags) {
                Message serverTag = searchForRemoteTag(detail.getIdentification().getUid(), serverTags);
                if (serverTag != null) {
                    if (this.tagsForDeletion.contains(detail.getIdentification().getUid())) {
                        searchConfigFolder.setFlags(new Message[]{serverTag}, deleted, true);
                        createMessage = false;
                    } else {
                        TagDetails fromMessage = getFromMessage(serverTag);
                        if (noChange(detail, fromMessage)) {
                            createMessage = false;
                        } else {
                            searchConfigFolder.setFlags(new Message[]{serverTag}, deleted, true);
                        }
                    }
                }
                if (createMessage) {
                    messagesToAdd.add(ImapNotesRepository.createMessage(this.account, detail.getIdentification(), detail.getAuditInformation(), new IMAPKolabDataHandler(detail, "APPLICATION/VND.KOLAB+XML", this.parser), "application/x-vnd.kolab.configuration.relation"));
                }
                createMessage = true;
            }
            searchConfigFolder.addMessages((Message[]) messagesToAdd.toArray(new Message[messagesToAdd.size()]));
            searchConfigFolder.close(true);
            if (store == null) {
                lstore.close();
            }
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
    }

    boolean noChange(TagDetails local, TagDetails remote) {
        boolean noChange = remote.getMembers().equals(local.getMembers()) && remote.getTag().getPriority() == local.getTag().getPriority() && remote.getTag().getName().equals(local.getTag().getName());
        if (!noChange) {
            return false;
        }
        if (remote.getTag().getColor() != null) {
            noChange = remote.getTag().getColor().equals(local.getTag().getColor());
        } else if (local.getTag().getColor() != null) {
            noChange = false;
        }
        return noChange;
    }

    Message searchForRemoteTag(String uid, Message[] messages) throws MessagingException {
        for (Message m : messages) {
            if (uid.equals(m.getSubject())) {
                return m;
            }
        }
        return null;
    }

    void addToNotesMap(TagDetails tag) {
        for (String note : tag.getMembers()) {
            Set<TagDetails> tagsOfNote = this.tagsPerNote.get(note);
            if (tagsOfNote == null) {
                tagsOfNote = new LinkedHashSet();
                this.tagsPerNote.put(note, tagsOfNote);
            }
            tagsOfNote.add(tag);
        }
    }

    Folder searchConfigFolder(Folder rFolder) throws MessagingException {
        for (Folder folder : rFolder.list("*")) {
            if (isConfigurationFolder(folder)) {
                return folder;
            }
        }
        return null;
    }

    boolean isConfigurationFolder(Folder folder) throws MessagingException {
        if (this.account.isFolderAnnotationEnabled()) {
            GetConfigurationCommand metadataCommand = new GetConfigurationCommand(folder.getFullName());
            ((IMAPFolder) folder).doCommand(metadataCommand);
            return metadataCommand.isConfigurationFolder();
        }
        return "Configuration".equalsIgnoreCase(folder.getName());
    }

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/imap/RemoteTags$TagDetails.class */
    public static class TagDetails {
        private final Tag tag;
        private final Set<String> members;
        private final AuditInformation auditInformation;
        private final Identification identification;

        public TagDetails(Identification identification, AuditInformation auditInformation, Tag tag, Set<String> members) {
            this.tag = tag;
            this.members = new LinkedHashSet(members);
            this.auditInformation = auditInformation;
            this.identification = identification;
        }

        public Tag getTag() {
            return this.tag;
        }

        public Set<String> getMembers() {
            return Collections.unmodifiableSet(this.members);
        }

        public boolean containsMember(String uid) {
            return this.members.contains(uid);
        }

        public void removeMember(String uid) {
            this.members.remove(uid);
        }

        public void addMember(String uid) {
            this.members.add(uid);
        }

        public AuditInformation getAuditInformation() {
            return this.auditInformation;
        }

        public Identification getIdentification() {
            return this.identification;
        }

        public String toString() {
            return "TagDetails{tag=" + this.tag + ", members=" + this.members + ", auditInformation=" + this.auditInformation + ", identification=" + this.identification + '}';
        }

        public int hashCode() {
            int hash = (59 * 7) + (this.tag != null ? this.tag.hashCode() : 0);
            return hash;
        }

        public boolean equals(Object obj) {
            if (obj == null || getClass() != obj.getClass()) {
                return false;
            }
            TagDetails other = (TagDetails) obj;
            if (this.tag == other.tag) {
                return true;
            }
            if (this.tag == null || !this.tag.equals(other.tag)) {
                return false;
            }
            return true;
        }
    }
}
