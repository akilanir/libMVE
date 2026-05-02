package ch.qos.logback.core.joran.spi;

import ch.qos.logback.core.Context;
import ch.qos.logback.core.joran.action.Action;
import ch.qos.logback.core.spi.ContextAwareBase;
import ch.qos.logback.core.util.OptionHelper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/spi/SimpleRuleStore.class */
public class SimpleRuleStore extends ContextAwareBase implements RuleStore {
    static String KLEENE_STAR = "*";
    HashMap<ElementSelector, List<Action>> rules = new HashMap<>();

    public SimpleRuleStore(Context context) {
        setContext(context);
    }

    @Override // ch.qos.logback.core.joran.spi.RuleStore
    public void addRule(ElementSelector elementSelector, Action action) {
        action.setContext(this.context);
        List<Action> list = this.rules.get(elementSelector);
        if (list == null) {
            list = new ArrayList();
            this.rules.put(elementSelector, list);
        }
        list.add(action);
    }

    @Override // ch.qos.logback.core.joran.spi.RuleStore
    public void addRule(ElementSelector elementSelector, String str) {
        Action action = null;
        try {
            action = (Action) OptionHelper.instantiateByClassName(str, (Class<?>) Action.class, this.context);
        } catch (Exception e) {
            addError("Could not instantiate class [" + str + "]", e);
        }
        if (action != null) {
            addRule(elementSelector, action);
        }
    }

    @Override // ch.qos.logback.core.joran.spi.RuleStore
    public List<Action> matchActions(ElementPath elementPath) {
        List<Action> fullPathMatch = fullPathMatch(elementPath);
        if (fullPathMatch != null) {
            return fullPathMatch;
        }
        List<Action> suffixMatch = suffixMatch(elementPath);
        if (suffixMatch != null) {
            return suffixMatch;
        }
        List<Action> prefixMatch = prefixMatch(elementPath);
        if (prefixMatch != null) {
            return prefixMatch;
        }
        List<Action> middleMatch = middleMatch(elementPath);
        if (middleMatch != null) {
            return middleMatch;
        }
        return null;
    }

    List<Action> fullPathMatch(ElementPath elementPath) {
        for (ElementSelector elementSelector : this.rules.keySet()) {
            if (elementSelector.fullPathMatch(elementPath)) {
                return this.rules.get(elementSelector);
            }
        }
        return null;
    }

    List<Action> suffixMatch(ElementPath elementPath) {
        int tailMatchLength;
        int i = 0;
        ElementSelector elementSelector = null;
        for (ElementSelector elementSelector2 : this.rules.keySet()) {
            if (isSuffixPattern(elementSelector2) && (tailMatchLength = elementSelector2.getTailMatchLength(elementPath)) > i) {
                i = tailMatchLength;
                elementSelector = elementSelector2;
            }
        }
        if (elementSelector != null) {
            return this.rules.get(elementSelector);
        }
        return null;
    }

    private boolean isSuffixPattern(ElementSelector elementSelector) {
        return elementSelector.size() > 1 && elementSelector.get(0).equals(KLEENE_STAR);
    }

    List<Action> prefixMatch(ElementPath elementPath) {
        int prefixMatchLength;
        int i = 0;
        ElementSelector elementSelector = null;
        for (ElementSelector elementSelector2 : this.rules.keySet()) {
            if (isKleeneStar(elementSelector2.peekLast()) && (prefixMatchLength = elementSelector2.getPrefixMatchLength(elementPath)) == elementSelector2.size() - 1 && prefixMatchLength > i) {
                i = prefixMatchLength;
                elementSelector = elementSelector2;
            }
        }
        if (elementSelector != null) {
            return this.rules.get(elementSelector);
        }
        return null;
    }

    private boolean isKleeneStar(String str) {
        return KLEENE_STAR.equals(str);
    }

    List<Action> middleMatch(ElementPath elementPath) {
        int i = 0;
        ElementSelector elementSelector = null;
        for (ElementSelector elementSelector2 : this.rules.keySet()) {
            String peekLast = elementSelector2.peekLast();
            String str = elementSelector2.size() > 1 ? elementSelector2.get(0) : null;
            if (isKleeneStar(peekLast) && isKleeneStar(str)) {
                List<String> copyOfPartList = elementSelector2.getCopyOfPartList();
                if (copyOfPartList.size() > 2) {
                    copyOfPartList.remove(0);
                    copyOfPartList.remove(copyOfPartList.size() - 1);
                }
                ElementSelector elementSelector3 = new ElementSelector(copyOfPartList);
                int size = elementSelector3.isContainedIn(elementPath) ? elementSelector3.size() : 0;
                if (size > i) {
                    i = size;
                    elementSelector = elementSelector2;
                }
            }
        }
        if (elementSelector != null) {
            return this.rules.get(elementSelector);
        }
        return null;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("SimpleRuleStore ( ").append("rules = ").append(this.rules).append("  ").append(" )");
        return sb.toString();
    }
}
