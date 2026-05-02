package org.apache.commons.digester;

import java.beans.PropertyDescriptor;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.DynaBean;
import org.apache.commons.beanutils.DynaProperty;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.logging.Log;
import org.xml.sax.Attributes;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/SetNestedPropertiesRule.class */
public class SetNestedPropertiesRule extends Rule {
    private Log log = null;
    private boolean trimData = true;
    private boolean allowUnknownChildElements = false;
    private HashMap elementNames = new HashMap();

    /* renamed from: org.apache.commons.digester.SetNestedPropertiesRule$1, reason: invalid class name */
    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/SetNestedPropertiesRule$1.class */
    class AnonymousClass1 {
    }

    public SetNestedPropertiesRule() {
    }

    public SetNestedPropertiesRule(String elementName, String propertyName) {
        this.elementNames.put(elementName, propertyName);
    }

    public SetNestedPropertiesRule(String[] elementNames, String[] propertyNames) {
        int size = elementNames.length;
        for (int i = 0; i < size; i++) {
            String propName = null;
            if (i < propertyNames.length) {
                propName = propertyNames[i];
            }
            this.elementNames.put(elementNames[i], propName);
        }
    }

    @Override // org.apache.commons.digester.Rule
    public void setDigester(Digester digester) {
        super.setDigester(digester);
        this.log = digester.getLogger();
    }

    public void setTrimData(boolean trimData) {
        this.trimData = trimData;
    }

    public boolean getTrimData() {
        return this.trimData;
    }

    public void setAllowUnknownChildElements(boolean allowUnknownChildElements) {
        this.allowUnknownChildElements = allowUnknownChildElements;
    }

    public boolean getAllowUnknownChildElements() {
        return this.allowUnknownChildElements;
    }

    @Override // org.apache.commons.digester.Rule
    public void begin(String namespace, String name, Attributes attributes) throws Exception {
        Rules oldRules = this.digester.getRules();
        AnyChildRule anyChildRule = new AnyChildRule(this, null);
        anyChildRule.setDigester(this.digester);
        AnyChildRules newRules = new AnyChildRules(this, anyChildRule);
        newRules.init(new StringBuffer().append(this.digester.getMatch()).append("/").toString(), oldRules);
        this.digester.setRules(newRules);
    }

    @Override // org.apache.commons.digester.Rule
    public void body(String bodyText) throws Exception {
        AnyChildRules newRules = (AnyChildRules) this.digester.getRules();
        this.digester.setRules(newRules.getOldRules());
    }

    public void addAlias(String elementName, String propertyName) {
        this.elementNames.put(elementName, propertyName);
    }

