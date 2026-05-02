package freemarker.template.utility;

import java.math.BigDecimal;
import java.math.BigInteger;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/NumberUtil.class */
public class NumberUtil {
    private NumberUtil() {
    }

    public static boolean isInfinite(Number num) {
        if (num instanceof Double) {
            return ((Double) num).isInfinite();
        }
        if (num instanceof Float) {
            return ((Float) num).isInfinite();
        }
        if (isNonFPNumberOfSupportedClass(num)) {
            return false;
        }
        throw new UnsupportedNumberClassException(num.getClass());
    }

    public static boolean isNaN(Number num) {
        if (num instanceof Double) {
            return ((Double) num).isNaN();
        }
        if (num instanceof Float) {
            return ((Float) num).isNaN();
        }
        if (isNonFPNumberOfSupportedClass(num)) {
            return false;
        }
        throw new UnsupportedNumberClassException(num.getClass());
    }

    public static int getSignum(Number num) throws ArithmeticException {
        if (num instanceof Integer) {
            int n = ((Integer) num).intValue();
            if (n > 0) {
                return 1;
            }
            return n == 0 ? 0 : -1;
        }
        if (num instanceof BigDecimal) {
            return ((BigDecimal) num).signum();
        }
        if (num instanceof Double) {
            double n2 = ((Double) num).doubleValue();
            if (n2 > 0.0d) {
                return 1;
            }
            if (n2 == 0.0d) {
                return 0;
            }
            if (n2 < 0.0d) {
                return -1;
            }
            throw new ArithmeticException(new StringBuffer().append("The signum of ").append(n2).append(" is not defined.").toString());
        }
        if (num instanceof Float) {
            float n3 = ((Float) num).floatValue();
            if (n3 > 0.0f) {
                return 1;
            }
            if (n3 == 0.0f) {
                return 0;
            }
            if (n3 < 0.0f) {
                return -1;
            }
            throw new ArithmeticException(new StringBuffer().append("The signum of ").append(n3).append(" is not defined.").toString());
        }
        if (num instanceof Long) {
            long n4 = ((Long) num).longValue();
            if (n4 > 0) {
                return 1;
            }
            return n4 == 0 ? 0 : -1;
        }
        if (num instanceof Short) {
            short n5 = ((Short) num).shortValue();
            if (n5 > 0) {
                return 1;
            }
            return n5 == 0 ? 0 : -1;
        }
        if (num instanceof Byte) {
            byte n6 = ((Byte) num).byteValue();
            if (n6 > 0) {
                return 1;
            }
            return n6 == 0 ? 0 : -1;
        }
        if (num instanceof BigInteger) {
            return ((BigInteger) num).signum();
        }
        throw new UnsupportedNumberClassException(num.getClass());
    }

    private static boolean isNonFPNumberOfSupportedClass(Number num) {
        return (num instanceof Integer) || (num instanceof BigDecimal) || (num instanceof Long) || (num instanceof Short) || (num instanceof Byte) || (num instanceof BigInteger);
    }
}
