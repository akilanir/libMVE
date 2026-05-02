package freemarker.core;

import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateModelIterator;
import freemarker.template.TemplateSequenceModel;
import java.io.Serializable;
import java.util.ArrayList;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/CollectionAndSequence.class */
public final class CollectionAndSequence implements TemplateCollectionModel, TemplateSequenceModel, Serializable {
    private TemplateCollectionModel collection;
    private TemplateSequenceModel sequence;
    private ArrayList data;

    public CollectionAndSequence(TemplateCollectionModel collection) {
        this.collection = collection;
    }

    public CollectionAndSequence(TemplateSequenceModel sequence) {
        this.sequence = sequence;
    }

    @Override // freemarker.template.TemplateCollectionModel
    public TemplateModelIterator iterator() throws TemplateModelException {
        if (this.collection != null) {
            return this.collection.iterator();
        }
        return new SequenceIterator(this.sequence);
    }

    @Override // freemarker.template.TemplateSequenceModel
    public TemplateModel get(int i) throws TemplateModelException {
        if (this.sequence != null) {
            return this.sequence.get(i);
        }
        initSequence();
        return (TemplateModel) this.data.get(i);
    }

    @Override // freemarker.template.TemplateSequenceModel
    public int size() throws TemplateModelException {
        if (this.sequence != null) {
            return this.sequence.size();
        }
        initSequence();
        return this.data.size();
    }

    private void initSequence() throws TemplateModelException {
        if (this.data == null) {
            this.data = new ArrayList();
            TemplateModelIterator it = this.collection.iterator();
            while (it.hasNext()) {
                this.data.add(it.next());
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/CollectionAndSequence$SequenceIterator.class */
    private static class SequenceIterator implements TemplateModelIterator {
        private final TemplateSequenceModel sequence;
        private final int size;
        private int index = 0;

        SequenceIterator(TemplateSequenceModel sequence) throws TemplateModelException {
            this.sequence = sequence;
            this.size = sequence.size();
        }

        @Override // freemarker.template.TemplateModelIterator
        public TemplateModel next() throws TemplateModelException {
            TemplateSequenceModel templateSequenceModel = this.sequence;
            int i = this.index;
            this.index = i + 1;
            return templateSequenceModel.get(i);
        }

        @Override // freemarker.template.TemplateModelIterator
        public boolean hasNext() {
            return this.index < this.size;
        }
    }
}
