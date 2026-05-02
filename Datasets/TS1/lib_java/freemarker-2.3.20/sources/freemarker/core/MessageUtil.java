package freemarker.core;

import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.utility.StringUtil;
import java.util.ArrayList;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/MessageUtil.class */
class MessageUtil {
    static final String[] UNKNOWN_DATE_TYPE_ERROR_TIPS = {"Use ?time, ?date or ?datetime to tell FreeMarker which parts of the date is used.", "For programmers: Use java.sql.Date/Time/Timestamp instead of java.util.Date in the data-model to avoid this ambiguity."};
    static final String[] UNKNOWN_DATE_TO_STRING_TIPS = {"Use ?string(format) to specify which parts to display.", UNKNOWN_DATE_TYPE_ERROR_TIPS[0], UNKNOWN_DATE_TYPE_ERROR_TIPS[1]};
    static final String EMBEDDED_MESSAGE_BEGIN = "---begin-message---\n";
    static final String EMBEDDED_MESSAGE_END = "\n---end-message---";

    private MessageUtil() {
    }

    static String formatLocationForSimpleParsingError(Template template, int line, int column) {
        return formatLocation("in", template, line, column);
    }

    static String formatLocationForSimpleParsingError(String templateName, int line, int column) {
        return formatLocation("in", templateName, line, column);
    }

    static String formatLocationForDependentParsingError(Template template, int line, int column) {
        return formatLocation("on", template, line, column);
    }

    static String formatLocationForDependentParsingError(String templateName, int line, int column) {
        return formatLocation("on", templateName, line, column);
    }

    static String formatLocationForEvaluationError(Template template, int line, int column) {
        return formatLocation("at", template, line, column);
    }

    static String formatLocationForEvaluationError(Macro macro, int line, int column) {
        Template t = macro.getTemplate();
        return formatLocation("at", t != null ? t.getName() : null, macro.getName(), macro.isFunction(), line, column);
    }

    static String formatLocationForEvaluationError(String templateName, int line, int column) {
        return formatLocation("at", templateName, line, column);
    }

    private static String formatLocation(String preposition, Template template, int line, int column) {
        return formatLocation(preposition, template != null ? template.getName() : null, line, column);
    }

    private static String formatLocation(String preposition, String templateName, int line, int column) {
        return formatLocation(preposition, templateName, null, false, line, column);
    }

    private static String formatLocation(String preposition, String templateName, String macroOrFuncName, boolean isFunction, int line, int column) {
        String templateDesc;
        String str;
        if (line < 0) {
            templateDesc = "?eval-ed string";
            line += 1000000001;
            macroOrFuncName = null;
        } else {
            templateDesc = templateName != null ? new StringBuffer().append("template ").append(StringUtil.jQuoteNoXSS(templateName)).toString() : "nameless template";
        }
        StringBuffer append = new StringBuffer().append("in ").append(templateDesc);
        if (macroOrFuncName != null) {
            str = new StringBuffer().append(" in ").append(isFunction ? "function " : "macro ").append(StringUtil.jQuote(macroOrFuncName)).toString();
        } else {
            str = "";
        }
        return append.append(str).append(" ").append(preposition).append(" line ").append(line).append(", column ").append(column).toString();
    }

    static String shorten(String s, int maxLength) {
        if (maxLength < 5) {
            maxLength = 5;
        }
        boolean isTruncated = false;
        int brIdx = s.indexOf(10);
        if (brIdx != -1) {
            s = s.substring(0, brIdx);
            isTruncated = true;
        }
        int brIdx2 = s.indexOf(13);
        if (brIdx2 != -1) {
            s = s.substring(0, brIdx2);
            isTruncated = true;
        }
        if (s.length() > maxLength) {
            s = s.substring(0, maxLength - 3);
            isTruncated = true;
        }
        if (!isTruncated) {
            return s;
        }
        if (s.endsWith(".")) {
            if (s.endsWith("..")) {
                if (s.endsWith("...")) {
                    return s;
                }
                return new StringBuffer().append(s).append(".").toString();
            }
            return new StringBuffer().append(s).append("..").toString();
        }
        return new StringBuffer().append(s).append("...").toString();
    }

    static StringBuffer appendExpressionAsUntearable(StringBuffer sb, Expression argExp) {
        boolean needParen = ((argExp instanceof NumberLiteral) || (argExp instanceof StringLiteral) || (argExp instanceof BooleanLiteral) || (argExp instanceof ListLiteral) || (argExp instanceof HashLiteral) || (argExp instanceof Identifier) || (argExp instanceof Dot) || (argExp instanceof DynamicKeyName) || (argExp instanceof MethodCall) || (argExp instanceof BuiltIn)) ? false : true;
        if (needParen) {
            sb.append('(');
        }
        sb.append(argExp.getCanonicalForm());
        if (needParen) {
            sb.append(')');
        }
        return sb;
    }

