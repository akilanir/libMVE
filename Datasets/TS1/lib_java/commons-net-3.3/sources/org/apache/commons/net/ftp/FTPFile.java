package org.apache.commons.net.ftp;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Formatter;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/ftp/FTPFile.class */
public class FTPFile implements Serializable {
    private static final long serialVersionUID = 9010790363003271996L;
    public static final int FILE_TYPE = 0;
    public static final int DIRECTORY_TYPE = 1;
    public static final int SYMBOLIC_LINK_TYPE = 2;
    public static final int UNKNOWN_TYPE = 3;
    public static final int USER_ACCESS = 0;
    public static final int GROUP_ACCESS = 1;
    public static final int WORLD_ACCESS = 2;
    public static final int READ_PERMISSION = 0;
    public static final int WRITE_PERMISSION = 1;
    public static final int EXECUTE_PERMISSION = 2;
    private String _link;
    private final boolean[][] _permissions = new boolean[3][3];
    private String _rawListing = null;
    private int _type = 3;
    private int _hardLinkCount = 0;
    private long _size = -1;
    private String _user = "";
    private String _group = "";
    private Calendar _date = null;
    private String _name = null;

    public void setRawListing(String rawListing) {
        this._rawListing = rawListing;
    }

    public String getRawListing() {
        return this._rawListing;
    }

    public boolean isDirectory() {
        return this._type == 1;
    }

    public boolean isFile() {
        return this._type == 0;
    }

    public boolean isSymbolicLink() {
        return this._type == 2;
    }

    public boolean isUnknown() {
        return this._type == 3;
    }

    public void setType(int type) {
        this._type = type;
    }

    public int getType() {
        return this._type;
    }

    public void setName(String name) {
        this._name = name;
    }

    public String getName() {
        return this._name;
    }

    public void setSize(long size) {
        this._size = size;
    }

    public long getSize() {
        return this._size;
    }

    public void setHardLinkCount(int links) {
        this._hardLinkCount = links;
    }

    public int getHardLinkCount() {
        return this._hardLinkCount;
    }

    public void setGroup(String group) {
        this._group = group;
    }

    public String getGroup() {
        return this._group;
    }

    public void setUser(String user) {
        this._user = user;
    }

    public String getUser() {
        return this._user;
    }

    public void setLink(String link) {
        this._link = link;
    }

    public String getLink() {
        return this._link;
    }

    public void setTimestamp(Calendar date) {
        this._date = date;
    }

    public Calendar getTimestamp() {
        return this._date;
    }

    public void setPermission(int access, int permission, boolean value) {
        this._permissions[access][permission] = value;
    }

    public boolean hasPermission(int access, int permission) {
        return this._permissions[access][permission];
    }

    public String toString() {
        return getRawListing();
    }

    public String toFormattedString() {
        StringBuilder sb = new StringBuilder();
        Formatter fmt = new Formatter(sb);
        sb.append(formatType());
        sb.append(permissionToString(0));
        sb.append(permissionToString(1));
        sb.append(permissionToString(2));
        fmt.format(" %4d", Integer.valueOf(getHardLinkCount()));
        fmt.format(" %-8s %-8s", getGroup(), getUser());
        fmt.format(" %8d", Long.valueOf(getSize()));
        Calendar timestamp = getTimestamp();
        if (timestamp != null) {
            fmt.format(" %1$tY-%1$tm-%1$td %1$tH:%1$tM:%1$tS", timestamp);
            fmt.format(" %1$tZ", timestamp);
            sb.append(' ');
        }
        sb.append(' ');
        sb.append(getName());
        fmt.close();
        return sb.toString();
    }

    private char formatType() {
        switch (this._type) {
            case 0:
                return '-';
            case 1:
                return 'd';
            case 2:
                return 'l';
            default:
                return '?';
        }
    }

    private String permissionToString(int access) {
        StringBuilder sb = new StringBuilder();
        if (hasPermission(access, 0)) {
            sb.append('r');
        } else {
            sb.append('-');
        }
        if (hasPermission(access, 1)) {
            sb.append('w');
        } else {
            sb.append('-');
        }
        if (hasPermission(access, 2)) {
            sb.append('x');
        } else {
            sb.append('-');
        }
        return sb.toString();
    }
}
