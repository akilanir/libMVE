package it.gmariotti.changelibs.library.internal;

import java.util.Iterator;
import java.util.LinkedList;

/* loaded from: com.github.gabrielemariotti.changeloglib.changelog.2.1.0.jar:it/gmariotti/changelibs/library/internal/ChangeLog.class */
public class ChangeLog {
    private LinkedList<ChangeLogRow> rows = new LinkedList<>();
    private boolean bulletedList;

    public void addRow(ChangeLogRow row) {
        if (row != null) {
            if (this.rows == null) {
                this.rows = new LinkedList<>();
            }
            this.rows.add(row);
        }
    }

    public void clearAllRows() {
        this.rows = new LinkedList<>();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("bulletedList=" + this.bulletedList);
        sb.append("\n");
        if (this.rows != null) {
            Iterator i$ = this.rows.iterator();
            while (i$.hasNext()) {
                ChangeLogRow row = i$.next();
                sb.append("row=[");
                sb.append(row.toString());
                sb.append("]\n");
            }
        } else {
            sb.append("rows:none");
        }
        return sb.toString();
    }

    public boolean isBulletedList() {
        return this.bulletedList;
    }

    public void setBulletedList(boolean bulletedList) {
        this.bulletedList = bulletedList;
    }

    public LinkedList<ChangeLogRow> getRows() {
        return this.rows;
    }

    public void setRows(LinkedList<ChangeLogRow> rows) {
        this.rows = rows;
    }
}
