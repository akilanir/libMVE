package org.acra;

/* loaded from: acra-4.6.2.jar:org/acra/CrashReportFileNameParser.class */
final class CrashReportFileNameParser {
    CrashReportFileNameParser() {
    }

    public boolean isSilent(String reportFileName) {
        return reportFileName.contains(ACRAConstants.SILENT_SUFFIX);
    }

    public boolean isApproved(String reportFileName) {
        return isSilent(reportFileName) || reportFileName.contains("-approved");
    }
}
