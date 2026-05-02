package freemarker.ext.jsp;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import java.beans.IntrospectionException;
import java.io.IOException;
import java.io.Writer;
import java.util.Map;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.JspTag;
import javax.servlet.jsp.tagext.SimpleTag;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/SimpleTagDirectiveModel.class */
class SimpleTagDirectiveModel extends JspTagModelBase implements TemplateDirectiveModel {
    static Class class$javax$servlet$jsp$tagext$SimpleTag;
    static Class class$javax$servlet$jsp$tagext$Tag;
    static Class class$javax$servlet$jsp$tagext$JspTag;

    protected SimpleTagDirectiveModel(Class tagClass) throws IntrospectionException {
        Class cls;
        Class cls2;
        Class cls3;
        super(tagClass);
        if (class$javax$servlet$jsp$tagext$SimpleTag == null) {
            cls = class$("javax.servlet.jsp.tagext.SimpleTag");
            class$javax$servlet$jsp$tagext$SimpleTag = cls;
        } else {
            cls = class$javax$servlet$jsp$tagext$SimpleTag;
        }
        if (!cls.isAssignableFrom(tagClass)) {
            StringBuffer append = new StringBuffer().append(tagClass.getName()).append(" does not implement either the ");
            if (class$javax$servlet$jsp$tagext$Tag == null) {
                cls2 = class$("javax.servlet.jsp.tagext.Tag");
                class$javax$servlet$jsp$tagext$Tag = cls2;
            } else {
                cls2 = class$javax$servlet$jsp$tagext$Tag;
            }
            StringBuffer append2 = append.append(cls2.getName()).append(" interface or the ");
            if (class$javax$servlet$jsp$tagext$SimpleTag == null) {
                cls3 = class$("javax.servlet.jsp.tagext.SimpleTag");
                class$javax$servlet$jsp$tagext$SimpleTag = cls3;
            } else {
                cls3 = class$javax$servlet$jsp$tagext$SimpleTag;
            }
            throw new IllegalArgumentException(append2.append(cls3.getName()).append(" interface.").toString());
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    /* JADX WARN: Finally extract failed */
    @Override // freemarker.template.TemplateDirectiveModel
    public void execute(Environment env, Map args, TemplateModel[] outArgs, TemplateDirectiveBody body) throws TemplateException, IOException {
        Class cls;
        try {
            SimpleTag tag = (SimpleTag) getTagInstance();
            FreeMarkerPageContext pageContext = PageContextFactory.getCurrentPageContext();
            pageContext.pushWriter(new JspWriterAdapter(env.getOut()));
            try {
                tag.setJspContext(pageContext);
                if (class$javax$servlet$jsp$tagext$JspTag == null) {
                    cls = class$("javax.servlet.jsp.tagext.JspTag");
                    class$javax$servlet$jsp$tagext$JspTag = cls;
                } else {
                    cls = class$javax$servlet$jsp$tagext$JspTag;
                }
                JspTag parentTag = (JspTag) pageContext.peekTopTag(cls);
                if (parentTag != null) {
                    tag.setParent(parentTag);
                }
                setupTag(tag, args, pageContext.getObjectWrapper());
                if (body != null) {
                    tag.setJspBody(new JspFragment(this, pageContext, body) { // from class: freemarker.ext.jsp.SimpleTagDirectiveModel.1
                        private final FreeMarkerPageContext val$pageContext;
                        private final TemplateDirectiveBody val$body;
                        private final SimpleTagDirectiveModel this$0;

                        {
                            this.this$0 = this;
                            this.val$pageContext = pageContext;
                            this.val$body = body;
                        }

                        public JspContext getJspContext() {
                            return this.val$pageContext;
                        }

                        public void invoke(Writer out) throws JspException, IOException {
                            try {
                                this.val$body.render(out == null ? this.val$pageContext.getOut() : out);
                            } catch (TemplateException e) {
                                throw new JspException(e);
                            }
                        }
                    });
                    pageContext.pushTopTag(tag);
                    try {
                        tag.doTag();
                        pageContext.popTopTag();
                    } catch (Throwable th) {
                        pageContext.popTopTag();
                        throw th;
                    }
                } else {
                    tag.doTag();
                }
                pageContext.popWriter();
            } catch (Throwable th2) {
                pageContext.popWriter();
                throw th2;
            }
        } catch (TemplateException e) {
            throw e;
        } catch (RuntimeException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new TemplateModelException(e3);
        }
    }
}
