package it.gmariotti.changelibs.library.internal;

/* loaded from: com.github.gabrielemariotti.changeloglib.changelog.2.1.0.jar:it/gmariotti/changelibs/library/internal/ChangeLogRowHeader.class */
public class ChangeLogRowHeader extends ChangeLogRow {
    public ChangeLogRowHeader() {
        setHeader(true);
        setBulletedList(false);
        setChangeTextTitle(null);
    }

    @Override // it.gmariotti.changelibs.library.internal.ChangeLogRow
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("header=" + this.header);
        sb.append(",");
        sb.append("versionName=" + this.versionName);
        sb.append(",");
        sb.append("changeDate=" + this.changeDate);
        return sb.toString();
    }
}
