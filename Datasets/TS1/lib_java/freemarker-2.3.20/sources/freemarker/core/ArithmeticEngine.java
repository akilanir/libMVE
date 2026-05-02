package freemarker.core;

import freemarker.template.TemplateException;
import freemarker.template.utility.NumberUtil;
import freemarker.template.utility.OptimizerUtil;
import freemarker.template.utility.StringUtil;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/ArithmeticEngine.class */
public abstract class ArithmeticEngine {
    public static final BigDecimalEngine BIGDECIMAL_ENGINE = new BigDecimalEngine();
    public static final ConservativeEngine CONSERVATIVE_ENGINE = new ConservativeEngine();
    protected int minScale = 12;
    protected int maxScale = 12;
    protected int roundingPolicy = 4;
    static Class class$java$lang$Byte;
    static Class class$java$lang$Short;
    static Class class$java$lang$Integer;
    static Class class$java$lang$Long;
    static Class class$java$lang$Float;
    static Class class$java$lang$Double;
    static Class class$java$math$BigInteger;
    static Class class$java$math$BigDecimal;

    public abstract int compareNumbers(Number number, Number number2) throws TemplateException;

    public abstract Number add(Number number, Number number2) throws TemplateException;

    public abstract Number subtract(Number number, Number number2) throws TemplateException;

    public abstract Number multiply(Number number, Number number2) throws TemplateException;

    public abstract Number divide(Number number, Number number2) throws TemplateException;

    public abstract Number modulus(Number number, Number number2) throws TemplateException;

    public abstract Number toNumber(String str);

    public void setMinScale(int minScale) {
        if (minScale < 0) {
            throw new IllegalArgumentException("minScale < 0");
        }
        this.minScale = minScale;
    }

    public void setMaxScale(int maxScale) {
        if (maxScale < this.minScale) {
            throw new IllegalArgumentException("maxScale < minScale");
        }
        this.maxScale = maxScale;
    }

