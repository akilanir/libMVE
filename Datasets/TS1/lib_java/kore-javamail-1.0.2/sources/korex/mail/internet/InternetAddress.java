package korex.mail.internet;

import com.sun.mail.util.PropUtil;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Locale;
import korex.mail.Address;
import korex.mail.Session;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/InternetAddress.class */
public class InternetAddress extends Address implements Cloneable {
    protected String address;
    protected String personal;
    protected String encodedPersonal;
    private static final long serialVersionUID = -7507595530758302903L;
    private static final boolean ignoreBogusGroupName = PropUtil.getBooleanSystemProperty("mail.mime.address.ignorebogusgroupname", true);
    private static final String rfc822phrase = HeaderTokenizer.RFC822.replace(' ', (char) 0).replace('\t', (char) 0);
    private static final String specialsNoDotNoAt = "()<>,;:\\\"[]";
    private static final String specialsNoDot = "()<>,;:\\\"[]@";

    public InternetAddress() {
    }

    public InternetAddress(String address) throws AddressException {
        InternetAddress[] a = parse(address, true);
        if (a.length != 1) {
            throw new AddressException("Illegal address", address);
        }
        this.address = a[0].address;
        this.personal = a[0].personal;
        this.encodedPersonal = a[0].encodedPersonal;
    }

    public InternetAddress(String address, boolean strict) throws AddressException {
        this(address);
        if (strict) {
            if (isGroup()) {
                getGroup(true);
            } else {
                checkAddress(this.address, true, true);
            }
        }
    }

    public InternetAddress(String address, String personal) throws UnsupportedEncodingException {
        this(address, personal, null);
    }

    public InternetAddress(String address, String personal, String charset) throws UnsupportedEncodingException {
        this.address = address;
        setPersonal(personal, charset);
    }

    public Object clone() {
        InternetAddress a = null;
        try {
            a = (InternetAddress) super.clone();
        } catch (CloneNotSupportedException e) {
        }
        return a;
    }

    @Override // korex.mail.Address
    public String getType() {
        return "rfc822";
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPersonal(String name, String charset) throws UnsupportedEncodingException {
        this.personal = name;
        if (name != null) {
            this.encodedPersonal = MimeUtility.encodeWord(name, charset, null);
        } else {
            this.encodedPersonal = null;
        }
    }

    public void setPersonal(String name) throws UnsupportedEncodingException {
        this.personal = name;
        if (name != null) {
            this.encodedPersonal = MimeUtility.encodeWord(name);
        } else {
            this.encodedPersonal = null;
        }
    }

    public String getAddress() {
        return this.address;
    }

    public String getPersonal() {
        if (this.personal != null) {
            return this.personal;
        }
        if (this.encodedPersonal != null) {
            try {
                this.personal = MimeUtility.decodeText(this.encodedPersonal);
                return this.personal;
            } catch (Exception e) {
                return this.encodedPersonal;
            }
        }
        return null;
    }

    @Override // korex.mail.Address
    public String toString() {
        String a = this.address == null ? "" : this.address;
        if (this.encodedPersonal == null && this.personal != null) {
            try {
                this.encodedPersonal = MimeUtility.encodeWord(this.personal);
            } catch (UnsupportedEncodingException e) {
            }
        }
        if (this.encodedPersonal != null) {
            return quotePhrase(this.encodedPersonal) + " <" + a + ">";
        }
        if (isGroup() || isSimple()) {
            return a;
        }
        return "<" + a + ">";
    }

    public String toUnicodeString() {
        String p = getPersonal();
        if (p != null) {
            return quotePhrase(p) + " <" + this.address + ">";
        }
        if (isGroup() || isSimple()) {
            return this.address;
        }
        return "<" + this.address + ">";
    }

    private static String quotePhrase(String phrase) {
        int len = phrase.length();
        boolean needQuoting = false;
        for (int i = 0; i < len; i++) {
            char c = phrase.charAt(i);
            if (c == '\"' || c == '\\') {
                StringBuffer sb = new StringBuffer(len + 3);
                sb.append('\"');
                for (int j = 0; j < len; j++) {
                    char cc = phrase.charAt(j);
                    if (cc == '\"' || cc == '\\') {
                        sb.append('\\');
                    }
                    sb.append(cc);
                }
                sb.append('\"');
                return sb.toString();
            }
            if ((c < ' ' && c != '\r' && c != '\n' && c != '\t') || c >= 127 || rfc822phrase.indexOf(c) >= 0) {
                needQuoting = true;
            }
        }
        if (needQuoting) {
            StringBuffer sb2 = new StringBuffer(len + 2);
            sb2.append('\"').append(phrase).append('\"');
            return sb2.toString();
        }
        return phrase;
    }

    private static String unquote(String s) {
        if (s.startsWith("\"") && s.endsWith("\"") && s.length() > 1) {
            s = s.substring(1, s.length() - 1);
            if (s.indexOf(92) >= 0) {
                StringBuffer sb = new StringBuffer(s.length());
                int i = 0;
                while (i < s.length()) {
                    char c = s.charAt(i);
                    if (c == '\\' && i < s.length() - 1) {
                        i++;
                        c = s.charAt(i);
                    }
                    sb.append(c);
                    i++;
                }
                s = sb.toString();
            }
        }
        return s;
    }

    @Override // korex.mail.Address
    public boolean equals(Object a) {
        if (!(a instanceof InternetAddress)) {
            return false;
        }
        String s = ((InternetAddress) a).getAddress();
        if (s == this.address) {
            return true;
        }
        if (this.address != null && this.address.equalsIgnoreCase(s)) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        if (this.address == null) {
            return 0;
        }
        return this.address.toLowerCase(Locale.ENGLISH).hashCode();
    }

    public static String toString(Address[] addresses) {
        return toString(addresses, 0);
    }

    public static String toString(Address[] addresses, int used) {
        if (addresses == null || addresses.length == 0) {
            return null;
        }
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < addresses.length; i++) {
            if (i != 0) {
                sb.append(", ");
                used += 2;
            }
            String s = addresses[i].toString();
            int len = lengthOfFirstSegment(s);
            if (used + len > 76) {
                sb.append("\r\n\t");
                used = 8;
            }
            sb.append(s);
            used = lengthOfLastSegment(s, used);
        }
        return sb.toString();
    }

