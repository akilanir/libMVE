package org.markdownj;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Collection;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: markdownj-core-0.4.jar:org/markdownj/MarkdownProcessor.class */
public class MarkdownProcessor {
    private static final CharacterProtector HTML_PROTECTOR = new CharacterProtector();
    private static final CharacterProtector CHAR_PROTECTOR = new CharacterProtector();
    private Random rnd = new Random();
    private Map<String, LinkDefinition> linkDefinitions = new TreeMap();
    private int tabWidth = 4;
    private int listLevel = 0;

    public String markdown(String txt) {
        if (txt == null) {
            txt = "";
        }
        TextEditor text = new TextEditor(txt);
        text.replaceAll("\\r\\n", "\n");
        text.replaceAll("\\r", "\n");
        text.replaceAll("^[ \\t]+$", "");
        text.append("\n\n");
        text.detabify();
        text.deleteAll("^[ ]+$");
        hashHTMLBlocks(text);
        stripLinkDefinitions(text);
        TextEditor text2 = runBlockGamut(text);
        unEscapeSpecialChars(text2);
        text2.append("\n");
        return text2.toString();
    }

    private TextEditor encodeBackslashEscapes(TextEditor text) {
        char[] normalChars = "`_>!".toCharArray();
        char[] escapedChars = "*{}[]()#+-.".toCharArray();
        text.replaceAllLiteral("\\\\\\\\", CHAR_PROTECTOR.encode("\\"));
        encodeEscapes(text, normalChars, "\\\\");
        encodeEscapes(text, escapedChars, "\\\\\\");
        return text;
    }

    private TextEditor encodeEscapes(TextEditor text, char[] chars, String slashes) {
        for (char ch : chars) {
            String regex = slashes + ch;
            text.replaceAllLiteral(regex, CHAR_PROTECTOR.encode(String.valueOf(ch)));
        }
        return text;
    }

    private void stripLinkDefinitions(TextEditor text) {
        Pattern p = Pattern.compile("^[ ]{0,3}\\[(.+)\\]:[ \\t]*\\n?[ \\t]*<?(\\S+?)>?[ \\t]*\\n?[ \\t]*(?:[\"(](.+?)[\")][ \\t]*)?(?:\\n+|\\Z)", 8);
        text.replaceAll(p, new Replacement() { // from class: org.markdownj.MarkdownProcessor.1
            @Override // org.markdownj.Replacement
            public String replacement(Matcher m) {
                String id = m.group(1).toLowerCase();
                String url = MarkdownProcessor.this.encodeAmpsAndAngles(new TextEditor(m.group(2))).toString();
                String title = m.group(3);
                if (title == null) {
                    title = "";
                }
                MarkdownProcessor.this.linkDefinitions.put(id, new LinkDefinition(url, MarkdownProcessor.this.replaceAll(title, "\"", "&quot;")));
                return "";
            }
        });
    }

    public TextEditor runBlockGamut(TextEditor text) {
        doHeaders(text);
        doHorizontalRules(text);
        doLists(text);
        doCodeBlocks(text);
        doBlockQuotes(text);
        hashHTMLBlocks(text);
        return formParagraphs(text);
    }

    private void doHorizontalRules(TextEditor text) {
        String[] hrDelimiters = {"\\*", "-", "_"};
        for (String hrDelimiter : hrDelimiters) {
            text.replaceAll("^[ ]{0,2}([ ]?" + hrDelimiter + "[ ]?){3,}[ ]*$", "<hr />");
        }
    }

    private void hashHTMLBlocks(TextEditor text) {
        String[] tagsA = {"p", "div", "h1", "h2", "h3", "h4", "h5", "h6", "blockquote", "pre", "table", "dl", "ol", "ul", "script", "noscript", "form", "fieldset", "iframe", "math"};
        String[] tagsB = {"ins", "del"};
        String alternationA = join("|", tagsA);
        String alternationB = alternationA + "|" + join("|", tagsB);
        int less_than_tab = this.tabWidth - 1;
        Pattern p1 = Pattern.compile("(^<(" + alternationA + ")\\b(.*\\n)*?</\\2>[ ]*(?=\\n+|\\Z))", 10);
        Replacement protectHTML = new Replacement() { // from class: org.markdownj.MarkdownProcessor.2
            @Override // org.markdownj.Replacement
            public String replacement(Matcher m) {
                String literal = m.group();
                return "\n\n" + MarkdownProcessor.HTML_PROTECTOR.encode(literal) + "\n\n";
            }
        };
        text.replaceAll(p1, protectHTML);
        Pattern p2 = Pattern.compile("(^<(" + alternationB + ")\\b(.*\\n)*?.*</\\2>[ ]*(?=\\n+|\\Z))", 10);
        text.replaceAll(p2, protectHTML);
        Pattern p3 = Pattern.compile("(?:(?<=\\n\\n)|\\A\\n?)([ ]{0," + less_than_tab + "}<(hr)\\b([^<>])*?/?>[ ]*(?=\\n{2,}|\\Z))", 2);
        text.replaceAll(p3, protectHTML);
        Pattern p4 = Pattern.compile("(?:(?<=\\n\\n)|\\A\\n?)([ ]{0," + less_than_tab + "}(?s:<!(--.*?--\\s*)+>)[ ]*(?=\\n{2,}|\\Z))");
        text.replaceAll(p4, protectHTML);
    }

