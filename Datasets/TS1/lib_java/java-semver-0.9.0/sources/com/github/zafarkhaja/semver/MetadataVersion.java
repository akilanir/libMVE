package com.github.zafarkhaja.semver;

import java.util.Arrays;

/* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/MetadataVersion.class */
class MetadataVersion implements Comparable<MetadataVersion> {
    static final MetadataVersion NULL = new NullMetadataVersion();
    private final String[] idents;

    /* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/MetadataVersion$NullMetadataVersion.class */
    private static class NullMetadataVersion extends MetadataVersion {
        public NullMetadataVersion() {
            super(null);
        }

        @Override // com.github.zafarkhaja.semver.MetadataVersion
        MetadataVersion increment() {
            throw new NullPointerException("Metadata version is NULL");
        }

        @Override // com.github.zafarkhaja.semver.MetadataVersion
        public String toString() {
            return "";
        }

        @Override // com.github.zafarkhaja.semver.MetadataVersion
        public int hashCode() {
            return 0;
        }

        @Override // com.github.zafarkhaja.semver.MetadataVersion
        public boolean equals(Object other) {
            return other instanceof NullMetadataVersion;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.github.zafarkhaja.semver.MetadataVersion, java.lang.Comparable
        public int compareTo(MetadataVersion other) {
            if (!equals(other)) {
                return 1;
            }
            return 0;
        }
    }

    MetadataVersion(String[] identifiers) {
        this.idents = identifiers;
    }

    MetadataVersion increment() {
        String[] ids = this.idents;
        String lastId = ids[ids.length - 1];
        if (isInt(lastId)) {
            int intId = Integer.parseInt(lastId);
            ids[ids.length - 1] = String.valueOf(intId + 1);
        } else {
            ids = (String[]) Arrays.copyOf(ids, ids.length + 1);
            ids[ids.length - 1] = String.valueOf(1);
        }
        return new MetadataVersion(ids);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof MetadataVersion) && compareTo((MetadataVersion) other) == 0;
    }

    public int hashCode() {
        return Arrays.hashCode(this.idents);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (String ident : this.idents) {
            sb.append(ident).append(".");
        }
        return sb.deleteCharAt(sb.lastIndexOf(".")).toString();
    }

    @Override // java.lang.Comparable
    public int compareTo(MetadataVersion other) {
        if (other == NULL) {
            return -1;
        }
        int result = compareIdentifierArrays(other.idents);
        if (result == 0) {
            result = this.idents.length - other.idents.length;
        }
        return result;
    }

    private int compareIdentifierArrays(String[] otherIdents) {
        int result = 0;
        int length = getLeastCommonArrayLength(this.idents, otherIdents);
        for (int i = 0; i < length; i++) {
            result = compareIdentifiers(this.idents[i], otherIdents[i]);
            if (result != 0) {
                break;
            }
        }
        return result;
    }

    private int getLeastCommonArrayLength(String[] arr1, String[] arr2) {
        return arr1.length <= arr2.length ? arr1.length : arr2.length;
    }

    private int compareIdentifiers(String ident1, String ident2) {
        if (isInt(ident1) && isInt(ident2)) {
            return Integer.parseInt(ident1) - Integer.parseInt(ident2);
        }
        return ident1.compareTo(ident2);
    }

    private boolean isInt(String str) {
        try {
            Integer.parseInt(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
