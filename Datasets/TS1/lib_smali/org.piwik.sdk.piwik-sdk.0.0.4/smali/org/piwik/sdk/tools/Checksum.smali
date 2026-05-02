.class public Lorg/piwik/sdk/tools/Checksum;
.super Ljava/lang/Object;
.source "Checksum.java"


# static fields
.field private static final HEXES:Ljava/lang/String; = "0123456789ABCDEF"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getHex([B)Ljava/lang/String;
    .registers 7
    .param p0, "raw"    # [B

    .line 28
    if-nez p0, :cond_4

    .line 29
    const/4 v0, 0x0

    return-object v0

    .line 30
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v1, p0

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 31
    .local v0, "hex":Ljava/lang/StringBuilder;
    array-length v1, p0

    const/4 v2, 0x0

    :goto_e
    if-ge v2, v1, :cond_2d

    aget-byte v3, p0, v2

    .line 32
    .local v3, "b":B
    const-string v4, "0123456789ABCDEF"

    and-int/lit16 v5, v3, 0xf0

    shr-int/lit8 v5, v5, 0x4

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v4, "0123456789ABCDEF"

    and-int/lit8 v5, v3, 0xf

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 31
    .end local v3    # "b":B
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 33
    :cond_2d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getMD5Checksum(Ljava/io/File;)Ljava/lang/String;
    .registers 6
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 58
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-nez v0, :cond_8

    .line 59
    const/4 v0, 0x0

    return-object v0

    .line 60
    :cond_8
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 61
    .local v0, "fis":Ljava/io/InputStream;
    const/16 v1, 0x400

    new-array v1, v1, [B

    .line 62
    .local v1, "buffer":[B
    const-string v2, "MD5"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 65
    .local v2, "complete":Ljava/security/MessageDigest;
    :cond_17
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .line 66
    .local v3, "numRead":I
    if-lez v3, :cond_21

    .line 67
    const/4 v4, 0x0

    invoke-virtual {v2, v1, v4, v3}, Ljava/security/MessageDigest;->update([BII)V

    .line 68
    :cond_21
    const/4 v4, -0x1

    if-ne v3, v4, :cond_17

    .line 69
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 70
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    invoke-static {v4}, Lorg/piwik/sdk/tools/Checksum;->getHex([B)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public static getMD5Checksum(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 44
    const-string v0, "MD5"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 45
    .local v0, "digest":Ljava/security/MessageDigest;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 46
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    .line 47
    .local v1, "messageDigest":[B
    invoke-static {v1}, Lorg/piwik/sdk/tools/Checksum;->getHex([B)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
