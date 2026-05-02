package freemarker.core;

import freemarker.cache.MruCacheStorage;
import freemarker.core.StringBuiltins;
import freemarker.log.Logger;
import freemarker.template.ObjectWrapper;
import freemarker.template.SimpleScalar;
import freemarker.template.SimpleSequence;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateModelIterator;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;
import freemarker.template.utility.StringUtil;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/_RegexBuiltins.class */
public class _RegexBuiltins {
    private static final int MAX_FLAG_WARNINGS_LOGGED = 25;
    private static int flagWarningsCnt;
    private static final long RE_FLAG_REGEXP = 4294967296L;
    private static final long RE_FLAG_FIRST_ONLY = 8589934592L;
    private static final Logger logger = Logger.getLogger("freemarker.runtime");
    private static volatile boolean flagWarningsEnabled = logger.isWarnEnabled();
    private static final Object flagWarningsCntSync = new Object();
    static final MruCacheStorage patternCache = new MruCacheStorage(50, 150);
    private static final long RE_FLAG_CASE_INSENSITIVE = intFlagToLong(2);
    private static final long RE_FLAG_MULTILINE = intFlagToLong(8);
    private static final long RE_FLAG_COMMENTS = intFlagToLong(4);
    private static final long RE_FLAG_DOTALL = intFlagToLong(32);

    private _RegexBuiltins() {
    }

    private static long intFlagToLong(int flag) {
        return flag & 65535;
    }

