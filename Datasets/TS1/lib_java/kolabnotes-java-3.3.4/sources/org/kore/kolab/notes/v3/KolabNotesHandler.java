package org.kore.kolab.notes.v3;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Calendar;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.TimeZone;
import org.kore.kolab.notes.Attachment;
import org.kore.kolab.notes.AuditInformation;
import org.kore.kolab.notes.Color;
import org.kore.kolab.notes.Colors;
import org.kore.kolab.notes.Identification;
import org.kore.kolab.notes.Note;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/v3/KolabNotesHandler.class */
public class KolabNotesHandler extends DefaultHandler {
    private String currentValue = "";
    private final NoteBuilder builder = new NoteBuilder();
    private StringBuilder completeValue = new StringBuilder();

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        this.completeValue = new StringBuilder();
    }

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
    public void characters(char[] ch, int start, int length) throws SAXException {
        this.completeValue.append(new String(ch, start, length));
    }

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
    public void endElement(String uri, String localName, String qName) throws SAXException {
        try {
            if (qName.contains("attachment")) {
                this.builder.addAttachment();
            } else {
                this.builder.setValue(qName, this.completeValue.toString());
            }
        } catch (ParseException e) {
            throw new KolabParseException(e);
        }
    }

    public Note getNote() {
        return this.builder.build();
    }

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder.class */
    class NoteBuilder {
        private String uid;
        private String productId;
        private Timestamp creationDate;
        private Timestamp lastModificationDate;
        private Note.Classification classification;
        private String summary;
        private String description;
        private Color color;
        private Set<Attachment> attachments = new LinkedHashSet();
        private String xlabel;
        private String fmttype;
        private String uri;

        NoteBuilder() {
        }

        void addAttachment() {
            this.attachments.add(new Attachment(this.uri, this.xlabel, this.fmttype));
        }

        void setValue(String name, String value) throws ParseException {
            if ("uid".contains(name)) {
                this.uid = value;
                return;
            }
            if ("prodid".contains(name)) {
                this.productId = value;
                return;
            }
            if ("creation-date".contains(name)) {
                this.creationDate = convertTimestamp(value);
                return;
            }
            if ("last-modification-date".contains(name)) {
                this.lastModificationDate = convertTimestamp(value);
                return;
            }
            if ("classification".contains(name)) {
                this.classification = Note.Classification.valueOf(value.toUpperCase());
                return;
            }
            if ("summary".contains(name)) {
                this.summary = value;
                return;
            }
            if ("description".contains(name)) {
                this.description = value;
                return;
            }
            if ("color".contains(name)) {
                this.color = Colors.getColor(value);
                return;
            }
            if ("fmttype".contains(name)) {
                this.fmttype = value.trim();
            } else if ("uri".contains(name)) {
                this.uri = value.substring(value.indexOf(":") + 1);
            } else if ("x-label".contains(name)) {
                this.xlabel = value.trim();
            }
        }

        Note build() {
            Identification id = new Identification(this.uid, this.productId);
            AuditInformation auditInformation = new AuditInformation(this.creationDate, this.lastModificationDate);
            Note note = new Note(id, auditInformation, this.classification, this.summary);
            note.setDescription(this.description);
            note.setSummary(this.summary);
            note.setColor(this.color);
            note.addAttachments((Attachment[]) this.attachments.toArray(new Attachment[this.attachments.size()]));
            return note;
        }

        Timestamp convertTimestamp(String value) throws ParseException {
            Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
            calendar.set(1, Integer.valueOf(value.substring(0, 4)).intValue());
            calendar.set(2, Integer.valueOf(value.substring(5, 7)).intValue() - 1);
            calendar.set(5, Integer.valueOf(value.substring(8, 10)).intValue());
            calendar.set(11, Integer.valueOf(value.substring(11, 13)).intValue());
            calendar.set(12, Integer.valueOf(value.substring(14, 16)).intValue());
            if (value.length() < 19) {
                calendar.set(13, Integer.valueOf(value.substring(17)).intValue());
            } else {
                calendar.set(13, Integer.valueOf(value.substring(17, 19)).intValue());
            }
            return new Timestamp(calendar.getTimeInMillis());
        }
    }
}
