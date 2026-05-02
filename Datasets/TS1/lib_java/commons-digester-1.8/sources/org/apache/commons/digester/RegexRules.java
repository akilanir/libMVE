package org.apache.commons.digester;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/RegexRules.class */
public class RegexRules extends AbstractRulesImpl {
    private ArrayList registeredRules = new ArrayList();
    private RegexMatcher matcher;

    public RegexRules(RegexMatcher matcher) {
        setRegexMatcher(matcher);
    }

    public RegexMatcher getRegexMatcher() {
        return this.matcher;
    }

    public void setRegexMatcher(RegexMatcher matcher) {
        if (matcher == null) {
            throw new IllegalArgumentException("RegexMatcher must not be null.");
        }
        this.matcher = matcher;
    }

    @Override // org.apache.commons.digester.AbstractRulesImpl
    protected void registerRule(String pattern, Rule rule) {
        this.registeredRules.add(new RegisteredRule(this, pattern, rule));
    }

    @Override // org.apache.commons.digester.AbstractRulesImpl, org.apache.commons.digester.Rules
    public void clear() {
        this.registeredRules.clear();
    }

    @Override // org.apache.commons.digester.AbstractRulesImpl, org.apache.commons.digester.Rules
    public List match(String namespaceURI, String pattern) {
        ArrayList rules = new ArrayList(this.registeredRules.size());
        Iterator it = this.registeredRules.iterator();
        while (it.hasNext()) {
            RegisteredRule next = (RegisteredRule) it.next();
            if (this.matcher.match(pattern, next.pattern)) {
                rules.add(next.rule);
            }
        }
        return rules;
    }

    @Override // org.apache.commons.digester.AbstractRulesImpl, org.apache.commons.digester.Rules
    public List rules() {
        ArrayList rules = new ArrayList(this.registeredRules.size());
        Iterator it = this.registeredRules.iterator();
        while (it.hasNext()) {
            rules.add(((RegisteredRule) it.next()).rule);
        }
        return rules;
    }

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/RegexRules$RegisteredRule.class */
    private class RegisteredRule {
        String pattern;
        Rule rule;
        private final RegexRules this$0;

        RegisteredRule(RegexRules this$0, String pattern, Rule rule) {
            this.this$0 = this$0;
            this.pattern = pattern;
            this.rule = rule;
        }
    }
}
