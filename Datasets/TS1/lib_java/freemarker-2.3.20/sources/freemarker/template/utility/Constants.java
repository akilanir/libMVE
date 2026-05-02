package freemarker.template.utility;

import freemarker.template.SimpleNumber;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateHashModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateModelIterator;
import freemarker.template.TemplateNumberModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/Constants.class */
public class Constants {
    public static final TemplateBooleanModel TRUE = TemplateBooleanModel.TRUE;
    public static final TemplateBooleanModel FALSE = TemplateBooleanModel.FALSE;
    public static final TemplateScalarModel EMPTY_STRING = (TemplateScalarModel) TemplateScalarModel.EMPTY_STRING;
    public static final TemplateNumberModel ZERO = new SimpleNumber(0);
    public static final TemplateNumberModel ONE = new SimpleNumber(1);
    public static final TemplateNumberModel MINUS_ONE = new SimpleNumber(-1);
    public static final TemplateModelIterator EMPTY_ITERATOR = new TemplateModelIterator() { // from class: freemarker.template.utility.Constants.1
        @Override // freemarker.template.TemplateModelIterator
        public TemplateModel next() throws TemplateModelException {
            throw new TemplateModelException("The collection has no more elements.");
        }

        @Override // freemarker.template.TemplateModelIterator
        public boolean hasNext() throws TemplateModelException {
            return false;
        }
    };
    public static final TemplateCollectionModel EMPTY_COLLECTION = new TemplateCollectionModel() { // from class: freemarker.template.utility.Constants.2
        @Override // freemarker.template.TemplateCollectionModel
        public TemplateModelIterator iterator() throws TemplateModelException {
            return Constants.EMPTY_ITERATOR;
        }
    };
    public static final TemplateSequenceModel EMPTY_SEQUENCE = new TemplateSequenceModel() { // from class: freemarker.template.utility.Constants.3
        @Override // freemarker.template.TemplateSequenceModel
        public TemplateModel get(int index) throws TemplateModelException {
            return null;
        }

        @Override // freemarker.template.TemplateSequenceModel
        public int size() throws TemplateModelException {
            return 0;
        }
    };
    public static final TemplateHashModelEx EMPTY_HASH = new TemplateHashModelEx() { // from class: freemarker.template.utility.Constants.4
        @Override // freemarker.template.TemplateHashModelEx
        public int size() throws TemplateModelException {
            return 0;
        }

        @Override // freemarker.template.TemplateHashModelEx
        public TemplateCollectionModel keys() throws TemplateModelException {
            return Constants.EMPTY_COLLECTION;
        }

        @Override // freemarker.template.TemplateHashModelEx
        public TemplateCollectionModel values() throws TemplateModelException {
            return Constants.EMPTY_COLLECTION;
        }

        @Override // freemarker.template.TemplateHashModel
        public TemplateModel get(String key) throws TemplateModelException {
            return null;
        }

        @Override // freemarker.template.TemplateHashModel
        public boolean isEmpty() throws TemplateModelException {
            return true;
        }
    };
}
