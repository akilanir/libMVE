package org.apache.commons.net.ftp.parser;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.TimeZone;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPFileEntryParserImpl;
import org.apache.commons.net.nntp.NNTP;
import org.apache.commons.net.nntp.NNTPReply;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/ftp/parser/MLSxEntryParser.class */
public class MLSxEntryParser extends FTPFileEntryParserImpl {
    private static final MLSxEntryParser PARSER = new MLSxEntryParser();
    private static final HashMap<String, Integer> TYPE_TO_INT = new HashMap<>();
    private static int[] UNIX_GROUPS;
    private static int[][] UNIX_PERMS;

    /* JADX WARN: Type inference failed for: r0v13, types: [int[], int[][]] */
    static {
        TYPE_TO_INT.put("file", 0);
        TYPE_TO_INT.put("cdir", 1);
        TYPE_TO_INT.put("pdir", 1);
        TYPE_TO_INT.put("dir", 1);
        UNIX_GROUPS = new int[]{0, 1, 2};
        UNIX_PERMS = new int[]{new int[0], new int[]{2}, new int[]{1}, new int[]{2, 1}, new int[]{0}, new int[]{0, 2}, new int[]{0, 1}, new int[]{0, 1, 2}};
    }

    @Override // org.apache.commons.net.ftp.FTPFileEntryParser
    public FTPFile parseFTPEntry(String entry) {
        SimpleDateFormat sdf;
        String[] parts = entry.split(" ", 2);
        if (parts.length != 2) {
            return null;
        }
        FTPFile file = new FTPFile();
        file.setRawListing(entry);
        file.setName(parts[1]);
        String[] facts = parts[0].split(";");
        boolean hasUnixMode = parts[0].toLowerCase(Locale.ENGLISH).contains("unix.mode=");
        for (String fact : facts) {
            String[] factparts = fact.split("=");
            if (factparts.length == 2) {
                String factname = factparts[0].toLowerCase(Locale.ENGLISH);
                String factvalue = factparts[1];
                String valueLowerCase = factvalue.toLowerCase(Locale.ENGLISH);
                if ("size".equals(factname)) {
                    file.setSize(Long.parseLong(factvalue));
                } else if ("sizd".equals(factname)) {
                    file.setSize(Long.parseLong(factvalue));
                } else if ("modify".equals(factname)) {
                    if (factvalue.contains(".")) {
                        sdf = new SimpleDateFormat("yyyyMMddHHmmss.SSS");
                    } else {
                        sdf = new SimpleDateFormat("yyyyMMddHHmmss");
                    }
                    TimeZone GMT = TimeZone.getTimeZone("GMT");
                    sdf.setTimeZone(GMT);
                    GregorianCalendar gc = new GregorianCalendar(GMT);
                    try {
                        gc.setTime(sdf.parse(factvalue));
                    } catch (ParseException e) {
                    }
                    file.setTimestamp(gc);
                } else if ("type".equals(factname)) {
                    Integer intType = TYPE_TO_INT.get(valueLowerCase);
                    if (intType == null) {
                        file.setType(3);
                    } else {
                        file.setType(intType.intValue());
                    }
                } else if (factname.startsWith("unix.")) {
                    String unixfact = factname.substring("unix.".length()).toLowerCase(Locale.ENGLISH);
                    if ("group".equals(unixfact)) {
                        file.setGroup(factvalue);
                    } else if ("owner".equals(unixfact)) {
                        file.setUser(factvalue);
                    } else if ("mode".equals(unixfact)) {
                        int off = factvalue.length() - 3;
                        for (int i = 0; i < 3; i++) {
                            int ch = factvalue.charAt(off + i) - '0';
                            if (ch >= 0 && ch <= 7) {
                                int[] arr$ = UNIX_PERMS[ch];
                                for (int p : arr$) {
                                    file.setPermission(UNIX_GROUPS[i], p, true);
                                }
                            }
                        }
                    }
                } else if (!hasUnixMode && "perm".equals(factname)) {
                    doUnixPerms(file, valueLowerCase);
                }
            }
        }
        return file;
    }

    private void doUnixPerms(FTPFile file, String valueLowerCase) {
        char[] arr$ = valueLowerCase.toCharArray();
        for (char c : arr$) {
            switch (c) {
                case 'a':
                    file.setPermission(0, 1, true);
                    break;
                case 'c':
                    file.setPermission(0, 1, true);
                    break;
                case NNTPReply.HELP_TEXT_FOLLOWS /* 100 */:
                    file.setPermission(0, 1, true);
                    break;
                case 'e':
                    file.setPermission(0, 0, true);
                    break;
                case 'l':
                    file.setPermission(0, 2, true);
                    break;
                case 'm':
                    file.setPermission(0, 1, true);
                    break;
                case 'p':
                    file.setPermission(0, 1, true);
                    break;
                case 'r':
                    file.setPermission(0, 0, true);
                    break;
                case NNTP.DEFAULT_PORT /* 119 */:
                    file.setPermission(0, 1, true);
                    break;
            }
        }
    }

    public static FTPFile parseEntry(String entry) {
        return PARSER.parseFTPEntry(entry);
    }

    public static MLSxEntryParser getInstance() {
        return PARSER;
    }
}
