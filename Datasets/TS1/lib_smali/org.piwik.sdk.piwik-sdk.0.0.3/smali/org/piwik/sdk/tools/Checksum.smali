.class public Lorg/piwik/sdk/tools/Checksum;
.super Ljava/lang/Object;
.source "Checksum.java"


# static fields
.field private static final HEXES:Ljava/lang/String; = "0123456789ABCDEF"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getHex([B)Ljava/lang/String;
    .registers 9
    .param p0, "raw"    # [B

    .prologue
    .line 28
    if-nez p0, :cond_4

    .line 29
    const/4 v5, 0x0

    .line 33
    :goto_3
    return-object v5

    .line 30
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    array-length v5, p0

    mul-int/lit8 v5, v5, 0x2

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 31
    .local v2, "hex":Ljava/lang/StringBuilder;
    move-object v0, p0

    .local v0, "arr$":[B
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_f
    if-ge v3, v4, :cond_2f

    aget-byte v1, v0, v3

    .line 32
    .local v1, "b":B
    const-string v5, "0123456789ABCDEF"

    and-int/lit16 v6, v1, 0xf0

    shr-int/lit8 v6, v6, 0x4

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "0123456789ABCDEF"

    and-int/lit8 v7, v1, 0xf

    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 31
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 33
    .end local v1    # "b":B
    :cond_2f
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_3
.end method

.method public static getMD5Checksum(Ljava/io/File;)Ljava/lang/String;
    .registers 6
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 58
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v4

    if-nez v4, :cond_8

    .line 59
    const/4 v4, 0x0

    .line 70
    :goto_7
    return-object v4

    .line 60
    :cond_8
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 61
    .local v2, "fis":Ljava/io/InputStream;
    const/16 v4, 0x400

    new-array v0, v4, [B

    .line 62
    .local v0, "buffer":[B
    const-string v4, "MD5"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 65
    .local v1, "complete":Ljava/security/MessageDigest;
    :cond_17
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .line 66
    .local v3, "numRead":I
    if-lez v3, :cond_21

    .line 67
    const/4 v4, 0x0

    invoke-virtual {v1, v0, v4, v3}, Ljava/security/MessageDigest;->update([BII)V

    .line 68
    :cond_21
    const/4 v4, -0x1

    if-ne v3, v4, :cond_17

    .line 69
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 70
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    invoke-static {v4}, Lorg/piwik/sdk/tools/Checksum;->getHex([B)Ljava/lang/String;

    move-result-object v4

    goto :goto_7
.end method

.method public static getMD5Checksum(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 44
    const-string v2, "MD5"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 45
    .local v0, "digest":Ljava/security/MessageDigest;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/security/MessageDigest;->update([B)V

    .line 46
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    .line 47
    .local v1, "messageDigest":[B
    invoke-static {v1}, Lorg/piwik/sdk/tools/Checksum;->getHex([B)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
