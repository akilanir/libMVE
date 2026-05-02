package org.apache.commons.validator;

import java.util.ArrayList;
import java.util.Collection;
import org.apache.commons.validator.util.Flags;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/CreditCardValidator.class */
public class CreditCardValidator {
    public static final int NONE = 0;
    public static final int AMEX = 1;
    public static final int VISA = 2;
    public static final int MASTERCARD = 4;
    public static final int DISCOVER = 8;
    private Collection cardTypes;

    /* renamed from: org.apache.commons.validator.CreditCardValidator$1, reason: invalid class name */
    /* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/CreditCardValidator$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/CreditCardValidator$CreditCardType.class */
    public interface CreditCardType {
        boolean matches(String str);
    }

    public CreditCardValidator() {
        this(15);
    }

    public CreditCardValidator(int options) {
        this.cardTypes = new ArrayList();
        Flags f = new Flags(options);
        if (f.isOn(2L)) {
            this.cardTypes.add(new Visa(null));
        }
        if (f.isOn(1L)) {
            this.cardTypes.add(new Amex(null));
        }
        if (f.isOn(4L)) {
            this.cardTypes.add(new Mastercard(null));
        }
        if (f.isOn(8L)) {
            this.cardTypes.add(new Discover(null));
        }
    }

    public boolean isValid(String card) {
        if (card == null || card.length() < 13 || card.length() > 19 || !luhnCheck(card)) {
            return false;
        }
        for (CreditCardType type : this.cardTypes) {
            if (type.matches(card)) {
                return true;
            }
        }
        return false;
    }

    public void addAllowedCardType(CreditCardType type) {
        this.cardTypes.add(type);
    }

    protected boolean luhnCheck(String cardNumber) {
        int digits = cardNumber.length();
        int oddOrEven = digits & 1;
        long sum = 0;
        for (int count = 0; count < digits; count++) {
            try {
                int digit = Integer.parseInt(new StringBuffer().append(cardNumber.charAt(count)).append("").toString());
                if (((count & 1) ^ oddOrEven) == 0) {
                    digit *= 2;
                    if (digit > 9) {
                        digit -= 9;
                    }
                }
                sum += digit;
            } catch (NumberFormatException e) {
                return false;
            }
        }
        return sum != 0 && sum % 10 == 0;
    }

    /* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/CreditCardValidator$Visa.class */
    private static class Visa implements CreditCardType {
        private static final String PREFIX = "4";

        private Visa() {
        }

        Visa(AnonymousClass1 x0) {
            this();
        }

        @Override // org.apache.commons.validator.CreditCardValidator.CreditCardType
        public boolean matches(String card) {
            return card.substring(0, 1).equals(PREFIX) && (card.length() == 13 || card.length() == 16);
        }
    }

    /* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/CreditCardValidator$Amex.class */
    private static class Amex implements CreditCardType {
        private static final String PREFIX = "34,37,";

        private Amex() {
        }

        Amex(AnonymousClass1 x0) {
            this();
        }

        @Override // org.apache.commons.validator.CreditCardValidator.CreditCardType
        public boolean matches(String card) {
            String prefix2 = new StringBuffer().append(card.substring(0, 2)).append(",").toString();
            return PREFIX.indexOf(prefix2) != -1 && card.length() == 15;
        }
    }

    /* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/CreditCardValidator$Discover.class */
    private static class Discover implements CreditCardType {
        private static final String PREFIX = "6011";

        private Discover() {
        }

        Discover(AnonymousClass1 x0) {
            this();
        }

        @Override // org.apache.commons.validator.CreditCardValidator.CreditCardType
        public boolean matches(String card) {
            return card.substring(0, 4).equals(PREFIX) && card.length() == 16;
        }
    }

    /* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/CreditCardValidator$Mastercard.class */
    private static class Mastercard implements CreditCardType {
        private static final String PREFIX = "51,52,53,54,55,";

        private Mastercard() {
        }

        Mastercard(AnonymousClass1 x0) {
            this();
        }

        @Override // org.apache.commons.validator.CreditCardValidator.CreditCardType
        public boolean matches(String card) {
            String prefix2 = new StringBuffer().append(card.substring(0, 2)).append(",").toString();
            return PREFIX.indexOf(prefix2) != -1 && card.length() == 16;
        }
    }
}
