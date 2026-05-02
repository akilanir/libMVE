package org.apache.commons.validator.routines;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/EmailValidator.class */
public class EmailValidator implements Serializable {
    private static final long serialVersionUID = 1705927040799295880L;
    private static final String SPECIAL_CHARS = "\\p{Cntrl}\\(\\)<>@,;:'\\\\\\\"\\.\\[\\]";
    private static final String VALID_CHARS = "[^\\s\\p{Cntrl}\\(\\)<>@,;:'\\\\\\\"\\.\\[\\]]";
    private static final String QUOTED_USER = "(\"[^\"]*\")";
    private static final String WORD = "(([^\\s\\p{Cntrl}\\(\\)<>@,;:'\\\\\\\"\\.\\[\\]]|')+|(\"[^\"]*\"))";
    private final boolean allowLocal;
    private static final String LEGAL_ASCII_REGEX = "^\\p{ASCII}+$";
    private static final Pattern MATCH_ASCII_PATTERN = Pattern.compile(LEGAL_ASCII_REGEX);
    private static final String EMAIL_REGEX = "^\\s*?(.+)@(.+?)\\s*$";
    private static final Pattern EMAIL_PATTERN = Pattern.compile(EMAIL_REGEX);
    private static final String IP_DOMAIN_REGEX = "^\\[(.*)\\]$";
    private static final Pattern IP_DOMAIN_PATTERN = Pattern.compile(IP_DOMAIN_REGEX);
    private static final String USER_REGEX = "^\\s*(([^\\s\\p{Cntrl}\\(\\)<>@,;:'\\\\\\\"\\.\\[\\]]|')+|(\"[^\"]*\"))(\\.(([^\\s\\p{Cntrl}\\(\\)<>@,;:'\\\\\\\"\\.\\[\\]]|')+|(\"[^\"]*\")))*$";
    private static final Pattern USER_PATTERN = Pattern.compile(USER_REGEX);
    private static final EmailValidator EMAIL_VALIDATOR = new EmailValidator(false);
    private static final EmailValidator EMAIL_VALIDATOR_WITH_LOCAL = new EmailValidator(true);

    public static EmailValidator getInstance() {
        return EMAIL_VALIDATOR;
    }

    public static EmailValidator getInstance(boolean allowLocal) {
        if (allowLocal) {
            return EMAIL_VALIDATOR_WITH_LOCAL;
        }
        return EMAIL_VALIDATOR;
    }

    protected EmailValidator(boolean allowLocal) {
        this.allowLocal = allowLocal;
    }

    public boolean isValid(String email) {
        if (email == null) {
            return false;
        }
        Matcher asciiMatcher = MATCH_ASCII_PATTERN.matcher(email);
        if (!asciiMatcher.matches()) {
            return false;
        }
        Matcher emailMatcher = EMAIL_PATTERN.matcher(email);
        if (!emailMatcher.matches() || email.endsWith(".") || !isValidUser(emailMatcher.group(1)) || !isValidDomain(emailMatcher.group(2))) {
            return false;
        }
        return true;
    }

    protected boolean isValidDomain(String domain) {
        Matcher ipDomainMatcher = IP_DOMAIN_PATTERN.matcher(domain);
        if (ipDomainMatcher.matches()) {
            InetAddressValidator inetAddressValidator = InetAddressValidator.getInstance();
            return inetAddressValidator.isValid(ipDomainMatcher.group(1));
        }
        DomainValidator domainValidator = DomainValidator.getInstance(this.allowLocal);
        return domainValidator.isValid(domain);
    }

    protected boolean isValidUser(String user) {
        return USER_PATTERN.matcher(user).matches();
    }
}
