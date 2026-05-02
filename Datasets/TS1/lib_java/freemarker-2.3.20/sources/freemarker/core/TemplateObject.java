package freemarker.core;

import freemarker.template.Template;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/TemplateObject.class */
public abstract class TemplateObject {
    private Template template;
    int beginColumn;
    int beginLine;
    int endColumn;
    int endLine;
    static final int RUNTIME_EVAL_LINE_DISPLACEMENT = -1000000000;

    public abstract String getCanonicalForm();

    abstract String getNodeTypeSymbol();

    abstract int getParameterCount();

    abstract Object getParameterValue(int i);

    abstract ParameterRole getParameterRole(int i);

    final void setLocation(Template template, Token begin, Token end) throws ParseException {
        setLocation(template, begin.beginColumn, begin.beginLine, end.endColumn, end.endLine);
    }

    final void setLocation(Template template, Token begin, TemplateObject end) throws ParseException {
        setLocation(template, begin.beginColumn, begin.beginLine, end.endColumn, end.endLine);
    }

    final void setLocation(Template template, TemplateObject begin, Token end) throws ParseException {
        setLocation(template, begin.beginColumn, begin.beginLine, end.endColumn, end.endLine);
    }

    final void setLocation(Template template, TemplateObject begin, TemplateObject end) throws ParseException {
        setLocation(template, begin.beginColumn, begin.beginLine, end.endColumn, end.endLine);
    }

    void setLocation(Template template, int beginColumn, int beginLine, int endColumn, int endLine) throws ParseException {
        this.template = template;
        this.beginColumn = beginColumn;
        this.beginLine = beginLine;
        this.endColumn = endColumn;
        this.endLine = endLine;
    }

    public final int getBeginColumn() {
        return this.beginColumn;
    }

    public final int getBeginLine() {
        return this.beginLine;
    }

    public final int getEndColumn() {
        return this.endColumn;
    }

    public final int getEndLine() {
        return this.endLine;
    }

    public String getStartLocation() {
        return MessageUtil.formatLocationForEvaluationError(this.template, this.beginLine, this.beginColumn);
    }

    public String getStartLocationQuoted() {
        return getStartLocation();
    }

    public String getEndLocation() {
        return MessageUtil.formatLocationForEvaluationError(this.template, this.endLine, this.endColumn);
    }

    public String getEndLocationQuoted() {
        return getEndLocation();
    }

    public final String getSource() {
        String s;
        if (this.template != null) {
            s = this.template.getSource(this.beginColumn, this.beginLine, this.endColumn, this.endLine);
        } else {
            s = null;
        }
        return s != null ? s : getCanonicalForm();
    }

    public String toString() {
        String s;
        try {
            s = getSource();
        } catch (Exception e) {
            s = null;
        }
        return s != null ? s : getCanonicalForm();
    }

    public boolean contains(int column, int line) {
        if (line < this.beginLine || line > this.endLine) {
            return false;
        }
        if (line == this.beginLine && column < this.beginColumn) {
            return false;
        }
        if (line == this.endLine && column > this.endColumn) {
            return false;
        }
        return true;
    }

    public Template getTemplate() {
        return this.template;
    }

    TemplateObject copyLocationFrom(TemplateObject from) {
        this.template = from.template;
        this.beginColumn = from.beginColumn;
        this.beginLine = from.beginLine;
        this.endColumn = from.endColumn;
        this.endLine = from.endLine;
        return this;
    }
}
