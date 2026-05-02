package ezvcard;

import ezvcard.io.StreamReader;
import ezvcard.io.html.HCardPage;
import ezvcard.io.html.HCardParser;
import ezvcard.io.json.JCardReader;
import ezvcard.io.json.JCardWriter;
import ezvcard.io.scribe.ScribeIndex;
import ezvcard.io.scribe.VCardPropertyScribe;
import ezvcard.io.text.VCardReader;
import ezvcard.io.text.VCardWriter;
import ezvcard.io.xml.XCardDocument;
import ezvcard.property.VCardProperty;
import ezvcard.util.IOUtils;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Properties;
import javax.xml.transform.TransformerException;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard.class */
public class Ezvcard {
    public static final String VERSION;
    public static final String URL;

    static {
        InputStream in = null;
        try {
            try {
                in = Ezvcard.class.getResourceAsStream("/ez-vcard.properties");
                Properties props = new Properties();
                props.load(in);
                VERSION = props.getProperty("version");
                URL = props.getProperty("url");
                IOUtils.closeQuietly(in);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } catch (Throwable th) {
            IOUtils.closeQuietly(in);
            throw th;
        }
    }

    public static ParserChainTextString parse(String str) {
        return new ParserChainTextString(str);
    }

    public static ParserChainTextReader parse(File file) {
        return new ParserChainTextReader(file);
    }

    public static ParserChainTextReader parse(InputStream in) {
        return parse(new InputStreamReader(in));
    }

    public static ParserChainTextReader parse(Reader reader) {
        return new ParserChainTextReader(reader);
    }

    public static ParserChainXmlString parseXml(String xml) {
        return new ParserChainXmlString(xml);
    }

    public static ParserChainXmlReader parseXml(File file) {
        return new ParserChainXmlReader(file);
    }

    public static ParserChainXmlReader parseXml(InputStream in) {
        return new ParserChainXmlReader(in);
    }

    public static ParserChainXmlReader parseXml(Reader reader) {
        return new ParserChainXmlReader(reader);
    }

    public static ParserChainXmlDom parseXml(Document document) {
        return new ParserChainXmlDom(document);
    }

    public static ParserChainHtmlString parseHtml(String html) {
        return new ParserChainHtmlString(html);
    }

    public static ParserChainHtmlReader parseHtml(File file) {
        return new ParserChainHtmlReader(file);
    }

    public static ParserChainHtmlReader parseHtml(InputStream in) {
        return parseHtml(new InputStreamReader(in));
    }

    public static ParserChainHtmlReader parseHtml(Reader reader) {
        return new ParserChainHtmlReader(reader);
    }

    public static ParserChainHtmlReader parseHtml(URL url) {
        return new ParserChainHtmlReader(url);
    }

    public static ParserChainJsonString parseJson(String json) {
        return new ParserChainJsonString(json);
    }

    public static ParserChainJsonReader parseJson(File file) {
        return new ParserChainJsonReader(file);
    }

    public static ParserChainJsonReader parseJson(InputStream in) {
        return new ParserChainJsonReader(in);
    }

    public static ParserChainJsonReader parseJson(Reader reader) {
        return new ParserChainJsonReader(reader);
    }

    public static WriterChainText write(VCard... vcards) {
        return write(Arrays.asList(vcards));
    }

    public static WriterChainText write(Collection<VCard> vcards) {
        return new WriterChainText(vcards);
    }

    public static WriterChainXml writeXml(VCard... vcards) {
        return writeXml(Arrays.asList(vcards));
    }

    public static WriterChainXml writeXml(Collection<VCard> vcards) {
        return new WriterChainXml(vcards);
    }

    public static WriterChainHtml writeHtml(VCard... vcards) {
        return writeHtml(Arrays.asList(vcards));
    }

    public static WriterChainHtml writeHtml(Collection<VCard> vcards) {
        return new WriterChainHtml(vcards);
    }

    public static WriterChainJson writeJson(VCard... vcards) {
        return writeJson(Arrays.asList(vcards));
    }

    public static WriterChainJson writeJson(Collection<VCard> vcards) {
        return new WriterChainJson(vcards);
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$ParserChain.class */
    static abstract class ParserChain<T> {
        List<List<String>> warnings;
        final ScribeIndex index = new ScribeIndex();
        final T this_ = this;

        public abstract VCard first() throws IOException, SAXException;

        public abstract List<VCard> all() throws IOException, SAXException;

        /* JADX WARN: Multi-variable type inference failed */
        ParserChain() {
        }

        public T register(VCardPropertyScribe<? extends VCardProperty> scribe) {
            this.index.register(scribe);
            return this.this_;
        }

        public T warnings(List<List<String>> warnings) {
            this.warnings = warnings;
            return this.this_;
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$ParserChainText.class */
    static abstract class ParserChainText<T> extends ParserChain<T> {
        boolean caretDecoding;
        final boolean closeWhenDone;

        abstract VCardReader _constructReader() throws IOException;

        private ParserChainText(boolean closeWhenDone) {
            this.caretDecoding = true;
            this.closeWhenDone = closeWhenDone;
        }

        public T caretDecoding(boolean enable) {
            this.caretDecoding = enable;
            return this.this_;
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public VCard first() throws IOException {
            VCardReader parser = constructReader();
            try {
                VCard vcard = parser.readNext();
                if (this.warnings != null) {
                    this.warnings.add(parser.getWarnings());
                }
                return vcard;
            } finally {
                if (this.closeWhenDone) {
                    IOUtils.closeQuietly(parser);
                }
            }
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public List<VCard> all() throws IOException {
            VCardReader parser = constructReader();
            try {
                List<VCard> vcards = new ArrayList<>();
                while (true) {
                    VCard vcard = parser.readNext();
                    if (vcard == null) {
                        break;
                    }
                    if (this.warnings != null) {
                        this.warnings.add(parser.getWarnings());
                    }
                    vcards.add(vcard);
                }
                return vcards;
            } finally {
                if (this.closeWhenDone) {
                    IOUtils.closeQuietly(parser);
                }
            }
        }

        private VCardReader constructReader() throws IOException {
            VCardReader parser = _constructReader();
            parser.setScribeIndex(this.index);
            parser.setCaretDecodingEnabled(this.caretDecoding);
            return parser;
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$ParserChainTextReader.class */
    public static class ParserChainTextReader extends ParserChainText<ParserChainTextReader> {
        private final Reader reader;
        private final File file;

        @Override // ezvcard.Ezvcard.ParserChainText, ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ List all() throws IOException {
            return super.all();
        }

        @Override // ezvcard.Ezvcard.ParserChainText, ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ VCard first() throws IOException {
            return super.first();
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object warnings(List x0) {
            return warnings((List<List<String>>) x0);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object register(VCardPropertyScribe x0) {
            return register((VCardPropertyScribe<? extends VCardProperty>) x0);
        }

        private ParserChainTextReader(Reader reader) {
            super(false);
            this.reader = reader;
            this.file = null;
        }

        private ParserChainTextReader(File file) {
            super(true);
            this.reader = null;
            this.file = file;
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainTextReader register(VCardPropertyScribe<? extends VCardProperty> scribe) {
            return (ParserChainTextReader) super.register(scribe);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainTextReader warnings(List<List<String>> warnings) {
            return (ParserChainTextReader) super.warnings(warnings);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // ezvcard.Ezvcard.ParserChainText
        public ParserChainTextReader caretDecoding(boolean enable) {
            return (ParserChainTextReader) super.caretDecoding(enable);
        }

        @Override // ezvcard.Ezvcard.ParserChainText
        VCardReader _constructReader() throws IOException {
            return this.reader != null ? new VCardReader(this.reader) : new VCardReader(this.file);
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$ParserChainTextString.class */
    public static class ParserChainTextString extends ParserChainText<ParserChainTextString> {
        private final String text;

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object warnings(List x0) {
            return warnings((List<List<String>>) x0);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object register(VCardPropertyScribe x0) {
            return register((VCardPropertyScribe<? extends VCardProperty>) x0);
        }

        private ParserChainTextString(String text) {
            super(false);
            this.text = text;
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainTextString register(VCardPropertyScribe<? extends VCardProperty> scribe) {
            return (ParserChainTextString) super.register(scribe);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainTextString warnings(List<List<String>> warnings) {
            return (ParserChainTextString) super.warnings(warnings);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // ezvcard.Ezvcard.ParserChainText
        public ParserChainTextString caretDecoding(boolean enable) {
            return (ParserChainTextString) super.caretDecoding(enable);
        }

        @Override // ezvcard.Ezvcard.ParserChainText
        VCardReader _constructReader() {
            return new VCardReader(this.text);
        }

        @Override // ezvcard.Ezvcard.ParserChainText, ezvcard.Ezvcard.ParserChain
        public VCard first() {
            try {
                return super.first();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        @Override // ezvcard.Ezvcard.ParserChainText, ezvcard.Ezvcard.ParserChain
        public List<VCard> all() {
            try {
                return super.all();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$ParserChainXml.class */
    static abstract class ParserChainXml<T> extends ParserChain<T> {
        abstract XCardDocument _constructDocument() throws IOException, SAXException;

        ParserChainXml() {
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public VCard first() throws IOException, SAXException {
            StreamReader reader = constructStreamReader();
            VCard vcard = reader.readNext();
            if (this.warnings != null) {
                this.warnings.add(reader.getWarnings());
            }
            return vcard;
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public List<VCard> all() throws IOException, SAXException {
            List<VCard> vcards = new ArrayList<>();
            StreamReader reader = constructStreamReader();
            while (true) {
                VCard vcard = reader.readNext();
                if (vcard != null) {
                    vcards.add(vcard);
                    if (this.warnings != null) {
                        this.warnings.add(reader.getWarnings());
                    }
                } else {
                    return vcards;
                }
            }
        }

        private StreamReader constructStreamReader() throws SAXException, IOException {
            XCardDocument parser = _constructDocument();
            StreamReader reader = parser.reader();
            reader.setScribeIndex(this.index);
            return reader;
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$ParserChainXmlReader.class */
    public static class ParserChainXmlReader extends ParserChainXml<ParserChainXmlReader> {
        private final InputStream in;
        private final File file;
        private final Reader reader;

        @Override // ezvcard.Ezvcard.ParserChainXml, ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ List all() throws IOException, SAXException {
            return super.all();
        }

        @Override // ezvcard.Ezvcard.ParserChainXml, ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ VCard first() throws IOException, SAXException {
            return super.first();
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object warnings(List x0) {
            return warnings((List<List<String>>) x0);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object register(VCardPropertyScribe x0) {
            return register((VCardPropertyScribe<? extends VCardProperty>) x0);
        }

        private ParserChainXmlReader(InputStream in) {
            this.in = in;
            this.reader = null;
            this.file = null;
        }

        private ParserChainXmlReader(File file) {
            this.in = null;
            this.reader = null;
            this.file = file;
        }

        private ParserChainXmlReader(Reader reader) {
            this.in = null;
            this.reader = reader;
            this.file = null;
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainXmlReader register(VCardPropertyScribe<? extends VCardProperty> scribe) {
            return (ParserChainXmlReader) super.register(scribe);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainXmlReader warnings(List<List<String>> warnings) {
            return (ParserChainXmlReader) super.warnings(warnings);
        }

        @Override // ezvcard.Ezvcard.ParserChainXml
        XCardDocument _constructDocument() throws IOException, SAXException {
            if (this.in != null) {
                return new XCardDocument(this.in);
            }
            if (this.file != null) {
                return new XCardDocument(this.file);
            }
            return new XCardDocument(this.reader);
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$ParserChainXmlString.class */
    public static class ParserChainXmlString extends ParserChainXml<ParserChainXmlString> {
        private final String xml;

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object warnings(List x0) {
            return warnings((List<List<String>>) x0);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object register(VCardPropertyScribe x0) {
            return register((VCardPropertyScribe<? extends VCardProperty>) x0);
        }

        private ParserChainXmlString(String xml) {
            this.xml = xml;
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainXmlString register(VCardPropertyScribe<? extends VCardProperty> scribe) {
            return (ParserChainXmlString) super.register(scribe);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainXmlString warnings(List<List<String>> warnings) {
            return (ParserChainXmlString) super.warnings(warnings);
        }

        @Override // ezvcard.Ezvcard.ParserChainXml
        XCardDocument _constructDocument() throws SAXException {
            return new XCardDocument(this.xml);
        }

        @Override // ezvcard.Ezvcard.ParserChainXml, ezvcard.Ezvcard.ParserChain
        public VCard first() throws SAXException {
            try {
                return super.first();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        @Override // ezvcard.Ezvcard.ParserChainXml, ezvcard.Ezvcard.ParserChain
        public List<VCard> all() throws SAXException {
            try {
                return super.all();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$ParserChainXmlDom.class */
    public static class ParserChainXmlDom extends ParserChainXml<ParserChainXmlDom> {
        private final Document document;

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object warnings(List x0) {
            return warnings((List<List<String>>) x0);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object register(VCardPropertyScribe x0) {
            return register((VCardPropertyScribe<? extends VCardProperty>) x0);
        }

        private ParserChainXmlDom(Document document) {
            this.document = document;
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainXmlDom register(VCardPropertyScribe<? extends VCardProperty> scribe) {
            return (ParserChainXmlDom) super.register(scribe);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainXmlDom warnings(List<List<String>> warnings) {
            return (ParserChainXmlDom) super.warnings(warnings);
        }

        @Override // ezvcard.Ezvcard.ParserChainXml
        XCardDocument _constructDocument() {
            return new XCardDocument(this.document);
        }

        @Override // ezvcard.Ezvcard.ParserChainXml, ezvcard.Ezvcard.ParserChain
        public VCard first() {
            try {
                return super.first();
            } catch (IOException e) {
                throw new RuntimeException(e);
            } catch (SAXException e2) {
                throw new RuntimeException(e2);
            }
        }

        @Override // ezvcard.Ezvcard.ParserChainXml, ezvcard.Ezvcard.ParserChain
        public List<VCard> all() {
            try {
                return super.all();
            } catch (IOException e) {
                throw new RuntimeException(e);
            } catch (SAXException e2) {
                throw new RuntimeException(e2);
            }
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$ParserChainHtml.class */
    static abstract class ParserChainHtml<T> extends ParserChain<T> {
        String pageUrl;

        abstract HCardParser _constructReader() throws IOException;

        ParserChainHtml() {
        }

        public T pageUrl(String pageUrl) {
            this.pageUrl = pageUrl;
            return this.this_;
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public VCard first() throws IOException {
            HCardParser parser = constructReader();
            VCard vcard = parser.readNext();
            if (this.warnings != null) {
                this.warnings.add(parser.getWarnings());
            }
            return vcard;
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public List<VCard> all() throws IOException {
            HCardParser parser = constructReader();
            List<VCard> vcards = new ArrayList<>();
            while (true) {
                VCard vcard = parser.readNext();
                if (vcard != null) {
                    vcards.add(vcard);
                    if (this.warnings != null) {
                        this.warnings.add(parser.getWarnings());
                    }
                } else {
                    return vcards;
                }
            }
        }

        private HCardParser constructReader() throws IOException {
            HCardParser parser = _constructReader();
            parser.setScribeIndex(this.index);
            return parser;
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$ParserChainHtmlReader.class */
    public static class ParserChainHtmlReader extends ParserChainHtml<ParserChainHtmlReader> {
        private final Reader reader;
        private final File file;
        private final URL url;

        @Override // ezvcard.Ezvcard.ParserChainHtml, ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ List all() throws IOException {
            return super.all();
        }

        @Override // ezvcard.Ezvcard.ParserChainHtml, ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ VCard first() throws IOException {
            return super.first();
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object warnings(List x0) {
            return warnings((List<List<String>>) x0);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object register(VCardPropertyScribe x0) {
            return register((VCardPropertyScribe<? extends VCardProperty>) x0);
        }

        private ParserChainHtmlReader(Reader reader) {
            this.reader = reader;
            this.file = null;
            this.url = null;
        }

        private ParserChainHtmlReader(File file) {
            this.reader = null;
            this.file = file;
            this.url = null;
        }

        private ParserChainHtmlReader(URL url) {
            this.reader = null;
            this.file = null;
            this.url = url;
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainHtmlReader register(VCardPropertyScribe<? extends VCardProperty> scribe) {
            return (ParserChainHtmlReader) super.register(scribe);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainHtmlReader warnings(List<List<String>> warnings) {
            return (ParserChainHtmlReader) super.warnings(warnings);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // ezvcard.Ezvcard.ParserChainHtml
        public ParserChainHtmlReader pageUrl(String pageUrl) {
            return (ParserChainHtmlReader) super.pageUrl(pageUrl);
        }

        @Override // ezvcard.Ezvcard.ParserChainHtml
        HCardParser _constructReader() throws IOException {
            if (this.reader != null) {
                return new HCardParser(this.reader, this.pageUrl);
            }
            if (this.file != null) {
                return new HCardParser(this.file, this.pageUrl);
            }
            return new HCardParser(this.url);
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$ParserChainHtmlString.class */
    public static class ParserChainHtmlString extends ParserChainHtml<ParserChainHtmlString> {
        private final String html;

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object warnings(List x0) {
            return warnings((List<List<String>>) x0);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object register(VCardPropertyScribe x0) {
            return register((VCardPropertyScribe<? extends VCardProperty>) x0);
        }

        private ParserChainHtmlString(String html) {
            this.html = html;
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainHtmlString register(VCardPropertyScribe<? extends VCardProperty> scribe) {
            return (ParserChainHtmlString) super.register(scribe);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainHtmlString warnings(List<List<String>> warnings) {
            return (ParserChainHtmlString) super.warnings(warnings);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // ezvcard.Ezvcard.ParserChainHtml
        public ParserChainHtmlString pageUrl(String pageUrl) {
            return (ParserChainHtmlString) super.pageUrl(pageUrl);
        }

        @Override // ezvcard.Ezvcard.ParserChainHtml
        HCardParser _constructReader() {
            return new HCardParser(this.html, this.pageUrl);
        }

        @Override // ezvcard.Ezvcard.ParserChainHtml, ezvcard.Ezvcard.ParserChain
        public VCard first() {
            try {
                return super.first();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        @Override // ezvcard.Ezvcard.ParserChainHtml, ezvcard.Ezvcard.ParserChain
        public List<VCard> all() {
            try {
                return super.all();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$ParserChainJson.class */
    static abstract class ParserChainJson<T> extends ParserChain<T> {
        final boolean closeWhenDone;

        abstract JCardReader _constructReader() throws IOException;

        private ParserChainJson(boolean closeWhenDone) {
            this.closeWhenDone = closeWhenDone;
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public VCard first() throws IOException {
            JCardReader parser = constructReader();
            try {
                VCard vcard = parser.readNext();
                if (this.warnings != null) {
                    this.warnings.add(parser.getWarnings());
                }
                return vcard;
            } finally {
                if (this.closeWhenDone) {
                    IOUtils.closeQuietly(parser);
                }
            }
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public List<VCard> all() throws IOException {
            JCardReader parser = constructReader();
            try {
                List<VCard> vcards = new ArrayList<>();
                while (true) {
                    VCard vcard = parser.readNext();
                    if (vcard == null) {
                        break;
                    }
                    if (this.warnings != null) {
                        this.warnings.add(parser.getWarnings());
                    }
                    vcards.add(vcard);
                }
                return vcards;
            } finally {
                if (this.closeWhenDone) {
                    IOUtils.closeQuietly(parser);
                }
            }
        }

        private JCardReader constructReader() throws IOException {
            JCardReader parser = _constructReader();
            parser.setScribeIndex(this.index);
            return parser;
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$ParserChainJsonReader.class */
    public static class ParserChainJsonReader extends ParserChainJson<ParserChainJsonReader> {
        private final InputStream in;
        private final File file;
        private final Reader reader;

        @Override // ezvcard.Ezvcard.ParserChainJson, ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ List all() throws IOException {
            return super.all();
        }

        @Override // ezvcard.Ezvcard.ParserChainJson, ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ VCard first() throws IOException {
            return super.first();
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object warnings(List x0) {
            return warnings((List<List<String>>) x0);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object register(VCardPropertyScribe x0) {
            return register((VCardPropertyScribe<? extends VCardProperty>) x0);
        }

        private ParserChainJsonReader(InputStream in) {
            super(false);
            this.in = in;
            this.reader = null;
            this.file = null;
        }

        private ParserChainJsonReader(File file) {
            super(true);
            this.in = null;
            this.reader = null;
            this.file = file;
        }

        private ParserChainJsonReader(Reader reader) {
            super(false);
            this.in = null;
            this.reader = reader;
            this.file = null;
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainJsonReader register(VCardPropertyScribe<? extends VCardProperty> scribe) {
            return (ParserChainJsonReader) super.register(scribe);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainJsonReader warnings(List<List<String>> warnings) {
            return (ParserChainJsonReader) super.warnings(warnings);
        }

        @Override // ezvcard.Ezvcard.ParserChainJson
        JCardReader _constructReader() throws IOException {
            if (this.in != null) {
                return new JCardReader(this.in);
            }
            if (this.file != null) {
                return new JCardReader(this.file);
            }
            return new JCardReader(this.reader);
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$ParserChainJsonString.class */
    public static class ParserChainJsonString extends ParserChainJson<ParserChainJsonString> {
        private final String json;

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object warnings(List x0) {
            return warnings((List<List<String>>) x0);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public /* bridge */ /* synthetic */ Object register(VCardPropertyScribe x0) {
            return register((VCardPropertyScribe<? extends VCardProperty>) x0);
        }

        private ParserChainJsonString(String json) {
            super(false);
            this.json = json;
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainJsonString register(VCardPropertyScribe<? extends VCardProperty> scribe) {
            return (ParserChainJsonString) super.register(scribe);
        }

        @Override // ezvcard.Ezvcard.ParserChain
        public ParserChainJsonString warnings(List<List<String>> warnings) {
            return (ParserChainJsonString) super.warnings(warnings);
        }

        @Override // ezvcard.Ezvcard.ParserChainJson
        JCardReader _constructReader() {
            return new JCardReader(this.json);
        }

        @Override // ezvcard.Ezvcard.ParserChainJson, ezvcard.Ezvcard.ParserChain
        public VCard first() {
            try {
                return super.first();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        @Override // ezvcard.Ezvcard.ParserChainJson, ezvcard.Ezvcard.ParserChain
        public List<VCard> all() {
            try {
                return super.all();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$WriterChain.class */
    static abstract class WriterChain<T> {
        final Collection<VCard> vcards;
        final T this_ = this;

        /* JADX WARN: Multi-variable type inference failed */
        WriterChain(Collection<VCard> vcards) {
            this.vcards = vcards;
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$WriterChainText.class */
    public static class WriterChainText extends WriterChain<WriterChainText> {
        VCardVersion version;
        boolean prodId;
        boolean versionStrict;
        boolean caretEncoding;
        final ScribeIndex index;

        private WriterChainText(Collection<VCard> vcards) {
            super(vcards);
            this.prodId = true;
            this.versionStrict = true;
            this.caretEncoding = false;
            this.index = new ScribeIndex();
        }

        /* JADX WARN: Multi-variable type inference failed */
        public WriterChainText version(VCardVersion version) {
            this.version = version;
            return (WriterChainText) this.this_;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public WriterChainText prodId(boolean include) {
            this.prodId = include;
            return (WriterChainText) this.this_;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public WriterChainText caretEncoding(boolean enable) {
            this.caretEncoding = enable;
            return (WriterChainText) this.this_;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public WriterChainText versionStrict(boolean versionStrict) {
            this.versionStrict = versionStrict;
            return (WriterChainText) this.this_;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public WriterChainText register(VCardPropertyScribe<? extends VCardProperty> scribe) {
            this.index.register(scribe);
            return (WriterChainText) this.this_;
        }

        public String go() {
            StringWriter sw = new StringWriter();
            try {
                go(sw);
            } catch (IOException e) {
            }
            return sw.toString();
        }

        public void go(OutputStream out) throws IOException {
            VCardWriter vcardWriter = new VCardWriter(out, this.version);
            go(vcardWriter);
        }

        public void go(File file) throws IOException {
            go(file, false);
        }

        public void go(File file, boolean append) throws IOException {
            VCardWriter vcardWriter = new VCardWriter(file, append, this.version);
            try {
                go(vcardWriter);
                IOUtils.closeQuietly(vcardWriter);
            } catch (Throwable th) {
                IOUtils.closeQuietly(vcardWriter);
                throw th;
            }
        }

        public void go(Writer writer) throws IOException {
            VCardWriter vcardWriter = new VCardWriter(writer, this.version);
            go(vcardWriter);
        }

        private void go(VCardWriter vcardWriter) throws IOException {
            vcardWriter.setAddProdId(this.prodId);
            vcardWriter.setCaretEncodingEnabled(this.caretEncoding);
            vcardWriter.setVersionStrict(this.versionStrict);
            vcardWriter.setScribeIndex(this.index);
            for (VCard vcard : this.vcards) {
                if (this.version == null) {
                    VCardVersion vcardVersion = vcard.getVersion();
                    if (vcardVersion == null) {
                        vcardVersion = VCardVersion.V3_0;
                    }
                    vcardWriter.setTargetVersion(vcardVersion);
                }
                vcardWriter.write(vcard);
                vcardWriter.flush();
            }
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$WriterChainXml.class */
    public static class WriterChainXml extends WriterChain<WriterChainXml> {
        boolean prodId;
        boolean versionStrict;
        int indent;
        final ScribeIndex index;

        private WriterChainXml(Collection<VCard> vcards) {
            super(vcards);
            this.prodId = true;
            this.versionStrict = true;
            this.indent = -1;
            this.index = new ScribeIndex();
        }

        /* JADX WARN: Multi-variable type inference failed */
        public WriterChainXml prodId(boolean include) {
            this.prodId = include;
            return (WriterChainXml) this.this_;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public WriterChainXml indent(int indent) {
            this.indent = indent;
            return (WriterChainXml) this.this_;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public WriterChainXml versionStrict(boolean versionStrict) {
            this.versionStrict = versionStrict;
            return (WriterChainXml) this.this_;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public WriterChainXml register(VCardPropertyScribe<? extends VCardProperty> scribe) {
            this.index.register(scribe);
            return (WriterChainXml) this.this_;
        }

        public String go() {
            StringWriter sw = new StringWriter();
            try {
                go(sw);
            } catch (TransformerException e) {
            }
            return sw.toString();
        }

        public void go(OutputStream out) throws TransformerException {
            XCardDocument doc = createXCardDocument();
            doc.write(out, this.indent);
        }

        public void go(File file) throws IOException, TransformerException {
            XCardDocument doc = createXCardDocument();
            doc.write(file, this.indent);
        }

        public void go(Writer writer) throws TransformerException {
            XCardDocument doc = createXCardDocument();
            doc.write(writer, this.indent);
        }

        public Document dom() {
            XCardDocument doc = createXCardDocument();
            return doc.getDocument();
        }

        private XCardDocument createXCardDocument() {
            XCardDocument doc = new XCardDocument();
            XCardDocument.XCardDocumentStreamWriter writer = doc.writer();
            writer.setAddProdId(this.prodId);
            writer.setVersionStrict(this.versionStrict);
            writer.setScribeIndex(this.index);
            for (VCard vcard : this.vcards) {
                writer.write(vcard);
            }
            return doc;
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$WriterChainHtml.class */
    public static class WriterChainHtml extends WriterChain<WriterChainHtml> {
        private WriterChainHtml(Collection<VCard> vcards) {
            super(vcards);
        }

        public String go() {
            StringWriter sw = new StringWriter();
            try {
                go(sw);
            } catch (IOException e) {
            }
            return sw.toString();
        }

        public void go(OutputStream out) throws IOException {
            go(new OutputStreamWriter(out));
        }

        public void go(File file) throws IOException {
            FileWriter writer = null;
            try {
                writer = new FileWriter(file);
                go(writer);
                IOUtils.closeQuietly(writer);
            } catch (Throwable th) {
                IOUtils.closeQuietly(writer);
                throw th;
            }
        }

        public void go(Writer writer) throws IOException {
            HCardPage page = new HCardPage();
            for (VCard vcard : this.vcards) {
                page.add(vcard);
            }
            page.write(writer);
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/Ezvcard$WriterChainJson.class */
    public static class WriterChainJson extends WriterChain<WriterChainJson> {
        boolean prodId;
        boolean versionStrict;
        boolean indent;
        final ScribeIndex index;

        private WriterChainJson(Collection<VCard> vcards) {
            super(vcards);
            this.prodId = true;
            this.versionStrict = true;
            this.indent = false;
            this.index = new ScribeIndex();
        }

        /* JADX WARN: Multi-variable type inference failed */
        public WriterChainJson prodId(boolean include) {
            this.prodId = include;
            return (WriterChainJson) this.this_;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public WriterChainJson indent(boolean indent) {
            this.indent = indent;
            return (WriterChainJson) this.this_;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public WriterChainJson versionStrict(boolean versionStrict) {
            this.versionStrict = versionStrict;
            return (WriterChainJson) this.this_;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public WriterChainJson register(VCardPropertyScribe<? extends VCardProperty> scribe) {
            this.index.register(scribe);
            return (WriterChainJson) this.this_;
        }

        public String go() {
            StringWriter sw = new StringWriter();
            try {
                go(sw);
            } catch (IOException e) {
            }
            return sw.toString();
        }

        public void go(OutputStream out) throws IOException {
            go(new JCardWriter(out, this.vcards.size() > 1));
        }

        public void go(File file) throws IOException {
            JCardWriter writer = new JCardWriter(file, this.vcards.size() > 1);
            try {
                go(writer);
                IOUtils.closeQuietly(writer);
            } catch (Throwable th) {
                IOUtils.closeQuietly(writer);
                throw th;
            }
        }

        public void go(Writer writer) throws IOException {
            go(new JCardWriter(writer, this.vcards.size() > 1));
        }

        private void go(JCardWriter writer) throws IOException {
            writer.setAddProdId(this.prodId);
            writer.setIndent(this.indent);
            writer.setVersionStrict(this.versionStrict);
            writer.setScribeIndex(this.index);
            try {
                for (VCard vcard : this.vcards) {
                    writer.write(vcard);
                    writer.flush();
                }
            } finally {
                writer.closeJsonStream();
            }
        }
    }

    private Ezvcard() {
    }
}
