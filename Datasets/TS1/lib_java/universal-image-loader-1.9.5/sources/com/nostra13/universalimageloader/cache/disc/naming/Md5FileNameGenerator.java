package com.nostra13.universalimageloader.cache.disc.naming;

import com.nostra13.universalimageloader.utils.L;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/* loaded from: universal-image-loader-1.9.5.jar:com/nostra13/universalimageloader/cache/disc/naming/Md5FileNameGenerator.class */
public class Md5FileNameGenerator implements FileNameGenerator {
    private static final String HASH_ALGORITHM = "MD5";
    private static final int RADIX = 36;

    @Override // com.nostra13.universalimageloader.cache.disc.naming.FileNameGenerator
    public String generate(String imageUri) {
        byte[] md5 = getMD5(imageUri.getBytes());
        BigInteger bi = new BigInteger(md5).abs();
        return bi.toString(RADIX);
    }

    private byte[] getMD5(byte[] data) {
        byte[] hash = null;
        try {
            MessageDigest digest = MessageDigest.getInstance(HASH_ALGORITHM);
            digest.update(data);
            hash = digest.digest();
        } catch (NoSuchAlgorithmException e) {
            L.e(e);
        }
        return hash;
    }
}
