package ezvcard.io.scribe;

import ezvcard.Messages;
import ezvcard.VCard;
import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.EmbeddedVCardException;
import ezvcard.io.SkipMeException;
import ezvcard.io.html.HCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.Agent;
import ezvcard.property.VCardProperty;
import java.util.List;
import java.util.Set;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/AgentScribe.class */
public class AgentScribe extends VCardPropertyScribe<Agent> {
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseHtml(HCardElement x0, List x1) {
        return _parseHtml(x0, (List<String>) x1);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseText(String x0, VCardDataType x1, VCardVersion x2, VCardParameters x3, List x4) {
        return _parseText(x0, x1, x2, x3, (List<String>) x4);
    }

    public AgentScribe() {
        super(Agent.class, "AGENT");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public VCardDataType _dataType(Agent property, VCardVersion version) {
        if (property.getUrl() != null) {
            return version == VCardVersion.V2_1 ? VCardDataType.URL : VCardDataType.URI;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(Agent property, VCardVersion version) {
        String url = property.getUrl();
        if (url != null) {
            return url;
        }
        VCard vcard = property.getVCard();
        if (vcard != null) {
            throw new EmbeddedVCardException(vcard);
        }
        throw new SkipMeException(Messages.INSTANCE.getValidationWarning(8, new Object[0]));
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Agent _parseText(String value, VCardDataType dataType, VCardVersion version, VCardParameters parameters, List<String> warnings) {
        Agent property = new Agent();
        if (dataType == null) {
            throw new EmbeddedVCardException(new Injector(property));
        }
        property.setUrl(unescape(value));
        return property;
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Agent _parseHtml(HCardElement element, List<String> warnings) {
        Agent property = new Agent();
        Set<String> classes = element.classNames();
        if (classes.contains("vcard")) {
            throw new EmbeddedVCardException(new Injector(property));
        }
        String url = element.absUrl("href");
        if (url.length() == 0) {
            url = element.value();
        }
        property.setUrl(url);
        return property;
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/AgentScribe$Injector.class */
    private static class Injector implements EmbeddedVCardException.InjectionCallback {
        private final Agent property;

        public Injector(Agent property) {
            this.property = property;
        }

        @Override // ezvcard.io.EmbeddedVCardException.InjectionCallback
        public void injectVCard(VCard vcard) {
            this.property.setVCard(vcard);
        }

        @Override // ezvcard.io.EmbeddedVCardException.InjectionCallback
        public VCardProperty getProperty() {
            return this.property;
        }
    }
}
