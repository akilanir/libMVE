package org.apache.commons.digester.xmlrules;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.collections.ArrayStack;
import org.apache.commons.digester.AbstractObjectCreationFactory;
import org.apache.commons.digester.BeanPropertySetterRule;
import org.apache.commons.digester.CallMethodRule;
import org.apache.commons.digester.CallParamRule;
import org.apache.commons.digester.Digester;
import org.apache.commons.digester.FactoryCreateRule;
import org.apache.commons.digester.NodeCreateRule;
import org.apache.commons.digester.ObjectCreateRule;
import org.apache.commons.digester.ObjectParamRule;
import org.apache.commons.digester.Rule;
import org.apache.commons.digester.RuleSetBase;
import org.apache.commons.digester.Rules;
import org.apache.commons.digester.SetNestedPropertiesRule;
import org.apache.commons.digester.SetNextRule;
import org.apache.commons.digester.SetPropertiesRule;
import org.apache.commons.digester.SetPropertyRule;
import org.apache.commons.digester.SetRootRule;
import org.apache.commons.digester.SetTopRule;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser.class */
public class DigesterRuleParser extends RuleSetBase {
    public static final String DIGESTER_PUBLIC_ID = "-//Jakarta Apache //DTD digester-rules XML V1.0//EN";
    private String digesterDtdUrl;
    protected Digester targetDigester;
    protected String basePath;
    protected PatternStack patternStack;
    private Set includedFiles;
    static Class class$org$apache$commons$digester$Rule;

    /* renamed from: org.apache.commons.digester.xmlrules.DigesterRuleParser$1, reason: invalid class name */
    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$1.class */
    class AnonymousClass1 {
    }

