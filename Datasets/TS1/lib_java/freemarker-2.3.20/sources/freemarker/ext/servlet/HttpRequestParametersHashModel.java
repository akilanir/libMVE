package freemarker.ext.servlet;

import freemarker.template.SimpleCollection;
import freemarker.template.SimpleScalar;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateHashModelEx;
import freemarker.template.TemplateModel;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/servlet/HttpRequestParametersHashModel.class */
public class HttpRequestParametersHashModel implements TemplateHashModelEx {
    private final HttpServletRequest request;
    private List keys;

    public HttpRequestParametersHashModel(HttpServletRequest request) {
        this.request = request;
    }

    @Override // freemarker.template.TemplateHashModel
    public TemplateModel get(String key) {
        String value = this.request.getParameter(key);
        if (value == null) {
            return null;
        }
        return new SimpleScalar(value);
    }

    @Override // freemarker.template.TemplateHashModel
    public boolean isEmpty() {
        return !this.request.getParameterNames().hasMoreElements();
    }

    @Override // freemarker.template.TemplateHashModelEx
    public int size() {
        return getKeys().size();
    }

    @Override // freemarker.template.TemplateHashModelEx
    public TemplateCollectionModel keys() {
        return new SimpleCollection(getKeys().iterator());
    }

    @Override // freemarker.template.TemplateHashModelEx
    public TemplateCollectionModel values() {
        Iterator iter = getKeys().iterator();
        return new SimpleCollection(new Iterator(this, iter) { // from class: freemarker.ext.servlet.HttpRequestParametersHashModel.1
            private final Iterator val$iter;
            private final HttpRequestParametersHashModel this$0;

            {
                this.this$0 = this;
                this.val$iter = iter;
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.val$iter.hasNext();
            }

            @Override // java.util.Iterator
            public Object next() {
                return this.this$0.request.getParameter((String) this.val$iter.next());
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException();
            }
        });
    }

    protected String transcode(String string) {
        return string;
    }

    private synchronized List getKeys() {
        if (this.keys == null) {
            this.keys = new ArrayList();
            Enumeration enumeration = this.request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                this.keys.add(enumeration.nextElement());
            }
        }
        return this.keys;
    }
}