    private static int lengthOfFirstSegment(String s) {
        int pos = s.indexOf("\r\n");
        if (pos != -1) {
            return pos;
        }
        return s.length();
    }

    private static int lengthOfLastSegment(String s, int used) {
        int pos = s.lastIndexOf("\r\n");
        if (pos != -1) {
            return (s.length() - pos) - 2;
        }
        return s.length() + used;
    }

    public static InternetAddress getLocalAddress(Session session) {
        try {
            return _getLocalAddress(session);
        } catch (SecurityException | UnknownHostException | AddressException e) {
            return null;
        }
    }

    static InternetAddress _getLocalAddress(Session session) throws SecurityException, AddressException, UnknownHostException {
        String user = null;
        String host = null;
        String address = null;
        if (session == null) {
            user = System.getProperty("user.name");
            host = getLocalHostName();
        } else {
            address = session.getProperty("mail.from");
            if (address == null) {
                user = session.getProperty("mail.user");
                if (user == null || user.length() == 0) {
                    user = session.getProperty("user.name");
                }
                if (user == null || user.length() == 0) {
                    user = System.getProperty("user.name");
                }
                host = session.getProperty("mail.host");
                if (host == null || host.length() == 0) {
                    host = getLocalHostName();
                }
            }
        }
        if (address == null && user != null && user.length() != 0 && host != null && host.length() != 0) {
            address = MimeUtility.quote(user.trim(), "()<>,;:\\\"[]@\t ") + "@" + host;
        }
        if (address == null) {
            return null;
        }
        return new InternetAddress(address);
    }

    private static String getLocalHostName() throws UnknownHostException {
        String host = null;
        InetAddress me = InetAddress.getLocalHost();
        if (me != null) {
            host = me.getHostName();
            if (host != null && host.length() > 0 && isInetAddressLiteral(host)) {
                host = '[' + host + ']';
            }
        }
        return host;
    }

