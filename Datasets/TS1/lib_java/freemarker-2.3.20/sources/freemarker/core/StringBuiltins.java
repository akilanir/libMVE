package freemarker.core;

import freemarker.template.SimpleNumber;
import freemarker.template.SimpleScalar;
import freemarker.template.SimpleSequence;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateScalarModel;
import freemarker.template.Version;
import freemarker.template.utility.StringUtil;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.StringTokenizer;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins.class */
class StringBuiltins {

    /* renamed from: freemarker.core.StringBuiltins$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$1.class */
    static class AnonymousClass1 {
    }

    private StringBuiltins() {
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$StringBuiltIn.class */
    static abstract class StringBuiltIn extends BuiltIn {
        abstract TemplateModel calculateResult(String str, Environment environment) throws TemplateException;

        StringBuiltIn() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            return calculateResult(this.target.evalAndCoerceToString(env), env);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$capitalizeBI.class */
    static class capitalizeBI extends StringBuiltIn {
        capitalizeBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) {
            return new SimpleScalar(StringUtil.capitalize(s));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$chop_linebreakBI.class */
    static class chop_linebreakBI extends StringBuiltIn {
        chop_linebreakBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) {
            return new SimpleScalar(StringUtil.chomp(s));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$j_stringBI.class */
    static class j_stringBI extends StringBuiltIn {
        j_stringBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) {
            return new SimpleScalar(StringUtil.javaStringEnc(s));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$js_stringBI.class */
    static class js_stringBI extends StringBuiltIn {
        js_stringBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) {
            return new SimpleScalar(StringUtil.javaScriptStringEnc(s));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$json_stringBI.class */
    static class json_stringBI extends StringBuiltIn {
        json_stringBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) {
            return new SimpleScalar(StringUtil.jsonStringEnc(s));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$cap_firstBI.class */
    static class cap_firstBI extends StringBuiltIn {
        cap_firstBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) {
            int i = 0;
            int ln = s.length();
            while (i < ln && Character.isWhitespace(s.charAt(i))) {
                i++;
            }
            if (i < ln) {
                StringBuffer b = new StringBuffer(s);
                b.setCharAt(i, Character.toUpperCase(s.charAt(i)));
                s = b.toString();
            }
            return new SimpleScalar(s);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$uncap_firstBI.class */
    static class uncap_firstBI extends StringBuiltIn {
        uncap_firstBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) {
            int i = 0;
            int ln = s.length();
            while (i < ln && Character.isWhitespace(s.charAt(i))) {
                i++;
            }
            if (i < ln) {
                StringBuffer b = new StringBuffer(s);
                b.setCharAt(i, Character.toLowerCase(s.charAt(i)));
                s = b.toString();
            }
            return new SimpleScalar(s);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$upper_caseBI.class */
    static class upper_caseBI extends StringBuiltIn {
        upper_caseBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) {
            return new SimpleScalar(s.toUpperCase(env.getLocale()));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$lower_caseBI.class */
    static class lower_caseBI extends StringBuiltIn {
        lower_caseBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) {
            return new SimpleScalar(s.toLowerCase(env.getLocale()));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$word_listBI.class */
    static class word_listBI extends StringBuiltIn {
        word_listBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) {
            SimpleSequence result = new SimpleSequence();
            StringTokenizer st = new StringTokenizer(s);
            while (st.hasMoreTokens()) {
                result.add(st.nextToken());
            }
            return result;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$evalBI.class */
    static class evalBI extends StringBuiltIn {
        evalBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) throws TemplateException {
            SimpleCharStream scs = new SimpleCharStream(new StringReader(new StringBuffer().append("(").append(s).append(")").toString()), -1000000000, 1, s.length() + 2);
            FMParserTokenManager token_source = new FMParserTokenManager(scs);
            token_source.incompatibleImprovements = env.getConfiguration().getIncompatibleImprovements().intValue();
            token_source.SwitchTo(2);
            FMParser parser = new FMParser(token_source);
            parser.setTemplate(getTemplate());
            try {
                try {
                    Expression exp = parser.Expression();
                    try {
                        return exp.eval(env);
                    } catch (TemplateException e) {
                        throw new _MiscTemplateException(this, new Object[]{"Failed to \"?", this.key, "\" string with this error:\n\n", "---begin-message---\n", new _DelayedGetMessageWithoutStackTop(e), "\n---end-message---", "\n\nThe failing expression:"});
                    }
                } catch (TokenMgrError e2) {
                    throw e2.toParseException(getTemplate());
                }
            } catch (ParseException e3) {
                throw new _MiscTemplateException(this, new Object[]{"Failed to \"?", this.key, "\" string with this error:\n\n", "---begin-message---\n", new _DelayedGetMessage(e3), "\n---end-message---", "\n\nThe failing expression:"});
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$numberBI.class */
    static class numberBI extends StringBuiltIn {
        numberBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) throws TemplateException {
            try {
                return new SimpleNumber(env.getArithmeticEngine().toNumber(s));
            } catch (NumberFormatException e) {
                throw NonNumericalException.newMalformedNumberException(this, s, env);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$substringBI.class */
    static class substringBI extends StringBuiltIn {
        substringBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) throws TemplateException {
            return new TemplateMethodModelEx(this, s) { // from class: freemarker.core.StringBuiltins.substringBI.1
                private final String val$s;
                private final substringBI this$0;

                {
                    this.this$0 = this;
                    this.val$s = s;
                }

                @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
                public Object exec(List args) throws TemplateModelException {
                    int argCount = args.size();
                    this.this$0.checkMethodArgCount(argCount, 1, 2);
                    int left = this.this$0.getNumberMethodArg(args, 0).intValue();
                    if (argCount > 1) {
                        return new SimpleScalar(this.val$s.substring(left, this.this$0.getNumberMethodArg(args, 1).intValue()));
                    }
                    return new SimpleScalar(this.val$s.substring(left));
                }
            };
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$lengthBI.class */
    static class lengthBI extends StringBuiltIn {
        lengthBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) throws TemplateException {
            return new SimpleNumber(s.length());
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$trimBI.class */
    static class trimBI extends StringBuiltIn {
        trimBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) {
            return new SimpleScalar(s.trim());
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$htmlBI.class */
    static class htmlBI extends StringBuiltIn implements ICIChainMember {
        private static final int MIN_ICE = Version.intValueFor(2, 3, 20);
        private final BIBeforeICE2d3d20 prevICEObj = new BIBeforeICE2d3d20();

        htmlBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) {
            return new SimpleScalar(StringUtil.XHTMLEnc(s));
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$htmlBI$BIBeforeICE2d3d20.class */
        static class BIBeforeICE2d3d20 extends StringBuiltIn {
            BIBeforeICE2d3d20() {
            }

            @Override // freemarker.core.StringBuiltins.StringBuiltIn
            TemplateModel calculateResult(String s, Environment env) {
                return new SimpleScalar(StringUtil.HTMLEnc(s));
            }
        }

        @Override // freemarker.core.ICIChainMember
        public int getMinimumICIVersion() {
            return MIN_ICE;
        }

        @Override // freemarker.core.ICIChainMember
        public Object getPreviousICIChainMember() {
            return this.prevICEObj;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$xmlBI.class */
    static class xmlBI extends StringBuiltIn {
        xmlBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) {
            return new SimpleScalar(StringUtil.XMLEnc(s));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$xhtmlBI.class */
    static class xhtmlBI extends StringBuiltIn {
        xhtmlBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) {
            return new SimpleScalar(StringUtil.XHTMLEnc(s));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$rtfBI.class */
    static class rtfBI extends StringBuiltIn {
        rtfBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) {
            return new SimpleScalar(StringUtil.RTFEnc(s));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$urlBI.class */
    static class urlBI extends StringBuiltIn {
        urlBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) {
            return new urlBIResult(s, env, null);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$urlBI$urlBIResult.class */
        static class urlBIResult implements TemplateScalarModel, TemplateMethodModel {
            private final String target;
            private final Environment env;
            private String cachedResult;

            urlBIResult(String x0, Environment x1, AnonymousClass1 x2) {
                this(x0, x1);
            }

            private urlBIResult(String target, Environment env) {
                this.target = target;
                this.env = env;
            }

            @Override // freemarker.template.TemplateScalarModel
            public String getAsString() throws TemplateModelException {
                if (this.cachedResult == null) {
                    String cs = this.env.getEffectiveURLEscapingCharset();
                    if (cs == null) {
                        throw new _TemplateModelException("To do URL encoding, the framework that encloses FreeMarker must specify the output encoding or the URL encoding charset, so ask the programmers to fix it. Or, as a last chance, you can set the url_encoding_charset setting in the template, e.g. <#setting url_escaping_charset='ISO-8859-1'>, or give the charset explicitly to the buit-in, e.g. foo?url('ISO-8859-1').");
                    }
                    try {
                        this.cachedResult = StringUtil.URLEnc(this.target, cs);
                    } catch (UnsupportedEncodingException e) {
                        throw new _TemplateModelException(e, "Failed to execute URL encoding.");
                    }
                }
                return this.cachedResult;
            }

            @Override // freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                if (args.size() != 1) {
                    throw new _TemplateModelException("The \"url\" built-in needs exactly 1 parameter, the charset.");
                }
                try {
                    return new SimpleScalar(StringUtil.URLEnc(this.target, (String) args.get(0)));
                } catch (UnsupportedEncodingException e) {
                    throw new _TemplateModelException(e, "Failed to execute URL encoding.");
                }
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$starts_withBI.class */
    static class starts_withBI extends StringBuiltIn {
        starts_withBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) throws TemplateException {
            return new BIMethod(this, s, null);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$starts_withBI$BIMethod.class */
        private class BIMethod implements TemplateMethodModelEx {
            private String s;
            private final starts_withBI this$0;

            BIMethod(starts_withBI x0, String x1, AnonymousClass1 x2) {
                this(x0, x1);
            }

            private BIMethod(starts_withBI starts_withbi, String s) {
                this.this$0 = starts_withbi;
                this.s = s;
            }

            @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                this.this$0.checkMethodArgCount(args, 1);
                return this.s.startsWith(this.this$0.getStringMethodArg(args, 0)) ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$ends_withBI.class */
    static class ends_withBI extends StringBuiltIn {
        ends_withBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) throws TemplateException {
            return new BIMethod(this, s, null);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$ends_withBI$BIMethod.class */
        private class BIMethod implements TemplateMethodModelEx {
            private String s;
            private final ends_withBI this$0;

            BIMethod(ends_withBI x0, String x1, AnonymousClass1 x2) {
                this(x0, x1);
            }

            private BIMethod(ends_withBI ends_withbi, String s) {
                this.this$0 = ends_withbi;
                this.s = s;
            }

            @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                this.this$0.checkMethodArgCount(args, 1);
                return this.s.endsWith(this.this$0.getStringMethodArg(args, 0)) ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$replaceBI.class */
    static class replaceBI extends StringBuiltIn {
        replaceBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) throws TemplateException {
            return new BIMethod(this, s, null);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$replaceBI$BIMethod.class */
        private class BIMethod implements TemplateMethodModel {
            private String s;
            private final replaceBI this$0;

            BIMethod(replaceBI x0, String x1, AnonymousClass1 x2) {
                this(x0, x1);
            }

            private BIMethod(replaceBI replacebi, String s) {
                this.this$0 = replacebi;
                this.s = s;
            }

            @Override // freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                boolean caseInsensitive;
                boolean firstOnly;
                int argCnt = args.size();
                this.this$0.checkMethodArgCount(argCnt, 2, 3);
                String first = (String) args.get(0);
                String second = (String) args.get(1);
                if (argCnt > 2) {
                    String flags = (String) args.get(2);
                    caseInsensitive = flags.indexOf(FMParserConstants.AND) >= 0;
                    firstOnly = flags.indexOf(FMParserConstants.ELLIPSIS) >= 0;
                    if (flags.indexOf(FMParserConstants.CLOSE_PAREN) >= 0) {
                        throw new _TemplateModelException("The regular expression classes are not available.");
                    }
                } else {
                    caseInsensitive = false;
                    firstOnly = false;
                }
                return new SimpleScalar(StringUtil.replace(this.s, first, second, caseInsensitive, firstOnly));
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$splitBI.class */
    static class splitBI extends StringBuiltIn {
        splitBI() {
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) throws TemplateException {
            return new BIMethod(this, s, null);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$splitBI$BIMethod.class */
        private class BIMethod implements TemplateMethodModel {
            private String s;
            private final splitBI this$0;

            BIMethod(splitBI x0, String x1, AnonymousClass1 x2) {
                this(x0, x1);
            }

            private BIMethod(splitBI splitbi, String s) {
                this.this$0 = splitbi;
                this.s = s;
            }

            @Override // freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                int argCnt = args.size();
                this.this$0.checkMethodArgCount(argCnt, 1, 2);
                String splitString = (String) args.get(0);
                String flags = argCnt == 2 ? (String) args.get(1) : "";
                boolean caseInsensitive = flags.indexOf(FMParserConstants.AND) >= 0;
                if (flags.indexOf(FMParserConstants.CLOSE_PAREN) >= 0) {
                    throw new _TemplateModelException("Regular expression classes not available");
                }
                return new StringArraySequence(StringUtil.split(this.s, splitString, caseInsensitive));
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$padBI.class */
    static class padBI extends StringBuiltIn {
        private final boolean leftPadder;

        public padBI(boolean leftPadder) {
            this.leftPadder = leftPadder;
        }

        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) throws TemplateException {
            return new BIMethod(this, s, null);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$padBI$BIMethod.class */
        private class BIMethod implements TemplateMethodModelEx {
            private final String s;
            private final padBI this$0;

            BIMethod(padBI x0, String x1, AnonymousClass1 x2) {
                this(x0, x1);
            }

            private BIMethod(padBI padbi, String s) {
                this.this$0 = padbi;
                this.s = s;
            }

            @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                int argCnt = args.size();
                this.this$0.checkMethodArgCount(argCnt, 1, 2);
                int width = this.this$0.getNumberMethodArg(args, 0).intValue();
                if (argCnt > 1) {
                    String filling = this.this$0.getStringMethodArg(args, 1);
                    try {
                        return new SimpleScalar(this.this$0.leftPadder ? StringUtil.leftPad(this.s, width, filling) : StringUtil.rightPad(this.s, width, filling));
                    } catch (IllegalArgumentException e) {
                        if (filling.length() == 0) {
                            throw new _TemplateModelException(new Object[]{"?", this.this$0.key, "(...) argument #2 can't be a 0-length string."});
                        }
                        throw new _TemplateModelException(e, new Object[]{"?", this.this$0.key, "(...) failed: ", e});
                    }
                }
                return new SimpleScalar(this.this$0.leftPadder ? StringUtil.leftPad(this.s, width) : StringUtil.rightPad(this.s, width));
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$containsBI.class */
    static class containsBI extends BuiltIn {
        containsBI() {
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            return new BIMethod(this, this.target.evalAndCoerceToString(env, "For sequences/collections (lists and such) use \"?seq_contains\" instead."), null);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$containsBI$BIMethod.class */
        private class BIMethod implements TemplateMethodModelEx {
            private final String s;
            private final containsBI this$0;

            BIMethod(containsBI x0, String x1, AnonymousClass1 x2) {
                this(x0, x1);
            }

            private BIMethod(containsBI containsbi, String s) {
                this.this$0 = containsbi;
                this.s = s;
            }

            @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                this.this$0.checkMethodArgCount(args, 1);
                return this.s.indexOf(this.this$0.getStringMethodArg(args, 0)) != -1 ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$index_ofBI.class */
    static class index_ofBI extends BuiltIn {
        private final boolean findLast;

        public index_ofBI(boolean findLast) {
            this.findLast = findLast;
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            return new BIMethod(this, this.target.evalAndCoerceToString(env, "For sequences/collections (lists and such) use \"?seq_index_of\" instead."), null);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/StringBuiltins$index_ofBI$BIMethod.class */
        private class BIMethod implements TemplateMethodModelEx {
            private final String s;
            private final index_ofBI this$0;

            BIMethod(index_ofBI x0, String x1, AnonymousClass1 x2) {
                this(x0, x1);
            }

            private BIMethod(index_ofBI index_ofbi, String s) {
                this.this$0 = index_ofbi;
                this.s = s;
            }

            @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                int argCnt = args.size();
                this.this$0.checkMethodArgCount(argCnt, 1, 2);
                String subStr = this.this$0.getStringMethodArg(args, 0);
                if (argCnt > 1) {
                    int startIdx = this.this$0.getNumberMethodArg(args, 1).intValue();
                    return new SimpleNumber(this.this$0.findLast ? this.s.lastIndexOf(subStr, startIdx) : this.s.indexOf(subStr, startIdx));
                }
                return new SimpleNumber(this.this$0.findLast ? this.s.lastIndexOf(subStr) : this.s.indexOf(subStr));
            }
        }
    }
}
