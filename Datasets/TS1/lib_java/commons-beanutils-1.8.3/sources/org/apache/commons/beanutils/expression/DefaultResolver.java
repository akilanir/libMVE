package org.apache.commons.beanutils.expression;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/expression/DefaultResolver.class */
public class DefaultResolver implements Resolver {
    private static final char NESTED = '.';
    private static final char MAPPED_START = '(';
    private static final char MAPPED_END = ')';
    private static final char INDEXED_START = '[';
    private static final char INDEXED_END = ']';

    @Override // org.apache.commons.beanutils.expression.Resolver
    public int getIndex(String expression) {
        char c;
        if (expression == null || expression.length() == 0) {
            return -1;
        }
        for (int i = 0; i < expression.length() && (c = expression.charAt(i)) != '.' && c != '('; i++) {
            if (c == '[') {
                int end = expression.indexOf(93, i);
                if (end < 0) {
                    throw new IllegalArgumentException("Missing End Delimiter");
                }
                String value = expression.substring(i + 1, end);
                if (value.length() == 0) {
                    throw new IllegalArgumentException("No Index Value");
                }
                try {
                    int index = Integer.parseInt(value, 10);
                    return index;
                } catch (Exception e) {
                    throw new IllegalArgumentException(new StringBuffer().append("Invalid index value '").append(value).append("'").toString());
                }
            }
        }
        return -1;
    }

    @Override // org.apache.commons.beanutils.expression.Resolver
    public String getKey(String expression) {
        char c;
        if (expression == null || expression.length() == 0) {
            return null;
        }
        for (int i = 0; i < expression.length() && (c = expression.charAt(i)) != '.' && c != '['; i++) {
            if (c == '(') {
                int end = expression.indexOf(41, i);
                if (end < 0) {
                    throw new IllegalArgumentException("Missing End Delimiter");
                }
                return expression.substring(i + 1, end);
            }
        }
        return null;
    }

    @Override // org.apache.commons.beanutils.expression.Resolver
    public String getProperty(String expression) {
        if (expression == null || expression.length() == 0) {
            return expression;
        }
        for (int i = 0; i < expression.length(); i++) {
            char c = expression.charAt(i);
            if (c == '.') {
                return expression.substring(0, i);
            }
            if (c == '(' || c == '[') {
                return expression.substring(0, i);
            }
        }
        return expression;
    }

    @Override // org.apache.commons.beanutils.expression.Resolver
    public boolean hasNested(String expression) {
        return (expression == null || expression.length() == 0 || remove(expression) == null) ? false : true;
    }

    @Override // org.apache.commons.beanutils.expression.Resolver
    public boolean isIndexed(String expression) {
        char c;
        if (expression == null || expression.length() == 0) {
            return false;
        }
        for (int i = 0; i < expression.length() && (c = expression.charAt(i)) != '.' && c != '('; i++) {
            if (c == '[') {
                return true;
            }
        }
        return false;
    }

    @Override // org.apache.commons.beanutils.expression.Resolver
    public boolean isMapped(String expression) {
        char c;
        if (expression == null || expression.length() == 0) {
            return false;
        }
        for (int i = 0; i < expression.length() && (c = expression.charAt(i)) != '.' && c != '['; i++) {
            if (c == '(') {
                return true;
            }
        }
        return false;
    }

    @Override // org.apache.commons.beanutils.expression.Resolver
    public String next(String expression) {
        if (expression == null || expression.length() == 0) {
            return null;
        }
        boolean indexed = false;
        boolean mapped = false;
        for (int i = 0; i < expression.length(); i++) {
            char c = expression.charAt(i);
            if (indexed) {
                if (c == ']') {
                    return expression.substring(0, i + 1);
                }
            } else if (mapped) {
                if (c == ')') {
                    return expression.substring(0, i + 1);
                }
            } else {
                if (c == '.') {
                    return expression.substring(0, i);
                }
                if (c == '(') {
                    mapped = true;
                } else if (c == '[') {
                    indexed = true;
                }
            }
        }
        return expression;
    }

    @Override // org.apache.commons.beanutils.expression.Resolver
    public String remove(String expression) {
        if (expression == null || expression.length() == 0) {
            return null;
        }
        String property = next(expression);
        if (expression.length() == property.length()) {
            return null;
        }
        int start = property.length();
        if (expression.charAt(start) == '.') {
            start++;
        }
        return expression.substring(start);
    }
}
