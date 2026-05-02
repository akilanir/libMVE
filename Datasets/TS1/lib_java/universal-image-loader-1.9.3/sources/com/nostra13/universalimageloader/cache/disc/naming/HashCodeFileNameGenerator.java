package com.nostra13.universalimageloader.cache.disc.naming;

/* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/cache/disc/naming/HashCodeFileNameGenerator.class */
public class HashCodeFileNameGenerator implements FileNameGenerator {
    @Override // com.nostra13.universalimageloader.cache.disc.naming.FileNameGenerator
    public String generate(String imageUri) {
        return String.valueOf(imageUri.hashCode());
    }
}
