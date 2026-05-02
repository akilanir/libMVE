package org.kore.kolab.notes.v3;

import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.TimeZone;
import org.kore.kolab.notes.Attachment;
import org.kore.kolab.notes.AuditInformation;
import org.kore.kolab.notes.Color;
import org.kore.kolab.notes.Identification;
import org.kore.kolab.notes.Note;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/v3/KolabNotesXMLBuilder.class */
public final class KolabNotesXMLBuilder {
    private final StringBuilder builder = new StringBuilder("<?xml version=\"1.0\" encoding=\"UTF-8\"?><note xmlns=\"http://kolab.org\" version=\"3.0\">");

    public KolabNotesXMLBuilder withIdentification(Identification id) {
        this.builder.append("<uid>");
        this.builder.append(id.getUid());
        this.builder.append("</uid>");
        this.builder.append("<prodid>");
        this.builder.append(id.getProductId());
        this.builder.append("</prodid>");
        return this;
    }

    public KolabNotesXMLBuilder withAuditInformation(AuditInformation id) {
        this.builder.append("<creation-date>");
        String creation = createTimestampString(id.getCreationDate());
        this.builder.append(creation);
        this.builder.append("</creation-date>");
        this.builder.append("<last-modification-date>");
        String modification = createTimestampString(id.getLastModificationDate());
        this.builder.append(modification);
        this.builder.append("</last-modification-date>");
        return this;
    }

    String createTimestampString(Date date) {
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
        calendar.setTime(date);
        return String.format("%1$04d", Integer.valueOf(calendar.get(1))) + '-' + String.format("%1$02d", Integer.valueOf(calendar.get(2) + 1)) + '-' + String.format("%1$02d", Integer.valueOf(calendar.get(5))) + 'T' + String.format("%1$02d", Integer.valueOf(calendar.get(11))) + ':' + String.format("%1$02d", Integer.valueOf(calendar.get(12))) + ':' + String.format("%1$02d", Integer.valueOf(calendar.get(13))) + 'Z';
    }

    public KolabNotesXMLBuilder withClassification(Note.Classification classification) {
        this.builder.append("<classification>");
        this.builder.append(classification.name());
        this.builder.append("</classification>");
        return this;
    }

    public KolabNotesXMLBuilder withSummary(String summray) {
        if (summray != null) {
            this.builder.append("<summary>");
            this.builder.append(summray);
            this.builder.append("</summary>");
        } else {
            this.builder.append("<summary/>");
        }
        return this;
    }

    public KolabNotesXMLBuilder withAttachments(Collection<Attachment> attachments) {
        for (Attachment attachment : attachments) {
            this.builder.append("<attachment>");
            this.builder.append("<parameters>");
            this.builder.append("<fmttype>");
            this.builder.append(attachment.getMimeType());
            this.builder.append("</fmttype>");
            this.builder.append("<x-label>");
            this.builder.append(attachment.getFileName());
            this.builder.append("</x-label>");
            this.builder.append("</parameters>");
            this.builder.append("<uri>");
            this.builder.append("cid:");
            this.builder.append(attachment.getId());
            this.builder.append("</uri>");
            this.builder.append("</attachment>");
        }
        return this;
    }

    public KolabNotesXMLBuilder withDescription(String desc) {
        if (desc != null) {
            this.builder.append("<description>");
            String correct = desc.replaceAll(">", "&gt;").replaceAll("<", "&lt;").replaceAll("&nbsp;", " ");
            this.builder.append(correct);
            this.builder.append("</description>");
        } else {
            this.builder.append("<description/>");
        }
        return this;
    }

    public KolabNotesXMLBuilder withColor(Color color) {
        if (color != null) {
            this.builder.append("<color>");
            this.builder.append(color.getHexcode());
            this.builder.append("</color>");
        } else {
            this.builder.append("<color/>");
        }
        return this;
    }

    public String build() {
        return this.builder.append("</note>").toString();
    }
}
