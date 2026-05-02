package ezvcard.io.scribe;

import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.CannotParseException;
import ezvcard.io.json.JCardValue;
import ezvcard.io.scribe.VCardPropertyScribe;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.ClientPidMap;
import ezvcard.property.VCardProperty;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/ClientPidMapScribe.class */
public class ClientPidMapScribe extends VCardPropertyScribe<ClientPidMap> {
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseJson(JCardValue x0, VCardDataType x1, VCardParameters x2, List x3) {
        return _parseJson(x0, x1, x2, (List<String>) x3);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseXml(XCardElement x0, VCardParameters x1, List x2) {
        return _parseXml(x0, x1, (List<String>) x2);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseText(String x0, VCardDataType x1, VCardVersion x2, VCardParameters x3, List x4) {
        return _parseText(x0, x1, x2, x3, (List<String>) x4);
    }

    public ClientPidMapScribe() {
        super(ClientPidMap.class, "CLIENTPIDMAP");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        return VCardDataType.TEXT;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(ClientPidMap property, VCardVersion version) {
        return structured(property.getPid(), property.getUri());
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected ClientPidMap _parseText(String value, VCardDataType dataType, VCardVersion version, VCardParameters parameters, List<String> warnings) {
        VCardPropertyScribe.SemiStructuredIterator it = semistructured(value, 2);
        String pid = it.next();
        String uri = it.next();
        if (pid == null || uri == null) {
            throw new CannotParseException(3, new Object[0]);
        }
        return parse(pid, uri);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _writeXml(ClientPidMap property, XCardElement parent) {
        Integer pid = property.getPid();
        parent.append("sourceid", pid == null ? "" : pid.toString());
        parent.append(VCardDataType.URI, property.getUri());
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected ClientPidMap _parseXml(XCardElement element, VCardParameters parameters, List<String> warnings) {
        String sourceid = element.first("sourceid");
        String uri = element.first(VCardDataType.URI);
        if (uri == null && sourceid == null) {
            throw missingXmlElements(VCardDataType.URI.getName().toLowerCase(), "sourceid");
        }
        if (uri == null) {
            throw missingXmlElements(VCardDataType.URI);
        }
        if (sourceid == null) {
            throw missingXmlElements("sourceid");
        }
        return parse(sourceid, uri);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public JCardValue _writeJson(ClientPidMap property) {
        return JCardValue.structured(property.getPid(), property.getUri());
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected ClientPidMap _parseJson(JCardValue value, VCardDataType dataType, VCardParameters parameters, List<String> warnings) {
        VCardPropertyScribe.StructuredIterator it = structured(value);
        String pid = it.nextString();
        String uri = it.nextString();
        return parse(pid, uri);
    }

    private ClientPidMap parse(String pid, String uri) {
        try {
            return new ClientPidMap(Integer.valueOf(Integer.parseInt(pid)), uri);
        } catch (NumberFormatException e) {
            throw new CannotParseException(4, new Object[0]);
        }
    }
}