    DigesterRuleParser(Digester x0, PatternStack x1, Set x2, AnonymousClass1 x3) {
        this(x0, x1, x2);
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack.class */
    protected class PatternStack extends ArrayStack {
        private final DigesterRuleParser this$0;

        protected PatternStack(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        public String toString() {
            StringBuffer str = new StringBuffer();
            for (int i = 0; i < size(); i++) {
                String elem = get(i).toString();
                if (elem.length() > 0) {
                    if (str.length() > 0) {
                        str.append('/');
                    }
                    str.append(elem);
                }
            }
            return str.toString();
        }
    }

    public DigesterRuleParser() {
        this.basePath = "";
        this.includedFiles = new HashSet();
        this.patternStack = new PatternStack(this);
    }

    public DigesterRuleParser(Digester targetDigester) {
        this.basePath = "";
        this.includedFiles = new HashSet();
        this.targetDigester = targetDigester;
        this.patternStack = new PatternStack(this);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    private DigesterRuleParser(Digester targetDigester, PatternStack stack, Set includedFiles) {
        this.basePath = "";
        this.includedFiles = new HashSet();
        this.targetDigester = targetDigester;
        this.patternStack = stack;
        this.includedFiles = includedFiles;
    }

    public void setTarget(Digester d) {
        this.targetDigester = d;
    }

    public void setBasePath(String path) {
        if (path == null) {
            this.basePath = "";
        } else if (path.length() > 0 && !path.endsWith("/")) {
            this.basePath = new StringBuffer().append(path).append("/").toString();
        } else {
            this.basePath = path;
        }
    }

    public void setDigesterRulesDTD(String dtdURL) {
        this.digesterDtdUrl = dtdURL;
    }

    protected String getDigesterRulesDTD() {
        return this.digesterDtdUrl;
    }

    public void add(Rule rule) {
        this.targetDigester.addRule(new StringBuffer().append(this.basePath).append(this.patternStack.toString()).toString(), rule);
    }

    @Override // org.apache.commons.digester.RuleSetBase, org.apache.commons.digester.RuleSet
    public void addRuleInstances(Digester digester) {
        Class cls;
        if (class$org$apache$commons$digester$Rule == null) {
            cls = class$("org.apache.commons.digester.Rule");
            class$org$apache$commons$digester$Rule = cls;
        } else {
            cls = class$org$apache$commons$digester$Rule;
        }
        String ruleClassName = cls.getName();
        digester.register(DIGESTER_PUBLIC_ID, getDigesterRulesDTD());
        digester.addRule("*/pattern", new PatternRule(this, "value"));
        digester.addRule("*/include", new IncludeRule(this));
        digester.addFactoryCreate("*/bean-property-setter-rule", new BeanPropertySetterRuleFactory(this, null));
        digester.addRule("*/bean-property-setter-rule", new PatternRule(this, "pattern"));
        digester.addSetNext("*/bean-property-setter-rule", "add", ruleClassName);
        digester.addFactoryCreate("*/call-method-rule", new CallMethodRuleFactory(this));
        digester.addRule("*/call-method-rule", new PatternRule(this, "pattern"));
        digester.addSetNext("*/call-method-rule", "add", ruleClassName);
        digester.addFactoryCreate("*/object-param-rule", new ObjectParamRuleFactory(this));
        digester.addRule("*/object-param-rule", new PatternRule(this, "pattern"));
        digester.addSetNext("*/object-param-rule", "add", ruleClassName);
        digester.addFactoryCreate("*/call-param-rule", new CallParamRuleFactory(this));
        digester.addRule("*/call-param-rule", new PatternRule(this, "pattern"));
        digester.addSetNext("*/call-param-rule", "add", ruleClassName);
        digester.addFactoryCreate("*/factory-create-rule", new FactoryCreateRuleFactory(this));
        digester.addRule("*/factory-create-rule", new PatternRule(this, "pattern"));
        digester.addSetNext("*/factory-create-rule", "add", ruleClassName);
        digester.addFactoryCreate("*/object-create-rule", new ObjectCreateRuleFactory(this));
        digester.addRule("*/object-create-rule", new PatternRule(this, "pattern"));
        digester.addSetNext("*/object-create-rule", "add", ruleClassName);
        digester.addFactoryCreate("*/node-create-rule", new NodeCreateRuleFactory(this));
        digester.addRule("*/node-create-rule", new PatternRule(this, "pattern"));
        digester.addSetNext("*/node-create-rule", "add", ruleClassName);
        digester.addFactoryCreate("*/set-properties-rule", new SetPropertiesRuleFactory(this));
        digester.addRule("*/set-properties-rule", new PatternRule(this, "pattern"));
        digester.addSetNext("*/set-properties-rule", "add", ruleClassName);
        digester.addRule("*/set-properties-rule/alias", new SetPropertiesAliasRule(this));
        digester.addFactoryCreate("*/set-property-rule", new SetPropertyRuleFactory(this));
        digester.addRule("*/set-property-rule", new PatternRule(this, "pattern"));
        digester.addSetNext("*/set-property-rule", "add", ruleClassName);
        digester.addFactoryCreate("*/set-nested-properties-rule", new SetNestedPropertiesRuleFactory(this));
        digester.addRule("*/set-nested-properties-rule", new PatternRule(this, "pattern"));
        digester.addSetNext("*/set-nested-properties-rule", "add", ruleClassName);
        digester.addRule("*/set-nested-properties-rule/alias", new SetNestedPropertiesAliasRule(this));
        digester.addFactoryCreate("*/set-top-rule", new SetTopRuleFactory(this));
        digester.addRule("*/set-top-rule", new PatternRule(this, "pattern"));
        digester.addSetNext("*/set-top-rule", "add", ruleClassName);
        digester.addFactoryCreate("*/set-next-rule", new SetNextRuleFactory(this));
        digester.addRule("*/set-next-rule", new PatternRule(this, "pattern"));
        digester.addSetNext("*/set-next-rule", "add", ruleClassName);
        digester.addFactoryCreate("*/set-root-rule", new SetRootRuleFactory(this));
        digester.addRule("*/set-root-rule", new PatternRule(this, "pattern"));
        digester.addSetNext("*/set-root-rule", "add", ruleClassName);
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule.class */
    private class PatternRule extends Rule {
        private String attrName;
        private String pattern = null;
        private final DigesterRuleParser this$0;

        public PatternRule(DigesterRuleParser this$0, String attrName) {
            this.this$0 = this$0;
            this.attrName = attrName;
        }

        @Override // org.apache.commons.digester.Rule
        public void begin(Attributes attributes) {
            this.pattern = attributes.getValue(this.attrName);
            if (this.pattern != null) {
                this.this$0.patternStack.push(this.pattern);
            }
        }

        @Override // org.apache.commons.digester.Rule
        public void end() {
            if (this.pattern != null) {
                this.this$0.patternStack.pop();
            }
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule.class */
    private class IncludeRule extends Rule {
        private final DigesterRuleParser this$0;

        public IncludeRule(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        @Override // org.apache.commons.digester.Rule
        public void begin(Attributes attributes) throws Exception {
            String fileName = attributes.getValue("path");
            if (fileName != null && fileName.length() > 0) {
                includeXMLRules(fileName);
            }
            String className = attributes.getValue("class");
            if (className != null && className.length() > 0) {
                includeProgrammaticRules(className);
            }
        }

        private void includeXMLRules(String fileName) throws IOException, SAXException, CircularIncludeException {
            ClassLoader cl = Thread.currentThread().getContextClassLoader();
            if (cl == null) {
                cl = this.this$0.getClass().getClassLoader();
            }
            URL fileURL = cl.getResource(fileName);
            if (fileURL == null) {
                throw new FileNotFoundException(new StringBuffer().append("File \"").append(fileName).append("\" not found.").toString());
            }
            String fileName2 = fileURL.toExternalForm();
            if (!this.this$0.includedFiles.add(fileName2)) {
                throw new CircularIncludeException(fileName2);
            }
            DigesterRuleParser includedSet = new DigesterRuleParser(this.this$0.targetDigester, this.this$0.patternStack, this.this$0.includedFiles, null);
            includedSet.setDigesterRulesDTD(this.this$0.getDigesterRulesDTD());
            Digester digester = new Digester();
            digester.addRuleSet(includedSet);
            digester.push(this.this$0);
            digester.parse(fileName2);
            this.this$0.includedFiles.remove(fileName2);
        }

        private void includeProgrammaticRules(String className) throws ClassNotFoundException, ClassCastException, InstantiationException, IllegalAccessException {
            Class cls = Class.forName(className);
            DigesterRulesSource rulesSource = (DigesterRulesSource) cls.newInstance();
            Rules digesterRules = this.this$0.targetDigester.getRules();
            Rules prefixWrapper = new RulesPrefixAdapter(this.this$0, this.this$0.patternStack.toString(), digesterRules);
            this.this$0.targetDigester.setRules(prefixWrapper);
            try {
                rulesSource.getRules(this.this$0.targetDigester);
            } finally {
                this.this$0.targetDigester.setRules(digesterRules);
            }
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter.class */
    private class RulesPrefixAdapter implements Rules {
        private Rules delegate;
        private String prefix;
        private final DigesterRuleParser this$0;

        public RulesPrefixAdapter(DigesterRuleParser this$0, String patternPrefix, Rules rules) {
            this.this$0 = this$0;
            this.prefix = patternPrefix;
            this.delegate = rules;
        }

        @Override // org.apache.commons.digester.Rules
        public void add(String pattern, Rule rule) {
            StringBuffer buffer = new StringBuffer();
            buffer.append(this.prefix);
            if (!pattern.startsWith("/")) {
                buffer.append('/');
            }
            buffer.append(pattern);
            this.delegate.add(buffer.toString(), rule);
        }

        @Override // org.apache.commons.digester.Rules
        public void clear() {
            this.delegate.clear();
        }

        @Override // org.apache.commons.digester.Rules
        public Digester getDigester() {
            return this.delegate.getDigester();
        }

        @Override // org.apache.commons.digester.Rules
        public String getNamespaceURI() {
            return this.delegate.getNamespaceURI();
        }

        @Override // org.apache.commons.digester.Rules
        public List match(String pattern) {
            return this.delegate.match(pattern);
        }

        @Override // org.apache.commons.digester.Rules
        public List match(String namespaceURI, String pattern) {
            return this.delegate.match(namespaceURI, pattern);
        }

        @Override // org.apache.commons.digester.Rules
        public List rules() {
            return this.delegate.rules();
        }

        @Override // org.apache.commons.digester.Rules
        public void setDigester(Digester digester) {
            this.delegate.setDigester(digester);
        }

        @Override // org.apache.commons.digester.Rules
        public void setNamespaceURI(String namespaceURI) {
            this.delegate.setNamespaceURI(namespaceURI);
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$BeanPropertySetterRuleFactory.class */
    private class BeanPropertySetterRuleFactory extends AbstractObjectCreationFactory {
        private final DigesterRuleParser this$0;

        private BeanPropertySetterRuleFactory(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        BeanPropertySetterRuleFactory(DigesterRuleParser x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // org.apache.commons.digester.AbstractObjectCreationFactory, org.apache.commons.digester.ObjectCreationFactory
        public Object createObject(Attributes attributes) throws Exception {
            Rule beanPropertySetterRule;
            String propertyname = attributes.getValue("propertyname");
            if (propertyname == null) {
                beanPropertySetterRule = new BeanPropertySetterRule();
            } else {
                beanPropertySetterRule = new BeanPropertySetterRule(propertyname);
            }
            return beanPropertySetterRule;
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$CallMethodRuleFactory.class */
    protected class CallMethodRuleFactory extends AbstractObjectCreationFactory {
        private final DigesterRuleParser this$0;

        protected CallMethodRuleFactory(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        @Override // org.apache.commons.digester.AbstractObjectCreationFactory, org.apache.commons.digester.ObjectCreationFactory
        public Object createObject(Attributes attributes) {
            Rule callMethodRule;
            String methodName = attributes.getValue("methodname");
            int targetOffset = 0;
            String targetOffsetStr = attributes.getValue("targetoffset");
            if (targetOffsetStr != null) {
                targetOffset = Integer.parseInt(targetOffsetStr);
            }
            if (attributes.getValue("paramcount") == null) {
                callMethodRule = new CallMethodRule(targetOffset, methodName);
            } else {
                int paramCount = Integer.parseInt(attributes.getValue("paramcount"));
                String paramTypesAttr = attributes.getValue("paramtypes");
                if (paramTypesAttr == null || paramTypesAttr.length() == 0) {
                    callMethodRule = new CallMethodRule(targetOffset, methodName, paramCount);
                } else {
                    String[] paramTypes = getParamTypes(paramTypesAttr);
                    callMethodRule = new CallMethodRule(targetOffset, methodName, paramCount, paramTypes);
                }
            }
            return callMethodRule;
        }

        private String[] getParamTypes(String paramTypes) {
            String[] paramTypesArray;
            if (paramTypes != null) {
                ArrayList paramTypesList = new ArrayList();
                StringTokenizer tokens = new StringTokenizer(paramTypes, " \t\n\r,");
                while (tokens.hasMoreTokens()) {
                    paramTypesList.add(tokens.nextToken());
                }
                paramTypesArray = (String[]) paramTypesList.toArray(new String[0]);
            } else {
                paramTypesArray = new String[0];
            }
            return paramTypesArray;
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$CallParamRuleFactory.class */
    protected class CallParamRuleFactory extends AbstractObjectCreationFactory {
        private final DigesterRuleParser this$0;

        protected CallParamRuleFactory(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        @Override // org.apache.commons.digester.AbstractObjectCreationFactory, org.apache.commons.digester.ObjectCreationFactory
        public Object createObject(Attributes attributes) {
            Rule callParamRule;
            int paramIndex = Integer.parseInt(attributes.getValue("paramnumber"));
            String attributeName = attributes.getValue("attrname");
            String fromStack = attributes.getValue("from-stack");
            String stackIndex = attributes.getValue("stack-index");
            if (attributeName == null) {
                if (stackIndex != null) {
                    callParamRule = new CallParamRule(paramIndex, Integer.parseInt(stackIndex));
                } else if (fromStack != null) {
                    callParamRule = new CallParamRule(paramIndex, Boolean.valueOf(fromStack).booleanValue());
                } else {
                    callParamRule = new CallParamRule(paramIndex);
                }
            } else if (fromStack == null) {
                callParamRule = new CallParamRule(paramIndex, attributeName);
            } else {
                throw new RuntimeException("Attributes from-stack and attrname cannot both be present.");
            }
            return callParamRule;
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$ObjectParamRuleFactory.class */
    protected class ObjectParamRuleFactory extends AbstractObjectCreationFactory {
        private final DigesterRuleParser this$0;

        protected ObjectParamRuleFactory(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        @Override // org.apache.commons.digester.AbstractObjectCreationFactory, org.apache.commons.digester.ObjectCreationFactory
        public Object createObject(Attributes attributes) throws Exception {
            Object param;
            Rule objectParamRule;
            int paramIndex = Integer.parseInt(attributes.getValue("paramnumber"));
            String attributeName = attributes.getValue("attrname");
            String type = attributes.getValue("type");
            String value = attributes.getValue("value");
            if (type == null) {
                throw new RuntimeException("Attribute 'type' is required.");
            }
            Class clazz = Class.forName(type);
            if (value == null) {
                param = clazz.newInstance();
            } else {
                param = ConvertUtils.convert(value, clazz);
            }
            if (attributeName == null) {
                objectParamRule = new ObjectParamRule(paramIndex, param);
            } else {
                objectParamRule = new ObjectParamRule(paramIndex, attributeName, param);
            }
            return objectParamRule;
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$NodeCreateRuleFactory.class */
    protected class NodeCreateRuleFactory extends AbstractObjectCreationFactory {
        private final DigesterRuleParser this$0;

        protected NodeCreateRuleFactory(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        @Override // org.apache.commons.digester.AbstractObjectCreationFactory, org.apache.commons.digester.ObjectCreationFactory
        public Object createObject(Attributes attributes) throws Exception {
            String nodeType = attributes.getValue("type");
            if (nodeType == null || "".equals(nodeType)) {
                return new NodeCreateRule();
            }
            if ("element".equals(nodeType)) {
                return new NodeCreateRule(1);
            }
            if ("fragment".equals(nodeType)) {
                return new NodeCreateRule(11);
            }
            throw new RuntimeException(new StringBuffer().append("Unrecognized node type: ").append(nodeType).append(".  This attribute is optional or can have a value of element|fragment.").toString());
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$FactoryCreateRuleFactory.class */
    protected class FactoryCreateRuleFactory extends AbstractObjectCreationFactory {
        private final DigesterRuleParser this$0;

        protected FactoryCreateRuleFactory(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        @Override // org.apache.commons.digester.AbstractObjectCreationFactory, org.apache.commons.digester.ObjectCreationFactory
        public Object createObject(Attributes attributes) {
            String className = attributes.getValue("classname");
            String attrName = attributes.getValue("attrname");
            boolean ignoreExceptions = "true".equalsIgnoreCase(attributes.getValue("ignore-exceptions"));
            return (attrName == null || attrName.length() == 0) ? new FactoryCreateRule(className, ignoreExceptions) : new FactoryCreateRule(className, attrName, ignoreExceptions);
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$ObjectCreateRuleFactory.class */
    protected class ObjectCreateRuleFactory extends AbstractObjectCreationFactory {
        private final DigesterRuleParser this$0;

        protected ObjectCreateRuleFactory(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        @Override // org.apache.commons.digester.AbstractObjectCreationFactory, org.apache.commons.digester.ObjectCreationFactory
        public Object createObject(Attributes attributes) {
            String className = attributes.getValue("classname");
            String attrName = attributes.getValue("attrname");
            return (attrName == null || attrName.length() == 0) ? new ObjectCreateRule(className) : new ObjectCreateRule(className, attrName);
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$SetPropertiesRuleFactory.class */
    protected class SetPropertiesRuleFactory extends AbstractObjectCreationFactory {
        private final DigesterRuleParser this$0;

        protected SetPropertiesRuleFactory(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        @Override // org.apache.commons.digester.AbstractObjectCreationFactory, org.apache.commons.digester.ObjectCreationFactory
        public Object createObject(Attributes attributes) {
            return new SetPropertiesRule();
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$SetPropertyRuleFactory.class */
    protected class SetPropertyRuleFactory extends AbstractObjectCreationFactory {
        private final DigesterRuleParser this$0;

        protected SetPropertyRuleFactory(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        @Override // org.apache.commons.digester.AbstractObjectCreationFactory, org.apache.commons.digester.ObjectCreationFactory
        public Object createObject(Attributes attributes) {
            String name = attributes.getValue("name");
            String value = attributes.getValue("value");
            return new SetPropertyRule(name, value);
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$SetNestedPropertiesRuleFactory.class */
    protected class SetNestedPropertiesRuleFactory extends AbstractObjectCreationFactory {
        private final DigesterRuleParser this$0;

        protected SetNestedPropertiesRuleFactory(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        @Override // org.apache.commons.digester.AbstractObjectCreationFactory, org.apache.commons.digester.ObjectCreationFactory
        public Object createObject(Attributes attributes) {
            boolean allowUnknownChildElements = "true".equalsIgnoreCase(attributes.getValue("allow-unknown-child-elements"));
            SetNestedPropertiesRule snpr = new SetNestedPropertiesRule();
            snpr.setAllowUnknownChildElements(allowUnknownChildElements);
            return snpr;
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$SetTopRuleFactory.class */
    protected class SetTopRuleFactory extends AbstractObjectCreationFactory {
        private final DigesterRuleParser this$0;

        protected SetTopRuleFactory(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        @Override // org.apache.commons.digester.AbstractObjectCreationFactory, org.apache.commons.digester.ObjectCreationFactory
        public Object createObject(Attributes attributes) {
            String methodName = attributes.getValue("methodname");
            String paramType = attributes.getValue("paramtype");
            return (paramType == null || paramType.length() == 0) ? new SetTopRule(methodName) : new SetTopRule(methodName, paramType);
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$SetNextRuleFactory.class */
    protected class SetNextRuleFactory extends AbstractObjectCreationFactory {
        private final DigesterRuleParser this$0;

        protected SetNextRuleFactory(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        @Override // org.apache.commons.digester.AbstractObjectCreationFactory, org.apache.commons.digester.ObjectCreationFactory
        public Object createObject(Attributes attributes) {
            String methodName = attributes.getValue("methodname");
            String paramType = attributes.getValue("paramtype");
            return (paramType == null || paramType.length() == 0) ? new SetNextRule(methodName) : new SetNextRule(methodName, paramType);
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$SetRootRuleFactory.class */
    protected class SetRootRuleFactory extends AbstractObjectCreationFactory {
        private final DigesterRuleParser this$0;

        protected SetRootRuleFactory(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        @Override // org.apache.commons.digester.AbstractObjectCreationFactory, org.apache.commons.digester.ObjectCreationFactory
        public Object createObject(Attributes attributes) {
            String methodName = attributes.getValue("methodname");
            String paramType = attributes.getValue("paramtype");
            return (paramType == null || paramType.length() == 0) ? new SetRootRule(methodName) : new SetRootRule(methodName, paramType);
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$SetPropertiesAliasRule.class */
    protected class SetPropertiesAliasRule extends Rule {
        private final DigesterRuleParser this$0;

        public SetPropertiesAliasRule(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        @Override // org.apache.commons.digester.Rule
        public void begin(Attributes attributes) {
            String attrName = attributes.getValue("attr-name");
            String propName = attributes.getValue("prop-name");
            SetPropertiesRule rule = (SetPropertiesRule) this.digester.peek();
            rule.addAlias(attrName, propName);
        }
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterRuleParser$SetNestedPropertiesAliasRule.class */
    protected class SetNestedPropertiesAliasRule extends Rule {
        private final DigesterRuleParser this$0;

        public SetNestedPropertiesAliasRule(DigesterRuleParser this$0) {
            this.this$0 = this$0;
        }

        @Override // org.apache.commons.digester.Rule
        public void begin(Attributes attributes) {
            String attrName = attributes.getValue("attr-name");
            String propName = attributes.getValue("prop-name");
            SetNestedPropertiesRule rule = (SetNestedPropertiesRule) this.digester.peek();
            rule.addAlias(attrName, propName);
        }
    }
}