    public void setRoundingPolicy(int roundingPolicy) {
        if (roundingPolicy != 2 && roundingPolicy != 1 && roundingPolicy != 3 && roundingPolicy != 5 && roundingPolicy != 6 && roundingPolicy != 4 && roundingPolicy != 7 && roundingPolicy != 0) {
            throw new IllegalArgumentException("invalid rounding policy");
        }
        this.roundingPolicy = roundingPolicy;
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/ArithmeticEngine$BigDecimalEngine.class */
    public static class BigDecimalEngine extends ArithmeticEngine {
        @Override // freemarker.core.ArithmeticEngine
        public int compareNumbers(Number first, Number second) {
            int firstSignum = NumberUtil.getSignum(first);
            int secondSignum = NumberUtil.getSignum(second);
            if (firstSignum != secondSignum) {
                if (firstSignum < secondSignum) {
                    return -1;
                }
                return firstSignum > secondSignum ? 1 : 0;
            }
            if (firstSignum != 0 || secondSignum != 0) {
                BigDecimal left = ArithmeticEngine.toBigDecimal(first);
                BigDecimal right = ArithmeticEngine.toBigDecimal(second);
                return left.compareTo(right);
            }
            return 0;
        }

        @Override // freemarker.core.ArithmeticEngine
        public Number add(Number first, Number second) {
            BigDecimal left = ArithmeticEngine.toBigDecimal(first);
            BigDecimal right = ArithmeticEngine.toBigDecimal(second);
            return left.add(right);
        }

        @Override // freemarker.core.ArithmeticEngine
        public Number subtract(Number first, Number second) {
            BigDecimal left = ArithmeticEngine.toBigDecimal(first);
            BigDecimal right = ArithmeticEngine.toBigDecimal(second);
            return left.subtract(right);
        }

        @Override // freemarker.core.ArithmeticEngine
        public Number multiply(Number first, Number second) {
            BigDecimal left = ArithmeticEngine.toBigDecimal(first);
            BigDecimal right = ArithmeticEngine.toBigDecimal(second);
            BigDecimal result = left.multiply(right);
            if (result.scale() > this.maxScale) {
                result = result.setScale(this.maxScale, this.roundingPolicy);
            }
            return result;
        }

        @Override // freemarker.core.ArithmeticEngine
        public Number divide(Number first, Number second) {
            BigDecimal left = ArithmeticEngine.toBigDecimal(first);
            BigDecimal right = ArithmeticEngine.toBigDecimal(second);
            return divide(left, right);
        }

        @Override // freemarker.core.ArithmeticEngine
        public Number modulus(Number first, Number second) {
            long left = first.longValue();
            long right = second.longValue();
            return new Long(left % right);
        }

        @Override // freemarker.core.ArithmeticEngine
        public Number toNumber(String s) {
            return new BigDecimal(s);
        }

        private BigDecimal divide(BigDecimal left, BigDecimal right) {
            int scale1 = left.scale();
            int scale2 = right.scale();
            int scale = Math.max(scale1, scale2);
            return left.divide(right, Math.max(this.minScale, scale), this.roundingPolicy);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/ArithmeticEngine$ConservativeEngine.class */
    public static class ConservativeEngine extends ArithmeticEngine {
        private static final int INTEGER = 0;
        private static final int LONG = 1;
        private static final int FLOAT = 2;
        private static final int DOUBLE = 3;
        private static final int BIGINTEGER = 4;
        private static final int BIGDECIMAL = 5;
        private static final Map classCodes = createClassCodesMap();

        @Override // freemarker.core.ArithmeticEngine
        public int compareNumbers(Number first, Number second) throws TemplateException {
            switch (getCommonClassCode(first, second)) {
                case 0:
                    int n1 = first.intValue();
                    int n2 = second.intValue();
                    if (n1 < n2) {
                        return -1;
                    }
                    return n1 == n2 ? 0 : 1;
                case 1:
                    long n12 = first.longValue();
                    long n22 = second.longValue();
                    if (n12 < n22) {
                        return -1;
                    }
                    return n12 == n22 ? 0 : 1;
                case 2:
                    float n13 = first.floatValue();
                    float n23 = second.floatValue();
                    if (n13 < n23) {
                        return -1;
                    }
                    return n13 == n23 ? 0 : 1;
                case 3:
                    double n14 = first.doubleValue();
                    double n24 = second.doubleValue();
                    if (n14 < n24) {
                        return -1;
                    }
                    return n14 == n24 ? 0 : 1;
                case 4:
                    BigInteger n15 = toBigInteger(first);
                    BigInteger n25 = toBigInteger(second);
                    return n15.compareTo(n25);
                case 5:
                    BigDecimal n16 = ArithmeticEngine.toBigDecimal(first);
                    BigDecimal n26 = ArithmeticEngine.toBigDecimal(second);
                    return n16.compareTo(n26);
                default:
                    throw new Error();
            }
        }

        @Override // freemarker.core.ArithmeticEngine
        public Number add(Number first, Number second) throws TemplateException {
            switch (getCommonClassCode(first, second)) {
                case 0:
                    int n1 = first.intValue();
                    int n2 = second.intValue();
                    int n = n1 + n2;
                    return ((n ^ n1) >= 0 || (n ^ n2) >= 0) ? new Integer(n) : new Long(n1 + n2);
                case 1:
                    long n12 = first.longValue();
                    long n22 = second.longValue();
                    long n3 = n12 + n22;
                    return ((n3 ^ n12) >= 0 || (n3 ^ n22) >= 0) ? new Long(n3) : toBigInteger(first).add(toBigInteger(second));
                case 2:
                    return new Float(first.floatValue() + second.floatValue());
                case 3:
                    return new Double(first.doubleValue() + second.doubleValue());
                case 4:
                    BigInteger n13 = toBigInteger(first);
                    BigInteger n23 = toBigInteger(second);
                    return n13.add(n23);
                case 5:
                    BigDecimal n14 = ArithmeticEngine.toBigDecimal(first);
                    BigDecimal n24 = ArithmeticEngine.toBigDecimal(second);
                    return n14.add(n24);
                default:
                    throw new Error();
            }
        }

        @Override // freemarker.core.ArithmeticEngine
        public Number subtract(Number first, Number second) throws TemplateException {
            switch (getCommonClassCode(first, second)) {
                case 0:
                    int n1 = first.intValue();
                    int n2 = second.intValue();
                    int n = n1 - n2;
                    return ((n ^ n1) >= 0 || (n ^ (n2 ^ (-1))) >= 0) ? new Integer(n) : new Long(n1 - n2);
                case 1:
                    long n12 = first.longValue();
                    long n22 = second.longValue();
                    long n3 = n12 - n22;
                    return ((n3 ^ n12) >= 0 || (n3 ^ (n22 ^ (-1))) >= 0) ? new Long(n3) : toBigInteger(first).subtract(toBigInteger(second));
                case 2:
                    return new Float(first.floatValue() - second.floatValue());
                case 3:
                    return new Double(first.doubleValue() - second.doubleValue());
                case 4:
                    BigInteger n13 = toBigInteger(first);
                    BigInteger n23 = toBigInteger(second);
                    return n13.subtract(n23);
                case 5:
                    BigDecimal n14 = ArithmeticEngine.toBigDecimal(first);
                    BigDecimal n24 = ArithmeticEngine.toBigDecimal(second);
                    return n14.subtract(n24);
                default:
                    throw new Error();
            }
        }

        @Override // freemarker.core.ArithmeticEngine
        public Number multiply(Number first, Number second) throws TemplateException {
            switch (getCommonClassCode(first, second)) {
                case 0:
                    int n1 = first.intValue();
                    int n2 = second.intValue();
                    int n = n1 * n2;
                    return (n1 == 0 || n / n1 == n2) ? new Integer(n) : new Long(n1 * n2);
                case 1:
                    long n12 = first.longValue();
                    long n22 = second.longValue();
                    long n3 = n12 * n22;
                    return (n12 == 0 || n3 / n12 == n22) ? new Long(n3) : toBigInteger(first).multiply(toBigInteger(second));
                case 2:
                    return new Float(first.floatValue() * second.floatValue());
                case 3:
                    return new Double(first.doubleValue() * second.doubleValue());
                case 4:
                    BigInteger n13 = toBigInteger(first);
                    BigInteger n23 = toBigInteger(second);
                    return n13.multiply(n23);
                case 5:
                    BigDecimal n14 = ArithmeticEngine.toBigDecimal(first);
                    BigDecimal n24 = ArithmeticEngine.toBigDecimal(second);
                    BigDecimal r = n14.multiply(n24);
                    return r.scale() > this.maxScale ? r.setScale(this.maxScale, this.roundingPolicy) : r;
                default:
                    throw new Error();
            }
        }

        @Override // freemarker.core.ArithmeticEngine
        public Number divide(Number first, Number second) throws TemplateException {
            switch (getCommonClassCode(first, second)) {
                case 0:
                    int n1 = first.intValue();
                    int n2 = second.intValue();
                    if (n1 % n2 == 0) {
                        return new Integer(n1 / n2);
                    }
                    return new Double(n1 / n2);
                case 1:
                    long n12 = first.longValue();
                    long n22 = second.longValue();
                    if (n12 % n22 == 0) {
                        return new Long(n12 / n22);
                    }
                    return new Double(n12 / n22);
                case 2:
                    return new Float(first.floatValue() / second.floatValue());
                case 3:
                    return new Double(first.doubleValue() / second.doubleValue());
                case 4:
                    BigInteger n13 = toBigInteger(first);
                    BigInteger n23 = toBigInteger(second);
                    BigInteger[] divmod = n13.divideAndRemainder(n23);
                    if (divmod[1].equals(BigInteger.ZERO)) {
                        return divmod[0];
                    }
                    BigDecimal bd1 = new BigDecimal(n13);
                    BigDecimal bd2 = new BigDecimal(n23);
                    return bd1.divide(bd2, this.minScale, this.roundingPolicy);
                case 5:
                    BigDecimal n14 = ArithmeticEngine.toBigDecimal(first);
                    BigDecimal n24 = ArithmeticEngine.toBigDecimal(second);
                    int scale1 = n14.scale();
                    int scale2 = n24.scale();
                    int scale = Math.max(scale1, scale2);
                    return n14.divide(n24, Math.max(this.minScale, scale), this.roundingPolicy);
                default:
                    throw new Error();
            }
        }

        @Override // freemarker.core.ArithmeticEngine
        public Number modulus(Number first, Number second) throws TemplateException {
            switch (getCommonClassCode(first, second)) {
                case 0:
                    return new Integer(first.intValue() % second.intValue());
                case 1:
                    return new Long(first.longValue() % second.longValue());
                case 2:
                    return new Float(first.floatValue() % second.floatValue());
                case 3:
                    return new Double(first.doubleValue() % second.doubleValue());
                case 4:
                    BigInteger n1 = toBigInteger(first);
                    BigInteger n2 = toBigInteger(second);
                    return n1.mod(n2);
                case 5:
                    throw new _MiscTemplateException("Can't calculate remainder on BigDecimals");
                default:
                    throw new Error();
            }
        }

        @Override // freemarker.core.ArithmeticEngine
        public Number toNumber(String s) {
            return OptimizerUtil.optimizeNumberRepresentation(new BigDecimal(s));
        }

        private static Map createClassCodesMap() {
            Class cls;
            Class cls2;
            Class cls3;
            Class cls4;
            Class cls5;
            Class cls6;
            Class cls7;
            Class cls8;
            Map map = new HashMap(17);
            Integer intcode = new Integer(0);
            if (ArithmeticEngine.class$java$lang$Byte == null) {
                cls = ArithmeticEngine.class$("java.lang.Byte");
                ArithmeticEngine.class$java$lang$Byte = cls;
            } else {
                cls = ArithmeticEngine.class$java$lang$Byte;
            }
            map.put(cls, intcode);
            if (ArithmeticEngine.class$java$lang$Short == null) {
                cls2 = ArithmeticEngine.class$("java.lang.Short");
                ArithmeticEngine.class$java$lang$Short = cls2;
            } else {
                cls2 = ArithmeticEngine.class$java$lang$Short;
            }
            map.put(cls2, intcode);
            if (ArithmeticEngine.class$java$lang$Integer == null) {
                cls3 = ArithmeticEngine.class$("java.lang.Integer");
                ArithmeticEngine.class$java$lang$Integer = cls3;
            } else {
                cls3 = ArithmeticEngine.class$java$lang$Integer;
            }
            map.put(cls3, intcode);
            if (ArithmeticEngine.class$java$lang$Long == null) {
                cls4 = ArithmeticEngine.class$("java.lang.Long");
                ArithmeticEngine.class$java$lang$Long = cls4;
            } else {
                cls4 = ArithmeticEngine.class$java$lang$Long;
            }
            map.put(cls4, new Integer(1));
            if (ArithmeticEngine.class$java$lang$Float == null) {
                cls5 = ArithmeticEngine.class$("java.lang.Float");
                ArithmeticEngine.class$java$lang$Float = cls5;
            } else {
                cls5 = ArithmeticEngine.class$java$lang$Float;
            }
            map.put(cls5, new Integer(2));
            if (ArithmeticEngine.class$java$lang$Double == null) {
                cls6 = ArithmeticEngine.class$("java.lang.Double");
                ArithmeticEngine.class$java$lang$Double = cls6;
            } else {
                cls6 = ArithmeticEngine.class$java$lang$Double;
            }
            map.put(cls6, new Integer(3));
            if (ArithmeticEngine.class$java$math$BigInteger == null) {
                cls7 = ArithmeticEngine.class$("java.math.BigInteger");
                ArithmeticEngine.class$java$math$BigInteger = cls7;
            } else {
                cls7 = ArithmeticEngine.class$java$math$BigInteger;
            }
            map.put(cls7, new Integer(4));
            if (ArithmeticEngine.class$java$math$BigDecimal == null) {
                cls8 = ArithmeticEngine.class$("java.math.BigDecimal");
                ArithmeticEngine.class$java$math$BigDecimal = cls8;
            } else {
                cls8 = ArithmeticEngine.class$java$math$BigDecimal;
            }
            map.put(cls8, new Integer(5));
            return map;
        }

        private static int getClassCode(Number num) throws TemplateException {
            try {
                return ((Integer) classCodes.get(num.getClass())).intValue();
            } catch (NullPointerException e) {
                if (num == null) {
                    throw new _MiscTemplateException("The Number object was null.");
                }
                throw new _MiscTemplateException(new Object[]{"Unknown number type ", num.getClass().getName()});
            }
        }

        private static int getCommonClassCode(Number num1, Number num2) throws TemplateException {
            int c1 = getClassCode(num1);
            int c2 = getClassCode(num2);
            int c = c1 > c2 ? c1 : c2;
            switch (c) {
                case 2:
                    if ((c1 < c2 ? c1 : c2) == 1) {
                        return 3;
                    }
                    break;
                case 4:
                    int min = c1 < c2 ? c1 : c2;
                    if (min == 3 || min == 2) {
                        return 5;
                    }
                    break;
            }
            return c;
        }

        private static BigInteger toBigInteger(Number num) {
            return num instanceof BigInteger ? (BigInteger) num : new BigInteger(num.toString());
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static BigDecimal toBigDecimal(Number num) {
        try {
            return num instanceof BigDecimal ? (BigDecimal) num : new BigDecimal(num.toString());
        } catch (NumberFormatException e) {
            throw new NumberFormatException(new StringBuffer().append("Can't parse this as BigDecimal number: ").append(StringUtil.jQuote(num)).toString());
        }
    }
}
