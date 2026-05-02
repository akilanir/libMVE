package freemarker.ext.jython;

import freemarker.ext.util.ModelFactory;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateModelIterator;
import freemarker.template.TemplateSequenceModel;
import org.python.core.PyException;
import org.python.core.PyObject;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jython/JythonSequenceModel.class */
public class JythonSequenceModel extends JythonModel implements TemplateSequenceModel, TemplateCollectionModel {
    static final ModelFactory FACTORY = new ModelFactory() { // from class: freemarker.ext.jython.JythonSequenceModel.1
        @Override // freemarker.ext.util.ModelFactory
        public TemplateModel create(Object object, ObjectWrapper wrapper) {
            return new JythonSequenceModel((PyObject) object, (JythonWrapper) wrapper);
        }
    };

    public JythonSequenceModel(PyObject object, JythonWrapper wrapper) {
        super(object, wrapper);
    }

    @Override // freemarker.template.TemplateSequenceModel
    public TemplateModel get(int index) throws TemplateModelException {
        try {
            return this.wrapper.wrap(this.object.__finditem__(index));
        } catch (PyException e) {
            throw new TemplateModelException((Exception) e);
        }
    }

    @Override // freemarker.template.TemplateSequenceModel
    public int size() throws TemplateModelException {
        try {
            return this.object.__len__();
        } catch (PyException e) {
            throw new TemplateModelException((Exception) e);
        }
    }

    @Override // freemarker.template.TemplateCollectionModel
    public TemplateModelIterator iterator() {
        return new TemplateModelIterator(this) { // from class: freemarker.ext.jython.JythonSequenceModel.2
            int i = 0;
            private final JythonSequenceModel this$0;

            {
                this.this$0 = this;
            }

            @Override // freemarker.template.TemplateModelIterator
            public boolean hasNext() throws TemplateModelException {
                return this.i < this.this$0.size();
            }

            @Override // freemarker.template.TemplateModelIterator
            public TemplateModel next() throws TemplateModelException {
                JythonSequenceModel jythonSequenceModel = this.this$0;
                int i = this.i;
                this.i = i + 1;
                return jythonSequenceModel.get(i);
            }
        };
    }
}