    private TextEditor formParagraphs(TextEditor markup) {
        String[] paragraphs;
        markup.deleteAll("\\A\\n+");
        markup.deleteAll("\\n+\\z");
        if (markup.isEmpty()) {
            paragraphs = new String[0];
        } else {
            paragraphs = Pattern.compile("\\n{2,}").split(markup.toString());
        }
        for (int i = 0; i < paragraphs.length; i++) {
            String paragraph = paragraphs[i];
            String decoded = HTML_PROTECTOR.decode(paragraph);
            if (decoded != null) {
                paragraphs[i] = decoded;
            } else {
                paragraphs[i] = "<p>" + runSpanGamut(new TextEditor(paragraph)).toString() + "</p>";
            }
        }
        return new TextEditor(join("\n\n", paragraphs));
    }

    private TextEditor doAutoLinks(TextEditor markup) {
        markup.replaceAll("<((https?|ftp):[^'\">\\s]+)>", "<a href=\"$1\">$1</a>");
        Pattern email = Pattern.compile("<([-.\\w]+\\@[-a-z0-9]+(\\.[-a-z0-9]+)*\\.[a-z]+)>");
        markup.replaceAll(email, new Replacement() { // from class: org.markdownj.MarkdownProcessor.3
            @Override // org.markdownj.Replacement
            public String replacement(Matcher m) {
                String address = m.group(1);
                TextEditor ed = new TextEditor(address);
                MarkdownProcessor.this.unEscapeSpecialChars(ed);
                String addr = MarkdownProcessor.this.encodeEmail(ed.toString());
                String url = MarkdownProcessor.this.encodeEmail("mailto:" + ed.toString());
                return "<a href=\"" + url + "\">" + addr + "</a>";
            }
        });
        return markup;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void unEscapeSpecialChars(TextEditor ed) {
        for (String hash : CHAR_PROTECTOR.getAllEncodedTokens()) {
            String plaintext = CHAR_PROTECTOR.decode(hash);
            ed.replaceAllLiteral(hash, plaintext);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String encodeEmail(String s) {
        StringBuilder sb = new StringBuilder();
        char[] email = s.toCharArray();
        for (char ch : email) {
            double r = this.rnd.nextDouble();
            if (r < 0.45d) {
                sb.append("&#");
                sb.append((int) ch);
                sb.append(';');
            } else if (r < 0.9d) {
                sb.append("&#x");
                sb.append(Integer.toString(ch, 16));
                sb.append(';');
            } else {
                sb.append(ch);
            }
        }
        return sb.toString();
    }

    private TextEditor doBlockQuotes(TextEditor markup) {
        Pattern p = Pattern.compile("((^[ \t]*>[ \t]?.+\\n(.+\\n)*\\n*)+)", 8);
        return markup.replaceAll(p, new Replacement() { // from class: org.markdownj.MarkdownProcessor.4
            @Override // org.markdownj.Replacement
            public String replacement(Matcher m) {
                TextEditor blockQuote = new TextEditor(m.group(1));
                blockQuote.deleteAll("^[ \t]*>[ \t]?");
                blockQuote.deleteAll("^[ \t]+$");
                TextEditor blockQuote2 = MarkdownProcessor.this.runBlockGamut(blockQuote);
                blockQuote2.replaceAll("^", "  ");
                Pattern p1 = Pattern.compile("(\\s*<pre>.*?</pre>)", 32);
                return "<blockquote>\n" + blockQuote2.replaceAll(p1, new Replacement() { // from class: org.markdownj.MarkdownProcessor.4.1
                    @Override // org.markdownj.Replacement
                    public String replacement(Matcher m1) {
                        String pre = m1.group(1);
                        return MarkdownProcessor.this.deleteAll(pre, "^  ");
                    }
                }) + "\n</blockquote>\n\n";
            }
        });
    }

    private TextEditor doCodeBlocks(TextEditor markup) {
        Pattern p = Pattern.compile("(?:\\n\\n|\\A)((?:(?:[ ]{4}).*\\n+)+)((?=^[ ]{0,4}\\S)|\\Z)", 8);
        return markup.replaceAll(p, new Replacement() { // from class: org.markdownj.MarkdownProcessor.5
            private static final String LANG_IDENTIFIER = "lang:";

            @Override // org.markdownj.Replacement
            public String replacement(Matcher m) {
                String out;
                String codeBlock = m.group(1);
                TextEditor ed = new TextEditor(codeBlock);
                ed.outdent();
                MarkdownProcessor.this.encodeCode(ed);
                ed.detabify().deleteAll("\\A\\n+").deleteAll("\\s+\\z");
                String text = ed.toString();
                String firstLine = firstLine(text);
                if (isLanguageIdentifier(firstLine)) {
                    out = languageBlock(firstLine, text);
                } else {
                    out = genericCodeBlock(text);
                }
                return out;
            }

            public String firstLine(String text) {
                if (text == null) {
                    return "";
                }
                String[] splitted = text.split("\\n");
                return splitted[0];
            }

            public boolean isLanguageIdentifier(String line) {
                if (line == null) {
                    return false;
                }
                String lang = "";
                if (line.startsWith(LANG_IDENTIFIER)) {
                    lang = line.replaceFirst(LANG_IDENTIFIER, "").trim();
                }
                return lang.length() > 0;
            }

            public String languageBlock(String firstLine, String text) {
                String lang = firstLine.replaceFirst(LANG_IDENTIFIER, "").trim();
                String block = text.replaceFirst(firstLine + "\n", "");
                return String.format("\n\n<pre class=\"%s\">\n%s\n</pre>\n\n", lang, block);
            }

            public String genericCodeBlock(String text) {
                return String.format("\n\n<pre><code>%s\n</code></pre>\n\n", text);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void encodeCode(TextEditor ed) {
        ed.replaceAll("&", "&amp;");
        ed.replaceAll("<", "&lt;");
        ed.replaceAll(">", "&gt;");
        ed.replaceAll("\\*", CHAR_PROTECTOR.encode("*"));
        ed.replaceAll("_", CHAR_PROTECTOR.encode("_"));
        ed.replaceAll("\\{", CHAR_PROTECTOR.encode("{"));
        ed.replaceAll("\\}", CHAR_PROTECTOR.encode("}"));
        ed.replaceAll("\\[", CHAR_PROTECTOR.encode("["));
        ed.replaceAll("\\]", CHAR_PROTECTOR.encode("]"));
        ed.replaceAll("\\\\", CHAR_PROTECTOR.encode("\\"));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public TextEditor doLists(TextEditor text) {
        int lessThanTab = this.tabWidth - 1;
        String wholeList = "(([ ]{0," + lessThanTab + "}((?:[-+*]|\\d+[.]))[ ]+)(?s:.+?)(\\z|\\n{2,}(?=\\S)(?![ ]*(?:[-+*]|\\d+[.])[ ]+)))";
        if (this.listLevel > 0) {
            Replacement replacer = new Replacement() { // from class: org.markdownj.MarkdownProcessor.6
                @Override // org.markdownj.Replacement
                public String replacement(Matcher m) {
                    String listType;
                    String html;
                    String list = m.group(1);
                    String listStart = m.group(3);
                    if (listStart.matches("[*+-]")) {
                        listType = "ul";
                    } else {
                        listType = "ol";
                    }
                    String result = MarkdownProcessor.this.processListItems(MarkdownProcessor.this.replaceAll(list, "\\n{2,}", "\n\n\n")).replaceAll("\\s+$", "");
                    if ("ul".equals(listType)) {
                        html = "<ul>" + result + "</ul>\n";
                    } else {
                        html = "<ol>" + result + "</ol>\n";
                    }
                    return html;
                }
            };
            Pattern matchStartOfLine = Pattern.compile("^" + wholeList, 8);
            text.replaceAll(matchStartOfLine, replacer);
        } else {
            Replacement replacer2 = new Replacement() { // from class: org.markdownj.MarkdownProcessor.7
                @Override // org.markdownj.Replacement
                public String replacement(Matcher m) {
                    String html;
                    String list = m.group(1);
                    String listStart = m.group(3);
                    if (listStart.matches("[*+-]")) {
                    }
                    String result = MarkdownProcessor.this.processListItems(MarkdownProcessor.this.replaceAll(list, "\n{2,}", "\n\n\n"));
                    if (listStart.matches("[*+-]")) {
                        html = "<ul>\n" + result + "</ul>\n";
                    } else {
                        html = "<ol>\n" + result + "</ol>\n";
                    }
                    return html;
                }
            };
            Pattern matchStartOfLine2 = Pattern.compile("(?:(?<=\\n\\n)|\\A\\n?)" + wholeList, 8);
            text.replaceAll(matchStartOfLine2, replacer2);
        }
        return text;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String processListItems(String list) {
        this.listLevel++;
        String list2 = replaceAll(list, "\\n{2,}\\z", "\n");
        Pattern p = Pattern.compile("(\\n)?^([ \\t]*)([-+*]|\\d+[.])[ ]+((?s:.+?)(\\n{1,2}))(?=\\n*(\\z|\\2([-+\\*]|\\d+[.])[ \\t]+))", 8);
        String list3 = replaceAll(list2, p, new Replacement() { // from class: org.markdownj.MarkdownProcessor.8
            @Override // org.markdownj.Replacement
            public String replacement(Matcher m) {
                TextEditor item;
                String text = m.group(4);
                TextEditor item2 = new TextEditor(text);
                String leadingLine = m.group(1);
                if (MarkdownProcessor.this.isEmptyString(leadingLine) && !MarkdownProcessor.this.hasParagraphBreak(item2)) {
                    item = MarkdownProcessor.this.runSpanGamut(MarkdownProcessor.this.doLists(item2.outdent()));
                } else {
                    item = MarkdownProcessor.this.runBlockGamut(item2.outdent());
                }
                return "<li>" + item.trim().toString() + "</li>\n";
            }
        });
        this.listLevel--;
        return list3;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean hasParagraphBreak(TextEditor item) {
        return item.toString().indexOf("\n\n") != -1;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isEmptyString(String leadingLine) {
        return leadingLine == null || leadingLine.equals("");
    }

    private TextEditor doHeaders(TextEditor markup) {
        markup.replaceAll("^(.*)\n====+$", "<h1>$1</h1>");
        markup.replaceAll("^(.*)\n----+$", "<h2>$1</h2>");
        Pattern p = Pattern.compile("^(#{1,6})\\s*(.*?)\\s*\\1?$", 8);
        markup.replaceAll(p, new Replacement() { // from class: org.markdownj.MarkdownProcessor.9
            @Override // org.markdownj.Replacement
            public String replacement(Matcher m) {
                String marker = m.group(1);
                String heading = m.group(2);
                int level = marker.length();
                String tag = "h" + level;
                return "<" + tag + ">" + heading + "</" + tag + ">\n";
            }
        });
        return markup;
    }

    private String join(String separator, String[] strings) {
        int length = strings.length;
        StringBuilder buf = new StringBuilder();
        if (length > 0) {
            buf.append(strings[0]);
            for (int i = 1; i < length; i++) {
                buf.append(separator).append(strings[i]);
            }
        }
        return buf.toString();
    }

    public TextEditor runSpanGamut(TextEditor text) {
        TextEditor text2 = encodeBackslashEscapes(doCodeSpans(escapeSpecialCharsWithinTagAttributes(text)));
        doImages(text2);
        doAnchors(text2);
        doAutoLinks(text2);
        TextEditor text3 = escapeSpecialCharsWithinTagAttributes(text2);
        encodeAmpsAndAngles(text3);
        doItalicsAndBold(text3);
        text3.replaceAll(" {2,}\n", " <br />\n");
        return text3;
    }

    private TextEditor escapeSpecialCharsWithinTagAttributes(TextEditor text) {
        Collection<HTMLToken> tokens = text.tokenizeHTML();
        TextEditor newText = new TextEditor("");
        for (HTMLToken token : tokens) {
            String value = token.getText();
            if (token.isTag()) {
                value = value.replaceAll("\\\\", CHAR_PROTECTOR.encode("\\")).replaceAll("`", CHAR_PROTECTOR.encode("`")).replaceAll("\\*", CHAR_PROTECTOR.encode("*")).replaceAll("_", CHAR_PROTECTOR.encode("_"));
            }
            newText.append(value);
        }
        return newText;
    }

    private void doImages(TextEditor text) {
        text.replaceAll("!\\[(.*)\\]\\((.*) \"(.*)\"\\)", "<img src=\"$2\" alt=\"$1\" title=\"$3\" />");
        text.replaceAll("!\\[(.*)\\]\\((.*)\\)", "<img src=\"$2\" alt=\"$1\" />");
        Pattern imageLink = Pattern.compile("([!]\\[(.*?)\\][ ]?(?:\\n[ ]*)?\\[(.*?)\\])");
        text.replaceAll(imageLink, new Replacement() { // from class: org.markdownj.MarkdownProcessor.10
            @Override // org.markdownj.Replacement
            public String replacement(Matcher m) {
                String replacementText;
                String wholeMatch = m.group(1);
                String altText = m.group(2);
                String id = m.group(3).toLowerCase();
                if (id == null || "".equals(id)) {
                    id = altText.toLowerCase();
                }
                LinkDefinition defn = (LinkDefinition) MarkdownProcessor.this.linkDefinitions.get(id);
                if (defn != null) {
                    String url = defn.getUrl();
                    String url2 = url.replaceAll("\\*", MarkdownProcessor.CHAR_PROTECTOR.encode("*")).replaceAll("_", MarkdownProcessor.CHAR_PROTECTOR.encode("_"));
                    String title = defn.getTitle();
                    String titleTag = "";
                    if (title != null && !title.equals("")) {
                        titleTag = " alt=\"" + altText + "\" title=\"" + title.replaceAll("\\*", MarkdownProcessor.CHAR_PROTECTOR.encode("*")).replaceAll("_", MarkdownProcessor.CHAR_PROTECTOR.encode("_")) + "\"";
                    }
                    replacementText = "<img src=\"" + url2 + "\"" + titleTag + "/>";
                } else {
                    replacementText = wholeMatch;
                }
                return replacementText;
            }
        });
    }

    private TextEditor doAnchors(TextEditor markup) {
        Pattern internalLink = Pattern.compile("(\\[(.*?)\\][ ]?(?:\\n[ ]*)?\\[(.*?)\\])");
        markup.replaceAll(internalLink, new Replacement() { // from class: org.markdownj.MarkdownProcessor.11
            @Override // org.markdownj.Replacement
            public String replacement(Matcher m) {
                String replacementText;
                String wholeMatch = m.group(1);
                String linkText = m.group(2);
                String id = m.group(3).toLowerCase();
                if (id == null || "".equals(id)) {
                    id = linkText.toLowerCase();
                }
                LinkDefinition defn = (LinkDefinition) MarkdownProcessor.this.linkDefinitions.get(id);
                if (defn != null) {
                    String url = defn.getUrl();
                    String url2 = url.replaceAll("\\*", MarkdownProcessor.CHAR_PROTECTOR.encode("*")).replaceAll("_", MarkdownProcessor.CHAR_PROTECTOR.encode("_"));
                    String title = defn.getTitle();
                    String titleTag = "";
                    if (title != null && !title.equals("")) {
                        titleTag = " title=\"" + title.replaceAll("\\*", MarkdownProcessor.CHAR_PROTECTOR.encode("*")).replaceAll("_", MarkdownProcessor.CHAR_PROTECTOR.encode("_")) + "\"";
                    }
                    replacementText = "<a href=\"" + url2 + "\"" + titleTag + ">" + linkText + "</a>";
                } else {
                    replacementText = wholeMatch;
                }
                return replacementText;
            }
        });
        Pattern inlineLink = Pattern.compile("(\\[(.*?)\\]\\([ \\t]*<?(.*?)>?[ \\t]*((['\"])(.*?)\\5)?\\))", 32);
        markup.replaceAll(inlineLink, new Replacement() { // from class: org.markdownj.MarkdownProcessor.12
            @Override // org.markdownj.Replacement
            public String replacement(Matcher m) {
                String linkText = m.group(2);
                String url = m.group(3);
                String title = m.group(6);
                String url2 = url.replaceAll("\\*", MarkdownProcessor.CHAR_PROTECTOR.encode("*")).replaceAll("_", MarkdownProcessor.CHAR_PROTECTOR.encode("_"));
                StringBuilder result = new StringBuilder();
                result.append("<a href=\"").append(url2).append("\"");
                if (title != null) {
                    String title2 = MarkdownProcessor.this.replaceAll(title.replaceAll("\\*", MarkdownProcessor.CHAR_PROTECTOR.encode("*")).replaceAll("_", MarkdownProcessor.CHAR_PROTECTOR.encode("_")), "\"", "&quot;");
                    result.append(" title=\"");
                    result.append(title2);
                    result.append("\"");
                }
                result.append(">").append(linkText);
                result.append("</a>");
                return result.toString();
            }
        });
        Pattern referenceShortcut = Pattern.compile("(\\[([^\\[\\]]+)\\])", 32);
        markup.replaceAll(referenceShortcut, new Replacement() { // from class: org.markdownj.MarkdownProcessor.13
            @Override // org.markdownj.Replacement
            public String replacement(Matcher m) {
                String replacementText;
                String wholeMatch = m.group(1);
                String linkText = m.group(2);
                String id = m.group(2).toLowerCase();
                LinkDefinition defn = (LinkDefinition) MarkdownProcessor.this.linkDefinitions.get(id.replaceAll("[ ]?\\n", " ").toLowerCase());
                if (defn != null) {
                    String url = defn.getUrl();
                    String url2 = url.replaceAll("\\*", MarkdownProcessor.CHAR_PROTECTOR.encode("*")).replaceAll("_", MarkdownProcessor.CHAR_PROTECTOR.encode("_"));
                    String title = defn.getTitle();
                    String titleTag = "";
                    if (title != null && !title.equals("")) {
                        titleTag = " title=\"" + title.replaceAll("\\*", MarkdownProcessor.CHAR_PROTECTOR.encode("*")).replaceAll("_", MarkdownProcessor.CHAR_PROTECTOR.encode("_")) + "\"";
                    }
                    replacementText = "<a href=\"" + url2 + "\"" + titleTag + ">" + linkText + "</a>";
                } else {
                    replacementText = wholeMatch;
                }
                return replacementText;
            }
        });
        return markup;
    }

    private TextEditor doItalicsAndBold(TextEditor markup) {
        markup.replaceAll("(\\*\\*|__)(?=\\S)(.+?[*_]*)(?<=\\S)\\1", "<strong>$2</strong>");
        markup.replaceAll("(\\*|_)(?=\\S)(.+?)(?<=\\S)\\1", "<em>$2</em>");
        return markup;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public TextEditor encodeAmpsAndAngles(TextEditor markup) {
        markup.replaceAll("&(?!#?[xX]?(?:[0-9a-fA-F]+|\\w+);)", "&amp;");
        markup.replaceAll("<(?![a-zA-Z/?\\$!])", "&lt;");
        return markup;
    }

    private TextEditor doCodeSpans(TextEditor markup) {
        return markup.replaceAll(Pattern.compile("(?<!\\\\)(`+)(.+?)(?<!`)\\1(?!`)"), new Replacement() { // from class: org.markdownj.MarkdownProcessor.14
            @Override // org.markdownj.Replacement
            public String replacement(Matcher m) {
                String code = m.group(2);
                TextEditor subEditor = new TextEditor(code);
                subEditor.deleteAll("^[ \\t]+").deleteAll("[ \\t]+$");
                MarkdownProcessor.this.encodeCode(subEditor);
                return "<code>" + subEditor.toString() + "</code>";
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String deleteAll(String text, String regex) {
        return replaceAll(text, regex, "");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String replaceAll(String text, String regex, String replacement) {
        TextEditor ed = new TextEditor(text);
        ed.replaceAll(regex, replacement);
        return ed.toString();
    }

    private String replaceAll(String markup, Pattern pattern, Replacement replacement) {
        TextEditor ed = new TextEditor(markup);
        ed.replaceAll(pattern, replacement);
        return ed.toString();
    }

    public String toString() {
        return "Markdown Processor for Java 0.4.0 (compatible with Markdown 1.0.2b2)";
    }

    public static void main(String[] args) {
        StringBuilder buf = new StringBuilder();
        char[] cbuf = new char[1024];
        Reader in = new InputStreamReader(System.in);
        try {
            for (int charsRead = in.read(cbuf); charsRead >= 0; charsRead = in.read(cbuf)) {
                buf.append(cbuf, 0, charsRead);
            }
            System.out.println(new MarkdownProcessor().markdown(buf.toString()));
        } catch (IOException e) {
            System.err.println("Error reading input: " + e.getMessage());
            System.exit(1);
        }
    }
}
