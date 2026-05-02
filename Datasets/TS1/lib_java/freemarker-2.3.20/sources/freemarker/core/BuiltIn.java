package freemarker.core;

import freemarker.core.DateBuiltins;
import freemarker.core.ExistenceBuiltins;
import freemarker.core.Expression;
import freemarker.core.HashBuiltins;
import freemarker.core.MiscellaneousBuiltins;
import freemarker.core.NodeBuiltins;
import freemarker.core.NumericalBuiltins;
import freemarker.core.SequenceBuiltins;
import freemarker.core.StringBuiltins;
import freemarker.log.Logger;
import freemarker.template.Configuration;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateNumberModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.utility.StringUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/BuiltIn.class */
abstract class BuiltIn extends Expression implements Cloneable {
    protected Expression target;
    protected String key;
    private static final Logger logger = Logger.getLogger("freemarker.runtime");
    static final HashMap builtins = new HashMap();

    BuiltIn() {
    }

    static {
        builtins.put("abs", new NumericalBuiltins.absBI());
        builtins.put("ancestors", new NodeBuiltins.ancestorsBI());
        builtins.put("byte", new NumericalBuiltins.byteBI());
        builtins.put("c", new MiscellaneousBuiltins.cBI());
        builtins.put("cap_first", new StringBuiltins.cap_firstBI());
        builtins.put("capitalize", new StringBuiltins.capitalizeBI());
        builtins.put("ceiling", new NumericalBuiltins.ceilingBI());
        builtins.put("children", new NodeBuiltins.childrenBI());
        builtins.put("chop_linebreak", new StringBuiltins.chop_linebreakBI());
        builtins.put("contains", new StringBuiltins.containsBI());
        builtins.put("date", new MiscellaneousBuiltins.dateBI(2));
        builtins.put("datetime", new MiscellaneousBuiltins.dateBI(3));
        builtins.put("default", new ExistenceBuiltins.defaultBI());
        builtins.put("double", new NumericalBuiltins.doubleBI());
        builtins.put("ends_with", new StringBuiltins.ends_withBI());
        builtins.put("eval", new StringBuiltins.evalBI());
        builtins.put("exists", new ExistenceBuiltins.existsBI());
        builtins.put("first", new SequenceBuiltins.firstBI());
        builtins.put("float", new NumericalBuiltins.floatBI());
        builtins.put("floor", new NumericalBuiltins.floorBI());
        builtins.put("chunk", new SequenceBuiltins.chunkBI());
        builtins.put("has_content", new ExistenceBuiltins.has_contentBI());
        builtins.put("html", new StringBuiltins.htmlBI());
        builtins.put("if_exists", new ExistenceBuiltins.if_existsBI());
        builtins.put("index_of", new StringBuiltins.index_ofBI(false));
        builtins.put("int", new NumericalBuiltins.intBI());
        builtins.put("interpret", new Interpret());
        builtins.put("is_boolean", new MiscellaneousBuiltins.is_booleanBI());
        builtins.put("is_collection", new MiscellaneousBuiltins.is_collectionBI());
        builtins.put("is_date", new MiscellaneousBuiltins.is_dateBI());
        builtins.put("is_directive", new MiscellaneousBuiltins.is_directiveBI());
        builtins.put("is_enumerable", new MiscellaneousBuiltins.is_enumerableBI());
        builtins.put("is_hash_ex", new MiscellaneousBuiltins.is_hash_exBI());
        builtins.put("is_hash", new MiscellaneousBuiltins.is_hashBI());
        builtins.put("is_infinite", new NumericalBuiltins.is_infiniteBI());
        builtins.put("is_indexable", new MiscellaneousBuiltins.is_indexableBI());
        builtins.put("is_macro", new MiscellaneousBuiltins.is_macroBI());
        builtins.put("is_method", new MiscellaneousBuiltins.is_methodBI());
        builtins.put("is_nan", new NumericalBuiltins.is_nanBI());
        builtins.put("is_node", new MiscellaneousBuiltins.is_nodeBI());
        builtins.put("is_number", new MiscellaneousBuiltins.is_numberBI());
        builtins.put("is_sequence", new MiscellaneousBuiltins.is_sequenceBI());
        builtins.put("is_string", new MiscellaneousBuiltins.is_stringBI());
        builtins.put("is_transform", new MiscellaneousBuiltins.is_transformBI());
        builtins.put("iso_utc", new DateBuiltins.iso_tz_BI(true, 6, true));
        builtins.put("iso_utc_nz", new DateBuiltins.iso_tz_BI(false, 6, true));
        builtins.put("iso_utc_ms", new DateBuiltins.iso_tz_BI(true, 7, true));
        builtins.put("iso_utc_ms_nz", new DateBuiltins.iso_tz_BI(false, 7, true));
        builtins.put("iso_utc_m", new DateBuiltins.iso_tz_BI(true, 5, true));
        builtins.put("iso_utc_m_nz", new DateBuiltins.iso_tz_BI(false, 5, true));
        builtins.put("iso_utc_h", new DateBuiltins.iso_tz_BI(true, 4, true));
        builtins.put("iso_utc_h_nz", new DateBuiltins.iso_tz_BI(false, 4, true));
        builtins.put("iso_local", new DateBuiltins.iso_tz_BI(true, 6, false));
        builtins.put("iso_local_nz", new DateBuiltins.iso_tz_BI(false, 6, false));
        builtins.put("iso_local_ms", new DateBuiltins.iso_tz_BI(true, 7, false));
        builtins.put("iso_local_ms_nz", new DateBuiltins.iso_tz_BI(false, 7, false));
        builtins.put("iso_local_m", new DateBuiltins.iso_tz_BI(true, 5, false));
        builtins.put("iso_local_m_nz", new DateBuiltins.iso_tz_BI(false, 5, false));
        builtins.put("iso_local_h", new DateBuiltins.iso_tz_BI(true, 4, false));
        builtins.put("iso_local_h_nz", new DateBuiltins.iso_tz_BI(false, 4, false));
        builtins.put("iso", new DateBuiltins.iso_BI(true, 6));
        builtins.put("iso_nz", new DateBuiltins.iso_BI(false, 6));
        builtins.put("iso_ms", new DateBuiltins.iso_BI(true, 7));
        builtins.put("iso_ms_nz", new DateBuiltins.iso_BI(false, 7));
        builtins.put("iso_m", new DateBuiltins.iso_BI(true, 5));
        builtins.put("iso_m_nz", new DateBuiltins.iso_BI(false, 5));
        builtins.put("iso_h", new DateBuiltins.iso_BI(true, 4));
        builtins.put("iso_h_nz", new DateBuiltins.iso_BI(false, 4));
        builtins.put("j_string", new StringBuiltins.j_stringBI());
        builtins.put("join", new SequenceBuiltins.joinBI());
        builtins.put("js_string", new StringBuiltins.js_stringBI());
        builtins.put("json_string", new StringBuiltins.json_stringBI());
        builtins.put("keys", new HashBuiltins.keysBI());
        builtins.put("last_index_of", new StringBuiltins.index_ofBI(true));
        builtins.put("last", new SequenceBuiltins.lastBI());
        builtins.put("left_pad", new StringBuiltins.padBI(true));
        builtins.put("length", new StringBuiltins.lengthBI());
        builtins.put("long", new NumericalBuiltins.longBI());
        builtins.put("lower_case", new StringBuiltins.lower_caseBI());
        builtins.put("namespace", new MiscellaneousBuiltins.namespaceBI());
        builtins.put("new", new NewBI());
        builtins.put("node_name", new NodeBuiltins.node_nameBI());
        builtins.put("node_namespace", new NodeBuiltins.node_namespaceBI());
        builtins.put("node_type", new NodeBuiltins.node_typeBI());
        builtins.put("number", new StringBuiltins.numberBI());
        builtins.put("number_to_date", new NumericalBuiltins.number_to_dateBI(2));
        builtins.put("number_to_time", new NumericalBuiltins.number_to_dateBI(1));
        builtins.put("number_to_datetime", new NumericalBuiltins.number_to_dateBI(3));
        builtins.put("parent", new NodeBuiltins.parentBI());
        builtins.put("replace", new StringBuiltins.replaceBI());
        builtins.put("reverse", new SequenceBuiltins.reverseBI());
        builtins.put("right_pad", new StringBuiltins.padBI(false));
        builtins.put("root", new NodeBuiltins.rootBI());
        builtins.put("round", new NumericalBuiltins.roundBI());
        builtins.put("rtf", new StringBuiltins.rtfBI());
        builtins.put("seq_contains", new SequenceBuiltins.seq_containsBI());
        builtins.put("seq_index_of", new SequenceBuiltins.seq_index_ofBI(1));
        builtins.put("seq_last_index_of", new SequenceBuiltins.seq_index_ofBI(-1));
        builtins.put("short", new NumericalBuiltins.shortBI());
        builtins.put("size", new MiscellaneousBuiltins.sizeBI());
        builtins.put("sort_by", new SequenceBuiltins.sort_byBI());
        builtins.put("sort", new SequenceBuiltins.sortBI());
        builtins.put("split", new StringBuiltins.splitBI());
        builtins.put("starts_with", new StringBuiltins.starts_withBI());
        builtins.put("string", new MiscellaneousBuiltins.stringBI());
        builtins.put("substring", new StringBuiltins.substringBI());
        builtins.put("time", new MiscellaneousBuiltins.dateBI(1));
        builtins.put("trim", new StringBuiltins.trimBI());
        builtins.put("uncap_first", new StringBuiltins.uncap_firstBI());
        builtins.put("upper_case", new StringBuiltins.upper_caseBI());
        builtins.put("url", new StringBuiltins.urlBI());
        builtins.put("values", new HashBuiltins.valuesBI());
        builtins.put("web_safe", builtins.get("html"));
        builtins.put("word_list", new StringBuiltins.word_listBI());
        builtins.put("xhtml", new StringBuiltins.xhtmlBI());
        builtins.put("xml", new StringBuiltins.xmlBI());
        try {
            Class.forName("java.util.regex.Pattern");
            builtins.put("matches", instantiateBI("freemarker.core._RegexBuiltins$matchesBI"));
            builtins.put("groups", instantiateBI("freemarker.core._RegexBuiltins$groupsBI"));
            builtins.put("replace", instantiateBI("freemarker.core._RegexBuiltins$replace_reBI"));
            builtins.put("split", instantiateBI("freemarker.core._RegexBuiltins$split_reBI"));
        } catch (Exception e) {
            logger.debug("Regular expression built-ins won't be avilable", e);
        }
    }

