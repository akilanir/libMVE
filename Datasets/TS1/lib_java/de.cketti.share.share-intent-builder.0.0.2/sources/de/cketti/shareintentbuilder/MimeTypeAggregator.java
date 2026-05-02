package de.cketti.shareintentbuilder;

import java.util.Locale;

/* loaded from: de.cketti.share.share-intent-builder.0.0.2.jar:de/cketti/shareintentbuilder/MimeTypeAggregator.class */
class MimeTypeAggregator {
    private static final String ASTERISK_WILDCARD = "*";
    private static final String DELIMITER = "/";
    private String topLevelType;
    private String subType;

    MimeTypeAggregator() {
    }

    public String getType() {
        if (isNotInitialized()) {
            throw new IllegalStateException("Add at least one MIME type");
        }
        return this.topLevelType + DELIMITER + this.subType;
    }

    public void add(String type) {
        checkTypeFormat(type);
        if (alreadyMatchesAllTypes()) {
            return;
        }
        String[] parts = type.split(DELIMITER, 2);
        String newTopLevelType = parts[0].toLowerCase(Locale.US);
        String newSubType = parts[1].toLowerCase(Locale.US);
        if (isNotInitialized()) {
            this.topLevelType = newTopLevelType;
            this.subType = newSubType;
        } else if (matchesTopLevelType(newTopLevelType)) {
            this.topLevelType = ASTERISK_WILDCARD;
            this.subType = ASTERISK_WILDCARD;
        } else if (!matchesSubType(newSubType)) {
            this.subType = ASTERISK_WILDCARD;
        }
    }

    private void checkTypeFormat(String type) {
        if (!type.matches("[a-zA-Z0-9+.-]+/[a-zA-Z0-9+.-]+")) {
            throw new IllegalArgumentException("Not a valid MIME type");
        }
    }

    private boolean alreadyMatchesAllTypes() {
        return ASTERISK_WILDCARD.equals(this.topLevelType);
    }

    private boolean isNotInitialized() {
        return this.topLevelType == null;
    }

    private boolean matchesTopLevelType(String newTopLevelType) {
        return !this.topLevelType.equals(newTopLevelType);
    }

    private boolean matchesSubType(String newSubType) {
        return this.subType.equals(newSubType);
    }
}
