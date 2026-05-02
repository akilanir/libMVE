package org.kore.kolab.notes.v3;

import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Serializable;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import korex.mail.internet.AsciiOutputStream;
import org.kore.kolab.notes.KolabParser;
import org.kore.kolab.notes.Note;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/v3/KolabNotesParserV3.class */
public class KolabNotesParserV3 implements KolabParser, Serializable {
    @Override // org.kore.kolab.notes.KolabParser
    public Note parse(InputStream stream) {
        try {
            SAXParser saxParser = SAXParserFactory.newInstance().newSAXParser();
            KolabNotesHandler handler = new KolabNotesHandler();
            saxParser.parse(stream, handler);
            return handler.getNote();
        } catch (Exception e) {
            throw new KolabParseException(e);
        }
    }

    @Override // org.kore.kolab.notes.KolabParser
    public void write(Object object, OutputStream stream) {
        try {
            Note note = (Note) object;
            String xml = new KolabNotesXMLBuilder().withIdentification(note.getIdentification()).withAuditInformation(note.getAuditInformation()).withClassification(note.getClassification()).withAttachments(note.getAttachments()).withSummary(note.getSummary()).withDescription(note.getDescription()).withColor(note.getColor()).build();
            if (stream instanceof AsciiOutputStream) {
                ((AsciiOutputStream) stream).disableBreakOnNonAscii();
            }
            OutputStreamWriter outputStreamWriter = new OutputStreamWriter(stream);
            outputStreamWriter.append((CharSequence) xml);
            outputStreamWriter.flush();
        } catch (Exception e) {
            throw new KolabParseException(e);
        }
    }
}
