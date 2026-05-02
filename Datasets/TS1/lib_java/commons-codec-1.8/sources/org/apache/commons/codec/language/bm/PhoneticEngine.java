package org.apache.commons.codec.language.bm;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import org.apache.commons.codec.language.bm.Languages;
import org.apache.commons.codec.language.bm.Rule;

/* loaded from: commons-codec-1.8.jar:org/apache/commons/codec/language/bm/PhoneticEngine.class */
public class PhoneticEngine {
    private static final Map<NameType, Set<String>> NAME_PREFIXES = new EnumMap(NameType.class);
    private static final int DEFAULT_MAX_PHONEMES = 20;
    private final Lang lang;
    private final NameType nameType;
    private final RuleType ruleType;
    private final boolean concat;
    private final int maxPhonemes;

    /* loaded from: commons-codec-1.8.jar:org/apache/commons/codec/language/bm/PhoneticEngine$PhonemeBuilder.class */
    static final class PhonemeBuilder {
        private final Set<Rule.Phoneme> phonemes;

        public static PhonemeBuilder empty(Languages.LanguageSet languages) {
            return new PhonemeBuilder(Collections.singleton(new Rule.Phoneme("", languages)));
        }

        private PhonemeBuilder(Set<Rule.Phoneme> phonemes) {
            this.phonemes = phonemes;
        }

        public PhonemeBuilder append(CharSequence str) {
            Set<Rule.Phoneme> newPhonemes = new LinkedHashSet<>();
            for (Rule.Phoneme ph : this.phonemes) {
                newPhonemes.add(ph.append(str));
            }
            return new PhonemeBuilder(newPhonemes);
        }

        public PhonemeBuilder apply(Rule.PhonemeExpr phonemeExpr, int maxPhonemes) {
            Set<Rule.Phoneme> newPhonemes = new LinkedHashSet<>();
            loop0: for (Rule.Phoneme left : this.phonemes) {
                for (Rule.Phoneme right : phonemeExpr.getPhonemes()) {
                    Rule.Phoneme join = left.join(right);
                    if (!join.getLanguages().isEmpty()) {
                        if (newPhonemes.size() >= maxPhonemes) {
                            break loop0;
                        }
                        newPhonemes.add(join);
                    }
                }
            }
            return new PhonemeBuilder(newPhonemes);
        }

        public Set<Rule.Phoneme> getPhonemes() {
            return this.phonemes;
        }

        public String makeString() {
            StringBuilder sb = new StringBuilder();
            for (Rule.Phoneme ph : this.phonemes) {
                if (sb.length() > 0) {
                    sb.append("|");
                }
                sb.append(ph.getPhonemeText());
            }
            return sb.toString();
        }
    }

    /* loaded from: commons-codec-1.8.jar:org/apache/commons/codec/language/bm/PhoneticEngine$RulesApplication.class */
    private static final class RulesApplication {
        private final List<Rule> finalRules;
        private final CharSequence input;
        private PhonemeBuilder phonemeBuilder;
        private int i;
        private final int maxPhonemes;
        private boolean found;

        public RulesApplication(List<Rule> finalRules, CharSequence input, PhonemeBuilder phonemeBuilder, int i, int maxPhonemes) {
            if (finalRules == null) {
                throw new NullPointerException("The finalRules argument must not be null");
            }
            this.finalRules = finalRules;
            this.phonemeBuilder = phonemeBuilder;
            this.input = input;
            this.i = i;
            this.maxPhonemes = maxPhonemes;
        }

        public int getI() {
            return this.i;
        }

        public PhonemeBuilder getPhonemeBuilder() {
            return this.phonemeBuilder;
        }

        public RulesApplication invoke() {
            this.found = false;
            int patternLength = 0;
            Iterator i$ = this.finalRules.iterator();
            while (true) {
                if (!i$.hasNext()) {
                    break;
                }
                Rule rule = i$.next();
                String pattern = rule.getPattern();
                patternLength = pattern.length();
                if (rule.patternAndContextMatches(this.input, this.i)) {
                    this.phonemeBuilder = this.phonemeBuilder.apply(rule.getPhoneme(), this.maxPhonemes);
                    this.found = true;
                    break;
                }
            }
            if (!this.found) {
                patternLength = 1;
            }
            this.i += patternLength;
            return this;
        }

        public boolean isFound() {
            return this.found;
        }
    }

    static {
        NAME_PREFIXES.put(NameType.ASHKENAZI, Collections.unmodifiableSet(new HashSet(Arrays.asList("bar", "ben", "da", "de", "van", "von"))));
        NAME_PREFIXES.put(NameType.SEPHARDIC, Collections.unmodifiableSet(new HashSet(Arrays.asList("al", "el", "da", "dal", "de", "del", "dela", "de la", "della", "des", "di", "do", "dos", "du", "van", "von"))));
        NAME_PREFIXES.put(NameType.GENERIC, Collections.unmodifiableSet(new HashSet(Arrays.asList("da", "dal", "de", "del", "dela", "de la", "della", "des", "di", "do", "dos", "du", "van", "von"))));
    }

    private static CharSequence cacheSubSequence(final CharSequence cached) {
        final CharSequence[][] cache = new CharSequence[cached.length()][cached.length()];
        return new CharSequence() { // from class: org.apache.commons.codec.language.bm.PhoneticEngine.1
            @Override // java.lang.CharSequence
            public char charAt(int index) {
                return cached.charAt(index);
            }

            @Override // java.lang.CharSequence
            public int length() {
                return cached.length();
            }

            @Override // java.lang.CharSequence
            public CharSequence subSequence(int start, int end) {
                if (start == end) {
                    return "";
                }
                CharSequence res = cache[start][end - 1];
                if (res == null) {
                    res = cached.subSequence(start, end);
                    cache[start][end - 1] = res;
                }
                return res;
            }
        };
    }

