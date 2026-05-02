package org.apache.commons.digester.xmlrules;

import java.net.URL;
import org.apache.commons.digester.Digester;
import org.apache.commons.digester.RuleSetBase;
import org.xml.sax.InputSource;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/FromXmlRuleSet.class */
public class FromXmlRuleSet extends RuleSetBase {
    public static final String DIGESTER_DTD_PATH = "org/apache/commons/digester/xmlrules/digester-rules.dtd";
    private XMLRulesLoader rulesLoader;
    private DigesterRuleParser parser;
    private Digester rulesDigester;

    /* renamed from: org.apache.commons.digester.xmlrules.FromXmlRuleSet$1, reason: invalid class name */
    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/FromXmlRuleSet$1.class */
    class AnonymousClass1 {
    }

    public FromXmlRuleSet(URL rulesXml) {
        this(rulesXml, new DigesterRuleParser(), new Digester());
    }

    public FromXmlRuleSet(URL rulesXml, Digester rulesDigester) {
        this(rulesXml, new DigesterRuleParser(), rulesDigester);
    }

    public FromXmlRuleSet(URL rulesXml, DigesterRuleParser parser) {
        this(rulesXml, parser, new Digester());
    }

    public FromXmlRuleSet(URL rulesXml, DigesterRuleParser parser, Digester rulesDigester) {
        init(new URLXMLRulesLoader(this, rulesXml), parser, rulesDigester);
    }

    public FromXmlRuleSet(InputSource inputSource) {
        this(inputSource, new DigesterRuleParser(), new Digester());
    }

    public FromXmlRuleSet(InputSource inputSource, Digester rulesDigester) {
        this(inputSource, new DigesterRuleParser(), rulesDigester);
    }

    public FromXmlRuleSet(InputSource inputSource, DigesterRuleParser parser) {
        this(inputSource, parser, new Digester());
    }

    public FromXmlRuleSet(InputSource inputSource, DigesterRuleParser parser, Digester rulesDigester) {
        init(new InputSourceXMLRulesLoader(this, inputSource), parser, rulesDigester);
    }

    private void init(XMLRulesLoader rulesLoader, DigesterRuleParser parser, Digester rulesDigester) {
        this.rulesLoader = rulesLoader;
        this.parser = parser;
        this.rulesDigester = rulesDigester;
    }

    @Override // org.apache.commons.digester.RuleSetBase, org.apache.commons.digester.RuleSet
    public void addRuleInstances(Digester digester) throws XmlLoadException {
        addRuleInstances(digester, null);
    }

    public void addRuleInstances(Digester digester, String basePath) throws XmlLoadException {
        URL dtdURL = getClass().getClassLoader().getResource(DIGESTER_DTD_PATH);
        if (dtdURL == null) {
            throw new XmlLoadException("Cannot find resource \"org/apache/commons/digester/xmlrules/digester-rules.dtd\"");
        }
        this.parser.setDigesterRulesDTD(dtdURL.toString());
        this.parser.setTarget(digester);
        this.parser.setBasePath(basePath);
        this.rulesDigester.addRuleSet(this.parser);
        this.rulesDigester.push(this.parser);
        this.rulesLoader.loadRules();
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/FromXmlRuleSet$XMLRulesLoader.class */
    private static abstract class XMLRulesLoader {
        public abstract void loadRules() throws XmlLoadException;

        private XMLRulesLoader() {
        }

        XMLRulesLoader(AnonymousClass1 x0) {
            this();
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/FromXmlRuleSet$URLXMLRulesLoader.class */
    private class URLXMLRulesLoader extends XMLRulesLoader {
        private URL url;
        private final FromXmlRuleSet this$0;

        public URLXMLRulesLoader(FromXmlRuleSet this$0, URL url) {
            super(null);
            this.this$0 = this$0;
            this.url = url;
        }

        @Override // org.apache.commons.digester.xmlrules.FromXmlRuleSet.XMLRulesLoader
        public void loadRules() throws XmlLoadException {
            try {
                this.this$0.rulesDigester.parse(this.url.openStream());
            } catch (Exception ex) {
                throw new XmlLoadException(ex);
            }
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/FromXmlRuleSet$InputSourceXMLRulesLoader.class */
    private class InputSourceXMLRulesLoader extends XMLRulesLoader {
        private InputSource inputSource;
        private final FromXmlRuleSet this$0;

        public InputSourceXMLRulesLoader(FromXmlRuleSet this$0, InputSource inputSource) {
            super(null);
            this.this$0 = this$0;
            this.inputSource = inputSource;
        }

        @Override // org.apache.commons.digester.xmlrules.FromXmlRuleSet.XMLRulesLoader
        public void loadRules() throws XmlLoadException {
            try {
                this.this$0.rulesDigester.parse(this.inputSource);
            } catch (Exception ex) {
                throw new XmlLoadException(ex);
            }
        }
    }
}
