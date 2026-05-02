package org.markdownj;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: markdownj-core-0.4.jar:org/markdownj/TextEditor.class */
public class TextEditor {
    private StringBuilder text;

    public TextEditor(CharSequence text) {
        this.text = new StringBuilder(text);
    }

    public String toString() {
        return this.text.toString();
    }

    public TextEditor replaceAll(String regex, String replacement) {
        if (this.text.length() > 0) {
            Pattern p = Pattern.compile(regex, 8);
            Matcher m = p.matcher(this.text);
            StringBuffer sb = new StringBuffer();
            while (m.find()) {
                m.appendReplacement(sb, replacement);
            }
            m.appendTail(sb);
            this.text = new StringBuilder(sb.toString());
        }
        return this;
    }

    public TextEditor replaceAllLiteral(String regex, final String replacement) {
        return replaceAll(Pattern.compile(regex, 8), new Replacement() { // from class: org.markdownj.TextEditor.1
            @Override // org.markdownj.Replacement
            public String replacement(Matcher m) {
                return replacement;
            }
        });
    }

    public TextEditor replaceAll(Pattern pattern, Replacement replacement) {
        Matcher m = pattern.matcher(this.text);
        int lastIndex = 0;
        StringBuilder sb = new StringBuilder();
        while (m.find()) {
            sb.append(this.text.subSequence(lastIndex, m.start()));
            sb.append(replacement.replacement(m));
            lastIndex = m.end();
        }
        sb.append(this.text.subSequence(lastIndex, this.text.length()));
        this.text = sb;
        return this;
    }

    public TextEditor deleteAll(String pattern) {
        return replaceAll(pattern, "");
    }

    public TextEditor detabify() {
        return detabify(4);
    }

    public TextEditor detabify(final int tabWidth) {
        replaceAll(Pattern.compile("(.*?)\\t"), new Replacement() { // from class: org.markdownj.TextEditor.2
            @Override // org.markdownj.Replacement
            public String replacement(Matcher m) {
                String lineSoFar = m.group(1);
                int width = lineSoFar.length();
                StringBuilder replacement = new StringBuilder(lineSoFar);
                do {
                    replacement.append(' ');
                    width++;
                } while (width % tabWidth != 0);
                return replacement.toString();
            }
        });
        return this;
    }

    public TextEditor outdent(int spaces) {
        return deleteAll("^(\\t|[ ]{1," + spaces + "})");
    }

    public TextEditor outdent() {
        return outdent(4);
    }

    public TextEditor trim() {
        this.text = new StringBuilder(this.text.toString().trim());
        return this;
    }

    public TextEditor indent(int spaces) {
        StringBuilder sb = new StringBuilder(spaces);
        for (int i = 0; i < spaces; i++) {
            sb.append(' ');
        }
        return replaceAll("^", sb.toString());
    }

    public void append(CharSequence s) {
        this.text.append(s);
    }

    public Collection<HTMLToken> tokenizeHTML() {
        int lastPos;
        List<HTMLToken> tokens = new ArrayList<>();
        String nestedTags = nestedTagsRegex(6);
        Pattern p = Pattern.compile("(?s:<!(--.*?--\\s*)+>)|(?s:<\\?.*?\\?>)|" + nestedTags + "", 2);
        Matcher m = p.matcher(this.text);
        int i = 0;
        while (true) {
            lastPos = i;
            if (!m.find()) {
                break;
            }
            if (lastPos < m.start()) {
                tokens.add(HTMLToken.text(this.text.substring(lastPos, m.start())));
            }
            tokens.add(HTMLToken.tag(this.text.substring(m.start(), m.end())));
            i = m.end();
        }
        if (lastPos < this.text.length()) {
            tokens.add(HTMLToken.text(this.text.substring(lastPos, this.text.length())));
        }
        return tokens;
    }

    private String nestedTagsRegex(int depth) {
        if (depth == 0) {
            return "";
        }
        return "(?:<[a-z/!$](?:[^<>]|" + nestedTagsRegex(depth - 1) + ")*>)";
    }

    public void prepend(CharSequence s) {
        this.text.insert(0, s);
    }

    public boolean isEmpty() {
        return this.text.length() == 0;
    }
}
