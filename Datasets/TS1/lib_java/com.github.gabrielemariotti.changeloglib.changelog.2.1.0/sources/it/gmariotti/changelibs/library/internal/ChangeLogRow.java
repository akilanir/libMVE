package it.gmariotti.changelibs.library.internal;

import android.content.Context;
import it.gmariotti.changelibs.BuildConfig;
import it.gmariotti.changelibs.R;

/* loaded from: com.github.gabrielemariotti.changeloglib.changelog.2.1.0.jar:it/gmariotti/changelibs/library/internal/ChangeLogRow.class */
public class ChangeLogRow {
    public static final int DEFAULT = 0;
    public static final int BUGFIX = 1;
    public static final int IMPROVEMENT = 2;
    protected boolean header;
    protected String versionName;
    protected int versionCode;
    protected String changeDate;
    private boolean bulletedList;
    private String changeTextTitle;
    private String changeText;
    private int type;

    public void parseChangeText(String changeLogText) {
        if (changeLogText != null) {
            changeLogText = changeLogText.replaceAll("\\[", "<").replaceAll("\\]", ">");
        }
        setChangeText(changeLogText);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("header=" + this.header);
        sb.append(",");
        sb.append("versionName=" + this.versionName);
        sb.append(",");
        sb.append("versionCode=" + this.versionCode);
        sb.append(",");
        sb.append("bulletedList=" + this.bulletedList);
        sb.append(",");
        sb.append("changeText=" + this.changeText);
        return sb.toString();
    }

    public boolean isHeader() {
        return this.header;
    }

    public void setHeader(boolean header) {
        this.header = header;
    }

    public boolean isBulletedList() {
        return this.bulletedList;
    }

    public void setBulletedList(boolean bulletedList) {
        this.bulletedList = bulletedList;
    }

    public String getChangeText() {
        return this.changeText;
    }

    public String getChangeText(Context context) {
        if (context == null) {
            return getChangeText();
        }
        String prefix = BuildConfig.FLAVOR;
        switch (this.type) {
            case BUGFIX /* 1 */:
                String prefix2 = context.getResources().getString(R.string.changelog_row_prefix_bug);
                prefix = prefix2.replaceAll("\\[", "<").replaceAll("\\]", ">");
                break;
            case IMPROVEMENT /* 2 */:
                String prefix3 = context.getResources().getString(R.string.changelog_row_prefix_improvement);
                prefix = prefix3.replaceAll("\\[", "<").replaceAll("\\]", ">");
                break;
        }
        return prefix + " " + this.changeText;
    }

    public void setChangeText(String changeText) {
        this.changeText = changeText;
    }

    public String getVersionName() {
        return this.versionName;
    }

    public void setVersionName(String versionName) {
        this.versionName = versionName;
    }

    public int getVersionCode() {
        return this.versionCode;
    }

    public void setVersionCode(int versionCode) {
        this.versionCode = versionCode;
    }

    public String getChangeTextTitle() {
        return this.changeTextTitle;
    }

    public void setChangeTextTitle(String changeTextTitle) {
        this.changeTextTitle = changeTextTitle;
    }

    public String getChangeDate() {
        return this.changeDate;
    }

    public void setChangeDate(String changeDate) {
        this.changeDate = changeDate;
    }

    public void setType(int type) {
        this.type = type;
    }
}