    private static Object instantiateBI(String className) throws Exception {
        return Class.forName(className).newInstance();
    }

    static BuiltIn newBuiltIn(int incompatibleImprovements, Expression target, String key) throws ParseException {
        BuiltIn bi = (BuiltIn) builtins.get(key);
        if (bi == null) {
            StringBuffer buf = new StringBuffer(new StringBuffer().append("Unknown built-in: ").append(StringUtil.jQuote(key)).append(". ").append("Help (latest version): http://freemarker.org/docs/ref_builtins.html; ").append("you're using FreeMarker ").append(Configuration.getVersion()).append(".\n").append("The alphabetical list of built-ins:").toString());
            List names = new ArrayList(builtins.keySet().size());
            names.addAll(builtins.keySet());
            Collections.sort(names);
            char lastLetter = 0;
            Iterator it = names.iterator();
            while (it.hasNext()) {
                String name = (String) it.next();
                char firstChar = name.charAt(0);
                if (firstChar != lastLetter) {
                    lastLetter = firstChar;
                    buf.append('\n');
                }
                buf.append(name);
                if (it.hasNext()) {
                    buf.append(", ");
                }
            }
            throw new ParseException(buf.toString(), target);
        }
        while ((bi instanceof ICIChainMember) && incompatibleImprovements < ((ICIChainMember) bi).getMinimumICIVersion()) {
            bi = (BuiltIn) ((ICIChainMember) bi).getPreviousICIChainMember();
        }
        try {
            BuiltIn bi2 = (BuiltIn) bi.clone();
            bi2.target = target;
            bi2.key = key;
            return bi2;
        } catch (CloneNotSupportedException e) {
            throw new InternalError();
        }
    }

