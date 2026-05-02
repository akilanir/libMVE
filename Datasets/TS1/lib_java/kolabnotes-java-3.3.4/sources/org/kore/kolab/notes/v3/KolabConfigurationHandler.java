package org.kore.kolab.notes.v3;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Calendar;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.TimeZone;
import org.kore.kolab.notes.AuditInformation;
import org.kore.kolab.notes.Colors;
import org.kore.kolab.notes.Identification;
import org.kore.kolab.notes.Tag;
import org.kore.kolab.notes.imap.RemoteTags;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/v3/KolabConfigurationHandler.class */
public class KolabConfigurationHandler extends DefaultHandler {
    private String currentValue = "";
    private final TagDetailBuilder builder = new TagDetailBuilder();
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
            this.builder.setValue(qName, this.completeValue.toString());
        } catch (ParseException e) {
            throw new KolabParseException(e);
        }
    }

    public RemoteTags.TagDetails getTag() {
        return this.builder.build();
    }

    /* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder.class */
    class TagDetailBuilder {
        private String uid;
        private String productId;
        private Timestamp creationDate;
        private Timestamp lastModificationDate;
        private final Set<String> members = new LinkedHashSet();
        private String name;
        private String type;
        private String relationType;
        private int priority;
        private String color;

        TagDetailBuilder() {
        }

        void setValue(String name, String value) throws ParseException {
            if ("uid".equals(name)) {
                this.uid = value;
                return;
            }
            if ("prodid".equals(name)) {
                this.productId = value;
                return;
            }
            if ("creation-date".equals(name)) {
                this.creationDate = convertTimestamp(value);
                return;
            }
            if ("last-modification-date".equals(name)) {
                this.lastModificationDate = convertTimestamp(value);
                return;
            }
            if ("priority".equals(name)) {
                this.priority = (value == null || value.trim().length() == 0) ? 0 : Integer.valueOf(value).intValue();
                return;
            }
            if ("type".equals(name)) {
                this.type = value;
                return;
            }
            if ("relationType".equals(name)) {
                this.relationType = value;
                return;
            }
            if ("name".equals(name)) {
                this.name = value;
                return;
            }
            if ("color".equals(name)) {
                this.color = value;
            } else if ("member".equals(name)) {
                if (value.startsWith("urn:uuid:")) {
                    this.members.add(value.substring(9));
                } else {
                    this.members.add(value);
                }
            }
        }

        RemoteTags.TagDetails build() {
            Identification id = new Identification(this.uid, this.productId);
            AuditInformation auditInformation = new AuditInformation(this.creationDate, this.lastModificationDate);
            Tag tag = new Tag(id, auditInformation);
            tag.setPriority(this.priority);
            tag.setName(this.name);
            tag.setColor(Colors.getColor(this.color));
            RemoteTags.TagDetails tagdetail = new RemoteTags.TagDetails(id, auditInformation, tag, this.members);
            if (RemoteTags.RELATION_TYPE.equalsIgnoreCase(this.relationType) && RemoteTags.TYPE.equalsIgnoreCase(this.type)) {
                return tagdetail;
            }
            return null;
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
