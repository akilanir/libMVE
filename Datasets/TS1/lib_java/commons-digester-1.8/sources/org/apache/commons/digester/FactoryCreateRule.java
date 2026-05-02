package org.apache.commons.digester;

import org.apache.commons.collections.ArrayStack;
import org.xml.sax.Attributes;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/FactoryCreateRule.class */
public class FactoryCreateRule extends Rule {
    private boolean ignoreCreateExceptions;
    private ArrayStack exceptionIgnoredStack;
    protected String attributeName;
    protected String className;
    protected ObjectCreationFactory creationFactory;

    public FactoryCreateRule(Digester digester, String className) {
        this(className);
    }

    public FactoryCreateRule(Digester digester, Class clazz) {
        this(clazz);
    }

    public FactoryCreateRule(Digester digester, String className, String attributeName) {
        this(className, attributeName);
    }

    public FactoryCreateRule(Digester digester, Class clazz, String attributeName) {
        this(clazz, attributeName);
    }

    public FactoryCreateRule(Digester digester, ObjectCreationFactory creationFactory) {
        this(creationFactory);
    }

    public FactoryCreateRule(String className) {
        this(className, false);
    }

    public FactoryCreateRule(Class clazz) {
        this(clazz, false);
    }

    public FactoryCreateRule(String className, String attributeName) {
        this(className, attributeName, false);
    }

    public FactoryCreateRule(Class clazz, String attributeName) {
        this(clazz, attributeName, false);
    }

    public FactoryCreateRule(ObjectCreationFactory creationFactory) {
        this(creationFactory, false);
    }

    public FactoryCreateRule(String className, boolean ignoreCreateExceptions) {
        this(className, (String) null, ignoreCreateExceptions);
    }

    public FactoryCreateRule(Class clazz, boolean ignoreCreateExceptions) {
        this(clazz, (String) null, ignoreCreateExceptions);
    }

    public FactoryCreateRule(String className, String attributeName, boolean ignoreCreateExceptions) {
        this.attributeName = null;
        this.className = null;
        this.creationFactory = null;
        this.className = className;
        this.attributeName = attributeName;
        this.ignoreCreateExceptions = ignoreCreateExceptions;
    }

    public FactoryCreateRule(Class clazz, String attributeName, boolean ignoreCreateExceptions) {
        this(clazz.getName(), attributeName, ignoreCreateExceptions);
    }

    public FactoryCreateRule(ObjectCreationFactory creationFactory, boolean ignoreCreateExceptions) {
        this.attributeName = null;
        this.className = null;
        this.creationFactory = null;
        this.creationFactory = creationFactory;
        this.ignoreCreateExceptions = ignoreCreateExceptions;
    }

    @Override // org.apache.commons.digester.Rule
    public void begin(String namespace, String name, Attributes attributes) throws Exception {
        if (this.ignoreCreateExceptions) {
            if (this.exceptionIgnoredStack == null) {
                this.exceptionIgnoredStack = new ArrayStack();
            }
            try {
                Object instance = getFactory(attributes).createObject(attributes);
                if (this.digester.log.isDebugEnabled()) {
                    this.digester.log.debug(new StringBuffer().append("[FactoryCreateRule]{").append(this.digester.match).append("} New ").append(instance.getClass().getName()).toString());
                }
                this.digester.push(instance);
                this.exceptionIgnoredStack.push(Boolean.FALSE);
                return;
            } catch (Exception e) {
                if (this.digester.log.isInfoEnabled()) {
                    this.digester.log.info(new StringBuffer().append("[FactoryCreateRule] Create exception ignored: ").append(e.getMessage() == null ? e.getClass().getName() : e.getMessage()).toString());
                    if (this.digester.log.isDebugEnabled()) {
                        this.digester.log.debug("[FactoryCreateRule] Ignored exception:", e);
                    }
                }
                this.exceptionIgnoredStack.push(Boolean.TRUE);
                return;
            }
        }
        Object instance2 = getFactory(attributes).createObject(attributes);
        if (this.digester.log.isDebugEnabled()) {
            this.digester.log.debug(new StringBuffer().append("[FactoryCreateRule]{").append(this.digester.match).append("} New ").append(instance2.getClass().getName()).toString());
        }
        this.digester.push(instance2);
    }

    @Override // org.apache.commons.digester.Rule
    public void end(String namespace, String name) throws Exception {
        if (this.ignoreCreateExceptions && this.exceptionIgnoredStack != null && !this.exceptionIgnoredStack.empty() && ((Boolean) this.exceptionIgnoredStack.pop()).booleanValue()) {
            if (this.digester.log.isTraceEnabled()) {
                this.digester.log.trace("[FactoryCreateRule] No creation so no push so no pop");
            }
        } else {
            Object top = this.digester.pop();
            if (this.digester.log.isDebugEnabled()) {
                this.digester.log.debug(new StringBuffer().append("[FactoryCreateRule]{").append(this.digester.match).append("} Pop ").append(top.getClass().getName()).toString());
            }
        }
    }

    @Override // org.apache.commons.digester.Rule
    public void finish() throws Exception {
        if (this.attributeName != null) {
            this.creationFactory = null;
        }
    }

    public String toString() {
        StringBuffer sb = new StringBuffer("FactoryCreateRule[");
        sb.append("className=");
        sb.append(this.className);
        sb.append(", attributeName=");
        sb.append(this.attributeName);
        if (this.creationFactory != null) {
            sb.append(", creationFactory=");
            sb.append(this.creationFactory);
        }
        sb.append("]");
        return sb.toString();
    }

    protected ObjectCreationFactory getFactory(Attributes attributes) throws Exception {
        String value;
        if (this.creationFactory == null) {
            String realClassName = this.className;
            if (this.attributeName != null && (value = attributes.getValue(this.attributeName)) != null) {
                realClassName = value;
            }
            if (this.digester.log.isDebugEnabled()) {
                this.digester.log.debug(new StringBuffer().append("[FactoryCreateRule]{").append(this.digester.match).append("} New factory ").append(realClassName).toString());
            }
            Class clazz = this.digester.getClassLoader().loadClass(realClassName);
            this.creationFactory = (ObjectCreationFactory) clazz.newInstance();
            this.creationFactory.setDigester(this.digester);
        }
        return this.creationFactory;
    }
}
