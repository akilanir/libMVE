package org.apache.commons.digester;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/ExtendedBaseRules.class */
public class ExtendedBaseRules extends RulesBase {
    private int counter = 0;
    private Map order = new HashMap();

    @Override // org.apache.commons.digester.RulesBase, org.apache.commons.digester.Rules
    public void add(String pattern, Rule rule) {
        super.add(pattern, rule);
        this.counter++;
        this.order.put(rule, new Integer(this.counter));
    }

    @Override // org.apache.commons.digester.RulesBase, org.apache.commons.digester.Rules
    public List match(String namespace, String pattern) {
        String parentPattern = "";
        int lastIndex = pattern.lastIndexOf(47);
        boolean hasParent = true;
        if (lastIndex == -1) {
            hasParent = false;
        } else {
            parentPattern = pattern.substring(0, lastIndex);
        }
        List universalList = new ArrayList(this.counter);
        List tempList = (List) this.cache.get("!*");
        if (tempList != null) {
            universalList.addAll(tempList);
        }
        List tempList2 = (List) this.cache.get(new StringBuffer().append("!").append(parentPattern).append("/?").toString());
        if (tempList2 != null) {
            universalList.addAll(tempList2);
        }
        boolean ignoreBasicMatches = false;
        List rulesList = (List) this.cache.get(pattern);
        if (rulesList != null) {
            ignoreBasicMatches = true;
        } else if (hasParent) {
            rulesList = (List) this.cache.get(new StringBuffer().append(parentPattern).append("/?").toString());
            if (rulesList != null) {
                ignoreBasicMatches = true;
            } else {
                rulesList = findExactAncesterMatch(pattern);
                if (rulesList != null) {
                    ignoreBasicMatches = true;
                }
            }
        }
        int longKeyLength = 0;
        for (String key : this.cache.keySet()) {
            boolean isUniversal = key.startsWith("!");
            if (isUniversal) {
                key = key.substring(1, key.length());
            }
            boolean wildcardMatchStart = key.startsWith("*/");
            boolean wildcardMatchEnd = key.endsWith("/*");
            if (wildcardMatchStart || (isUniversal && wildcardMatchEnd)) {
                boolean parentMatched = false;
                boolean basicMatched = false;
                boolean ancesterMatched = false;
                boolean parentMatchEnd = key.endsWith("/?");
                if (parentMatchEnd) {
                    parentMatched = parentMatch(key, pattern, parentPattern);
                } else if (wildcardMatchEnd) {
                    if (wildcardMatchStart) {
                        String patternBody = key.substring(2, key.length() - 2);
                        ancesterMatched = pattern.endsWith(patternBody) ? true : pattern.indexOf(new StringBuffer().append(patternBody).append("/").toString()) > -1;
                    } else {
                        String bodyPattern = key.substring(0, key.length() - 2);
                        ancesterMatched = pattern.startsWith(bodyPattern) ? pattern.length() == bodyPattern.length() ? true : pattern.charAt(bodyPattern.length()) == '/' : false;
                    }
                } else {
                    basicMatched = basicMatch(key, pattern);
                }
                if (parentMatched || basicMatched || ancesterMatched) {
                    if (isUniversal) {
                        List tempList3 = (List) this.cache.get(new StringBuffer().append("!").append(key).toString());
                        if (tempList3 != null) {
                            universalList.addAll(tempList3);
                        }
                    } else if (!ignoreBasicMatches) {
                        int keyLength = key.length();
                        if (wildcardMatchStart) {
                            keyLength--;
                        }
                        if (wildcardMatchEnd || parentMatchEnd) {
                            keyLength--;
                        }
                        if (keyLength > longKeyLength) {
                            rulesList = (List) this.cache.get(key);
                            longKeyLength = keyLength;
                        }
                    }
                }
            }
        }
        if (rulesList == null) {
            rulesList = (List) this.cache.get("*");
        }
        if (rulesList != null) {
            universalList.addAll(rulesList);
        }
        if (namespace != null) {
            Iterator it = universalList.iterator();
            while (it.hasNext()) {
                Rule rule = (Rule) it.next();
                String ns_uri = rule.getNamespaceURI();
                if (ns_uri != null && !ns_uri.equals(namespace)) {
                    it.remove();
                }
            }
        }
        Collections.sort(universalList, new Comparator(this) { // from class: org.apache.commons.digester.ExtendedBaseRules.1
            private final ExtendedBaseRules this$0;

            {
                this.this$0 = this;
            }

            @Override // java.util.Comparator
            public int compare(Object o1, Object o2) throws ClassCastException {
                Integer i1 = (Integer) this.this$0.order.get(o1);
                Integer i2 = (Integer) this.this$0.order.get(o2);
                if (i1 == null) {
                    if (i2 == null) {
                        return 0;
                    }
                    return -1;
                }
                if (i2 == null) {
                    return 1;
                }
                return i1.intValue() - i2.intValue();
            }
        });
        return universalList;
    }

    private boolean parentMatch(String key, String pattern, String parentPattern) {
        return parentPattern.endsWith(key.substring(1, key.length() - 2));
    }

    private boolean basicMatch(String key, String pattern) {
        return pattern.equals(key.substring(2)) || pattern.endsWith(key.substring(1));
    }

    private List findExactAncesterMatch(String parentPattern) {
        List matchingRules;
        int lastIndex = parentPattern.length();
        while (true) {
            int i = lastIndex;
            int lastIndex2 = i - 1;
            if (i > 0) {
                lastIndex = parentPattern.lastIndexOf(47, lastIndex2);
                if (lastIndex > 0 && (matchingRules = (List) this.cache.get(new StringBuffer().append(parentPattern.substring(0, lastIndex)).append("/*").toString())) != null) {
                    return matchingRules;
                }
            } else {
                return null;
            }
        }
    }
}
