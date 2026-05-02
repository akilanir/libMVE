package ezvcard.io.text;

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
import java.io.FileWriter;
import java.io.Flushable;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.LinkedList;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/text/VCardWriter.class */
public class VCardWriter extends StreamWriter implements Flushable {
    private final VCardRawWriter writer;
    private final LinkedList<Boolean> prodIdStack;

    public VCardWriter(OutputStream out, VCardVersion targetVersion) {
        this(targetVersion == VCardVersion.V4_0 ? IOUtils.utf8Writer(out) : new OutputStreamWriter(out), targetVersion);
    }

    public VCardWriter(File file, VCardVersion targetVersion) throws IOException {
        this(file, false, targetVersion);
    }

    public VCardWriter(File file, boolean append, VCardVersion targetVersion) throws IOException {
        this(targetVersion == VCardVersion.V4_0 ? IOUtils.utf8Writer(file, append) : new FileWriter(file, append), targetVersion);
    }

    public VCardWriter(Writer writer, VCardVersion targetVersion) {
        this.prodIdStack = new LinkedList<>();
        this.writer = new VCardRawWriter(writer, targetVersion);
    }

    public VCardRawWriter getRawWriter() {
        return this.writer;
    }

    @Override // ezvcard.io.StreamWriter
    public VCardVersion getTargetVersion() {
        return this.writer.getVersion();
    }

    public void setTargetVersion(VCardVersion targetVersion) {
        this.writer.setVersion(targetVersion);
    }

    public boolean isCaretEncodingEnabled() {
        return this.writer.isCaretEncodingEnabled();
    }

    public void setCaretEncodingEnabled(boolean enable) {
        this.writer.setCaretEncodingEnabled(enable);
    }

    @Override // ezvcard.io.StreamWriter
    protected void _write(VCard vcard, List<VCardProperty> propertiesToAdd) throws IOException {
        VCardDataType defaultDataType;
        VCardVersion targetVersion = getTargetVersion();
        this.writer.writeBeginComponent("VCARD");
        this.writer.writeVersion();
        for (VCardProperty property : propertiesToAdd) {
            VCardPropertyScribe scribe = this.index.getPropertyScribe(property);
            String value = null;
            VCard nestedVCard = null;
            try {
                value = scribe.writeText(property, targetVersion);
            } catch (EmbeddedVCardException e) {
                nestedVCard = e.getVCard();
            } catch (SkipMeException e2) {
            }
            VCardParameters parameters = scribe.prepareParameters(property, targetVersion, vcard);
            if (nestedVCard != null) {
                if (targetVersion == VCardVersion.V2_1) {
                    this.writer.writeProperty(property.getGroup(), scribe.getPropertyName(), parameters, value);
                    this.prodIdStack.add(Boolean.valueOf(this.addProdId));
                    this.addProdId = false;
                    write(nestedVCard);
                    this.addProdId = this.prodIdStack.removeLast().booleanValue();
                } else {
                    StringWriter sw = new StringWriter();
                    VCardWriter agentWriter = new VCardWriter(sw, targetVersion);
                    agentWriter.getRawWriter().getFoldedLineWriter().setLineLength(null);
                    agentWriter.getRawWriter().getFoldedLineWriter().setNewline("\n");
                    agentWriter.setAddProdId(false);
                    agentWriter.setVersionStrict(this.versionStrict);
                    try {
                        agentWriter.write(nestedVCard);
                        IOUtils.closeQuietly(agentWriter);
                    } catch (IOException e3) {
                        IOUtils.closeQuietly(agentWriter);
                    } catch (Throwable th) {
                        IOUtils.closeQuietly(agentWriter);
                        throw th;
                    }
                    String vCardStr = sw.toString();
                    this.writer.writeProperty(property.getGroup(), scribe.getPropertyName(), parameters, VCardPropertyScribe.escape(vCardStr));
                }
            } else if (value != null) {
                VCardDataType dataType = scribe.dataType(property, targetVersion);
                if (dataType != null && dataType != (defaultDataType = scribe.defaultDataType(targetVersion)) && (defaultDataType != VCardDataType.DATE_AND_OR_TIME || (dataType != VCardDataType.DATE && dataType != VCardDataType.DATE_TIME && dataType != VCardDataType.TIME))) {
                    parameters.setValue(dataType);
                }
                this.writer.writeProperty(property.getGroup(), scribe.getPropertyName(), parameters, value);
            }
        }
        this.writer.writeEndComponent("VCARD");
    }

    @Override // java.io.Flushable
    public void flush() throws IOException {
        this.writer.flush();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.writer.close();
    }
}
