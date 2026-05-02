.class public final enum Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;
.super Ljava/lang/Enum;
.source "SevenZMethod.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

.field public static final enum AES256SHA256:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

.field public static final enum BCJ_ARM_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

.field public static final enum BCJ_ARM_THUMB_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

.field public static final enum BCJ_IA64_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

.field public static final enum BCJ_PPC_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

.field public static final enum BCJ_SPARC_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

.field public static final enum BCJ_X86_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

.field public static final enum BZIP2:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

.field public static final enum COPY:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

.field public static final enum DEFLATE:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

.field public static final enum DELTA_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

.field public static final enum LZMA:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

.field public static final enum LZMA2:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;


# instance fields
.field private final id:[B


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x3

    const/4 v5, 0x0

    const/4 v4, 0x4

    .line 38
    new-instance v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    const-string v1, "COPY"

    new-array v2, v7, [B

    aput-byte v5, v2, v5

    invoke-direct {v0, v1, v5, v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;-><init>(Ljava/lang/String;I[B)V

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->COPY:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    .line 40
    new-instance v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    const-string v1, "LZMA"

    new-array v2, v6, [B

    fill-array-data v2, :array_110

    invoke-direct {v0, v1, v7, v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;-><init>(Ljava/lang/String;I[B)V

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->LZMA:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    .line 42
    new-instance v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    const-string v1, "LZMA2"

    new-array v2, v7, [B

    const/16 v3, 0x21

    aput-byte v3, v2, v5

    invoke-direct {v0, v1, v8, v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;-><init>(Ljava/lang/String;I[B)V

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->LZMA2:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    .line 44
    new-instance v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    const-string v1, "DEFLATE"

    new-array v2, v6, [B

    fill-array-data v2, :array_116

    invoke-direct {v0, v1, v6, v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;-><init>(Ljava/lang/String;I[B)V

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->DEFLATE:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    .line 46
    new-instance v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    const-string v1, "BZIP2"

    new-array v2, v6, [B

    fill-array-data v2, :array_11c

    invoke-direct {v0, v1, v4, v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;-><init>(Ljava/lang/String;I[B)V

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->BZIP2:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    .line 51
    new-instance v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    const-string v1, "AES256SHA256"

    const/4 v2, 0x5

    new-array v3, v4, [B

    fill-array-data v3, :array_122

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;-><init>(Ljava/lang/String;I[B)V

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->AES256SHA256:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    .line 56
    new-instance v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    const-string v1, "BCJ_X86_FILTER"

    const/4 v2, 0x6

    new-array v3, v4, [B

    fill-array-data v3, :array_128

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;-><init>(Ljava/lang/String;I[B)V

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->BCJ_X86_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    .line 61
    new-instance v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    const-string v1, "BCJ_PPC_FILTER"

    const/4 v2, 0x7

    new-array v3, v4, [B

    fill-array-data v3, :array_12e

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;-><init>(Ljava/lang/String;I[B)V

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->BCJ_PPC_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    .line 66
    new-instance v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    const-string v1, "BCJ_IA64_FILTER"

    const/16 v2, 0x8

    new-array v3, v4, [B

    fill-array-data v3, :array_134

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;-><init>(Ljava/lang/String;I[B)V

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->BCJ_IA64_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    .line 71
    new-instance v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    const-string v1, "BCJ_ARM_FILTER"

    const/16 v2, 0x9

    new-array v3, v4, [B

    fill-array-data v3, :array_13a

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;-><init>(Ljava/lang/String;I[B)V

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->BCJ_ARM_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    .line 76
    new-instance v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    const-string v1, "BCJ_ARM_THUMB_FILTER"

    const/16 v2, 0xa

    new-array v3, v4, [B

    fill-array-data v3, :array_140

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;-><init>(Ljava/lang/String;I[B)V

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->BCJ_ARM_THUMB_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    .line 81
    new-instance v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    const-string v1, "BCJ_SPARC_FILTER"

    const/16 v2, 0xb

    new-array v3, v4, [B

    fill-array-data v3, :array_146

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;-><init>(Ljava/lang/String;I[B)V

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->BCJ_SPARC_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    .line 86
    new-instance v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    const-string v1, "DELTA_FILTER"

    const/16 v2, 0xc

    new-array v3, v7, [B

    aput-byte v6, v3, v5

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;-><init>(Ljava/lang/String;I[B)V

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->DELTA_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    .line 36
    const/16 v0, 0xd

    new-array v0, v0, [Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    sget-object v1, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->COPY:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    aput-object v1, v0, v5

    sget-object v1, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->LZMA:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    aput-object v1, v0, v7

    sget-object v1, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->LZMA2:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    aput-object v1, v0, v8

    sget-object v1, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->DEFLATE:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    aput-object v1, v0, v6

    sget-object v1, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->BZIP2:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    aput-object v1, v0, v4

    const/4 v1, 0x5

    sget-object v2, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->AES256SHA256:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->BCJ_X86_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->BCJ_PPC_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->BCJ_IA64_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->BCJ_ARM_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->BCJ_ARM_THUMB_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->BCJ_SPARC_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->DELTA_FILTER:Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->$VALUES:[Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    return-void

    .line 40
    nop

    :array_110
    .array-data 1
        0x3t
        0x1t
        0x1t
    .end array-data

    .line 44
    :array_116
    .array-data 1
        0x4t
        0x1t
        0x8t
    .end array-data

    .line 46
    :array_11c
    .array-data 1
        0x4t
        0x2t
        0x2t
    .end array-data

    .line 51
    :array_122
    .array-data 1
        0x6t
        -0xft
        0x7t
        0x1t
    .end array-data

    .line 56
    :array_128
    .array-data 1
        0x3t
        0x3t
        0x1t
        0x3t
    .end array-data

    .line 61
    :array_12e
    .array-data 1
        0x3t
        0x3t
        0x2t
        0x5t
    .end array-data

    .line 66
    :array_134
    .array-data 1
        0x3t
        0x3t
        0x4t
        0x1t
    .end array-data

    .line 71
    :array_13a
    .array-data 1
        0x3t
        0x3t
        0x5t
        0x1t
    .end array-data

    .line 76
    :array_140
    .array-data 1
        0x3t
        0x3t
        0x7t
        0x1t
    .end array-data

    .line 81
    :array_146
    .array-data 1
        0x3t
        0x3t
        0x8t
        0x5t
    .end array-data
.end method

.method private constructor <init>(Ljava/lang/String;I[B)V
    .registers 4
    .param p3, "id"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)V"
        }
    .end annotation

    .prologue
    .line 90
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 91
    iput-object p3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->id:[B

    .line 92
    return-void
.end method

.method static byId([B)Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;
    .registers 6
    .param p0, "id"    # [B

    .prologue
    .line 101
    const-class v4, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    invoke-virtual {v4}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    .local v0, "arr$":[Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_a
    if-ge v1, v2, :cond_1a

    aget-object v3, v0, v1

    .line 102
    .local v3, "m":Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;
    iget-object v4, v3, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->id:[B

    invoke-static {v4, p0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v4

    if-eqz v4, :cond_17

    .line 106
    .end local v3    # "m":Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;
    :goto_16
    return-object v3

    .line 101
    .restart local v3    # "m":Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;
    :cond_17
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 106
    .end local v3    # "m":Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;
    :cond_1a
    const/4 v3, 0x0

    goto :goto_16
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 36
    const-class v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    return-object v0
.end method

.method public static values()[Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;
    .registers 1

    .prologue
    .line 36
    sget-object v0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->$VALUES:[Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    invoke-virtual {v0}, [Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    return-object v0
.end method


# virtual methods
.method getId()[B
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 95
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->id:[B

    array-length v1, v1

    new-array v0, v1, [B

    .line 96
    .local v0, "copy":[B
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->id:[B

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;->id:[B

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 97
    return-object v0
.end method