    private static boolean isInetAddressLiteral(String addr) {
        boolean sawHex = false;
        boolean sawColon = false;
        for (int i = 0; i < addr.length(); i++) {
            char c = addr.charAt(i);
            if ((c < '0' || c > '9') && c != '.') {
                if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')) {
                    sawHex = true;
                } else if (c == ':') {
                    sawColon = true;
                } else {
                    return false;
                }
            }
        }
        return !sawHex || sawColon;
    }

    public static InternetAddress[] parse(String addresslist) throws AddressException {
        return parse(addresslist, true);
    }

    public static InternetAddress[] parse(String addresslist, boolean strict) throws AddressException {
        return parse(addresslist, strict, false);
    }

    public static InternetAddress[] parseHeader(String addresslist, boolean strict) throws AddressException {
        return parse(MimeUtility.unfold(addresslist), strict, true);
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x02b7  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x02da  */
    /* JADX WARN: Removed duplicated region for block: B:253:0x0633  */
    /* JADX WARN: Removed duplicated region for block: B:356:0x069a A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:366:0x0267 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0219  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x026c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static korex.mail.internet.InternetAddress[] parse(java.lang.String r6, boolean r7, boolean r8) throws korex.mail.internet.AddressException {
        /*
            Method dump skipped, instructions count: 1974
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: korex.mail.internet.InternetAddress.parse(java.lang.String, boolean, boolean):korex.mail.internet.InternetAddress[]");
    }

    public void validate() throws AddressException {
        if (isGroup()) {
            getGroup(true);
        } else {
            checkAddress(getAddress(), true, true);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:101:0x01bc, code lost:
    
        if (r0 < 127) goto L104;
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x01c9, code lost:
    
        throw new korex.mail.internet.AddressException("Domain contains control or whitespace", r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x01cf, code lost:
    
        if (java.lang.Character.isLetterOrDigit(r0) != false) goto L112;
     */
    /* JADX WARN: Code restructure failed: missing block: B:107:0x01d6, code lost:
    
        if (r0 == '-') goto L112;
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x01dd, code lost:
    
        if (r0 == '.') goto L112;
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x01ea, code lost:
    
        throw new korex.mail.internet.AddressException("Domain contains illegal character", r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:113:0x01ef, code lost:
    
        if (r0 != '.') goto L146;
     */
    /* JADX WARN: Code restructure failed: missing block: B:115:0x01f6, code lost:
    
        if (r12 != '.') goto L147;
     */
    /* JADX WARN: Code restructure failed: missing block: B:117:0x0203, code lost:
    
        throw new korex.mail.internet.AddressException("Domain contains dot-dot", r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:0x0204, code lost:
    
        r12 = r0;
        r8 = r8 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:120:0x0212, code lost:
    
        if (r12 != '.') goto L123;
     */
    /* JADX WARN: Code restructure failed: missing block: B:122:0x021f, code lost:
    
        throw new korex.mail.internet.AddressException("Domain ends with dot", r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:123:0x0220, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x0147, code lost:
    
        if (r13 == false) goto L77;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x0154, code lost:
    
        throw new korex.mail.internet.AddressException("Unterminated quote", r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x0159, code lost:
    
        if (r11 == '@') goto L84;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x015d, code lost:
    
        if (r7 == false) goto L83;
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x016a, code lost:
    
        throw new korex.mail.internet.AddressException("Missing final '@domain'", r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x016b, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x016c, code lost:
    
        r0 = r8 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x0175, code lost:
    
        if (r0 < r0) goto L88;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x0182, code lost:
    
        throw new korex.mail.internet.AddressException("Missing domain", r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x018b, code lost:
    
        if (r5.charAt(r0) != '.') goto L92;
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x0198, code lost:
    
        throw new korex.mail.internet.AddressException("Domain starts with dot", r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x0199, code lost:
    
        r8 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:0x019f, code lost:
    
        if (r8 >= r0) goto L145;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x01a2, code lost:
    
        r0 = r5.charAt(r8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x01ad, code lost:
    
        if (r0 != '[') goto L98;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x01b0, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x01b5, code lost:
    
        if (r0 <= ' ') goto L141;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void checkAddress(java.lang.String r5, boolean r6, boolean r7) throws korex.mail.internet.AddressException {
        /*
            Method dump skipped, instructions count: 545
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: korex.mail.internet.InternetAddress.checkAddress(java.lang.String, boolean, boolean):void");
    }

    private boolean isSimple() {
        return this.address == null || indexOfAny(this.address, specialsNoDotNoAt) < 0;
    }

    public boolean isGroup() {
        return this.address != null && this.address.endsWith(";") && this.address.indexOf(58) > 0;
    }

    public InternetAddress[] getGroup(boolean strict) throws AddressException {
        int ix;
        String addr = getAddress();
        if (addr == null || !addr.endsWith(";") || (ix = addr.indexOf(58)) < 0) {
            return null;
        }
        String list = addr.substring(ix + 1, addr.length() - 1);
        return parseHeader(list, strict);
    }

    private static int indexOfAny(String s, String any) {
        return indexOfAny(s, any, 0);
    }

    private static int indexOfAny(String s, String any, int start) {
        try {
            int len = s.length();
            for (int i = start; i < len; i++) {
                if (any.indexOf(s.charAt(i)) >= 0) {
                    return i;
                }
            }
            return -1;
        } catch (StringIndexOutOfBoundsException e) {
            return -1;
        }
    }
}
