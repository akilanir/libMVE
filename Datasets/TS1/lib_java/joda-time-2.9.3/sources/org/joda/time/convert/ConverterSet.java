package org.joda.time.convert;

/* loaded from: joda-time-2.9.3.jar:org/joda/time/convert/ConverterSet.class */
class ConverterSet {
    private final Converter[] iConverters;
    private Entry[] iSelectEntries = new Entry[16];

    ConverterSet(Converter[] converterArr) {
        this.iConverters = converterArr;
    }

    Converter select(Class<?> cls) throws IllegalStateException {
        Entry[] entryArr = this.iSelectEntries;
        int length = entryArr.length;
        int hashCode = cls == null ? 0 : cls.hashCode() & (length - 1);
        while (true) {
            Entry entry = entryArr[hashCode];
            if (entry != null) {
                if (entry.iType == cls) {
                    return entry.iConverter;
                }
                hashCode++;
                if (hashCode >= length) {
                    hashCode = 0;
                }
            } else {
                Converter selectSlow = selectSlow(this, cls);
                Entry entry2 = new Entry(cls, selectSlow);
                Entry[] entryArr2 = (Entry[]) entryArr.clone();
                entryArr2[hashCode] = entry2;
                for (int i = 0; i < length; i++) {
                    if (entryArr2[i] == null) {
                        this.iSelectEntries = entryArr2;
                        return selectSlow;
                    }
                }
                int i2 = length << 1;
                Entry[] entryArr3 = new Entry[i2];
                for (int i3 = 0; i3 < length; i3++) {
                    Entry entry3 = entryArr2[i3];
                    Class<?> cls2 = entry3.iType;
                    int hashCode2 = cls2 == null ? 0 : cls2.hashCode() & (i2 - 1);
                    while (entryArr3[hashCode2] != null) {
                        hashCode2++;
                        if (hashCode2 >= i2) {
                            hashCode2 = 0;
                        }
                    }
                    entryArr3[hashCode2] = entry3;
                }
                this.iSelectEntries = entryArr3;
                return selectSlow;
            }
        }
    }

    int size() {
        return this.iConverters.length;
    }

    void copyInto(Converter[] converterArr) {
        System.arraycopy(this.iConverters, 0, converterArr, 0, this.iConverters.length);
    }

    ConverterSet add(Converter converter, Converter[] converterArr) {
        Converter[] converterArr2 = this.iConverters;
        int length = converterArr2.length;
        for (int i = 0; i < length; i++) {
            Converter converter2 = converterArr2[i];
            if (converter.equals(converter2)) {
                if (converterArr != null) {
                    converterArr[0] = null;
                }
                return this;
            }
            if (converter.getSupportedType() == converter2.getSupportedType()) {
                Converter[] converterArr3 = new Converter[length];
                for (int i2 = 0; i2 < length; i2++) {
                    if (i2 != i) {
                        converterArr3[i2] = converterArr2[i2];
                    } else {
                        converterArr3[i2] = converter;
                    }
                }
                if (converterArr != null) {
                    converterArr[0] = converter2;
                }
                return new ConverterSet(converterArr3);
            }
        }
        Converter[] converterArr4 = new Converter[length + 1];
        System.arraycopy(converterArr2, 0, converterArr4, 0, length);
        converterArr4[length] = converter;
        if (converterArr != null) {
            converterArr[0] = null;
        }
        return new ConverterSet(converterArr4);
    }

    ConverterSet remove(Converter converter, Converter[] converterArr) {
        Converter[] converterArr2 = this.iConverters;
        int length = converterArr2.length;
        for (int i = 0; i < length; i++) {
            if (converter.equals(converterArr2[i])) {
                return remove(i, converterArr);
            }
        }
        if (converterArr != null) {
            converterArr[0] = null;
        }
        return this;
    }

    ConverterSet remove(int i, Converter[] converterArr) {
        Converter[] converterArr2 = this.iConverters;
        int length = converterArr2.length;
        if (i >= length) {
            throw new IndexOutOfBoundsException();
        }
        if (converterArr != null) {
            converterArr[0] = converterArr2[i];
        }
        Converter[] converterArr3 = new Converter[length - 1];
        int i2 = 0;
        for (int i3 = 0; i3 < length; i3++) {
            if (i3 != i) {
                int i4 = i2;
                i2++;
                converterArr3[i4] = converterArr2[i3];
            }
        }
        return new ConverterSet(converterArr3);
    }

    private static Converter selectSlow(ConverterSet converterSet, Class<?> cls) {
        Converter[] converterArr = converterSet.iConverters;
        int length = converterArr.length;
        int i = length;
        while (true) {
            i--;
            if (i >= 0) {
                Converter converter = converterArr[i];
                Class<?> supportedType = converter.getSupportedType();
                if (supportedType == cls) {
                    return converter;
                }
                if (supportedType == null || (cls != null && !supportedType.isAssignableFrom(cls))) {
                    converterSet = converterSet.remove(i, (Converter[]) null);
                    converterArr = converterSet.iConverters;
                    length = converterArr.length;
                }
            } else {
                if (cls == null || length == 0) {
                    return null;
                }
                if (length == 1) {
                    return converterArr[0];
                }
                int i2 = length;
                while (true) {
                    i2--;
                    if (i2 < 0) {
                        break;
                    }
                    Class<?> supportedType2 = converterArr[i2].getSupportedType();
                    int i3 = length;
                    while (true) {
                        i3--;
                        if (i3 >= 0) {
                            if (i3 != i2 && converterArr[i3].getSupportedType().isAssignableFrom(supportedType2)) {
                                converterSet = converterSet.remove(i3, (Converter[]) null);
                                converterArr = converterSet.iConverters;
                                length = converterArr.length;
                                i2 = length - 1;
                            }
                        }
                    }
                }
                if (length == 1) {
                    return converterArr[0];
                }
                StringBuilder sb = new StringBuilder();
                sb.append("Unable to find best converter for type \"");
                sb.append(cls.getName());
                sb.append("\" from remaining set: ");
                for (int i4 = 0; i4 < length; i4++) {
                    Converter converter2 = converterArr[i4];
                    Class<?> supportedType3 = converter2.getSupportedType();
                    sb.append(converter2.getClass().getName());
                    sb.append('[');
                    sb.append(supportedType3 == null ? null : supportedType3.getName());
                    sb.append("], ");
                }
                throw new IllegalStateException(sb.toString());
            }
        }
    }

    /* loaded from: joda-time-2.9.3.jar:org/joda/time/convert/ConverterSet$Entry.class */
    static class Entry {
        final Class<?> iType;
        final Converter iConverter;

        Entry(Class<?> cls, Converter converter) {
            this.iType = cls;
            this.iConverter = converter;
        }
    }
}
