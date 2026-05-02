package freemarker.ext.jsp;

import freemarker.log.Logger;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateTransformModel;
import freemarker.template.TransformControl;
import java.io.CharArrayReader;
import java.io.CharArrayWriter;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.util.Map;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTag;
import javax.servlet.jsp.tagext.Tag;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/TagTransformModel.class */
class TagTransformModel extends JspTagModelBase implements TemplateTransformModel {
    private static final Logger logger = Logger.getLogger("freemarker.jsp");
    private final boolean isBodyTag;
    private final boolean isIterationTag;
    private final boolean isTryCatchFinally;
    static Class class$javax$servlet$jsp$tagext$IterationTag;
    static Class class$javax$servlet$jsp$tagext$BodyTag;
    static Class class$javax$servlet$jsp$tagext$TryCatchFinally;
    static Class class$javax$servlet$jsp$tagext$Tag;

    /* JADX WARN: Removed duplicated region for block: B:15:0x004a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public TagTransformModel(java.lang.Class r5) throws java.beans.IntrospectionException {
        /*
            r4 = this;
            r0 = r4
            r1 = r5
            r0.<init>(r1)
            r0 = r4
            java.lang.Class r1 = freemarker.ext.jsp.TagTransformModel.class$javax$servlet$jsp$tagext$IterationTag
            if (r1 != 0) goto L18
            java.lang.String r1 = "javax.servlet.jsp.tagext.IterationTag"
            java.lang.Class r1 = class$(r1)
            r2 = r1
            freemarker.ext.jsp.TagTransformModel.class$javax$servlet$jsp$tagext$IterationTag = r2
            goto L1b
        L18:
            java.lang.Class r1 = freemarker.ext.jsp.TagTransformModel.class$javax$servlet$jsp$tagext$IterationTag
        L1b:
            r2 = r5
            boolean r1 = r1.isAssignableFrom(r2)
            r0.isIterationTag = r1
            r0 = r4
            r1 = r4
            boolean r1 = r1.isIterationTag
            if (r1 == 0) goto L4a
            java.lang.Class r1 = freemarker.ext.jsp.TagTransformModel.class$javax$servlet$jsp$tagext$BodyTag
            if (r1 != 0) goto L3c
            java.lang.String r1 = "javax.servlet.jsp.tagext.BodyTag"
            java.lang.Class r1 = class$(r1)
            r2 = r1
            freemarker.ext.jsp.TagTransformModel.class$javax$servlet$jsp$tagext$BodyTag = r2
            goto L3f
        L3c:
            java.lang.Class r1 = freemarker.ext.jsp.TagTransformModel.class$javax$servlet$jsp$tagext$BodyTag
        L3f:
            r2 = r5
            boolean r1 = r1.isAssignableFrom(r2)
            if (r1 == 0) goto L4a
            r1 = 1
            goto L4b
        L4a:
            r1 = 0
        L4b:
            r0.isBodyTag = r1
            r0 = r4
            java.lang.Class r1 = freemarker.ext.jsp.TagTransformModel.class$javax$servlet$jsp$tagext$TryCatchFinally
            if (r1 != 0) goto L61
            java.lang.String r1 = "javax.servlet.jsp.tagext.TryCatchFinally"
            java.lang.Class r1 = class$(r1)
            r2 = r1
            freemarker.ext.jsp.TagTransformModel.class$javax$servlet$jsp$tagext$TryCatchFinally = r2
            goto L64
        L61:
            java.lang.Class r1 = freemarker.ext.jsp.TagTransformModel.class$javax$servlet$jsp$tagext$TryCatchFinally
        L64:
            r2 = r5
            boolean r1 = r1.isAssignableFrom(r2)
            r0.isTryCatchFinally = r1
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: freemarker.ext.jsp.TagTransformModel.<init>(java.lang.Class):void");
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v15, types: [freemarker.ext.jsp.JspWriterAdapter] */
    @Override // freemarker.template.TemplateTransformModel
    public Writer getWriter(Writer out, Map args) throws TemplateModelException {
        Class cls;
        boolean usesAdapter;
        try {
            Tag tag = (Tag) getTagInstance();
            FreeMarkerPageContext pageContext = PageContextFactory.getCurrentPageContext();
            if (class$javax$servlet$jsp$tagext$Tag == null) {
                cls = class$("javax.servlet.jsp.tagext.Tag");
                class$javax$servlet$jsp$tagext$Tag = cls;
            } else {
                cls = class$javax$servlet$jsp$tagext$Tag;
            }
            Tag parentTag = (Tag) pageContext.peekTopTag(cls);
            tag.setParent(parentTag);
            tag.setPageContext(pageContext);
            setupTag(tag, args, pageContext.getObjectWrapper());
            if (out instanceof JspWriter) {
                if (out != pageContext.getOut()) {
                    throw new TemplateModelException(new StringBuffer().append("out != pageContext.getOut(). Out is ").append(out).append(" pageContext.getOut() is ").append(pageContext.getOut()).toString());
                }
                usesAdapter = false;
            } else {
                out = new JspWriterAdapter(out);
                pageContext.pushWriter((JspWriter) out);
                usesAdapter = true;
            }
            JspWriter w = new TagWriter(this, out, tag, pageContext, usesAdapter);
            pageContext.pushTopTag(tag);
            pageContext.pushWriter(w);
            return w;
        } catch (TemplateModelException e) {
            throw e;
        } catch (RuntimeException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new TemplateModelException(e3);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/TagTransformModel$BodyContentImpl.class */
    static class BodyContentImpl extends BodyContent {
        private CharArrayWriter buf;

        BodyContentImpl(JspWriter out, boolean buffer) {
            super(out);
            if (buffer) {
                initBuffer();
            }
        }

        void initBuffer() {
            this.buf = new CharArrayWriter();
        }

        public void flush() throws IOException {
            if (this.buf == null) {
                getEnclosingWriter().flush();
            }
        }

        public void clear() throws IOException {
            if (this.buf != null) {
                this.buf = new CharArrayWriter();
                return;
            }
            throw new IOException("Can't clear");
        }

        public void clearBuffer() throws IOException {
            if (this.buf != null) {
                this.buf = new CharArrayWriter();
                return;
            }
            throw new IOException("Can't clear");
        }

        public int getRemaining() {
            return Integer.MAX_VALUE;
        }

        public void newLine() throws IOException {
            write(JspWriterAdapter.NEWLINE);
        }

        public void close() throws IOException {
        }

        public void print(boolean arg0) throws IOException {
            write(arg0 ? Boolean.TRUE.toString() : Boolean.FALSE.toString());
        }

        public void print(char arg0) throws IOException {
            write(arg0);
        }

        public void print(char[] arg0) throws IOException {
            write(arg0);
        }

        public void print(double arg0) throws IOException {
            write(Double.toString(arg0));
        }

        public void print(float arg0) throws IOException {
            write(Float.toString(arg0));
        }

        public void print(int arg0) throws IOException {
            write(Integer.toString(arg0));
        }

        public void print(long arg0) throws IOException {
            write(Long.toString(arg0));
        }

        public void print(Object arg0) throws IOException {
            write(arg0 == null ? "null" : arg0.toString());
        }

        public void print(String arg0) throws IOException {
            write(arg0);
        }

        public void println() throws IOException {
            newLine();
        }

        public void println(boolean arg0) throws IOException {
            print(arg0);
            newLine();
        }

        public void println(char arg0) throws IOException {
            print(arg0);
            newLine();
        }

        public void println(char[] arg0) throws IOException {
            print(arg0);
            newLine();
        }

        public void println(double arg0) throws IOException {
            print(arg0);
            newLine();
        }

        public void println(float arg0) throws IOException {
            print(arg0);
            newLine();
        }

        public void println(int arg0) throws IOException {
            print(arg0);
            newLine();
        }

        public void println(long arg0) throws IOException {
            print(arg0);
            newLine();
        }

        public void println(Object arg0) throws IOException {
            print(arg0);
            newLine();
        }

        public void println(String arg0) throws IOException {
            print(arg0);
            newLine();
        }

        public void write(int c) throws IOException {
            if (this.buf != null) {
                this.buf.write(c);
            } else {
                getEnclosingWriter().write(c);
            }
        }

        public void write(char[] cbuf, int off, int len) throws IOException {
            if (this.buf != null) {
                this.buf.write(cbuf, off, len);
            } else {
                getEnclosingWriter().write(cbuf, off, len);
            }
        }

        public String getString() {
            return this.buf.toString();
        }

        public Reader getReader() {
            return new CharArrayReader(this.buf.toCharArray());
        }

        public void writeOut(Writer out) throws IOException {
            this.buf.writeTo(out);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/TagTransformModel$TagWriter.class */
    class TagWriter extends BodyContentImpl implements TransformControl {
        private final Tag tag;
        private final FreeMarkerPageContext pageContext;
        private boolean needPop;
        private final boolean needDoublePop;
        private final TagTransformModel this$0;

        TagWriter(TagTransformModel tagTransformModel, Writer out, Tag tag, FreeMarkerPageContext pageContext, boolean needDoublePop) {
            super((JspWriter) out, false);
            this.this$0 = tagTransformModel;
            this.needPop = true;
            this.needDoublePop = needDoublePop;
            this.tag = tag;
            this.pageContext = pageContext;
        }

        public String toString() {
            return new StringBuffer().append("TagWriter for ").append(this.tag.getClass().getName()).append(" wrapping a ").append(getEnclosingWriter().toString()).toString();
        }

        Tag getTag() {
            return this.tag;
        }

        FreeMarkerPageContext getPageContext() {
            return this.pageContext;
        }

        @Override // freemarker.template.TransformControl
        public int onStart() throws TemplateModelException {
            try {
                int dst = this.tag.doStartTag();
                switch (dst) {
                    case 0:
                    case 6:
                        endEvaluation();
                        return 0;
                    case 1:
                        return 1;
                    case 2:
                        if (this.this$0.isBodyTag) {
                            initBuffer();
                            BodyTag btag = this.tag;
                            btag.setBodyContent(this);
                            btag.doInitBody();
                            return 1;
                        }
                        throw new TemplateModelException(new StringBuffer().append("Can't buffer body since ").append(this.tag.getClass().getName()).append(" does not implement BodyTag.").toString());
                    case 3:
                    case 4:
                    case 5:
                    default:
                        throw new RuntimeException(new StringBuffer().append("Illegal return value ").append(dst).append(" from ").append(this.tag.getClass().getName()).append(".doStartTag()").toString());
                }
            } catch (JspException e) {
                throw new TemplateModelException(e.getMessage(), (Exception) e);
            }
        }

        @Override // freemarker.template.TransformControl
        public int afterBody() throws TemplateModelException {
            try {
                if (this.this$0.isIterationTag) {
                    int dab = this.tag.doAfterBody();
                    switch (dab) {
                        case 0:
                            endEvaluation();
                            return 1;
                        case 2:
                            return 0;
                        default:
                            throw new TemplateModelException(new StringBuffer().append("Unexpected return value ").append(dab).append("from ").append(this.tag.getClass().getName()).append(".doAfterBody()").toString());
                    }
                }
                endEvaluation();
                return 1;
            } catch (JspException e) {
                throw new TemplateModelException((Exception) e);
            }
        }

        private void endEvaluation() throws JspException {
            if (this.needPop) {
                this.pageContext.popWriter();
                this.needPop = false;
            }
            if (this.tag.doEndTag() == 5) {
                TagTransformModel.logger.warn(new StringBuffer().append("Tag.SKIP_PAGE was ignored from a ").append(this.tag.getClass().getName()).append(" tag.").toString());
            }
        }

        @Override // freemarker.template.TransformControl
        public void onError(Throwable t) throws Throwable {
            if (this.this$0.isTryCatchFinally) {
                this.tag.doCatch(t);
                return;
            }
            throw t;
        }

        @Override // freemarker.ext.jsp.TagTransformModel.BodyContentImpl
        public void close() {
            if (this.needPop) {
                this.pageContext.popWriter();
            }
            this.pageContext.popTopTag();
            try {
                if (this.this$0.isTryCatchFinally) {
                    this.tag.doFinally();
                }
                this.tag.release();
                if (this.needDoublePop) {
                    this.pageContext.popWriter();
                }
            } catch (Throwable th) {
                if (this.needDoublePop) {
                    this.pageContext.popWriter();
                }
                throw th;
            }
        }
    }
}