    @Override // freemarker.core.TemplateObject
    public String getCanonicalForm() {
        return new StringBuffer().append(this.target.getCanonicalForm()).append(getNodeTypeSymbol()).toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return new StringBuffer().append("?").append(this.key).toString();
    }

    @Override // freemarker.core.Expression
    boolean isLiteral() {
        return false;
    }

    protected final void checkMethodArgCount(List args, int expectedCnt) throws TemplateModelException {
        checkMethodArgCount(args.size(), expectedCnt);
    }

    protected final void checkMethodArgCount(int argCnt, int expectedCnt) throws TemplateModelException {
        if (argCnt != expectedCnt) {
            throw MessageUtil.newArgCntError(new StringBuffer().append("?").append(this.key).toString(), argCnt, expectedCnt);
        }
    }

    protected final void checkMethodArgCount(List args, int minCnt, int maxCnt) throws TemplateModelException {
        checkMethodArgCount(args.size(), minCnt, maxCnt);
    }

    protected final void checkMethodArgCount(int argCnt, int minCnt, int maxCnt) throws TemplateModelException {
        if (argCnt < minCnt || argCnt > maxCnt) {
            throw MessageUtil.newArgCntError(new StringBuffer().append("?").append(this.key).toString(), argCnt, minCnt, maxCnt);
        }
    }