    public String toString() {
        StringBuffer sb = new StringBuffer("SetNestedPropertiesRule[");
        sb.append("allowUnknownChildElements=");
        sb.append(this.allowUnknownChildElements);
        sb.append(", trimData=");
        sb.append(this.trimData);
        sb.append(", elementNames=");
        sb.append(this.elementNames);
        sb.append("]");
        return sb.toString();
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/SetNestedPropertiesRule$AnyChildRules.class */
    private class AnyChildRules implements Rules {
        private String matchPrefix = null;
        private Rules decoratedRules = null;
        private ArrayList rules = new ArrayList(1);
        private AnyChildRule rule;
        private final SetNestedPropertiesRule this$0;

        public AnyChildRules(SetNestedPropertiesRule this$0, AnyChildRule rule) {
            this.this$0 = this$0;
            this.rule = rule;
            this.rules.add(rule);
        }

        @Override // org.apache.commons.digester.Rules
        public Digester getDigester() {
            return null;
        }

        @Override // org.apache.commons.digester.Rules
        public void setDigester(Digester digester) {
        }

        @Override // org.apache.commons.digester.Rules
        public String getNamespaceURI() {
            return null;
        }

        @Override // org.apache.commons.digester.Rules
        public void setNamespaceURI(String namespaceURI) {
        }

        @Override // org.apache.commons.digester.Rules
        public void add(String pattern, Rule rule) {
        }

        @Override // org.apache.commons.digester.Rules
        public void clear() {
        }

        @Override // org.apache.commons.digester.Rules
        public List match(String matchPath) {
            return match(null, matchPath);
        }

        @Override // org.apache.commons.digester.Rules
        public List match(String namespaceURI, String matchPath) {
            List match = this.decoratedRules.match(namespaceURI, matchPath);
            if (matchPath.startsWith(this.matchPrefix) && matchPath.indexOf(47, this.matchPrefix.length()) == -1) {
                if (match == null || match.size() == 0) {
                    return this.rules;
                }
                LinkedList newMatch = new LinkedList(match);
                newMatch.addLast(this.rule);
                return newMatch;
            }
            return match;
        }

        @Override // org.apache.commons.digester.Rules
        public List rules() {
            this.this$0.log.debug("AnyChildRules.rules invoked.");
            return this.decoratedRules.rules();
        }

        public void init(String prefix, Rules rules) {
            this.matchPrefix = prefix;
            this.decoratedRules = rules;
        }

        public Rules getOldRules() {
            return this.decoratedRules;
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule.class */
    private class AnyChildRule extends Rule {
        private String currChildNamespaceURI;
        private String currChildElementName;
        private final SetNestedPropertiesRule this$0;

        private AnyChildRule(SetNestedPropertiesRule this$0) {
            this.this$0 = this$0;
            this.currChildNamespaceURI = null;
            this.currChildElementName = null;
        }

        AnyChildRule(SetNestedPropertiesRule x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // org.apache.commons.digester.Rule
        public void begin(String namespaceURI, String name, Attributes attributes) throws Exception {
            this.currChildNamespaceURI = namespaceURI;
            this.currChildElementName = name;
        }

        @Override // org.apache.commons.digester.Rule
        public void body(String value) throws Exception {
            String propName = this.currChildElementName;
            if (this.this$0.elementNames.containsKey(this.currChildElementName)) {
                propName = (String) this.this$0.elementNames.get(this.currChildElementName);
                if (propName == null) {
                    return;
                }
            }
            boolean debug = this.this$0.log.isDebugEnabled();
            if (debug) {
                this.this$0.log.debug(new StringBuffer().append("[SetNestedPropertiesRule]{").append(this.digester.match).append("} Setting property '").append(propName).append("' to '").append(value).append("'").toString());
            }
            Object top = this.digester.peek();
            if (debug) {
                if (top != null) {
                    this.this$0.log.debug(new StringBuffer().append("[SetNestedPropertiesRule]{").append(this.digester.match).append("} Set ").append(top.getClass().getName()).append(" properties").toString());
                } else {
                    this.this$0.log.debug(new StringBuffer().append("[SetPropertiesRule]{").append(this.digester.match).append("} Set NULL properties").toString());
                }
            }
            if (this.this$0.trimData) {
                value = value.trim();
            }
            if (!this.this$0.allowUnknownChildElements) {
                if (top instanceof DynaBean) {
                    DynaProperty desc = ((DynaBean) top).getDynaClass().getDynaProperty(propName);
                    if (desc == null) {
                        throw new NoSuchMethodException(new StringBuffer().append("Bean has no property named ").append(propName).toString());
                    }
                } else {
                    PropertyDescriptor desc2 = PropertyUtils.getPropertyDescriptor(top, propName);
                    if (desc2 == null) {
                        throw new NoSuchMethodException(new StringBuffer().append("Bean has no property named ").append(propName).toString());
                    }
                }
            }
            try {
                BeanUtils.setProperty(top, propName, value);
            } catch (NullPointerException e) {
                this.this$0.log.error(new StringBuffer().append("NullPointerException: top=").append(top).append(",propName=").append(propName).append(",value=").append(value).append("!").toString());
                throw e;
            }
        }

        @Override // org.apache.commons.digester.Rule
        public void end(String namespace, String name) throws Exception {
            this.currChildElementName = null;
        }
    }
}
