package org.spongycastle.asn1;

import java.io.IOException;
import org.spongycastle.asn1.eac.EACTags;
import org.spongycastle.crypto.tls.AlertDescription;
import org.spongycastle.crypto.tls.CipherSuite;
import org.spongycastle.crypto.tls.ExtensionType;
import org.spongycastle.util.Arrays;
import org.spongycastle.util.Strings;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/asn1/DERPrintableString.class */
public class DERPrintableString extends ASN1Primitive implements ASN1String {
    private final byte[] string;

    public static DERPrintableString getInstance(Object obj) {
        if (obj == null || (obj instanceof DERPrintableString)) {
            return (DERPrintableString) obj;
        }
        if (obj instanceof byte[]) {
            try {
                return (DERPrintableString) fromByteArray((byte[]) obj);
            } catch (Exception e) {
                throw new IllegalArgumentException("encoding error in getInstance: " + e.toString());
            }
        }
        throw new IllegalArgumentException("illegal object in getInstance: " + obj.getClass().getName());
    }

    public static DERPrintableString getInstance(ASN1TaggedObject obj, boolean explicit) {
        ASN1Primitive o = obj.getObject();
        if (explicit || (o instanceof DERPrintableString)) {
            return getInstance(o);
        }
        return new DERPrintableString(ASN1OctetString.getInstance(o).getOctets());
    }

    DERPrintableString(byte[] string) {
        this.string = string;
    }

    public DERPrintableString(String string) {
        this(string, false);
    }

    public DERPrintableString(String string, boolean validate) {
        if (validate && !isPrintableString(string)) {
            throw new IllegalArgumentException("string contains illegal characters");
        }
        this.string = Strings.toByteArray(string);
    }

    @Override // org.spongycastle.asn1.ASN1String
    public String getString() {
        return Strings.fromByteArray(this.string);
    }

    public byte[] getOctets() {
        return Arrays.clone(this.string);
    }

    @Override // org.spongycastle.asn1.ASN1Primitive
    boolean isConstructed() {
        return false;
    }

    @Override // org.spongycastle.asn1.ASN1Primitive
    int encodedLength() {
        return 1 + StreamUtil.calculateBodyLength(this.string.length) + this.string.length;
    }

    @Override // org.spongycastle.asn1.ASN1Primitive
    void encode(ASN1OutputStream out) throws IOException {
        out.writeEncoded(19, this.string);
    }

    @Override // org.spongycastle.asn1.ASN1Primitive, org.spongycastle.asn1.ASN1Object
    public int hashCode() {
        return Arrays.hashCode(this.string);
    }

    @Override // org.spongycastle.asn1.ASN1Primitive
    boolean asn1Equals(ASN1Primitive o) {
        if (!(o instanceof DERPrintableString)) {
            return false;
        }
        DERPrintableString s = (DERPrintableString) o;
        return Arrays.areEqual(this.string, s.string);
    }

    public String toString() {
        return getString();
    }

    public static boolean isPrintableString(String str) {
        for (int i = str.length() - 1; i >= 0; i--) {
            char ch = str.charAt(i);
            if (ch > 127) {
                return false;
            }
            if (('a' > ch || ch > 'z') && (('A' > ch || ch > 'Z') && ('0' > ch || ch > '9'))) {
                switch (ch) {
                    case ' ':
                    case '\'':
                    case '(':
                    case ')':
                    case AlertDescription.unsupported_certificate /* 43 */:
                    case ',':
                    case '-':
                    case '.':
                    case '/':
                    case CipherSuite.TLS_DH_anon_WITH_AES_256_CBC_SHA /* 58 */:
                    case CipherSuite.TLS_RSA_WITH_AES_256_CBC_SHA256 /* 61 */:
                    case '?':
                        break;
                    case EACTags.CARDHOLDER_CERTIFICATE /* 33 */:
                    case '\"':
                    case ExtensionType.session_ticket /* 35 */:
                    case EACTags.APPLICATION_EXPIRATION_DATE /* 36 */:
                    case EACTags.APPLICATION_EFFECTIVE_DATE /* 37 */:
                    case '&':
                    case AlertDescription.bad_certificate /* 42 */:
                    case '0':
                    case '1':
                    case '2':
                    case '3':
                    case CipherSuite.TLS_DH_anon_WITH_AES_128_CBC_SHA /* 52 */:
                    case CipherSuite.TLS_RSA_WITH_AES_256_CBC_SHA /* 53 */:
                    case CipherSuite.TLS_DH_DSS_WITH_AES_256_CBC_SHA /* 54 */:
                    case '7':
                    case CipherSuite.TLS_DHE_DSS_WITH_AES_256_CBC_SHA /* 56 */:
                    case CipherSuite.TLS_DHE_RSA_WITH_AES_256_CBC_SHA /* 57 */:
                    case CipherSuite.TLS_RSA_WITH_NULL_SHA256 /* 59 */:
                    case '<':
                    case CipherSuite.TLS_DH_DSS_WITH_AES_128_CBC_SHA256 /* 62 */:
                    default:
                        return false;
                }
            }
        }
        return true;
    }
}
