package org.apache.commons.net.ftp.parser;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.StringTokenizer;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPListParseEngine;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/ftp/parser/VMSFTPEntryParser.class */
public class VMSFTPEntryParser extends ConfigurableFTPFileEntryParserImpl {
    private static final String DEFAULT_DATE_FORMAT = "d-MMM-yyyy HH:mm:ss";
    private static final String REGEX = "(.*;[0-9]+)\\s*(\\d+)/\\d+\\s*(\\S+)\\s+(\\S+)\\s+\\[(([0-9$A-Za-z_]+)|([0-9$A-Za-z_]+),([0-9$a-zA-Z_]+))\\]?\\s*\\([a-zA-Z]*,([a-zA-Z]*),([a-zA-Z]*),([a-zA-Z]*)\\)";

    public VMSFTPEntryParser() {
        this(null);
    }

    public VMSFTPEntryParser(FTPClientConfig config) {
        super(REGEX);
        configure(config);
    }

    @Override // org.apache.commons.net.ftp.FTPFileEntryParser
    public FTPFile parseFTPEntry(String entry) {
        String grp;
        String user;
        if (matches(entry)) {
            FTPFile f = new FTPFile();
            f.setRawListing(entry);
            String name = group(1);
            String size = group(2);
            String datestr = group(3) + " " + group(4);
            String owner = group(5);
            String[] permissions = {group(9), group(10), group(11)};
            try {
                f.setTimestamp(super.parseTimestamp(datestr));
            } catch (ParseException e) {
            }
            StringTokenizer t = new StringTokenizer(owner, ",");
            switch (t.countTokens()) {
                case 1:
                    grp = null;
                    user = t.nextToken();
                    break;
                case 2:
                    grp = t.nextToken();
                    user = t.nextToken();
                    break;
                default:
                    grp = null;
                    user = null;
                    break;
            }
            if (name.lastIndexOf(".DIR") != -1) {
                f.setType(1);
            } else {
                f.setType(0);
            }
            if (isVersioning()) {
                f.setName(name);
            } else {
                f.setName(name.substring(0, name.lastIndexOf(";")));
            }
            long sizeInBytes = Long.parseLong(size) * 512;
            f.setSize(sizeInBytes);
            f.setGroup(grp);
            f.setUser(user);
            for (int access = 0; access < 3; access++) {
                String permission = permissions[access];
                f.setPermission(access, 0, permission.indexOf(82) >= 0);
                f.setPermission(access, 1, permission.indexOf(87) >= 0);
                f.setPermission(access, 2, permission.indexOf(69) >= 0);
            }
            return f;
        }
        return null;
    }

    @Override // org.apache.commons.net.ftp.FTPFileEntryParserImpl, org.apache.commons.net.ftp.FTPFileEntryParser
    public String readNextEntry(BufferedReader reader) throws IOException {
        String line = reader.readLine();
        StringBuilder entry = new StringBuilder();
        while (line != null) {
            if (line.startsWith("Directory") || line.startsWith("Total")) {
                line = reader.readLine();
            } else {
                entry.append(line);
                if (line.trim().endsWith(")")) {
                    break;
                }
                line = reader.readLine();
            }
        }
        if (entry.length() == 0) {
            return null;
        }
        return entry.toString();
    }

    protected boolean isVersioning() {
        return false;
    }

    @Override // org.apache.commons.net.ftp.parser.ConfigurableFTPFileEntryParserImpl
    protected FTPClientConfig getDefaultConfiguration() {
        return new FTPClientConfig(FTPClientConfig.SYST_VMS, DEFAULT_DATE_FORMAT, null, null, null, null);
    }

    @Deprecated
    public FTPFile[] parseFileList(InputStream listStream) throws IOException {
        FTPListParseEngine engine = new FTPListParseEngine(this);
        engine.readServerList(listStream, null);
        return engine.getFiles();
    }
}
