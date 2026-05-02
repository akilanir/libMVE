package org.apache.commons.compress.archivers.arj;

import java.util.Arrays;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/arj/MainHeader.class */
class MainHeader {
    int archiverVersionNumber;
    int minVersionToExtract;
    int hostOS;
    int arjFlags;
    int securityVersion;
    int fileType;
    int reserved;
    int dateTimeCreated;
    int dateTimeModified;
    long archiveSize;
    int securityEnvelopeFilePosition;
    int fileSpecPosition;
    int securityEnvelopeLength;
    int encryptionVersion;
    int lastChapter;
    int arjProtectionFactor;
    int arjFlags2;
    String name;
    String comment;
    byte[] extendedHeaderBytes = null;

    MainHeader() {
    }

    /* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/arj/MainHeader$Flags.class */
    static class Flags {
        static final int GARBLED = 1;
        static final int OLD_SECURED_NEW_ANSI_PAGE = 2;
        static final int VOLUME = 4;
        static final int ARJPROT = 8;
        static final int PATHSYM = 16;
        static final int BACKUP = 32;
        static final int SECURED = 64;
        static final int ALTNAME = 128;

        Flags() {
        }
    }

    public String toString() {
        return "MainHeader [archiverVersionNumber=" + this.archiverVersionNumber + ", minVersionToExtract=" + this.minVersionToExtract + ", hostOS=" + this.hostOS + ", arjFlags=" + this.arjFlags + ", securityVersion=" + this.securityVersion + ", fileType=" + this.fileType + ", reserved=" + this.reserved + ", dateTimeCreated=" + this.dateTimeCreated + ", dateTimeModified=" + this.dateTimeModified + ", archiveSize=" + this.archiveSize + ", securityEnvelopeFilePosition=" + this.securityEnvelopeFilePosition + ", fileSpecPosition=" + this.fileSpecPosition + ", securityEnvelopeLength=" + this.securityEnvelopeLength + ", encryptionVersion=" + this.encryptionVersion + ", lastChapter=" + this.lastChapter + ", arjProtectionFactor=" + this.arjProtectionFactor + ", arjFlags2=" + this.arjFlags2 + ", name=" + this.name + ", comment=" + this.comment + ", extendedHeaderBytes=" + Arrays.toString(this.extendedHeaderBytes) + "]";
    }
}
