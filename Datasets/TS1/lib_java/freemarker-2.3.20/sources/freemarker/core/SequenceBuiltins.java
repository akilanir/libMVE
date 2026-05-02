package freemarker.core;

import freemarker.ext.beans.CollectionModel;
import freemarker.template.SimpleNumber;
import freemarker.template.SimpleScalar;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateDateModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateModelIterator;
import freemarker.template.TemplateModelListSequence;
import freemarker.template.TemplateNumberModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;
import freemarker.template.utility.Constants;
import freemarker.template.utility.StringUtil;
import java.io.Serializable;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins.class */
class SequenceBuiltins {

    /* renamed from: freemarker.core.SequenceBuiltins$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$1.class */
    static class AnonymousClass1 {
    }

    private SequenceBuiltins() {
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$SequenceBuiltIn.class */
    private static abstract class SequenceBuiltIn extends BuiltIn {
        abstract TemplateModel calculateResult(TemplateSequenceModel templateSequenceModel) throws TemplateModelException;

        private SequenceBuiltIn() {
        }

        SequenceBuiltIn(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel model = this.target.eval(env);
            if (!(model instanceof TemplateSequenceModel)) {
                throw new UnexpectedTypeException(this.target, model, "sequence", env);
            }
            return calculateResult((TemplateSequenceModel) model);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$firstBI.class */
    static class firstBI extends SequenceBuiltIn {
        firstBI() {
            super(null);
        }

        @Override // freemarker.core.SequenceBuiltins.SequenceBuiltIn
        TemplateModel calculateResult(TemplateSequenceModel tsm) throws TemplateModelException {
            if (tsm.size() == 0) {
                return null;
            }
            return tsm.get(0);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$lastBI.class */
    static class lastBI extends SequenceBuiltIn {
        lastBI() {
            super(null);
        }

        @Override // freemarker.core.SequenceBuiltins.SequenceBuiltIn
        TemplateModel calculateResult(TemplateSequenceModel tsm) throws TemplateModelException {
            if (tsm.size() == 0) {
                return null;
            }
            return tsm.get(tsm.size() - 1);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$reverseBI.class */
    static class reverseBI extends SequenceBuiltIn {
        reverseBI() {
            super(null);
        }

        @Override // freemarker.core.SequenceBuiltins.SequenceBuiltIn
        TemplateModel calculateResult(TemplateSequenceModel tsm) {
            if (!(tsm instanceof ReverseSequence)) {
                return new ReverseSequence(tsm);
            }
            return ((ReverseSequence) tsm).seq;
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$reverseBI$ReverseSequence.class */
        private static class ReverseSequence implements TemplateSequenceModel {
            private final TemplateSequenceModel seq;

            ReverseSequence(TemplateSequenceModel seq) {
                this.seq = seq;
            }

            @Override // freemarker.template.TemplateSequenceModel
            public int size() throws TemplateModelException {
                return this.seq.size();
            }

            @Override // freemarker.template.TemplateSequenceModel
            public TemplateModel get(int index) throws TemplateModelException {
                return this.seq.get((this.seq.size() - 1) - index);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$sortBI.class */
    static class sortBI extends SequenceBuiltIn {
        static final int KEY_TYPE_NOT_YET_DETECTED = 0;
        static final int KEY_TYPE_STRING = 1;
        static final int KEY_TYPE_NUMBER = 2;
        static final int KEY_TYPE_DATE = 3;
        static final int KEY_TYPE_BOOLEAN = 4;

        sortBI() {
            super(null);
        }

        @Override // freemarker.core.SequenceBuiltins.SequenceBuiltIn
        TemplateModel calculateResult(TemplateSequenceModel seq) throws TemplateModelException {
            return sort(seq, null);
        }

        static Object[] startErrorMessage(int keyNamesLn) {
            Object[] objArr = new Object[2];
            objArr[0] = keyNamesLn == 0 ? "?sort" : "?sort_by(...)";
            objArr[1] = " failed: ";
            return objArr;
        }

        static Object[] startErrorMessage(int keyNamesLn, int index) {
            Object[] objArr = new Object[4];
            objArr[0] = keyNamesLn == 0 ? "?sort" : "?sort_by(...)";
            objArr[1] = " failed at sequence index ";
            objArr[2] = new Integer(index);
            objArr[3] = index == 0 ? ": " : " (0-based): ";
            return objArr;
        }

        static TemplateModelException newInconsistentSortKeyTypeException(int keyNamesLn, String firstType, String firstTypePlural, int index, TemplateModel key) {
            String valueInMsg;
            String valuesInMsg;
            if (keyNamesLn == 0) {
                valueInMsg = "value";
                valuesInMsg = "values";
            } else {
                valueInMsg = "key value";
                valuesInMsg = "key values";
            }
            return new _TemplateModelException(new Object[]{startErrorMessage(keyNamesLn, index), "All ", valuesInMsg, " in the sequence must be ", firstTypePlural, ", because the first ", valueInMsg, " was that. However, the ", valueInMsg, " of the current item isn't a ", firstType, " but a ", new _DelayedFTLTypeDescription(key), "."});
        }

        static TemplateSequenceModel sort(TemplateSequenceModel seq, String[] keyNames) throws TemplateModelException {
            int ln = seq.size();
            if (ln == 0) {
                return seq;
            }
            ArrayList res = new ArrayList(ln);
            int keyNamesLn = keyNames == null ? 0 : keyNames.length;
            int keyType = 0;
            Comparator keyComparator = null;
            for (int i = 0; i < ln; i++) {
                TemplateModel item = seq.get(i);
                TemplateModel key = item;
                int keyNameI = 0;
                while (keyNameI < keyNamesLn) {
                    try {
                        key = ((TemplateHashModel) key).get(keyNames[keyNameI]);
                        if (key != null) {
                            keyNameI++;
                        } else {
                            throw new _TemplateModelException(new Object[]{startErrorMessage(keyNamesLn, i), new StringBuffer().append("The ").append(StringUtil.jQuote(keyNames[keyNameI])).toString(), " subvariable was not found."});
                        }
                    } catch (ClassCastException e) {
                        if (!(key instanceof TemplateHashModel)) {
                            Object[] objArr = new Object[6];
                            objArr[0] = startErrorMessage(keyNamesLn, i);
                            objArr[1] = keyNameI == 0 ? "Sequence items must be hashes when using ?sort_by. " : new StringBuffer().append("The ").append(StringUtil.jQuote(keyNames[keyNameI - 1])).toString();
                            objArr[2] = " subvariable is not a hash, so ?sort_by ";
                            objArr[3] = "can't proceed with getting the ";
                            objArr[4] = new _DelayedJQuote(keyNames[keyNameI]);
                            objArr[5] = " subvariable.";
                            throw new _TemplateModelException(objArr);
                        }
                        throw e;
                    }
                }
                if (keyType == 0) {
                    if (key instanceof TemplateScalarModel) {
                        keyType = 1;
                        keyComparator = new LexicalKVPComparator(Environment.getCurrentEnvironment().getCollator());
                    } else if (key instanceof TemplateNumberModel) {
                        keyType = 2;
                        keyComparator = new NumericalKVPComparator(Environment.getCurrentEnvironment().getArithmeticEngine(), null);
                    } else if (key instanceof TemplateDateModel) {
                        keyType = 3;
                        keyComparator = new DateKVPComparator(null);
                    } else if (key instanceof TemplateBooleanModel) {
                        keyType = 4;
                        keyComparator = new BooleanKVPComparator(null);
                    } else {
                        throw new _TemplateModelException(new Object[]{startErrorMessage(keyNamesLn, i), "Values used for sorting must be numbers, strings, date/times or booleans."});
                    }
                }
                switch (keyType) {
                    case 1:
                        try {
                            res.add(new KVP(((TemplateScalarModel) key).getAsString(), item, null));
                            break;
                        } catch (ClassCastException e2) {
                            if (!(key instanceof TemplateScalarModel)) {
                                throw newInconsistentSortKeyTypeException(keyNamesLn, "string", "strings", i, key);
                            }
                            throw e2;
                        }
                    case 2:
                        try {
                            res.add(new KVP(((TemplateNumberModel) key).getAsNumber(), item, null));
                            break;
                        } catch (ClassCastException e3) {
                            if (!(key instanceof TemplateNumberModel)) {
                                throw newInconsistentSortKeyTypeException(keyNamesLn, "number", "numbers", i, key);
                            }
                            break;
                        }
                    case 3:
                        try {
                            res.add(new KVP(((TemplateDateModel) key).getAsDate(), item, null));
                            break;
                        } catch (ClassCastException e4) {
                            if (!(key instanceof TemplateDateModel)) {
                                throw newInconsistentSortKeyTypeException(keyNamesLn, "date/time", "date/times", i, key);
                            }
                            break;
                        }
                    case 4:
                        try {
                            res.add(new KVP(((TemplateBooleanModel) key).getAsBoolean() ? Boolean.TRUE : Boolean.FALSE, item, null));
                            break;
                        } catch (ClassCastException e5) {
                            if (!(key instanceof TemplateBooleanModel)) {
                                throw newInconsistentSortKeyTypeException(keyNamesLn, "boolean", "booleans", i, key);
                            }
                            break;
                        }
                    default:
                        throw new RuntimeException("FreeMarker bug: Unexpected key type");
                }
            }
            try {
                Collections.sort(res, keyComparator);
                for (int i2 = 0; i2 < ln; i2++) {
                    res.set(i2, ((KVP) res.get(i2)).value);
                }
                return new TemplateModelListSequence(res);
            } catch (Exception exc) {
                throw new _TemplateModelException(exc, new Object[]{startErrorMessage(keyNamesLn), new StringBuffer().append("Unexpected error while sorting:").append(exc).toString()});
            }
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$sortBI$KVP.class */
        private static class KVP {
            private Object key;
            private Object value;

            KVP(Object x0, Object x1, AnonymousClass1 x2) {
                this(x0, x1);
            }

            private KVP(Object key, Object value) {
                this.key = key;
                this.value = value;
            }
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$sortBI$NumericalKVPComparator.class */
        private static class NumericalKVPComparator implements Comparator {
            private ArithmeticEngine ae;

            NumericalKVPComparator(ArithmeticEngine x0, AnonymousClass1 x1) {
                this(x0);
            }

            private NumericalKVPComparator(ArithmeticEngine ae) {
                this.ae = ae;
            }

            @Override // java.util.Comparator
            public int compare(Object arg0, Object arg1) {
                try {
                    return this.ae.compareNumbers((Number) ((KVP) arg0).key, (Number) ((KVP) arg1).key);
                } catch (TemplateException e) {
                    throw new ClassCastException(new StringBuffer().append("Failed to compare numbers: ").append(e).toString());
                }
            }
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$sortBI$LexicalKVPComparator.class */
        private static class LexicalKVPComparator implements Comparator {
            private Collator collator;

            LexicalKVPComparator(Collator collator) {
                this.collator = collator;
            }

            @Override // java.util.Comparator
            public int compare(Object arg0, Object arg1) {
                return this.collator.compare(((KVP) arg0).key, ((KVP) arg1).key);
            }
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$sortBI$DateKVPComparator.class */
        private static class DateKVPComparator implements Comparator, Serializable {
            private DateKVPComparator() {
            }

            DateKVPComparator(AnonymousClass1 x0) {
                this();
            }

            @Override // java.util.Comparator
            public int compare(Object arg0, Object arg1) {
                return ((Date) ((KVP) arg0).key).compareTo((Date) ((KVP) arg1).key);
            }
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$sortBI$BooleanKVPComparator.class */
        private static class BooleanKVPComparator implements Comparator, Serializable {
            private BooleanKVPComparator() {
            }

            BooleanKVPComparator(AnonymousClass1 x0) {
                this();
            }

            @Override // java.util.Comparator
            public int compare(Object arg0, Object arg1) {
                boolean b0 = ((Boolean) ((KVP) arg0).key).booleanValue();
                boolean b1 = ((Boolean) ((KVP) arg1).key).booleanValue();
                return b0 ? b1 ? 0 : 1 : b1 ? -1 : 0;
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$sort_byBI.class */
    static class sort_byBI extends sortBI {
        sort_byBI() {
        }

        @Override // freemarker.core.SequenceBuiltins.sortBI, freemarker.core.SequenceBuiltins.SequenceBuiltIn
        TemplateModel calculateResult(TemplateSequenceModel seq) {
            return new BIMethod(this, seq);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$sort_byBI$BIMethod.class */
        class BIMethod implements TemplateMethodModelEx {
            TemplateSequenceModel seq;
            private final sort_byBI this$0;

            BIMethod(sort_byBI sort_bybi, TemplateSequenceModel seq) {
                this.this$0 = sort_bybi;
                this.seq = seq;
            }

            @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                String[] subvars;
                if (args.size() < 1) {
                    throw MessageUtil.newArgCntError(new StringBuffer().append("?").append(this.this$0.key).toString(), args.size(), 1);
                }
                Object obj = args.get(0);
                if (obj instanceof TemplateScalarModel) {
                    subvars = new String[]{((TemplateScalarModel) obj).getAsString()};
                } else if (obj instanceof TemplateSequenceModel) {
                    TemplateSequenceModel seq = (TemplateSequenceModel) obj;
                    int ln = seq.size();
                    subvars = new String[ln];
                    for (int i = 0; i < ln; i++) {
                        Object item = seq.get(i);
                        try {
                            subvars[i] = ((TemplateScalarModel) item).getAsString();
                        } catch (ClassCastException e) {
                            if (!(item instanceof TemplateScalarModel)) {
                                throw new _TemplateModelException(new Object[]{"The argument to ?", this.this$0.key, "(key), when it's a sequence, must be a sequence of strings, but the item at index ", new Integer(i), " is not a string."});
                            }
                        }
                    }
                } else {
                    throw new _TemplateModelException(new Object[]{"The argument to ?", this.this$0.key, "(key) must be a string (the name of the subvariable), or a sequence of strings (the \"path\" to the subvariable)."});
                }
                return sortBI.sort(this.seq, subvars);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isBuggySeqButGoodCollection(TemplateModel model) {
        return (model instanceof CollectionModel) && !((CollectionModel) model).getSupportsIndexedAccess();
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$seq_containsBI.class */
    static class seq_containsBI extends BuiltIn {
        seq_containsBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel model = this.target.eval(env);
            if ((model instanceof TemplateSequenceModel) && !SequenceBuiltins.isBuggySeqButGoodCollection(model)) {
                return new BIMethodForSequence(this, (TemplateSequenceModel) model, env, null);
            }
            if (model instanceof TemplateCollectionModel) {
                return new BIMethodForCollection(this, (TemplateCollectionModel) model, env, null);
            }
            throw new UnexpectedTypeException(this.target, model, "sequence or collection", env);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForSequence.class */
        private class BIMethodForSequence implements TemplateMethodModelEx {
            private TemplateSequenceModel m_seq;
            private Environment m_env;
            private final seq_containsBI this$0;

            BIMethodForSequence(seq_containsBI x0, TemplateSequenceModel x1, Environment x2, AnonymousClass1 x3) {
                this(x0, x1, x2);
            }

            private BIMethodForSequence(seq_containsBI seq_containsbi, TemplateSequenceModel seq, Environment env) {
                this.this$0 = seq_containsbi;
                this.m_seq = seq;
                this.m_env = env;
            }

            @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                this.this$0.checkMethodArgCount(args, 1);
                TemplateModel arg = (TemplateModel) args.get(0);
                int size = this.m_seq.size();
                for (int i = 0; i < size; i++) {
                    if (SequenceBuiltins.modelsEqual(i, this.m_seq.get(i), arg, this.m_env)) {
                        return TemplateBooleanModel.TRUE;
                    }
                }
                return TemplateBooleanModel.FALSE;
            }
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForCollection.class */
        private class BIMethodForCollection implements TemplateMethodModelEx {
            private TemplateCollectionModel m_coll;
            private Environment m_env;
            private final seq_containsBI this$0;

            BIMethodForCollection(seq_containsBI x0, TemplateCollectionModel x1, Environment x2, AnonymousClass1 x3) {
                this(x0, x1, x2);
            }

            private BIMethodForCollection(seq_containsBI seq_containsbi, TemplateCollectionModel coll, Environment env) {
                this.this$0 = seq_containsbi;
                this.m_coll = coll;
                this.m_env = env;
            }

            @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                this.this$0.checkMethodArgCount(args, 1);
                TemplateModel arg = (TemplateModel) args.get(0);
                TemplateModelIterator it = this.m_coll.iterator();
                int idx = 0;
                while (it.hasNext()) {
                    if (SequenceBuiltins.modelsEqual(idx, it.next(), arg, this.m_env)) {
                        return TemplateBooleanModel.TRUE;
                    }
                    idx++;
                }
                return TemplateBooleanModel.FALSE;
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$seq_index_ofBI.class */
    static class seq_index_ofBI extends BuiltIn {
        private int m_dir;

        public seq_index_ofBI(int dir) {
            this.m_dir = dir;
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            return new BIMethod(this, env, null);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod.class */
        private class BIMethod implements TemplateMethodModelEx {
            protected final TemplateSequenceModel m_seq;
            protected final TemplateCollectionModel m_col;
            protected final Environment m_env;
            private final seq_index_ofBI this$0;

            BIMethod(seq_index_ofBI x0, Environment x1, AnonymousClass1 x2) throws TemplateException {
                this(x0, x1);
            }

            private BIMethod(seq_index_ofBI seq_index_ofbi, Environment env) throws TemplateException {
                this.this$0 = seq_index_ofbi;
                TemplateModel model = seq_index_ofbi.target.eval(env);
                this.m_seq = (!(model instanceof TemplateSequenceModel) || SequenceBuiltins.isBuggySeqButGoodCollection(model)) ? null : (TemplateSequenceModel) model;
                this.m_col = (this.m_seq == null && (model instanceof TemplateCollectionModel)) ? (TemplateCollectionModel) model : null;
                if (this.m_seq == null && this.m_col == null) {
                    throw new UnexpectedTypeException(seq_index_ofbi.target, model, "sequence or collection", env);
                }
                this.m_env = env;
            }

            @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
            public final Object exec(List args) throws TemplateModelException {
                int foundAtIdx;
                int argCnt = args.size();
                this.this$0.checkMethodArgCount(argCnt, 1, 2);
                TemplateModel target = (TemplateModel) args.get(0);
                if (argCnt > 1) {
                    int startIndex = this.this$0.getNumberMethodArg(args, 1).intValue();
                    foundAtIdx = this.m_seq != null ? findInSeq(target, startIndex) : findInCol(target, startIndex);
                } else {
                    foundAtIdx = this.m_seq != null ? findInSeq(target) : findInCol(target);
                }
                return foundAtIdx == -1 ? Constants.MINUS_ONE : new SimpleNumber(foundAtIdx);
            }

            public int findInSeq(TemplateModel target) throws TemplateModelException {
                int actualStartIndex;
                int seqSize = this.m_seq.size();
                if (this.this$0.m_dir == 1) {
                    actualStartIndex = 0;
                } else {
                    actualStartIndex = seqSize - 1;
                }
                return findInSeq(target, actualStartIndex, seqSize);
            }

            private int findInSeq(TemplateModel target, int startIndex) throws TemplateModelException {
                int seqSize = this.m_seq.size();
                if (this.this$0.m_dir == 1) {
                    if (startIndex >= seqSize) {
                        return -1;
                    }
                    if (startIndex < 0) {
                        startIndex = 0;
                    }
                } else {
                    if (startIndex >= seqSize) {
                        startIndex = seqSize - 1;
                    }
                    if (startIndex < 0) {
                        return -1;
                    }
                }
                return findInSeq(target, startIndex, seqSize);
            }

            private int findInSeq(TemplateModel target, int scanStartIndex, int seqSize) throws TemplateModelException {
                if (this.this$0.m_dir == 1) {
                    for (int i = scanStartIndex; i < seqSize; i++) {
                        if (SequenceBuiltins.modelsEqual(i, this.m_seq.get(i), target, this.m_env)) {
                            return i;
                        }
                    }
                    return -1;
                }
                for (int i2 = scanStartIndex; i2 >= 0; i2--) {
                    if (SequenceBuiltins.modelsEqual(i2, this.m_seq.get(i2), target, this.m_env)) {
                        return i2;
                    }
                }
                return -1;
            }

            public int findInCol(TemplateModel target) throws TemplateModelException {
                return findInCol(target, 0, Integer.MAX_VALUE);
            }

            protected int findInCol(TemplateModel target, int startIndex) throws TemplateModelException {
                if (this.this$0.m_dir == 1) {
                    return findInCol(target, startIndex, Integer.MAX_VALUE);
                }
                return findInCol(target, 0, startIndex);
            }

            protected int findInCol(TemplateModel target, int allowedRangeStart, int allowedRangeEnd) throws TemplateModelException {
                if (allowedRangeEnd < 0) {
                    return -1;
                }
                TemplateModelIterator it = this.m_col.iterator();
                int foundAtIdx = -1;
                for (int idx = 0; it.hasNext() && idx <= allowedRangeEnd; idx++) {
                    TemplateModel current = it.next();
                    if (idx >= allowedRangeStart && SequenceBuiltins.modelsEqual(idx, current, target, this.m_env)) {
                        foundAtIdx = idx;
                        if (this.this$0.m_dir == 1) {
                            break;
                        }
                    }
                }
                return foundAtIdx;
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$chunkBI.class */
    static class chunkBI extends SequenceBuiltIn {
        chunkBI() {
            super(null);
        }

        @Override // freemarker.core.SequenceBuiltins.SequenceBuiltIn
        TemplateModel calculateResult(TemplateSequenceModel tsm) throws TemplateModelException {
            return new BIMethod(this, tsm, null);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$chunkBI$BIMethod.class */
        private class BIMethod implements TemplateMethodModelEx {
            private final TemplateSequenceModel tsm;
            private final chunkBI this$0;

            BIMethod(chunkBI x0, TemplateSequenceModel x1, AnonymousClass1 x2) {
                this(x0, x1);
            }

            private BIMethod(chunkBI chunkbi, TemplateSequenceModel tsm) {
                this.this$0 = chunkbi;
                this.tsm = tsm;
            }

            @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                this.this$0.checkMethodArgCount(args, 1, 2);
                int chunkSize = this.this$0.getNumberMethodArg(args, 0).intValue();
                return new ChunkedSequence(this.tsm, chunkSize, args.size() > 1 ? (TemplateModel) args.get(1) : null, null);
            }
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence.class */
        private static class ChunkedSequence implements TemplateSequenceModel {
            private final TemplateSequenceModel wrappedTsm;
            private final int chunkSize;
            private final TemplateModel fillerItem;
            private final int numberOfChunks;

            ChunkedSequence(TemplateSequenceModel x0, int x1, TemplateModel x2, AnonymousClass1 x3) throws TemplateModelException {
                this(x0, x1, x2);
            }

            private ChunkedSequence(TemplateSequenceModel wrappedTsm, int chunkSize, TemplateModel fillerItem) throws TemplateModelException {
                if (chunkSize < 1) {
                    throw new _TemplateModelException(new Object[]{"The 1st argument to ?', key, ' (...) must be at least 1."});
                }
                this.wrappedTsm = wrappedTsm;
                this.chunkSize = chunkSize;
                this.fillerItem = fillerItem;
                this.numberOfChunks = ((wrappedTsm.size() + chunkSize) - 1) / chunkSize;
            }

            @Override // freemarker.template.TemplateSequenceModel
            public TemplateModel get(int chunkIndex) throws TemplateModelException {
                if (chunkIndex >= this.numberOfChunks) {
                    return null;
                }
                return new TemplateSequenceModel(this, chunkIndex) { // from class: freemarker.core.SequenceBuiltins.chunkBI.ChunkedSequence.1
                    private final int baseIndex;
                    private final int val$chunkIndex;
                    private final ChunkedSequence this$0;

                    {
                        this.this$0 = this;
                        this.val$chunkIndex = chunkIndex;
                        this.baseIndex = this.val$chunkIndex * this.this$0.chunkSize;
                    }

                    @Override // freemarker.template.TemplateSequenceModel
                    public TemplateModel get(int relIndex) throws TemplateModelException {
                        int absIndex = this.baseIndex + relIndex;
                        if (absIndex < this.this$0.wrappedTsm.size()) {
                            return this.this$0.wrappedTsm.get(absIndex);
                        }
                        if (absIndex < this.this$0.numberOfChunks * this.this$0.chunkSize) {
                            return this.this$0.fillerItem;
                        }
                        return null;
                    }

                    @Override // freemarker.template.TemplateSequenceModel
                    public int size() throws TemplateModelException {
                        return (this.this$0.fillerItem != null || this.val$chunkIndex + 1 < this.this$0.numberOfChunks) ? this.this$0.chunkSize : this.this$0.wrappedTsm.size() - this.baseIndex;
                    }
                };
            }

            @Override // freemarker.template.TemplateSequenceModel
            public int size() throws TemplateModelException {
                return this.numberOfChunks;
            }
        }
    }

    public static boolean modelsEqual(int seqItemIndex, TemplateModel seqItem, TemplateModel searchedItem, Environment env) throws TemplateModelException {
        try {
            return EvalUtil.compare(seqItem, null, 1, null, searchedItem, null, null, true, true, true, env);
        } catch (TemplateException ex) {
            throw new _TemplateModelException(ex, new Object[]{"This error has occured when comparing sequence item at 0-based index ", new Integer(seqItemIndex), " to the searched item:\n", new _DelayedGetMessage(ex)});
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$joinBI.class */
    static class joinBI extends BuiltIn {
        joinBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel model = this.target.eval(env);
            if (model instanceof TemplateCollectionModel) {
                return new BIMethodForCollection(this, env, (TemplateCollectionModel) model, null);
            }
            if (model instanceof TemplateSequenceModel) {
                return new BIMethodForCollection(this, env, new CollectionAndSequence((TemplateSequenceModel) model), null);
            }
            throw new UnexpectedTypeException(this.target, model, "sequence or collection", env);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection.class */
        private class BIMethodForCollection implements TemplateMethodModelEx {
            private final Environment env;
            private final TemplateCollectionModel coll;
            private final joinBI this$0;

            BIMethodForCollection(joinBI x0, Environment x1, TemplateCollectionModel x2, AnonymousClass1 x3) {
                this(x0, x1, x2);
            }

            private BIMethodForCollection(joinBI joinbi, Environment env, TemplateCollectionModel coll) {
                this.this$0 = joinbi;
                this.env = env;
                this.coll = coll;
            }

            @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                this.this$0.checkMethodArgCount(args, 1, 3);
                String separator = this.this$0.getStringMethodArg(args, 0);
                String whenEmpty = this.this$0.getOptStringMethodArg(args, 1);
                String afterLast = this.this$0.getOptStringMethodArg(args, 2);
                StringBuffer sb = new StringBuffer();
                TemplateModelIterator it = this.coll.iterator();
                int idx = 0;
                boolean hadItem = false;
                while (it.hasNext()) {
                    TemplateModel item = it.next();
                    if (item != null) {
                        if (hadItem) {
                            sb.append(separator);
                        } else {
                            hadItem = true;
                        }
                        try {
                            sb.append(EvalUtil.coerceModelToString(item, null, null, this.env));
                        } catch (TemplateException e) {
                            throw new _TemplateModelException(e, new Object[]{"\"?", this.this$0.key, "\" failed at index ", new Integer(idx), " with this error:\n\n", "---begin-message---\n", new _DelayedGetMessageWithoutStackTop(e), "\n---end-message---"});
                        }
                    }
                    idx++;
                }
                if (hadItem) {
                    if (afterLast != null) {
                        sb.append(afterLast);
                    }
                } else if (whenEmpty != null) {
                    sb.append(whenEmpty);
                }
                return new SimpleScalar(sb.toString());
            }
        }
    }
}
