package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Caller.class */
class Caller {
    private final Function commit;
    private final Function validate;
    private final Function persist;
    private final Function complete;
    private final Function replace;
    private final Function resolve;
    private final Context context;

    public Caller(Scanner schema, Context context) {
        this.validate = schema.getValidate();
        this.complete = schema.getComplete();
        this.replace = schema.getReplace();
        this.resolve = schema.getResolve();
        this.persist = schema.getPersist();
        this.commit = schema.getCommit();
        this.context = context;
    }

    public Object replace(Object source) throws Exception {
        if (this.replace != null) {
            return this.replace.call(this.context, source);
        }
        return source;
    }

    public Object resolve(Object source) throws Exception {
        if (this.resolve != null) {
            return this.resolve.call(this.context, source);
        }
        return source;
    }

    public void commit(Object source) throws Exception {
        if (this.commit != null) {
            this.commit.call(this.context, source);
        }
    }

    public void validate(Object source) throws Exception {
        if (this.validate != null) {
            this.validate.call(this.context, source);
        }
    }

    public void persist(Object source) throws Exception {
        if (this.persist != null) {
            this.persist.call(this.context, source);
        }
    }

    public void complete(Object source) throws Exception {
        if (this.complete != null) {
            this.complete.call(this.context, source);
        }
    }
}