    static Pattern getPattern(String patternString, int flags) throws TemplateModelException {
        Pattern result;
        PatternCacheKey patternKey = new PatternCacheKey(patternString, flags);
        synchronized (patternCache) {
            result = (Pattern) patternCache.get(patternKey);
        }
        if (result != null) {
            return result;
        }
        try {
            Pattern result2 = Pattern.compile(patternString, flags);
            synchronized (patternCache) {
                patternCache.put(patternKey, result2);
            }
            return result2;
        } catch (PatternSyntaxException e) {
            throw new _TemplateModelException(e, new Object[]{"Malformed regular expression: ", new _DelayedGetMessage(e)});
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/_RegexBuiltins$PatternCacheKey.class */
    private static class PatternCacheKey {
        private final String patternString;
        private final int flags;
        private final int hashCode;

        public PatternCacheKey(String patternString, int flags) {
            this.patternString = patternString;
            this.flags = flags;
            this.hashCode = patternString.hashCode() + (31 * flags);
        }

        public boolean equals(Object that) {
            if (that instanceof PatternCacheKey) {
                PatternCacheKey thatPCK = (PatternCacheKey) that;
                return thatPCK.flags == this.flags && thatPCK.patternString.equals(this.patternString);
            }
            return false;
        }

        public int hashCode() {
            return this.hashCode;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static long parseFlagString(String flagString) {
        long flags = 0;
        for (int i = 0; i < flagString.length(); i++) {
            char c = flagString.charAt(i);
            switch (c) {
                case FMParserConstants.MINUS /* 99 */:
                    flags |= RE_FLAG_COMMENTS;
                    break;
                case FMParserConstants.TIMES /* 100 */:
                case FMParserConstants.DOUBLE_STAR /* 101 */:
                case FMParserConstants.DIVIDE /* 103 */:
                case FMParserConstants.PERCENT /* 104 */:
                case FMParserConstants.OR /* 106 */:
                case FMParserConstants.EXCLAM /* 107 */:
                case FMParserConstants.COMMA /* 108 */:
                case FMParserConstants.COLON /* 110 */:
                case FMParserConstants.OPEN_BRACKET /* 111 */:
                case FMParserConstants.CLOSE_BRACKET /* 112 */:
                case FMParserConstants.OPEN_PAREN /* 113 */:
                default:
                    if (flagWarningsEnabled) {
                        logFlagWarning(new StringBuffer().append("Unrecognized regular expression flag: ").append(StringUtil.jQuote(String.valueOf(c))).append(".").toString());
                        break;
                    } else {
                        break;
                    }
                case FMParserConstants.ELLIPSIS /* 102 */:
                    flags |= RE_FLAG_FIRST_ONLY;
                    break;
                case FMParserConstants.AND /* 105 */:
                    flags |= RE_FLAG_CASE_INSENSITIVE;
                    break;
                case FMParserConstants.SEMICOLON /* 109 */:
                    flags |= RE_FLAG_MULTILINE;
                    break;
                case FMParserConstants.CLOSE_PAREN /* 114 */:
                    flags |= RE_FLAG_REGEXP;
                    break;
                case FMParserConstants.OPEN_BRACE /* 115 */:
                    flags |= RE_FLAG_DOTALL;
                    break;
            }
        }
        return flags;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void logFlagWarning(String message) {
        if (flagWarningsEnabled) {
            synchronized (flagWarningsCntSync) {
                int cnt = flagWarningsCnt;
                if (cnt < 25) {
                    flagWarningsCnt++;
                    String message2 = new StringBuffer().append(message).append(" This will be an error in FreeMarker 2.4!").toString();
                    if (cnt + 1 == 25) {
                        message2 = new StringBuffer().append(message2).append(" [Will not log more regular expression flag problems until restart!]").toString();
                    }
                    logger.warn(message2);
                    return;
                }
                flagWarningsEnabled = false;
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/_RegexBuiltins$matchesBI.class */
    public static class matchesBI extends StringBuiltins.StringBuiltIn {
        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) throws TemplateModelException {
            return new MatcherBuilder(this, s);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/_RegexBuiltins$matchesBI$MatcherBuilder.class */
        class MatcherBuilder implements TemplateMethodModel {
            String matchString;
            private final matchesBI this$0;

            MatcherBuilder(matchesBI matchesbi, String matchString) throws TemplateModelException {
                this.this$0 = matchesbi;
                this.matchString = matchString;
            }

            @Override // freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                int argCnt = args.size();
                this.this$0.checkMethodArgCount(argCnt, 1, 2);
                String patternString = (String) args.get(0);
                long flags = argCnt > 1 ? _RegexBuiltins.parseFlagString((String) args.get(1)) : 0L;
                if ((flags & _RegexBuiltins.RE_FLAG_FIRST_ONLY) != 0) {
                    _RegexBuiltins.logFlagWarning(new StringBuffer().append("?").append(this.this$0.key).append(" doesn't support the \"f\" flag.").toString());
                }
                Pattern pattern = _RegexBuiltins.getPattern(patternString, (int) flags);
                Matcher matcher = pattern.matcher(this.matchString);
                return new RegexMatchModel(matcher, this.matchString);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/_RegexBuiltins$groupsBI.class */
    public static class groupsBI extends BuiltIn {
        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel targetModel = this.target.eval(env);
            assertNonNull(targetModel, env);
            if (targetModel instanceof RegexMatchModel) {
                return ((RegexMatchModel) targetModel).getGroups();
            }
            if (targetModel instanceof RegexMatchModel.Match) {
                return ((RegexMatchModel.Match) targetModel).subs;
            }
            throw new UnexpectedTypeException(this.target, targetModel, "regular expression matcher", env);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/_RegexBuiltins$replace_reBI.class */
    public static class replace_reBI extends StringBuiltins.StringBuiltIn {
        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) throws TemplateModelException {
            return new ReplaceMethod(this, s);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/_RegexBuiltins$replace_reBI$ReplaceMethod.class */
        class ReplaceMethod implements TemplateMethodModel {
            private String s;
            private final replace_reBI this$0;

            ReplaceMethod(replace_reBI replace_rebi, String s) {
                this.this$0 = replace_rebi;
                this.s = s;
            }

            @Override // freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                String result;
                int argCnt = args.size();
                this.this$0.checkMethodArgCount(argCnt, 2, 3);
                String arg1 = (String) args.get(0);
                String arg2 = (String) args.get(1);
                long flags = argCnt > 2 ? _RegexBuiltins.parseFlagString((String) args.get(2)) : 0L;
                if ((flags & _RegexBuiltins.RE_FLAG_REGEXP) == 0) {
                    _RegexBuiltins.checkNonRegexpFlags("replace", flags);
                    result = StringUtil.replace(this.s, arg1, arg2, (flags & _RegexBuiltins.RE_FLAG_CASE_INSENSITIVE) != 0, (flags & _RegexBuiltins.RE_FLAG_FIRST_ONLY) != 0);
                } else {
                    Pattern pattern = _RegexBuiltins.getPattern(arg1, (int) flags);
                    Matcher matcher = pattern.matcher(this.s);
                    result = (flags & _RegexBuiltins.RE_FLAG_FIRST_ONLY) != 0 ? matcher.replaceFirst(arg2) : matcher.replaceAll(arg2);
                }
                return new SimpleScalar(result);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/_RegexBuiltins$split_reBI.class */
    public static class split_reBI extends StringBuiltins.StringBuiltIn {
        @Override // freemarker.core.StringBuiltins.StringBuiltIn
        TemplateModel calculateResult(String s, Environment env) throws TemplateModelException {
            return new SplitMethod(this, s);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/_RegexBuiltins$split_reBI$SplitMethod.class */
        class SplitMethod implements TemplateMethodModel {
            private String s;
            private final split_reBI this$0;

            SplitMethod(split_reBI split_rebi, String s) {
                this.this$0 = split_rebi;
                this.s = s;
            }

            @Override // freemarker.template.TemplateMethodModel
            public Object exec(List args) throws TemplateModelException {
                String[] result;
                int argCnt = args.size();
                this.this$0.checkMethodArgCount(argCnt, 1, 2);
                String splitString = (String) args.get(0);
                long flags = argCnt > 1 ? _RegexBuiltins.parseFlagString((String) args.get(1)) : 0L;
                if ((flags & _RegexBuiltins.RE_FLAG_REGEXP) == 0) {
                    _RegexBuiltins.checkNonRegexpFlags("split", flags);
                    result = StringUtil.split(this.s, splitString, (flags & _RegexBuiltins.RE_FLAG_CASE_INSENSITIVE) != 0);
                } else {
                    Pattern pattern = _RegexBuiltins.getPattern(splitString, (int) flags);
                    result = pattern.split(this.s);
                }
                return ObjectWrapper.DEFAULT_WRAPPER.wrap(result);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/_RegexBuiltins$RegexMatchModel.class */
    static class RegexMatchModel implements TemplateBooleanModel, TemplateCollectionModel, TemplateSequenceModel {
        final Matcher matcher;
        final String input;
        final boolean matches;
        TemplateSequenceModel groups;
        private ArrayList data;

        RegexMatchModel(Matcher matcher, String input) {
            this.matcher = matcher;
            this.input = input;
            this.matches = matcher.matches();
        }

        @Override // freemarker.template.TemplateBooleanModel
        public boolean getAsBoolean() {
            return this.matches;
        }

        @Override // freemarker.template.TemplateSequenceModel
        public TemplateModel get(int i) throws TemplateModelException {
            if (this.data == null) {
                initSequence();
            }
            return (TemplateModel) this.data.get(i);
        }

        @Override // freemarker.template.TemplateSequenceModel
        public int size() throws TemplateModelException {
            if (this.data == null) {
                initSequence();
            }
            return this.data.size();
        }

        private void initSequence() throws TemplateModelException {
            this.data = new ArrayList();
            TemplateModelIterator it = iterator();
            while (it.hasNext()) {
                this.data.add(it.next());
            }
        }

        public TemplateModel getGroups() {
            if (this.groups == null) {
                this.groups = new TemplateSequenceModel(this) { // from class: freemarker.core._RegexBuiltins.RegexMatchModel.1
                    private final RegexMatchModel this$0;

                    {
                        this.this$0 = this;
                    }

                    @Override // freemarker.template.TemplateSequenceModel
                    public int size() throws TemplateModelException {
                        try {
                            return this.this$0.matcher.groupCount() + 1;
                        } catch (Exception e) {
                            throw new _TemplateModelException(e);
                        }
                    }

                    @Override // freemarker.template.TemplateSequenceModel
                    public TemplateModel get(int i) throws TemplateModelException {
                        try {
                            return new SimpleScalar(this.this$0.matcher.group(i));
                        } catch (Exception e) {
                            throw new _TemplateModelException(e);
                        }
                    }
                };
            }
            return this.groups;
        }

        @Override // freemarker.template.TemplateCollectionModel
        public TemplateModelIterator iterator() {
            this.matcher.reset();
            return new TemplateModelIterator(this) { // from class: freemarker.core._RegexBuiltins.RegexMatchModel.2
                boolean hasFindInfo;
                private final RegexMatchModel this$0;

                {
                    this.this$0 = this;
                    this.hasFindInfo = this.this$0.matcher.find();
                }

                @Override // freemarker.template.TemplateModelIterator
                public boolean hasNext() {
                    return this.hasFindInfo;
                }

                @Override // freemarker.template.TemplateModelIterator
                public TemplateModel next() throws TemplateModelException {
                    if (!hasNext()) {
                        throw new _TemplateModelException("No more matches");
                    }
                    Match result = new Match(this.this$0);
                    this.hasFindInfo = this.this$0.matcher.find();
                    return result;
                }
            };
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/core/_RegexBuiltins$RegexMatchModel$Match.class */
        class Match implements TemplateScalarModel {
            String match;
            SimpleSequence subs = new SimpleSequence();
            private final RegexMatchModel this$0;

            Match(RegexMatchModel regexMatchModel) {
                this.this$0 = regexMatchModel;
                this.match = regexMatchModel.input.substring(regexMatchModel.matcher.start(), regexMatchModel.matcher.end());
                for (int i = 0; i < regexMatchModel.matcher.groupCount() + 1; i++) {
                    this.subs.add(regexMatchModel.matcher.group(i));
                }
            }

            @Override // freemarker.template.TemplateScalarModel
            public String getAsString() {
                return this.match;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void checkNonRegexpFlags(String biName, long flags) {
        if (flagWarningsEnabled) {
            if ((flags & RE_FLAG_MULTILINE) != 0) {
                logFlagWarning(new StringBuffer().append("?").append(biName).append(" doesn't support the \"m\" flag ").append("without the \"r\" flag.").toString());
            }
            if ((flags & RE_FLAG_DOTALL) != 0) {
                logFlagWarning(new StringBuffer().append("?").append(biName).append(" doesn't support the \"s\" flag ").append("without the \"r\" flag.").toString());
            }
            if ((flags & RE_FLAG_COMMENTS) != 0) {
                logFlagWarning(new StringBuffer().append("?").append(biName).append(" doesn't support the \"c\" flag ").append("without the \"r\" flag.").toString());
            }
        }
    }
}
