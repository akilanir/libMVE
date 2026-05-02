package org.spongycastle.crypto.tls;

import org.spongycastle.asn1.eac.EACTags;
import org.spongycastle.pqc.math.linearalgebra.Matrix;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/AlertDescription.class */
public class AlertDescription {
    public static final short close_notify = 0;
    public static final short unexpected_message = 10;
    public static final short bad_record_mac = 20;
    public static final short decryption_failed = 21;
    public static final short record_overflow = 22;
    public static final short decompression_failure = 30;
    public static final short handshake_failure = 40;
    public static final short no_certificate = 41;
    public static final short bad_certificate = 42;
    public static final short unsupported_certificate = 43;
    public static final short certificate_revoked = 44;
    public static final short certificate_expired = 45;
    public static final short certificate_unknown = 46;
    public static final short illegal_parameter = 47;
    public static final short unknown_ca = 48;
    public static final short access_denied = 49;
    public static final short decode_error = 50;
    public static final short decrypt_error = 51;
    public static final short export_restriction = 60;
    public static final short protocol_version = 70;
    public static final short insufficient_security = 71;
    public static final short internal_error = 80;
    public static final short user_canceled = 90;
    public static final short no_renegotiation = 100;
    public static final short unsupported_extension = 110;
    public static final short certificate_unobtainable = 111;
    public static final short unrecognized_name = 112;
    public static final short bad_certificate_status_response = 113;
    public static final short bad_certificate_hash_value = 114;
    public static final short unknown_psk_identity = 115;
    public static final short inappropriate_fallback = 86;

    public static String getName(short alertDescription) {
        switch (alertDescription) {
            case 0:
                return "close_notify";
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 23:
            case 24:
            case 25:
            case 26:
            case 27:
            case 28:
            case 29:
            case 31:
            case 32:
            case EACTags.CARDHOLDER_CERTIFICATE /* 33 */:
            case 34:
            case ExtensionType.session_ticket /* 35 */:
            case EACTags.APPLICATION_EXPIRATION_DATE /* 36 */:
            case EACTags.APPLICATION_EFFECTIVE_DATE /* 37 */:
            case 38:
            case 39:
            case CipherSuite.TLS_DH_anon_WITH_AES_128_CBC_SHA /* 52 */:
            case CipherSuite.TLS_RSA_WITH_AES_256_CBC_SHA /* 53 */:
            case CipherSuite.TLS_DH_DSS_WITH_AES_256_CBC_SHA /* 54 */:
            case 55:
            case CipherSuite.TLS_DHE_DSS_WITH_AES_256_CBC_SHA /* 56 */:
            case CipherSuite.TLS_DHE_RSA_WITH_AES_256_CBC_SHA /* 57 */:
            case CipherSuite.TLS_DH_anon_WITH_AES_256_CBC_SHA /* 58 */:
            case CipherSuite.TLS_RSA_WITH_NULL_SHA256 /* 59 */:
            case CipherSuite.TLS_RSA_WITH_AES_256_CBC_SHA256 /* 61 */:
            case CipherSuite.TLS_DH_DSS_WITH_AES_128_CBC_SHA256 /* 62 */:
            case 63:
            case 64:
            case 65:
            case 66:
            case 67:
            case 68:
            case 69:
            case EACTags.STATUS_INFORMATION /* 72 */:
            case 73:
            case 74:
            case 75:
            case 76:
            case EACTags.EXTENDED_HEADER_LIST /* 77 */:
            case 78:
            case EACTags.APPLICATION_IDENTIFIER /* 79 */:
            case EACTags.FILE_REFERENCE /* 81 */:
            case 82:
            case EACTags.DISCRETIONARY_DATA /* 83 */:
            case EACTags.OFFSET_DATA_OBJECT /* 84 */:
            case Matrix.MATRIX_TYPE_RANDOM_UT /* 85 */:
            case EACTags.TRACK2_APPLICATION /* 87 */:
            case EACTags.TRACK3_APPLICATION /* 88 */:
            case EACTags.CARD_EXPIRATION_DATA /* 89 */:
            case EACTags.NAME /* 91 */:
            case EACTags.TAG_LIST /* 92 */:
            case EACTags.HEADER_LIST /* 93 */:
            case EACTags.LOGIN_DATA /* 94 */:
            case 95:
            case 96:
            case EACTags.APPLICATION_TEMPLATE /* 97 */:
            case EACTags.FCP_TEMPLATE /* 98 */:
            case EACTags.WRAPPER /* 99 */:
            case 101:
            case 102:
            case 103:
            case 104:
            case CipherSuite.TLS_DH_RSA_WITH_AES_256_CBC_SHA256 /* 105 */:
            case 106:
            case 107:
            case 108:
            case 109:
            default:
                return "UNKNOWN";
            case 10:
                return "unexpected_message";
            case 20:
                return "bad_record_mac";
            case 21:
                return "decryption_failed";
            case 22:
                return "record_overflow";
            case 30:
                return "decompression_failure";
            case 40:
                return "handshake_failure";
            case 41:
                return "no_certificate";
            case bad_certificate /* 42 */:
                return "bad_certificate";
            case unsupported_certificate /* 43 */:
                return "unsupported_certificate";
            case 44:
                return "certificate_revoked";
            case 45:
                return "certificate_expired";
            case 46:
                return "certificate_unknown";
            case 47:
                return "illegal_parameter";
            case 48:
                return "unknown_ca";
            case 49:
                return "access_denied";
            case 50:
                return "decode_error";
            case 51:
                return "decrypt_error";
            case 60:
                return "export_restriction";
            case 70:
                return "protocol_version";
            case 71:
                return "insufficient_security";
            case 80:
                return "internal_error";
            case 86:
                return "inappropriate_fallback";
            case 90:
                return "user_canceled";
            case 100:
                return "no_renegotiation";
            case 110:
                return "unsupported_extension";
            case 111:
                return "certificate_unobtainable";
            case unrecognized_name /* 112 */:
                return "unrecognized_name";
            case bad_certificate_status_response /* 113 */:
                return "bad_certificate_status_response";
            case bad_certificate_hash_value /* 114 */:
                return "bad_certificate_hash_value";
            case 115:
                return "unknown_psk_identity";
        }
    }

    public static String getText(short alertDescription) {
        return getName(alertDescription) + "(" + ((int) alertDescription) + ")";
    }
}
