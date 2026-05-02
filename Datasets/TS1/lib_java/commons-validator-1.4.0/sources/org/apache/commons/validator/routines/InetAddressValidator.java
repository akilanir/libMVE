package org.apache.commons.validator.routines;

import java.io.Serializable;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/InetAddressValidator.class */
public class InetAddressValidator implements Serializable {
    private static final long serialVersionUID = -919201640201914789L;
    private static final String IPV4_REGEX = "^(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})$";
    private static final InetAddressValidator VALIDATOR = new InetAddressValidator();
    private final RegexValidator ipv4Validator = new RegexValidator(IPV4_REGEX);

    public static InetAddressValidator getInstance() {
        return VALIDATOR;
    }

    public boolean isValid(String inetAddress) {
        return isValidInet4Address(inetAddress);
    }

    public boolean isValidInet4Address(String inet4Address) {
        String[] groups = this.ipv4Validator.match(inet4Address);
        if (groups == null) {
            return false;
        }
        for (int i = 0; i <= 3; i++) {
            String ipSegment = groups[i];
            if (ipSegment == null || ipSegment.length() <= 0) {
                return false;
            }
            try {
                int iIpSegment = Integer.parseInt(ipSegment);
                if (iIpSegment > 255) {
                    return false;
                }
            } catch (NumberFormatException e) {
                return false;
            }
        }
        return true;
    }
}
