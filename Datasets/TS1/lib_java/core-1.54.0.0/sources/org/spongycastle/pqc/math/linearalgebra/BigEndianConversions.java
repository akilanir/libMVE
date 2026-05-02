package org.spongycastle.pqc.math.linearalgebra;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/pqc/math/linearalgebra/BigEndianConversions.class */
public final class BigEndianConversions {
    private BigEndianConversions() {
    }

    public static byte[] I2OSP(int x) {
        byte[] result = {(byte) (x >>> 24), (byte) (x >>> 16), (byte) (x >>> 8), (byte) x};
        return result;
    }

    public static byte[] I2OSP(int x, int oLen) throws ArithmeticException {
        if (x < 0) {
            return null;
        }
        int octL = IntegerFunctions.ceilLog256(x);
        if (octL > oLen) {
            throw new ArithmeticException("Cannot encode given integer into specified number of octets.");
        }
        byte[] result = new byte[oLen];
        for (int i = oLen - 1; i >= oLen - octL; i--) {
            result[i] = (byte) (x >>> (8 * ((oLen - 1) - i)));
        }
        return result;
    }

    public static void I2OSP(int input, byte[] output, int outOff) {
        int outOff2 = outOff + 1;
        output[outOff] = (byte) (input >>> 24);
        int outOff3 = outOff2 + 1;
        output[outOff2] = (byte) (input >>> 16);
        output[outOff3] = (byte) (input >>> 8);
        output[outOff3 + 1] = (byte) input;
    }

    public static byte[] I2OSP(long input) {
        byte[] output = {(byte) (input >>> 56), (byte) (input >>> 48), (byte) (input >>> 40), (byte) (input >>> 32), (byte) (input >>> 24), (byte) (input >>> 16), (byte) (input >>> 8), (byte) input};
        return output;
    }

    public static void I2OSP(long input, byte[] output, int outOff) {
        int outOff2 = outOff + 1;
        output[outOff] = (byte) (input >>> 56);
        int outOff3 = outOff2 + 1;
        output[outOff2] = (byte) (input >>> 48);
        int outOff4 = outOff3 + 1;
        output[outOff3] = (byte) (input >>> 40);
        int outOff5 = outOff4 + 1;
        output[outOff4] = (byte) (input >>> 32);
        int outOff6 = outOff5 + 1;
        output[outOff5] = (byte) (input >>> 24);
        int outOff7 = outOff6 + 1;
        output[outOff6] = (byte) (input >>> 16);
        output[outOff7] = (byte) (input >>> 8);
        output[outOff7 + 1] = (byte) input;
    }

    public static void I2OSP(int input, byte[] output, int outOff, int length) {
        for (int i = length - 1; i >= 0; i--) {
            output[outOff + i] = (byte) (input >>> (8 * ((length - 1) - i)));
        }
    }

    public static int OS2IP(byte[] input) {
        if (input.length > 4) {
            throw new ArithmeticException("invalid input length");
        }
        if (input.length == 0) {
            return 0;
        }
        int result = 0;
        for (int j = 0; j < input.length; j++) {
            result |= (input[j] & 255) << (8 * ((input.length - 1) - j));
        }
        return result;
    }

    public static int OS2IP(byte[] input, int inOff) {
        int inOff2 = inOff + 1;
        int result = (input[inOff] & 255) << 24;
        int inOff3 = inOff2 + 1;
        return result | ((input[inOff2] & 255) << 16) | ((input[inOff3] & 255) << 8) | (input[inOff3 + 1] & 255);
    }

    public static int OS2IP(byte[] input, int inOff, int inLen) {
        if (input.length == 0 || input.length < (inOff + inLen) - 1) {
            return 0;
        }
        int result = 0;
        for (int j = 0; j < inLen; j++) {
            result |= (input[inOff + j] & 255) << (8 * ((inLen - j) - 1));
        }
        return result;
    }

    public static long OS2LIP(byte[] input, int inOff) {
        long result = (input[inOff] & 255) << 56;
        long result2 = result | ((input[r8] & 255) << 48);
        long result3 = result2 | ((input[r8] & 255) << 40);
        long result4 = result3 | ((input[r8] & 255) << 32);
        long result5 = result4 | ((input[r8] & 255) << 24);
        int inOff2 = inOff + 1 + 1 + 1 + 1 + 1 + 1;
        return result5 | ((input[r8] & 255) << 16) | ((input[inOff2] & 255) << 8) | (input[inOff2 + 1] & 255);
    }

    public static byte[] toByteArray(int[] input) {
        byte[] result = new byte[input.length << 2];
        for (int i = 0; i < input.length; i++) {
            I2OSP(input[i], result, i << 2);
        }
        return result;
    }

    public static byte[] toByteArray(int[] input, int length) {
        int intLen = input.length;
        byte[] result = new byte[length];
        int index = 0;
        int i = 0;
        while (i <= intLen - 2) {
            I2OSP(input[i], result, index);
            i++;
            index += 4;
        }
        I2OSP(input[intLen - 1], result, index, length - index);
        return result;
    }

    public static int[] toIntArray(byte[] input) {
        int intLen = (input.length + 3) / 4;
        int lastLen = input.length & 3;
        int[] result = new int[intLen];
        int index = 0;
        int i = 0;
        while (i <= intLen - 2) {
            result[i] = OS2IP(input, index);
            i++;
            index += 4;
        }
        if (lastLen != 0) {
            result[intLen - 1] = OS2IP(input, index, lastLen);
        } else {
            result[intLen - 1] = OS2IP(input, index);
        }
        return result;
    }
}
