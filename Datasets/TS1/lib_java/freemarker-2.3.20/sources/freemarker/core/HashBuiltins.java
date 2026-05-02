package freemarker.core;

import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateHashModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateSequenceModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/HashBuiltins.class */
class HashBuiltins {

    /* renamed from: freemarker.core.HashBuiltins$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/core/HashBuiltins$1.class */
    static class AnonymousClass1 {
    }

    private HashBuiltins() {
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/HashBuiltins$HashExBuiltin.class */
    private static abstract class HashExBuiltin extends BuiltIn {
        abstract TemplateModel calculateResult(TemplateHashModelEx templateHashModelEx, Environment environment) throws TemplateModelException, InvalidReferenceException;

        private HashExBuiltin() {
        }

        HashExBuiltin(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel model = this.target.eval(env);
            if (model instanceof TemplateHashModelEx) {
                return calculateResult((TemplateHashModelEx) model, env);
            }
            throw new UnexpectedTypeException(this.target, model, "extended hash", env);
        }

        protected InvalidReferenceException newNullPropertyException(String propertyName, TemplateModel tm, Environment env) {
            if (env.getFastInvalidReferenceExceptions()) {
                return InvalidReferenceException.FAST_INSTANCE;
            }
            return new InvalidReferenceException(new _ErrorDescriptionBuilder(new Object[]{"The exteneded hash (of class ", tm.getClass().getName(), ") has returned null for its \"", propertyName, "\" property. This is maybe a bug. The extended hash was returned by this expression:"}).blame(this.target), env);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/HashBuiltins$keysBI.class */
    static class keysBI extends HashExBuiltin {
        keysBI() {
            super(null);
        }

        @Override // freemarker.core.HashBuiltins.HashExBuiltin
        TemplateModel calculateResult(TemplateHashModelEx hashExModel, Environment env) throws TemplateModelException, InvalidReferenceException {
            TemplateCollectionModel keys = hashExModel.keys();
            if (keys == null) {
                throw newNullPropertyException("keys", hashExModel, env);
            }
            return keys instanceof TemplateSequenceModel ? keys : new CollectionAndSequence(keys);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/HashBuiltins$valuesBI.class */
    static class valuesBI extends HashExBuiltin {
        valuesBI() {
            super(null);
        }

        @Override // freemarker.core.HashBuiltins.HashExBuiltin
        TemplateModel calculateResult(TemplateHashModelEx hashExModel, Environment env) throws TemplateModelException, InvalidReferenceException {
            TemplateCollectionModel values = hashExModel.values();
            if (values == null) {
                throw newNullPropertyException("values", hashExModel, env);
            }
            return values instanceof TemplateSequenceModel ? values : new CollectionAndSequence(values);
        }
    }
}
