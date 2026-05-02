package org.apache.commons.beanutils;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/ConvertUtils.class */
public class ConvertUtils {
    public static boolean getDefaultBoolean() {
        return ConvertUtilsBean.getInstance().getDefaultBoolean();
    }

    public static void setDefaultBoolean(boolean newDefaultBoolean) {
        ConvertUtilsBean.getInstance().setDefaultBoolean(newDefaultBoolean);
    }

    public static byte getDefaultByte() {
        return ConvertUtilsBean.getInstance().getDefaultByte();
    }

    public static void setDefaultByte(byte newDefaultByte) {
        ConvertUtilsBean.getInstance().setDefaultByte(newDefaultByte);
    }

    public static char getDefaultCharacter() {
        return ConvertUtilsBean.getInstance().getDefaultCharacter();
    }

    public static void setDefaultCharacter(char newDefaultCharacter) {
        ConvertUtilsBean.getInstance().setDefaultCharacter(newDefaultCharacter);
    }

    public static double getDefaultDouble() {
        return ConvertUtilsBean.getInstance().getDefaultDouble();
    }

    public static void setDefaultDouble(double newDefaultDouble) {
        ConvertUtilsBean.getInstance().setDefaultDouble(newDefaultDouble);
    }

    public static float getDefaultFloat() {
        return ConvertUtilsBean.getInstance().getDefaultFloat();
    }

    public static void setDefaultFloat(float newDefaultFloat) {
        ConvertUtilsBean.getInstance().setDefaultFloat(newDefaultFloat);
    }

    public static int getDefaultInteger() {
        return ConvertUtilsBean.getInstance().getDefaultInteger();
    }

    public static void setDefaultInteger(int newDefaultInteger) {
        ConvertUtilsBean.getInstance().setDefaultInteger(newDefaultInteger);
    }

    public static long getDefaultLong() {
        return ConvertUtilsBean.getInstance().getDefaultLong();
    }

    public static void setDefaultLong(long newDefaultLong) {
        ConvertUtilsBean.getInstance().setDefaultLong(newDefaultLong);
    }

    public static short getDefaultShort() {
        return ConvertUtilsBean.getInstance().getDefaultShort();
    }

    public static void setDefaultShort(short newDefaultShort) {
        ConvertUtilsBean.getInstance().setDefaultShort(newDefaultShort);
    }

    public static String convert(Object value) {
        return ConvertUtilsBean.getInstance().convert(value);
    }

    public static Object convert(String value, Class clazz) {
        return ConvertUtilsBean.getInstance().convert(value, clazz);
    }

    public static Object convert(String[] values, Class clazz) {
        return ConvertUtilsBean.getInstance().convert(values, clazz);
    }

    public static Object convert(Object value, Class targetType) {
        return ConvertUtilsBean.getInstance().convert(value, targetType);
    }

    public static void deregister() {
        ConvertUtilsBean.getInstance().deregister();
    }

    public static void deregister(Class clazz) {
        ConvertUtilsBean.getInstance().deregister(clazz);
    }

    public static Converter lookup(Class clazz) {
        return ConvertUtilsBean.getInstance().lookup(clazz);
    }

    public static Converter lookup(Class sourceType, Class targetType) {
        return ConvertUtilsBean.getInstance().lookup(sourceType, targetType);
    }

    public static void register(Converter converter, Class clazz) {
        ConvertUtilsBean.getInstance().register(converter, clazz);
    }
}