    private static String join(Iterable<String> strings, String sep) {
        StringBuilder sb = new StringBuilder();
        Iterator<String> si = strings.iterator();
        if (si.hasNext()) {
            sb.append(si.next());
        }
        while (si.hasNext()) {
            sb.append(sep).append(si.next());
        }
        return sb.toString();
    }

    public PhoneticEngine(NameType nameType, RuleType ruleType, boolean concat) {
        this(nameType, ruleType, concat, DEFAULT_MAX_PHONEMES);
    }

    public PhoneticEngine(NameType nameType, RuleType ruleType, boolean concat, int maxPhonemes) {
        if (ruleType == RuleType.RULES) {
            throw new IllegalArgumentException("ruleType must not be " + RuleType.RULES);
        }
        this.nameType = nameType;
        this.ruleType = ruleType;
        this.concat = concat;
        this.lang = Lang.instance(nameType);
        this.maxPhonemes = maxPhonemes;
    }

    private PhonemeBuilder applyFinalRules(PhonemeBuilder phonemeBuilder, List<Rule> finalRules) {
        if (finalRules == null) {
            throw new NullPointerException("finalRules can not be null");
        }
        if (finalRules.isEmpty()) {
            return phonemeBuilder;
        }
        Set<Rule.Phoneme> phonemes = new TreeSet<>(Rule.Phoneme.COMPARATOR);
        for (Rule.Phoneme phoneme : phonemeBuilder.getPhonemes()) {
            PhonemeBuilder subBuilder = PhonemeBuilder.empty(phoneme.getLanguages());
            CharSequence phonemeText = cacheSubSequence(phoneme.getPhonemeText());
            int i = 0;
            while (true) {
                int i2 = i;
                if (i2 < phonemeText.length()) {
                    RulesApplication rulesApplication = new RulesApplication(finalRules, phonemeText, subBuilder, i2, this.maxPhonemes).invoke();
                    boolean found = rulesApplication.isFound();
                    subBuilder = rulesApplication.getPhonemeBuilder();
                    if (!found) {
                        subBuilder = subBuilder.append(phonemeText.subSequence(i2, i2 + 1));
                    }
                    i = rulesApplication.getI();
                }
            }
            phonemes.addAll(subBuilder.getPhonemes());
        }
        return new PhonemeBuilder(phonemes);
    }

    public String encode(String input) {
        Languages.LanguageSet languageSet = this.lang.guessLanguages(input);
        return encode(input, languageSet);
    }

    public String encode(String input, Languages.LanguageSet languageSet) {
        String input2;
        List<Rule> rules = Rule.getInstance(this.nameType, RuleType.RULES, languageSet);
        List<Rule> finalRules1 = Rule.getInstance(this.nameType, this.ruleType, "common");
        List<Rule> finalRules2 = Rule.getInstance(this.nameType, this.ruleType, languageSet);
        String input3 = input.toLowerCase(Locale.ENGLISH).replace('-', ' ').trim();
        if (this.nameType == NameType.GENERIC) {
            if (input3.length() >= 2 && input3.substring(0, 2).equals("d'")) {
                String remainder = input3.substring(2);
                String combined = "d" + remainder;
                return "(" + encode(remainder) + ")-(" + encode(combined) + ")";
            }
            for (String l : NAME_PREFIXES.get(this.nameType)) {
                if (input3.startsWith(l + " ")) {
                    String remainder2 = input3.substring(l.length() + 1);
                    String combined2 = l + remainder2;
                    return "(" + encode(remainder2) + ")-(" + encode(combined2) + ")";
                }
            }
        }
        List<String> words = Arrays.asList(input3.split("\\s+"));
        List<String> words2 = new ArrayList<>();
        switch (this.nameType) {
            case SEPHARDIC:
                for (String aWord : words) {
                    String[] parts = aWord.split("'");
                    String lastPart = parts[parts.length - 1];
                    words2.add(lastPart);
                }
                words2.removeAll(NAME_PREFIXES.get(this.nameType));
                break;
            case ASHKENAZI:
                words2.addAll(words);
                words2.removeAll(NAME_PREFIXES.get(this.nameType));
                break;
            case GENERIC:
                words2.addAll(words);
                break;
            default:
                throw new IllegalStateException("Unreachable case: " + this.nameType);
        }
        if (this.concat) {
            input2 = join(words2, " ");
        } else if (words2.size() == 1) {
            input2 = words.iterator().next();
        } else {
            StringBuilder result = new StringBuilder();
            for (String word : words2) {
                result.append("-").append(encode(word));
            }
            return result.substring(1);
        }
        PhonemeBuilder phonemeBuilder = PhonemeBuilder.empty(languageSet);
        CharSequence inputCache = cacheSubSequence(input2);
        int i = 0;
        while (i < inputCache.length()) {
            RulesApplication rulesApplication = new RulesApplication(rules, inputCache, phonemeBuilder, i, this.maxPhonemes).invoke();
            i = rulesApplication.getI();
            phonemeBuilder = rulesApplication.getPhonemeBuilder();
        }
        return applyFinalRules(applyFinalRules(phonemeBuilder, finalRules1), finalRules2).makeString();
    }

    public Lang getLang() {
        return this.lang;
    }

    public NameType getNameType() {
        return this.nameType;
    }

    public RuleType getRuleType() {
        return this.ruleType;
    }

    public boolean isConcat() {
        return this.concat;
    }

    public int getMaxPhonemes() {
        return this.maxPhonemes;
    }
}