    static TemplateModelException newArgCntError(String methodName, int argCnt, int expectedCnt) {
        return newArgCntError(methodName, argCnt, expectedCnt, expectedCnt);
    }

    static TemplateModelException newArgCntError(String methodName, int argCnt, int minCnt, int maxCnt) {
        ArrayList desc = new ArrayList(20);
        desc.add(methodName);
        desc.add("(");
        if (maxCnt != 0) {
            desc.add("...");
        }
        desc.add(") expects ");
        if (minCnt == maxCnt) {
            if (maxCnt == 0) {
                desc.add("no");
            } else {
                desc.add(new Integer(maxCnt));
            }
        } else if (maxCnt - minCnt == 1) {
            desc.add(new Integer(minCnt));
            desc.add(" or ");
            desc.add(new Integer(maxCnt));
        } else {
            desc.add(new Integer(minCnt));
            if (maxCnt != Integer.MAX_VALUE) {
                desc.add(" to ");
                desc.add(new Integer(maxCnt));
            } else {
                desc.add(" or more (unlimited)");
            }
        }
        desc.add(" argument");
        if (maxCnt > 1) {
            desc.add("s");
        }
        desc.add(" but has received ");
        if (argCnt == 0) {
            desc.add("none");
        } else {
            desc.add(new Integer(argCnt));
        }
        desc.add(".");
        return new _TemplateModelException(desc.toArray());
    }

    static TemplateModelException newMethodArgMustBeStringException(String methodName, int argIdx, TemplateModel arg) {
        return newMethodArgUnexpectedTypeException(methodName, argIdx, "string", arg);
    }

    static TemplateModelException newMethodArgMustBeNumberException(String methodName, int argIdx, TemplateModel arg) {
        return newMethodArgUnexpectedTypeException(methodName, argIdx, "number", arg);
    }

    static TemplateModelException newMethodArgMustBeBooleanException(String methodName, int argIdx, TemplateModel arg) {
        return newMethodArgUnexpectedTypeException(methodName, argIdx, "boolean", arg);
    }

    static TemplateModelException newMethodArgMustBeExtendedHashException(String methodName, int argIdx, TemplateModel arg) {
        return newMethodArgUnexpectedTypeException(methodName, argIdx, "extended hash", arg);
    }

    static TemplateModelException newMethodArgMustBeSequenceException(String methodName, int argIdx, TemplateModel arg) {
        return newMethodArgUnexpectedTypeException(methodName, argIdx, "sequence", arg);
    }

    static TemplateModelException newMethodArgMustBeSequenceOrCollectionException(String methodName, int argIdx, TemplateModel arg) {
        return newMethodArgUnexpectedTypeException(methodName, argIdx, "sequence or collection", arg);
    }

    static TemplateModelException newMethodArgUnexpectedTypeException(String methodName, int argIdx, String expectedType, TemplateModel arg) {
        return new _TemplateModelException(new Object[]{methodName, "(...) expects ", new _DelayedAOrAn(expectedType), " as argument #", new Integer(argIdx + 1), ", but received ", new _DelayedAOrAn(new _DelayedFTLTypeDescription(arg)), "."});
    }

    static TemplateException newInstantiatingClassNotAllowedException(String className, Environment env) {
        return new _MiscTemplateException(env, new Object[]{"Instantiating ", className, " is not allowed in the template for security reasons."});
    }

    static String getAOrAn(String s) {
        if (s == null) {
            return null;
        }
        if (s.length() == 0) {
            return "";
        }
        char fc = Character.toLowerCase(s.charAt(0));
        if (fc == 'a' || fc == 'e' || fc == 'i') {
            return "an";
        }
        if (fc == 'h') {
            String ls = s.toLowerCase();
            if (ls.startsWith("has") || ls.startsWith("hi")) {
                return "a";
            }
            if (ls.startsWith("ht")) {
                return "an";
            }
            return "a(n)";
        }
        if (fc == 'u' || fc == 'o') {
            return "a(n)";
        }
        char sc = s.length() > 1 ? s.charAt(1) : (char) 0;
        if (fc == 'x' && sc != 'a' && sc != 'e' && sc != 'i' && sc != 'a' && sc != 'o' && sc != 'u') {
            return "an";
        }
        return "a";
    }
}
