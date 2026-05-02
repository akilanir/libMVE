package org.apache.commons.net.ftp.parser;

import java.text.ParseException;
import java.util.List;
import java.util.ListIterator;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.nntp.NNTPReply;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/ftp/parser/UnixFTPEntryParser.class */
public class UnixFTPEntryParser extends ConfigurableFTPFileEntryParserImpl {
    static final String DEFAULT_DATE_FORMAT = "MMM d yyyy";
    static final String DEFAULT_RECENT_DATE_FORMAT = "MMM d HH:mm";
    static final String NUMERIC_DATE_FORMAT = "yyyy-MM-dd HH:mm";
    public static final FTPClientConfig NUMERIC_DATE_CONFIG = new FTPClientConfig(FTPClientConfig.SYST_UNIX, NUMERIC_DATE_FORMAT, null, null, null, null);
    private static final String REGEX = "([bcdelfmpSs-])(((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-])))\\+?\\s*(\\d+)\\s+(?:(\\S+(?:\\s\\S+)*?)\\s+)?(?:(\\S+(?:\\s\\S+)*)\\s+)?(\\d+(?:,\\s*\\d+)?)\\s+((?:\\d+[-/]\\d+[-/]\\d+)|(?:\\S{3}\\s+\\d{1,2})|(?:\\d{1,2}\\s+\\S{3}))\\s+(\\d+(?::\\d+)?)\\s+(\\S*)(\\s*.*)";

    public UnixFTPEntryParser() {
        this(null);
    }

    public UnixFTPEntryParser(FTPClientConfig config) {
        super(REGEX);
        configure(config);
    }

    @Override // org.apache.commons.net.ftp.FTPFileEntryParserImpl, org.apache.commons.net.ftp.FTPFileEntryParser
    public List<String> preParse(List<String> original) {
        ListIterator<String> iter = original.listIterator();
        while (iter.hasNext()) {
            String entry = iter.next();
            if (entry.matches("^total \\d+$")) {
                iter.remove();
            }
        }
        return original;
    }

    @Override // org.apache.commons.net.ftp.FTPFileEntryParser
    public FTPFile parseFTPEntry(String entry) {
        int type;
        int end;
        FTPFile file = new FTPFile();
        file.setRawListing(entry);
        boolean isDevice = false;
        if (matches(entry)) {
            String typeStr = group(1);
            String hardLinkCount = group(15);
            String usr = group(16);
            String grp = group(17);
            String filesize = group(18);
            String datestr = group(19) + " " + group(20);
            String name = group(21);
            String endtoken = group(22);
            try {
                file.setTimestamp(super.parseTimestamp(datestr));
            } catch (ParseException e) {
            }
            switch (typeStr.charAt(0)) {
                case '-':
                case 'f':
                    type = 0;
                    break;
                case 'b':
                case 'c':
                    isDevice = true;
                    type = 0;
                    break;
                case NNTPReply.HELP_TEXT_FOLLOWS /* 100 */:
                    type = 1;
                    break;
                case 'e':
                    type = 2;
                    break;
                case 'l':
                    type = 2;
                    break;
                default:
                    type = 3;
                    break;
            }
            file.setType(type);
            int g = 4;
            int access = 0;
            while (access < 3) {
                file.setPermission(access, 0, !group(g).equals("-"));
                file.setPermission(access, 1, !group(g + 1).equals("-"));
                String execPerm = group(g + 2);
                if (!execPerm.equals("-") && !Character.isUpperCase(execPerm.charAt(0))) {
                    file.setPermission(access, 2, true);
                } else {
                    file.setPermission(access, 2, false);
                }
                access++;
                g += 4;
            }
            if (!isDevice) {
                try {
                    file.setHardLinkCount(Integer.parseInt(hardLinkCount));
                } catch (NumberFormatException e2) {
                }
            }
            file.setUser(usr);
            file.setGroup(grp);
            try {
                file.setSize(Long.parseLong(filesize));
            } catch (NumberFormatException e3) {
            }
            if (null == endtoken) {
                file.setName(name);
            } else {
                String name2 = name + endtoken;
                if (type != 2 || (end = name2.indexOf(" -> ")) == -1) {
                    file.setName(name2);
                } else {
                    file.setName(name2.substring(0, end));
                    file.setLink(name2.substring(end + 4));
                }
            }
            return file;
        }
        return null;
    }

    @Override // org.apache.commons.net.ftp.parser.ConfigurableFTPFileEntryParserImpl
    protected FTPClientConfig getDefaultConfiguration() {
        return new FTPClientConfig(FTPClientConfig.SYST_UNIX, "MMM d yyyy", "MMM d HH:mm", null, null, null);
    }
}
