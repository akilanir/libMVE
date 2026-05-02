package org.jivesoftware.smack.packet;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/packet/PrivacyItem.class */
public class PrivacyItem {
    private boolean allow;
    private int order;
    private PrivacyRule rule;
    private boolean filterIQ = false;
    private boolean filterMessage = false;
    private boolean filterPresence_in = false;
    private boolean filterPresence_out = false;

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/packet/PrivacyItem$Type.class */
    public enum Type {
        group,
        jid,
        subscription
    }

    public PrivacyItem(String type, boolean allow, int order) {
        setRule(PrivacyRule.fromString(type));
        setAllow(allow);
        setOrder(order);
    }

    public boolean isAllow() {
        return this.allow;
    }

    private void setAllow(boolean allow) {
        this.allow = allow;
    }

    public boolean isFilterIQ() {
        return this.filterIQ;
    }

    public void setFilterIQ(boolean filterIQ) {
        this.filterIQ = filterIQ;
    }

    public boolean isFilterMessage() {
        return this.filterMessage;
    }

    public void setFilterMessage(boolean filterMessage) {
        this.filterMessage = filterMessage;
    }

    public boolean isFilterPresence_in() {
        return this.filterPresence_in;
    }

    public void setFilterPresence_in(boolean filterPresence_in) {
        this.filterPresence_in = filterPresence_in;
    }

    public boolean isFilterPresence_out() {
        return this.filterPresence_out;
    }

    public void setFilterPresence_out(boolean filterPresence_out) {
        this.filterPresence_out = filterPresence_out;
    }

    public int getOrder() {
        return this.order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public void setValue(String value) {
        if (getRule() != null || value != null) {
            getRule().setValue(value);
        }
    }

    public Type getType() {
        if (getRule() == null) {
            return null;
        }
        return getRule().getType();
    }

    public String getValue() {
        if (getRule() == null) {
            return null;
        }
        return getRule().getValue();
    }

    public boolean isFilterEverything() {
        return (isFilterIQ() || isFilterMessage() || isFilterPresence_in() || isFilterPresence_out()) ? false : true;
    }

    private PrivacyRule getRule() {
        return this.rule;
    }

    private void setRule(PrivacyRule rule) {
        this.rule = rule;
    }

    public String toXML() {
        StringBuilder buf = new StringBuilder();
        buf.append("<item");
        if (isAllow()) {
            buf.append(" action=\"allow\"");
        } else {
            buf.append(" action=\"deny\"");
        }
        buf.append(" order=\"").append(getOrder()).append("\"");
        if (getType() != null) {
            buf.append(" type=\"").append(getType()).append("\"");
        }
        if (getValue() != null) {
            buf.append(" value=\"").append(getValue()).append("\"");
        }
        if (isFilterEverything()) {
            buf.append("/>");
        } else {
            buf.append(">");
            if (isFilterIQ()) {
                buf.append("<iq/>");
            }
            if (isFilterMessage()) {
                buf.append("<message/>");
            }
            if (isFilterPresence_in()) {
                buf.append("<presence-in/>");
            }
            if (isFilterPresence_out()) {
                buf.append("<presence-out/>");
            }
            buf.append("</item>");
        }
        return buf.toString();
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/packet/PrivacyItem$PrivacyRule.class */
    public static class PrivacyRule {
        private Type type;
        private String value;
        public static final String SUBSCRIPTION_BOTH = "both";
        public static final String SUBSCRIPTION_TO = "to";
        public static final String SUBSCRIPTION_FROM = "from";
        public static final String SUBSCRIPTION_NONE = "none";

        protected static PrivacyRule fromString(String value) {
            if (value == null) {
                return null;
            }
            PrivacyRule rule = new PrivacyRule();
            rule.setType(Type.valueOf(value.toLowerCase()));
            return rule;
        }

        public Type getType() {
            return this.type;
        }

        private void setType(Type type) {
            this.type = type;
        }

        public String getValue() {
            return this.value;
        }

        protected void setValue(String value) {
            if (isSuscription()) {
                setSuscriptionValue(value);
            } else {
                this.value = value;
            }
        }

        private void setSuscriptionValue(String value) {
            String setValue;
            if (value == null) {
            }
            if (SUBSCRIPTION_BOTH.equalsIgnoreCase(value)) {
                setValue = SUBSCRIPTION_BOTH;
            } else if (SUBSCRIPTION_TO.equalsIgnoreCase(value)) {
                setValue = SUBSCRIPTION_TO;
            } else if (SUBSCRIPTION_FROM.equalsIgnoreCase(value)) {
                setValue = SUBSCRIPTION_FROM;
            } else if (SUBSCRIPTION_NONE.equalsIgnoreCase(value)) {
                setValue = SUBSCRIPTION_NONE;
            } else {
                setValue = null;
            }
            this.value = setValue;
        }

        public boolean isSuscription() {
            return getType() == Type.subscription;
        }
    }
}
