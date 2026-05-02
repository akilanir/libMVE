.class public Lcom/jcraft/jsch/jce/PBKDF;
.super Ljava/lang/Object;
.source "PBKDF.java"

# interfaces
.implements Lcom/jcraft/jsch/PBKDF;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getKey([B[BII)[B
    .registers 11
    .param p1, "_pass"    # [B
    .param p2, "salt"    # [B
    .param p3, "iterations"    # I
    .param p4, "size"    # I

    .prologue
    .line 41
    array-length v5, p1

    new-array v2, v5, [C

    .line 42
    .local v2, "pass":[C
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v5, p1

    if-ge v0, v5, :cond_11

    .line 43
    aget-byte v5, p1, v0

    and-int/lit16 v5, v5, 0xff

    int-to-char v5, v5

    aput-char v5, v2, v0

    .line 42
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 46
    :cond_11
    :try_start_11
    new-instance v4, Ljavax/crypto/spec/PBEKeySpec;

    mul-int/lit8 v5, p4, 0x8

    invoke-direct {v4, v2, p2, p3, v5}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C[BII)V

    .line 48
    .local v4, "spec":Ljavax/crypto/spec/PBEKeySpec;
    const-string v5, "PBKDF2WithHmacSHA1"

    invoke-static {v5}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v3

    .line 50
    .local v3, "skf":Ljavax/crypto/SecretKeyFactory;
    invoke-virtual {v3, v4}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v5

    invoke-interface {v5}, Ljavax/crypto/SecretKey;->getEncoded()[B
    :try_end_25
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_11 .. :try_end_25} :catch_2a
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_11 .. :try_end_25} :catch_27

    move-result-object v1

    .line 57
    .end local v3    # "skf":Ljavax/crypto/SecretKeyFactory;
    .end local v4    # "spec":Ljavax/crypto/spec/PBEKeySpec;
    :goto_26
    return-object v1

    .line 55
    :catch_27
    move-exception v5

    .line 57
    :goto_28
    const/4 v1, 0x0

    goto :goto_26

    .line 53
    :catch_2a
    move-exception v5

    goto :goto_28
.end method
