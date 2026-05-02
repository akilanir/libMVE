package ezvcard.io.json;

import ezvcard.VCard;
import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.EmbeddedVCardException;
import ezvcard.io.SkipMeException;
import ezvcard.io.StreamWriter;
import ezvcard.io.scribe.VCardPropertyScribe;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.VCardProperty;
import ezvcard.util.IOUtils;
import java.io.File;
import java.io.Flushable;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Writer;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/json/JCardWriter.class */
public class JCardWriter extends StreamWriter implements Flushable {
    private final JCardRawWriter writer;
    private final VCardVersion targetVersion;

    public JCardWriter(OutputStream out) {
        this(IOUtils.utf8Writer(out));
    }

    public JCardWriter(OutputStream out, boolean wrapInArray) {
        this(IOUtils.utf8Writer(out), wrapInArray);
    }

    public JCardWriter(File file) throws IOException {
        this(IOUtils.utf8Writer(file));
    }

    public JCardWriter(File file, boolean wrapInArray) throws IOException {
        this(IOUtils.utf8Writer(file), wrapInArray);
    }

    public JCardWriter(Writer writer) {
        this(writer, false);
    }

    public JCardWriter(Writer writer, boolean wrapInArray) {
        this.targetVersion = VCardVersion.V4_0;
        this.writer = new JCardRawWriter(writer, wrapInArray);
    }

    @Override // ezvcard.io.StreamWriter
    protected void _write(VCard vcard, List<VCardProperty> properties) throws IOException {
        this.writer.writeStartVCard();
        this.writer.writeProperty("version", VCardDataType.TEXT, JCardValue.single(this.targetVersion.getVersion()));
        for (VCardProperty property : properties) {
            VCardPropertyScribe scribe = this.index.getPropertyScribe(property);
            try {
                JCardValue value = scribe.writeJson(property);
                String group = property.getGroup();
                String name = scribe.getPropertyName().toLowerCase();
                VCardParameters parameters = scribe.prepareParameters(property, this.targetVersion, vcard);
                VCardDataType dataType = scribe.dataType(property, this.targetVersion);
                this.writer.writeProperty(group, name, parameters, dataType, value);
            } catch (EmbeddedVCardException e) {
            } catch (SkipMeException e2) {
            }
        }
        this.writer.writeEndVCard();
    }

    @Override // ezvcard.io.StreamWriter
    protected VCardVersion getTargetVersion() {
        return this.targetVersion;
    }

    public boolean isIndent() {
        return this.writer.isIndent();
    }

    public void setIndent(boolean indent) {
        this.writer.setIndent(indent);
    }

    @Override // java.io.Flushable
    public void flush() throws IOException {
        this.writer.flush();
    }

    public void closeJsonStream() throws IOException {
        this.writer.closeJsonStream();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.writer.close();
    }
}
