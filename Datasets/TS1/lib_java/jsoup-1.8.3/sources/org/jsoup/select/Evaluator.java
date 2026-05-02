package org.jsoup.select;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Comment;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.DocumentType;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.nodes.XmlDeclaration;

/* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator.class */
public abstract class Evaluator {
    public abstract boolean matches(Element element, Element element2);

    protected Evaluator() {
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$Tag.class */
    public static final class Tag extends Evaluator {
        private String tagName;

        public Tag(String tagName) {
            this.tagName = tagName;
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            return element.tagName().equals(this.tagName);
        }

        public String toString() {
            return String.format("%s", this.tagName);
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$Id.class */
    public static final class Id extends Evaluator {
        private String id;

        public Id(String id) {
            this.id = id;
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            return this.id.equals(element.id());
        }

        public String toString() {
            return String.format("#%s", this.id);
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$Class.class */
    public static final class Class extends Evaluator {
        private String className;

        public Class(String className) {
            this.className = className;
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            return element.hasClass(this.className);
        }

        public String toString() {
            return String.format(".%s", this.className);
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$Attribute.class */
    public static final class Attribute extends Evaluator {
        private String key;

        public Attribute(String key) {
            this.key = key;
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            return element.hasAttr(this.key);
        }

        public String toString() {
            return String.format("[%s]", this.key);
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$AttributeStarting.class */
    public static final class AttributeStarting extends Evaluator {
        private String keyPrefix;

        public AttributeStarting(String keyPrefix) {
            this.keyPrefix = keyPrefix;
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            List<org.jsoup.nodes.Attribute> values = element.attributes().asList();
            for (org.jsoup.nodes.Attribute attribute : values) {
                if (attribute.getKey().startsWith(this.keyPrefix)) {
                    return true;
                }
            }
            return false;
        }

        public String toString() {
            return String.format("[^%s]", this.keyPrefix);
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$AttributeWithValue.class */
    public static final class AttributeWithValue extends AttributeKeyPair {
        public AttributeWithValue(String key, String value) {
            super(key, value);
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            return element.hasAttr(this.key) && this.value.equalsIgnoreCase(element.attr(this.key).trim());
        }

        public String toString() {
            return String.format("[%s=%s]", this.key, this.value);
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$AttributeWithValueNot.class */
    public static final class AttributeWithValueNot extends AttributeKeyPair {
        public AttributeWithValueNot(String key, String value) {
            super(key, value);
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            return !this.value.equalsIgnoreCase(element.attr(this.key));
        }

        public String toString() {
            return String.format("[%s!=%s]", this.key, this.value);
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$AttributeWithValueStarting.class */
    public static final class AttributeWithValueStarting extends AttributeKeyPair {
        public AttributeWithValueStarting(String key, String value) {
            super(key, value);
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            return element.hasAttr(this.key) && element.attr(this.key).toLowerCase().startsWith(this.value);
        }

        public String toString() {
            return String.format("[%s^=%s]", this.key, this.value);
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$AttributeWithValueEnding.class */
    public static final class AttributeWithValueEnding extends AttributeKeyPair {
        public AttributeWithValueEnding(String key, String value) {
            super(key, value);
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            return element.hasAttr(this.key) && element.attr(this.key).toLowerCase().endsWith(this.value);
        }

        public String toString() {
            return String.format("[%s$=%s]", this.key, this.value);
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$AttributeWithValueContaining.class */
    public static final class AttributeWithValueContaining extends AttributeKeyPair {
        public AttributeWithValueContaining(String key, String value) {
            super(key, value);
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            return element.hasAttr(this.key) && element.attr(this.key).toLowerCase().contains(this.value);
        }

        public String toString() {
            return String.format("[%s*=%s]", this.key, this.value);
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$AttributeWithValueMatching.class */
    public static final class AttributeWithValueMatching extends Evaluator {
        String key;
        Pattern pattern;

        public AttributeWithValueMatching(String key, Pattern pattern) {
            this.key = key.trim().toLowerCase();
            this.pattern = pattern;
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            return element.hasAttr(this.key) && this.pattern.matcher(element.attr(this.key)).find();
        }

        public String toString() {
            return String.format("[%s~=%s]", this.key, this.pattern.toString());
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$AttributeKeyPair.class */
    public static abstract class AttributeKeyPair extends Evaluator {
        String key;
        String value;

        public AttributeKeyPair(String key, String value) {
            Validate.notEmpty(key);
            Validate.notEmpty(value);
            this.key = key.trim().toLowerCase();
            if (value.startsWith("\"") && value.endsWith("\"")) {
                value = value.substring(1, value.length() - 1);
            }
            this.value = value.trim().toLowerCase();
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$AllElements.class */
    public static final class AllElements extends Evaluator {
        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            return true;
        }

        public String toString() {
            return "*";
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$IndexLessThan.class */
    public static final class IndexLessThan extends IndexEvaluator {
        public IndexLessThan(int index) {
            super(index);
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            return element.elementSiblingIndex().intValue() < this.index;
        }

        public String toString() {
            return String.format(":lt(%d)", Integer.valueOf(this.index));
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$IndexGreaterThan.class */
    public static final class IndexGreaterThan extends IndexEvaluator {
        public IndexGreaterThan(int index) {
            super(index);
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            return element.elementSiblingIndex().intValue() > this.index;
        }

        public String toString() {
            return String.format(":gt(%d)", Integer.valueOf(this.index));
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$IndexEquals.class */
    public static final class IndexEquals extends IndexEvaluator {
        public IndexEquals(int index) {
            super(index);
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            return element.elementSiblingIndex().intValue() == this.index;
        }

        public String toString() {
            return String.format(":eq(%d)", Integer.valueOf(this.index));
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$IsLastChild.class */
    public static final class IsLastChild extends Evaluator {
        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            Element p = element.parent();
            return (p == null || (p instanceof Document) || element.elementSiblingIndex().intValue() != p.children().size() - 1) ? false : true;
        }

        public String toString() {
            return ":last-child";
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$IsFirstOfType.class */
    public static final class IsFirstOfType extends IsNthOfType {
        public IsFirstOfType() {
            super(0, 1);
        }

        @Override // org.jsoup.select.Evaluator.CssNthEvaluator
        public String toString() {
            return ":first-of-type";
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$IsLastOfType.class */
    public static final class IsLastOfType extends IsNthLastOfType {
        public IsLastOfType() {
            super(0, 1);
        }

        @Override // org.jsoup.select.Evaluator.CssNthEvaluator
        public String toString() {
            return ":last-of-type";
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$CssNthEvaluator.class */
    public static abstract class CssNthEvaluator extends Evaluator {
        protected final int a;
        protected final int b;

        protected abstract String getPseudoClass();

        protected abstract int calculatePosition(Element element, Element element2);

        public CssNthEvaluator(int a, int b) {
            this.a = a;
            this.b = b;
        }

        public CssNthEvaluator(int b) {
            this(0, b);
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            Element p = element.parent();
            if (p == null || (p instanceof Document)) {
                return false;
            }
            int pos = calculatePosition(root, element);
            return this.a == 0 ? pos == this.b : (pos - this.b) * this.a >= 0 && (pos - this.b) % this.a == 0;
        }

        public String toString() {
            if (this.a == 0) {
                return String.format(":%s(%d)", getPseudoClass(), Integer.valueOf(this.b));
            }
            if (this.b == 0) {
                return String.format(":%s(%dn)", getPseudoClass(), Integer.valueOf(this.a));
            }
            return String.format(":%s(%dn%+d)", getPseudoClass(), Integer.valueOf(this.a), Integer.valueOf(this.b));
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$IsNthChild.class */
    public static final class IsNthChild extends CssNthEvaluator {
        public IsNthChild(int a, int b) {
            super(a, b);
        }

        @Override // org.jsoup.select.Evaluator.CssNthEvaluator
        protected int calculatePosition(Element root, Element element) {
            return element.elementSiblingIndex().intValue() + 1;
        }

        @Override // org.jsoup.select.Evaluator.CssNthEvaluator
        protected String getPseudoClass() {
            return "nth-child";
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$IsNthLastChild.class */
    public static final class IsNthLastChild extends CssNthEvaluator {
        public IsNthLastChild(int a, int b) {
            super(a, b);
        }

        @Override // org.jsoup.select.Evaluator.CssNthEvaluator
        protected int calculatePosition(Element root, Element element) {
            return element.parent().children().size() - element.elementSiblingIndex().intValue();
        }

        @Override // org.jsoup.select.Evaluator.CssNthEvaluator
        protected String getPseudoClass() {
            return "nth-last-child";
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$IsNthOfType.class */
    public static class IsNthOfType extends CssNthEvaluator {
        public IsNthOfType(int a, int b) {
            super(a, b);
        }

        @Override // org.jsoup.select.Evaluator.CssNthEvaluator
        protected int calculatePosition(Element root, Element element) {
            int pos = 0;
            Elements family = element.parent().children();
            for (int i = 0; i < family.size(); i++) {
                if (family.get(i).tag().equals(element.tag())) {
                    pos++;
                }
                if (family.get(i) == element) {
                    break;
                }
            }
            return pos;
        }

        @Override // org.jsoup.select.Evaluator.CssNthEvaluator
        protected String getPseudoClass() {
            return "nth-of-type";
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$IsNthLastOfType.class */
    public static class IsNthLastOfType extends CssNthEvaluator {
        public IsNthLastOfType(int a, int b) {
            super(a, b);
        }

        @Override // org.jsoup.select.Evaluator.CssNthEvaluator
        protected int calculatePosition(Element root, Element element) {
            int pos = 0;
            Elements family = element.parent().children();
            for (int i = element.elementSiblingIndex().intValue(); i < family.size(); i++) {
                if (family.get(i).tag().equals(element.tag())) {
                    pos++;
                }
            }
            return pos;
        }

        @Override // org.jsoup.select.Evaluator.CssNthEvaluator
        protected String getPseudoClass() {
            return "nth-last-of-type";
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$IsFirstChild.class */
    public static final class IsFirstChild extends Evaluator {
        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            Element p = element.parent();
            return (p == null || (p instanceof Document) || element.elementSiblingIndex().intValue() != 0) ? false : true;
        }

        public String toString() {
            return ":first-child";
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$IsRoot.class */
    public static final class IsRoot extends Evaluator {
        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            Element r = root instanceof Document ? root.child(0) : root;
            return element == r;
        }

        public String toString() {
            return ":root";
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$IsOnlyChild.class */
    public static final class IsOnlyChild extends Evaluator {
        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            Element p = element.parent();
            return (p == null || (p instanceof Document) || element.siblingElements().size() != 0) ? false : true;
        }

        public String toString() {
            return ":only-child";
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$IsOnlyOfType.class */
    public static final class IsOnlyOfType extends Evaluator {
        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            Element p = element.parent();
            if (p == null || (p instanceof Document)) {
                return false;
            }
            int pos = 0;
            Elements family = p.children();
            for (int i = 0; i < family.size(); i++) {
                if (family.get(i).tag().equals(element.tag())) {
                    pos++;
                }
            }
            return pos == 1;
        }

        public String toString() {
            return ":only-of-type";
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$IsEmpty.class */
    public static final class IsEmpty extends Evaluator {
        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            List<Node> family = element.childNodes();
            for (int i = 0; i < family.size(); i++) {
                Node n = family.get(i);
                if (!(n instanceof Comment) && !(n instanceof XmlDeclaration) && !(n instanceof DocumentType)) {
                    return false;
                }
            }
            return true;
        }

        public String toString() {
            return ":empty";
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$IndexEvaluator.class */
    public static abstract class IndexEvaluator extends Evaluator {
        int index;

        public IndexEvaluator(int index) {
            this.index = index;
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$ContainsText.class */
    public static final class ContainsText extends Evaluator {
        private String searchText;

        public ContainsText(String searchText) {
            this.searchText = searchText.toLowerCase();
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            return element.text().toLowerCase().contains(this.searchText);
        }

        public String toString() {
            return String.format(":contains(%s", this.searchText);
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$ContainsOwnText.class */
    public static final class ContainsOwnText extends Evaluator {
        private String searchText;

        public ContainsOwnText(String searchText) {
            this.searchText = searchText.toLowerCase();
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            return element.ownText().toLowerCase().contains(this.searchText);
        }

        public String toString() {
            return String.format(":containsOwn(%s", this.searchText);
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$Matches.class */
    public static final class Matches extends Evaluator {
        private Pattern pattern;

        public Matches(Pattern pattern) {
            this.pattern = pattern;
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            Matcher m = this.pattern.matcher(element.text());
            return m.find();
        }

        public String toString() {
            return String.format(":matches(%s", this.pattern);
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/select/Evaluator$MatchesOwn.class */
    public static final class MatchesOwn extends Evaluator {
        private Pattern pattern;

        public MatchesOwn(Pattern pattern) {
            this.pattern = pattern;
        }

        @Override // org.jsoup.select.Evaluator
        public boolean matches(Element root, Element element) {
            Matcher m = this.pattern.matcher(element.ownText());
            return m.find();
        }

        public String toString() {
            return String.format(":matchesOwn(%s", this.pattern);
        }
    }
}