    protected final String getOptStringMethodArg(List args, int argIdx) throws TemplateModelException {
        if (args.size() > argIdx) {
            return getStringMethodArg(args, argIdx);
        }
        return null;
    }

    protected final String getStringMethodArg(List args, int argIdx) throws TemplateModelException {
        TemplateModel arg = (TemplateModel) args.get(argIdx);
        if (!(arg instanceof TemplateScalarModel)) {
            throw MessageUtil.newMethodArgMustBeStringException(new StringBuffer().append("?").append(this.key).toString(), argIdx, arg);
        }
        return EvalUtil.modelToString((TemplateScalarModel) arg, null, null);
    }

    protected final Number getNumberMethodArg(List args, int argIdx) throws TemplateModelException {
        TemplateModel arg = (TemplateModel) args.get(argIdx);
        if (!(arg instanceof TemplateNumberModel)) {
            throw MessageUtil.newMethodArgMustBeNumberException(new StringBuffer().append("?").append(this.key).toString(), argIdx, arg);
        }
        return EvalUtil.modelToNumber((TemplateNumberModel) arg, null);
    }

    @Override // freemarker.core.Expression
    protected final Expression deepCloneWithIdentifierReplaced_inner(String replacedIdentifier, Expression replacement, Expression.ReplacemenetState replacementState) {
        try {
            BuiltIn clone = (BuiltIn) clone();
            clone.target = this.target.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState);
            return clone;
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(new StringBuffer().append("Internal error: ").append(e).toString());
        }
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 2;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        switch (idx) {
            case 0:
                return this.target;
            case 1:
                return this.key;
            default:
                throw new IndexOutOfBoundsException();
        }
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        switch (idx) {
            case 0:
                return ParameterRole.LEFT_HAND_OPERAND;
            case 1:
                return ParameterRole.RIGHT_HAND_OPERAND;
            default:
                throw new IndexOutOfBoundsException();
        }
    }
}
