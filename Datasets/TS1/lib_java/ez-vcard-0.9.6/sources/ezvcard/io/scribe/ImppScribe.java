package ezvcard.io.scribe;

import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.CannotParseException;
import ezvcard.io.html.HCardElement;
import ezvcard.io.json.JCardValue;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.Impp;
import ezvcard.property.VCardProperty;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/ImppScribe.class */
public class ImppScribe extends VCardPropertyScribe<Impp> {
    public static final String AIM = "aim";
    public static final String ICQ = "icq";
    public static final String IRC = "irc";
    public static final String MSN = "msnim";
    public static final String SIP = "sip";
    public static final String SKYPE = "skype";
    public static final String XMPP = "xmpp";
    public static final String YAHOO = "ymsgr";
    private static final List<HtmlLinkFormat> htmlLinkFormats;

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseJson(JCardValue x0, VCardDataType x1, VCardParameters x2, List x3) {
        return _parseJson(x0, x1, x2, (List<String>) x3);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseHtml(HCardElement x0, List x1) {
        return _parseHtml(x0, (List<String>) x1);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseXml(XCardElement x0, VCardParameters x1, List x2) {
        return _parseXml(x0, x1, (List<String>) x2);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseText(String x0, VCardDataType x1, VCardVersion x2, VCardParameters x3, List x4) {
        return _parseText(x0, x1, x2, x3, (List<String>) x4);
    }

    public ImppScribe() {
        super(Impp.class, "IMPP");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        return VCardDataType.URI;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(Impp property, VCardVersion version) {
        return write(property);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Impp _parseText(String value, VCardDataType dataType, VCardVersion version, VCardParameters parameters, List<String> warnings) {
        return parse(unescape(value));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _writeXml(Impp property, XCardElement parent) {
        parent.append(VCardDataType.URI, write(property));
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Impp _parseXml(XCardElement element, VCardParameters parameters, List<String> warnings) {
        String value = element.first(VCardDataType.URI);
        if (value != null) {
            return parse(value);
        }
        throw missingXmlElements(VCardDataType.URI);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Impp _parseHtml(HCardElement element, List<String> warnings) {
        String href = element.attr("href");
        if (href.length() == 0) {
            href = element.value();
        }
        try {
            URI uri = parseHtmlLink(href);
            if (uri == null) {
                throw new IllegalArgumentException();
            }
            return new Impp(uri);
        } catch (IllegalArgumentException e) {
            throw new CannotParseException(14, href);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public JCardValue _writeJson(Impp property) {
        return JCardValue.single(write(property));
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Impp _parseJson(JCardValue value, VCardDataType dataType, VCardParameters parameters, List<String> warnings) {
        return parse(value.asSingle());
    }

    private String write(Impp property) {
        URI uri = property.getUri();
        return uri == null ? "" : uri.toString();
    }

    private Impp parse(String value) {
        if (value == null || value.length() == 0) {
            return new Impp((URI) null);
        }
        try {
            return new Impp(value);
        } catch (IllegalArgumentException e) {
            throw new CannotParseException(15, value, e.getMessage());
        }
    }

    static {
        List<HtmlLinkFormat> list = new ArrayList<>();
        list.add(new HtmlLinkFormat(AIM, "(goim|addbuddy)\\?.*?\\bscreenname=(.*?)(&|$)", 2, "goim?screenname=%s"));
        list.add(new HtmlLinkFormat(YAHOO, "(sendim|addfriend|sendfile|call)\\?(.*)", 2, "sendim?%s"));
        list.add(new HtmlLinkFormat(SKYPE, "(.*?)(\\?|$)", 1, "%s"));
        list.add(new HtmlLinkFormat(MSN, "(chat|add|voice|video)\\?contact=(.*?)(&|$)", 2, "chat?contact=%s"));
        list.add(new HtmlLinkFormat(XMPP, "(.*?)(\\?|$)", 1, "%s?message"));
        list.add(new HtmlLinkFormat(ICQ, "message\\?uin=(\\d+)", 1, "message?uin=%s"));
        list.add(new HtmlLinkFormat(SIP));
        list.add(new HtmlLinkFormat(IRC));
        htmlLinkFormats = Collections.unmodifiableList(list);
    }

    public URI parseHtmlLink(String linkUri) {
        for (HtmlLinkFormat format : htmlLinkFormats) {
            String handle = format.parseHandle(linkUri);
            if (handle != null) {
                try {
                    return new URI(format.getProtocol(), handle, null);
                } catch (URISyntaxException e) {
                    throw new IllegalArgumentException(e);
                }
            }
        }
        return null;
    }

    public String writeHtmlLink(Impp property) {
        URI uri = property.getUri();
        if (uri == null) {
            return null;
        }
        String protocol = uri.getScheme();
        String handle = uri.getSchemeSpecificPart();
        for (HtmlLinkFormat format : htmlLinkFormats) {
            if (protocol.equals(format.getProtocol())) {
                return format.buildLink(handle);
            }
        }
        return uri.toString();
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/ImppScribe$HtmlLinkFormat.class */
    private static class HtmlLinkFormat {
        private final Pattern parseRegex;
        private final String protocol;
        private final int handleGroup;
        private final String linkFormat;

        public HtmlLinkFormat(String protocol) {
            this(protocol, "(.*)", 1, "%s");
        }

        public HtmlLinkFormat(String protocol, String linkRegex, int handleGroup, String linkFormat) {
            this.parseRegex = Pattern.compile('^' + protocol + ':' + linkRegex, 2);
            this.protocol = protocol;
            this.handleGroup = handleGroup;
            this.linkFormat = protocol + ':' + linkFormat;
        }

        public String parseHandle(String linkUri) {
            Matcher m = this.parseRegex.matcher(linkUri);
            if (m.find()) {
                return m.group(this.handleGroup);
            }
            return null;
        }

        public String buildLink(String handle) {
            return String.format(this.linkFormat, handle);
        }

        public String getProtocol() {
            return this.protocol;
        }
    }
}
