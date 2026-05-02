.class public Lorg/spongycastle/crypto/tls/AlertDescription;
.super Ljava/lang/Object;
.source "AlertDescription.java"


# static fields
.field public static final access_denied:S = 0x31s

.field public static final bad_certificate:S = 0x2as

.field public static final bad_certificate_hash_value:S = 0x72s

.field public static final bad_certificate_status_response:S = 0x71s

.field public static final bad_record_mac:S = 0x14s

.field public static final certificate_expired:S = 0x2ds

.field public static final certificate_revoked:S = 0x2cs

.field public static final certificate_unknown:S = 0x2es

.field public static final certificate_unobtainable:S = 0x6fs

.field public static final close_notify:S = 0x0s

.field public static final decode_error:S = 0x32s

.field public static final decompression_failure:S = 0x1es

.field public static final decrypt_error:S = 0x33s

.field public static final decryption_failed:S = 0x15s

.field public static final export_restriction:S = 0x3cs

.field public static final handshake_failure:S = 0x28s

.field public static final illegal_parameter:S = 0x2fs

.field public static final inappropriate_fallback:S = 0x56s

.field public static final insufficient_security:S = 0x47s

.field public static final internal_error:S = 0x50s

.field public static final no_certificate:S = 0x29s

.field public static final no_renegotiation:S = 0x64s

.field public static final protocol_version:S = 0x46s

.field public static final record_overflow:S = 0x16s

.field public static final unexpected_message:S = 0xas

.field public static final unknown_ca:S = 0x30s

.field public static final unknown_psk_identity:S = 0x73s

.field public static final unrecognized_name:S = 0x70s

.field public static final unsupported_certificate:S = 0x2bs

.field public static final unsupported_extension:S = 0x6es

.field public static final user_canceled:S = 0x5as


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getName(S)Ljava/lang/String;
    .registers 2
    .param p0, "alertDescription"    # S

    .prologue
    .line 230
    sparse-switch p0, :sswitch_data_64

    .line 295
    const-string v0, "UNKNOWN"

    :goto_5
    return-object v0

    .line 233
    :sswitch_6
    const-string v0, "close_notify"

    goto :goto_5

    .line 235
    :sswitch_9
    const-string v0, "unexpected_message"

    goto :goto_5

    .line 237
    :sswitch_c
    const-string v0, "bad_record_mac"

    goto :goto_5

    .line 239
    :sswitch_f
    const-string v0, "decryption_failed"

    goto :goto_5

    .line 241
    :sswitch_12
    const-string v0, "record_overflow"

    goto :goto_5

    .line 243
    :sswitch_15
    const-string v0, "decompression_failure"

    goto :goto_5

    .line 245
    :sswitch_18
    const-string v0, "handshake_failure"

    goto :goto_5

    .line 247
    :sswitch_1b
    const-string v0, "no_certificate"

    goto :goto_5

    .line 249
    :sswitch_1e
    const-string v0, "bad_certificate"

    goto :goto_5

    .line 251
    :sswitch_21
    const-string v0, "unsupported_certificate"

    goto :goto_5

    .line 253
    :sswitch_24
    const-string v0, "certificate_revoked"

    goto :goto_5

    .line 255
    :sswitch_27
    const-string v0, "certificate_expired"

    goto :goto_5

    .line 257
    :sswitch_2a
    const-string v0, "certificate_unknown"

    goto :goto_5

    .line 259
    :sswitch_2d
    const-string v0, "illegal_parameter"

    goto :goto_5

    .line 261
    :sswitch_30
    const-string v0, "unknown_ca"

    goto :goto_5

    .line 263
    :sswitch_33
    const-string v0, "access_denied"

    goto :goto_5

    .line 265
    :sswitch_36
    const-string v0, "decode_error"

    goto :goto_5

    .line 267
    :sswitch_39
    const-string v0, "decrypt_error"

    goto :goto_5

    .line 269
    :sswitch_3c
    const-string v0, "export_restriction"

    goto :goto_5

    .line 271
    :sswitch_3f
    const-string v0, "protocol_version"

    goto :goto_5

    .line 273
    :sswitch_42
    const-string v0, "insufficient_security"

    goto :goto_5

    .line 275
    :sswitch_45
    const-string v0, "internal_error"

    goto :goto_5

    .line 277
    :sswitch_48
    const-string v0, "user_canceled"

    goto :goto_5

    .line 279
    :sswitch_4b
    const-string v0, "no_renegotiation"

    goto :goto_5

    .line 281
    :sswitch_4e
    const-string v0, "unsupported_extension"

    goto :goto_5

    .line 283
    :sswitch_51
    const-string v0, "certificate_unobtainable"

    goto :goto_5

    .line 285
    :sswitch_54
    const-string v0, "unrecognized_name"

    goto :goto_5

    .line 287
    :sswitch_57
    const-string v0, "bad_certificate_status_response"

    goto :goto_5

    .line 289
    :sswitch_5a
    const-string v0, "bad_certificate_hash_value"

    goto :goto_5

    .line 291
    :sswitch_5d
    const-string v0, "unknown_psk_identity"

    goto :goto_5

    .line 293
    :sswitch_60
    const-string v0, "inappropriate_fallback"

    goto :goto_5

    .line 230
    nop

    :sswitch_data_64
    .sparse-switch
        0x0 -> :sswitch_6
        0xa -> :sswitch_9
        0x14 -> :sswitch_c
        0x15 -> :sswitch_f
        0x16 -> :sswitch_12
        0x1e -> :sswitch_15
        0x28 -> :sswitch_18
        0x29 -> :sswitch_1b
        0x2a -> :sswitch_1e
        0x2b -> :sswitch_21
        0x2c -> :sswitch_24
        0x2d -> :sswitch_27
        0x2e -> :sswitch_2a
        0x2f -> :sswitch_2d
        0x30 -> :sswitch_30
        0x31 -> :sswitch_33
        0x32 -> :sswitch_36
        0x33 -> :sswitch_39
        0x3c -> :sswitch_3c
        0x46 -> :sswitch_3f
        0x47 -> :sswitch_42
        0x50 -> :sswitch_45
        0x56 -> :sswitch_60
        0x5a -> :sswitch_48
        0x64 -> :sswitch_4b
        0x6e -> :sswitch_4e
        0x6f -> :sswitch_51
        0x70 -> :sswitch_54
        0x71 -> :sswitch_57
        0x72 -> :sswitch_5a
        0x73 -> :sswitch_5d
    .end sparse-switch
.end method

.method public static getText(S)Ljava/lang/String;
    .registers 3
    .param p0, "alertDescription"    # S

    .prologue
    .line 301
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lorg/spongycastle/crypto/tls/AlertDescription;->getName(S)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
