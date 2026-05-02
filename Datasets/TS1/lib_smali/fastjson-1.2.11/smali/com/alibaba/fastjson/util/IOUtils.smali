.class public Lcom/alibaba/fastjson/util/IOUtils;
.super Ljava/lang/Object;
.source "IOUtils.java"


# static fields
.field public static final ASCII_CHARS:[C

.field public static final CA:[C

.field public static final DIGITS:[C

.field static final DigitOnes:[C

.field static final DigitTens:[C

.field public static final IA:[I

.field public static final UTF8:Ljava/nio/charset/Charset;

.field static final digits:[C

.field public static final firstIdentifierFlags:[Z

.field public static final identifierFlags:[Z

.field public static final replaceChars:[C

.field static final sizeTable:[I

.field public static final specicalFlags_doubleQuotes:[B

.field public static final specicalFlags_doubleQuotesFlags:[Z

.field public static final specicalFlags_singleQuotes:[B

.field public static final specicalFlags_singleQuotesFlags:[Z


# direct methods
.method static constructor <clinit>()V
    .registers 10

    .prologue
    const/16 v9, 0xa

    const/16 v8, 0xa1

    const/4 v5, 0x0

    const/4 v7, 0x4

    const/4 v4, 0x1

    .line 35
    const-string v3, "UTF-8"

    invoke-static {v3}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    .line 37
    const/16 v3, 0x10

    new-array v3, v3, [C

    fill-array-data v3, :array_262

    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    .line 40
    const/16 v3, 0x100

    new-array v3, v3, [Z

    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->firstIdentifierFlags:[Z

    .line 42
    const/4 v0, 0x0

    .local v0, "c":C
    :goto_1f
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->firstIdentifierFlags:[Z

    array-length v3, v3

    if-ge v0, v3, :cond_4a

    .line 43
    const/16 v3, 0x41

    if-lt v0, v3, :cond_34

    const/16 v3, 0x5a

    if-gt v0, v3, :cond_34

    .line 44
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->firstIdentifierFlags:[Z

    aput-boolean v4, v3, v0

    .line 42
    :cond_30
    :goto_30
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_1f

    .line 45
    :cond_34
    const/16 v3, 0x61

    if-lt v0, v3, :cond_41

    const/16 v3, 0x7a

    if-gt v0, v3, :cond_41

    .line 46
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->firstIdentifierFlags:[Z

    aput-boolean v4, v3, v0

    goto :goto_30

    .line 47
    :cond_41
    const/16 v3, 0x5f

    if-ne v0, v3, :cond_30

    .line 48
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->firstIdentifierFlags:[Z

    aput-boolean v4, v3, v0

    goto :goto_30

    .line 53
    :cond_4a
    const/16 v3, 0x100

    new-array v3, v3, [Z

    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->identifierFlags:[Z

    .line 56
    const/4 v0, 0x0

    :goto_51
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->identifierFlags:[Z

    array-length v3, v3

    if-ge v0, v3, :cond_89

    .line 57
    const/16 v3, 0x41

    if-lt v0, v3, :cond_66

    const/16 v3, 0x5a

    if-gt v0, v3, :cond_66

    .line 58
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->identifierFlags:[Z

    aput-boolean v4, v3, v0

    .line 56
    :cond_62
    :goto_62
    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    goto :goto_51

    .line 59
    :cond_66
    const/16 v3, 0x61

    if-lt v0, v3, :cond_73

    const/16 v3, 0x7a

    if-gt v0, v3, :cond_73

    .line 60
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->identifierFlags:[Z

    aput-boolean v4, v3, v0

    goto :goto_62

    .line 61
    :cond_73
    const/16 v3, 0x5f

    if-ne v0, v3, :cond_7c

    .line 62
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->identifierFlags:[Z

    aput-boolean v4, v3, v0

    goto :goto_62

    .line 63
    :cond_7c
    const/16 v3, 0x30

    if-lt v0, v3, :cond_62

    const/16 v3, 0x39

    if-gt v0, v3, :cond_62

    .line 64
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->identifierFlags:[Z

    aput-boolean v4, v3, v0

    goto :goto_62

    .line 69
    :cond_89
    new-array v3, v8, [B

    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    .line 70
    new-array v3, v8, [B

    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    .line 71
    new-array v3, v8, [Z

    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotesFlags:[Z

    .line 72
    new-array v3, v8, [Z

    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotesFlags:[Z

    .line 74
    const/16 v3, 0x5d

    new-array v3, v3, [C

    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 76
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aput-byte v7, v3, v5

    .line 77
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aput-byte v7, v3, v4

    .line 78
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    const/4 v6, 0x2

    aput-byte v7, v3, v6

    .line 79
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    const/4 v6, 0x3

    aput-byte v7, v3, v6

    .line 80
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aput-byte v7, v3, v7

    .line 81
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    const/4 v6, 0x5

    aput-byte v7, v3, v6

    .line 82
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    const/4 v6, 0x6

    aput-byte v7, v3, v6

    .line 83
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    const/4 v6, 0x7

    aput-byte v7, v3, v6

    .line 84
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    const/16 v6, 0x8

    aput-byte v4, v3, v6

    .line 85
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    const/16 v6, 0x9

    aput-byte v4, v3, v6

    .line 86
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aput-byte v4, v3, v9

    .line 87
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    const/16 v6, 0xb

    aput-byte v7, v3, v6

    .line 88
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    const/16 v6, 0xc

    aput-byte v4, v3, v6

    .line 89
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    const/16 v6, 0xd

    aput-byte v4, v3, v6

    .line 90
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    const/16 v6, 0x22

    aput-byte v4, v3, v6

    .line 91
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    const/16 v6, 0x5c

    aput-byte v4, v3, v6

    .line 93
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    aput-byte v7, v3, v5

    .line 94
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    aput-byte v7, v3, v4

    .line 95
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    const/4 v6, 0x2

    aput-byte v7, v3, v6

    .line 96
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    const/4 v6, 0x3

    aput-byte v7, v3, v6

    .line 97
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    aput-byte v7, v3, v7

    .line 98
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    const/4 v6, 0x5

    aput-byte v7, v3, v6

    .line 99
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    const/4 v6, 0x6

    aput-byte v7, v3, v6

    .line 100
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    const/4 v6, 0x7

    aput-byte v7, v3, v6

    .line 101
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    const/16 v6, 0x8

    aput-byte v4, v3, v6

    .line 102
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    const/16 v6, 0x9

    aput-byte v4, v3, v6

    .line 103
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    aput-byte v4, v3, v9

    .line 104
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    const/16 v6, 0xb

    aput-byte v7, v3, v6

    .line 105
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    const/16 v6, 0xc

    aput-byte v4, v3, v6

    .line 106
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    const/16 v6, 0xd

    aput-byte v4, v3, v6

    .line 107
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    const/16 v6, 0x5c

    aput-byte v4, v3, v6

    .line 108
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    const/16 v6, 0x27

    aput-byte v4, v3, v6

    .line 110
    const/16 v1, 0xe

    .local v1, "i":I
    :goto_147
    const/16 v3, 0x1f

    if-gt v1, v3, :cond_156

    .line 111
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aput-byte v7, v3, v1

    .line 112
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    aput-byte v7, v3, v1

    .line 110
    add-int/lit8 v1, v1, 0x1

    goto :goto_147

    .line 115
    :cond_156
    const/16 v1, 0x7f

    :goto_158
    const/16 v3, 0xa0

    if-gt v1, v3, :cond_167

    .line 116
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aput-byte v7, v3, v1

    .line 117
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    aput-byte v7, v3, v1

    .line 115
    add-int/lit8 v1, v1, 0x1

    goto :goto_158

    .line 120
    :cond_167
    const/4 v1, 0x0

    :goto_168
    if-ge v1, v8, :cond_187

    .line 121
    sget-object v6, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotesFlags:[Z

    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aget-byte v3, v3, v1

    if-eqz v3, :cond_183

    move v3, v4

    :goto_173
    aput-boolean v3, v6, v1

    .line 122
    sget-object v6, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotesFlags:[Z

    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    aget-byte v3, v3, v1

    if-eqz v3, :cond_185

    move v3, v4

    :goto_17e
    aput-boolean v3, v6, v1

    .line 120
    add-int/lit8 v1, v1, 0x1

    goto :goto_168

    :cond_183
    move v3, v5

    .line 121
    goto :goto_173

    :cond_185
    move v3, v5

    .line 122
    goto :goto_17e

    .line 125
    :cond_187
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/16 v6, 0x30

    aput-char v6, v3, v5

    .line 126
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/16 v6, 0x31

    aput-char v6, v3, v4

    .line 127
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/4 v4, 0x2

    const/16 v6, 0x32

    aput-char v6, v3, v4

    .line 128
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/4 v4, 0x3

    const/16 v6, 0x33

    aput-char v6, v3, v4

    .line 129
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/16 v4, 0x34

    aput-char v4, v3, v7

    .line 130
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/4 v4, 0x5

    const/16 v6, 0x35

    aput-char v6, v3, v4

    .line 131
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/4 v4, 0x6

    const/16 v6, 0x36

    aput-char v6, v3, v4

    .line 132
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/4 v4, 0x7

    const/16 v6, 0x37

    aput-char v6, v3, v4

    .line 133
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/16 v4, 0x8

    const/16 v6, 0x62

    aput-char v6, v3, v4

    .line 134
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/16 v4, 0x9

    const/16 v6, 0x74

    aput-char v6, v3, v4

    .line 135
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/16 v4, 0x6e

    aput-char v4, v3, v9

    .line 136
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/16 v4, 0xb

    const/16 v6, 0x76

    aput-char v6, v3, v4

    .line 137
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/16 v4, 0xc

    const/16 v6, 0x66

    aput-char v6, v3, v4

    .line 138
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/16 v4, 0xd

    const/16 v6, 0x72

    aput-char v6, v3, v4

    .line 139
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/16 v4, 0x22

    const/16 v6, 0x22

    aput-char v6, v3, v4

    .line 140
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/16 v4, 0x27

    const/16 v6, 0x27

    aput-char v6, v3, v4

    .line 141
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/16 v4, 0x2f

    const/16 v6, 0x2f

    aput-char v6, v3, v4

    .line 142
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    const/16 v4, 0x5c

    const/16 v6, 0x5c

    aput-char v6, v3, v4

    .line 145
    const/16 v3, 0x60

    new-array v3, v3, [C

    fill-array-data v3, :array_276

    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->ASCII_CHARS:[C

    .line 286
    const/16 v3, 0x24

    new-array v3, v3, [C

    fill-array-data v3, :array_2da

    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->digits:[C

    .line 289
    const/16 v3, 0x64

    new-array v3, v3, [C

    fill-array-data v3, :array_302

    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->DigitTens:[C

    .line 295
    const/16 v3, 0x64

    new-array v3, v3, [C

    fill-array-data v3, :array_36a

    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->DigitOnes:[C

    .line 301
    new-array v3, v9, [I

    fill-array-data v3, :array_3d2

    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->sizeTable:[I

    .line 340
    const-string v3, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    invoke-virtual {v3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->CA:[C

    .line 341
    const/16 v3, 0x100

    new-array v3, v3, [I

    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    .line 343
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    const/4 v4, -0x1

    invoke-static {v3, v4}, Ljava/util/Arrays;->fill([II)V

    .line 344
    const/4 v1, 0x0

    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->CA:[C

    array-length v2, v3

    .local v2, "iS":I
    :goto_24d
    if-ge v1, v2, :cond_25a

    .line 345
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    sget-object v4, Lcom/alibaba/fastjson/util/IOUtils;->CA:[C

    aget-char v4, v4, v1

    aput v1, v3, v4

    .line 344
    add-int/lit8 v1, v1, 0x1

    goto :goto_24d

    .line 346
    :cond_25a
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    const/16 v4, 0x3d

    aput v5, v3, v4

    .line 347
    return-void

    .line 37
    nop

    :array_262
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data

    .line 145
    :array_276
    .array-data 2
        0x30s
        0x30s
        0x30s
        0x31s
        0x30s
        0x32s
        0x30s
        0x33s
        0x30s
        0x34s
        0x30s
        0x35s
        0x30s
        0x36s
        0x30s
        0x37s
        0x30s
        0x38s
        0x30s
        0x39s
        0x30s
        0x41s
        0x30s
        0x42s
        0x30s
        0x43s
        0x30s
        0x44s
        0x30s
        0x45s
        0x30s
        0x46s
        0x31s
        0x30s
        0x31s
        0x31s
        0x31s
        0x32s
        0x31s
        0x33s
        0x31s
        0x34s
        0x31s
        0x35s
        0x31s
        0x36s
        0x31s
        0x37s
        0x31s
        0x38s
        0x31s
        0x39s
        0x31s
        0x41s
        0x31s
        0x42s
        0x31s
        0x43s
        0x31s
        0x44s
        0x31s
        0x45s
        0x31s
        0x46s
        0x32s
        0x30s
        0x32s
        0x31s
        0x32s
        0x32s
        0x32s
        0x33s
        0x32s
        0x34s
        0x32s
        0x35s
        0x32s
        0x36s
        0x32s
        0x37s
        0x32s
        0x38s
        0x32s
        0x39s
        0x32s
        0x41s
        0x32s
        0x42s
        0x32s
        0x43s
        0x32s
        0x44s
        0x32s
        0x45s
        0x32s
        0x46s
    .end array-data

    .line 286
    :array_2da
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
        0x67s
        0x68s
        0x69s
        0x6as
        0x6bs
        0x6cs
        0x6ds
        0x6es
        0x6fs
        0x70s
        0x71s
        0x72s
        0x73s
        0x74s
        0x75s
        0x76s
        0x77s
        0x78s
        0x79s
        0x7as
    .end array-data

    .line 289
    :array_302
    .array-data 2
        0x30s
        0x30s
        0x30s
        0x30s
        0x30s
        0x30s
        0x30s
        0x30s
        0x30s
        0x30s
        0x31s
        0x31s
        0x31s
        0x31s
        0x31s
        0x31s
        0x31s
        0x31s
        0x31s
        0x31s
        0x32s
        0x32s
        0x32s
        0x32s
        0x32s
        0x32s
        0x32s
        0x32s
        0x32s
        0x32s
        0x33s
        0x33s
        0x33s
        0x33s
        0x33s
        0x33s
        0x33s
        0x33s
        0x33s
        0x33s
        0x34s
        0x34s
        0x34s
        0x34s
        0x34s
        0x34s
        0x34s
        0x34s
        0x34s
        0x34s
        0x35s
        0x35s
        0x35s
        0x35s
        0x35s
        0x35s
        0x35s
        0x35s
        0x35s
        0x35s
        0x36s
        0x36s
        0x36s
        0x36s
        0x36s
        0x36s
        0x36s
        0x36s
        0x36s
        0x36s
        0x37s
        0x37s
        0x37s
        0x37s
        0x37s
        0x37s
        0x37s
        0x37s
        0x37s
        0x37s
        0x38s
        0x38s
        0x38s
        0x38s
        0x38s
        0x38s
        0x38s
        0x38s
        0x38s
        0x38s
        0x39s
        0x39s
        0x39s
        0x39s
        0x39s
        0x39s
        0x39s
        0x39s
        0x39s
        0x39s
    .end array-data

    .line 295
    :array_36a
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
    .end array-data

    .line 301
    :array_3d2
    .array-data 4
        0x9
        0x63
        0x3e7
        0x270f
        0x1869f
        0xf423f
        0x98967f
        0x5f5e0ff
        0x3b9ac9ff
        0x7fffffff
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static close(Ljava/io/Closeable;)V
    .registers 2
    .param p0, "x"    # Ljava/io/Closeable;

    .prologue
    .line 153
    if-eqz p0, :cond_5

    .line 155
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_5} :catch_6

    .line 160
    :cond_5
    :goto_5
    return-void

    .line 156
    :catch_6
    move-exception v0

    goto :goto_5
.end method

.method public static decode(Ljava/nio/charset/CharsetDecoder;Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;)V
    .registers 8
    .param p0, "charsetDecoder"    # Ljava/nio/charset/CharsetDecoder;
    .param p1, "byteBuf"    # Ljava/nio/ByteBuffer;
    .param p2, "charByte"    # Ljava/nio/CharBuffer;

    .prologue
    .line 314
    const/4 v2, 0x1

    :try_start_1
    invoke-virtual {p0, p1, p2, v2}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;Z)Ljava/nio/charset/CoderResult;

    move-result-object v0

    .line 316
    .local v0, "cr":Ljava/nio/charset/CoderResult;
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->isUnderflow()Z

    move-result v2

    if-nez v2, :cond_e

    .line 317
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->throwException()V

    .line 320
    :cond_e
    invoke-virtual {p0, p2}, Ljava/nio/charset/CharsetDecoder;->flush(Ljava/nio/CharBuffer;)Ljava/nio/charset/CoderResult;

    move-result-object v0

    .line 322
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->isUnderflow()Z

    move-result v2

    if-nez v2, :cond_1b

    .line 323
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->throwException()V
    :try_end_1b
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_1 .. :try_end_1b} :catch_1c

    .line 330
    :cond_1b
    return-void

    .line 325
    .end local v0    # "cr":Ljava/nio/charset/CoderResult;
    :catch_1c
    move-exception v1

    .line 328
    .local v1, "x":Ljava/nio/charset/CharacterCodingException;
    new-instance v2, Lcom/alibaba/fastjson/JSONException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "utf8 decode error, "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/nio/charset/CharacterCodingException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static decodeBase64(Ljava/lang/String;)[B
    .registers 22
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 483
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v16

    .line 484
    .local v16, "sLen":I
    if-nez v16, :cond_d

    .line 485
    const/16 v18, 0x0

    move/from16 v0, v18

    new-array v6, v0, [B

    .line 535
    :goto_c
    return-object v6

    .line 488
    :cond_d
    const/4 v14, 0x0

    .local v14, "sIx":I
    add-int/lit8 v7, v16, -0x1

    .line 491
    .local v7, "eIx":I
    :goto_10
    if-ge v14, v7, :cond_27

    sget-object v18, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v19

    move/from16 v0, v19

    and-int/lit16 v0, v0, 0xff

    move/from16 v19, v0

    aget v18, v18, v19

    if-gez v18, :cond_27

    .line 492
    add-int/lit8 v14, v14, 0x1

    goto :goto_10

    .line 495
    :cond_27
    :goto_27
    if-lez v7, :cond_3e

    sget-object v18, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v19

    move/from16 v0, v19

    and-int/lit16 v0, v0, 0xff

    move/from16 v19, v0

    aget v18, v18, v19

    if-gez v18, :cond_3e

    .line 496
    add-int/lit8 v7, v7, -0x1

    goto :goto_27

    .line 499
    :cond_3e
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v18

    const/16 v19, 0x3d

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_101

    add-int/lit8 v18, v7, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v18

    const/16 v19, 0x3d

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_fe

    const/4 v12, 0x2

    .line 500
    .local v12, "pad":I
    :goto_5f
    sub-int v18, v7, v14

    add-int/lit8 v2, v18, 0x1

    .line 501
    .local v2, "cCnt":I
    const/16 v18, 0x4c

    move/from16 v0, v16

    move/from16 v1, v18

    if-le v0, v1, :cond_108

    const/16 v18, 0x4c

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v18

    const/16 v19, 0xd

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_104

    div-int/lit8 v18, v2, 0x4e

    :goto_7f
    shl-int/lit8 v17, v18, 0x1

    .line 503
    .local v17, "sepCnt":I
    :goto_81
    sub-int v18, v2, v17

    mul-int/lit8 v18, v18, 0x6

    shr-int/lit8 v18, v18, 0x3

    sub-int v11, v18, v12

    .line 504
    .local v11, "len":I
    new-array v6, v11, [B

    .line 507
    .local v6, "dArr":[B
    const/4 v4, 0x0

    .line 508
    .local v4, "d":I
    const/4 v3, 0x0

    .local v3, "cc":I
    div-int/lit8 v18, v11, 0x3

    mul-int/lit8 v8, v18, 0x3

    .local v8, "eLen":I
    move v5, v4

    .end local v4    # "d":I
    .local v5, "d":I
    move v15, v14

    .end local v14    # "sIx":I
    .local v15, "sIx":I
    :goto_93
    if-ge v5, v8, :cond_10c

    .line 510
    sget-object v18, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v14, v15, 0x1

    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v19

    aget v18, v18, v19

    shl-int/lit8 v18, v18, 0x12

    sget-object v19, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v15, v14, 0x1

    .end local v14    # "sIx":I
    .restart local v15    # "sIx":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v20

    aget v19, v19, v20

    shl-int/lit8 v19, v19, 0xc

    or-int v18, v18, v19

    sget-object v19, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v14, v15, 0x1

    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v20

    aget v19, v19, v20

    shl-int/lit8 v19, v19, 0x6

    or-int v18, v18, v19

    sget-object v19, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v15, v14, 0x1

    .line 511
    .end local v14    # "sIx":I
    .restart local v15    # "sIx":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v20

    aget v19, v19, v20

    or-int v9, v18, v19

    .line 514
    .local v9, "i":I
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "d":I
    .restart local v4    # "d":I
    shr-int/lit8 v18, v9, 0x10

    move/from16 v0, v18

    int-to-byte v0, v0

    move/from16 v18, v0

    aput-byte v18, v6, v5

    .line 515
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "d":I
    .restart local v5    # "d":I
    shr-int/lit8 v18, v9, 0x8

    move/from16 v0, v18

    int-to-byte v0, v0

    move/from16 v18, v0

    aput-byte v18, v6, v4

    .line 516
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "d":I
    .restart local v4    # "d":I
    int-to-byte v0, v9

    move/from16 v18, v0

    aput-byte v18, v6, v5

    .line 519
    if-lez v17, :cond_145

    add-int/lit8 v3, v3, 0x1

    const/16 v18, 0x13

    move/from16 v0, v18

    if-ne v3, v0, :cond_145

    .line 520
    add-int/lit8 v14, v15, 0x2

    .line 521
    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    const/4 v3, 0x0

    :goto_fb
    move v5, v4

    .end local v4    # "d":I
    .restart local v5    # "d":I
    move v15, v14

    .line 523
    .end local v14    # "sIx":I
    .restart local v15    # "sIx":I
    goto :goto_93

    .line 499
    .end local v2    # "cCnt":I
    .end local v3    # "cc":I
    .end local v5    # "d":I
    .end local v6    # "dArr":[B
    .end local v8    # "eLen":I
    .end local v9    # "i":I
    .end local v11    # "len":I
    .end local v12    # "pad":I
    .end local v15    # "sIx":I
    .end local v17    # "sepCnt":I
    .restart local v14    # "sIx":I
    :cond_fe
    const/4 v12, 0x1

    goto/16 :goto_5f

    :cond_101
    const/4 v12, 0x0

    goto/16 :goto_5f

    .line 501
    .restart local v2    # "cCnt":I
    .restart local v12    # "pad":I
    :cond_104
    const/16 v18, 0x0

    goto/16 :goto_7f

    :cond_108
    const/16 v17, 0x0

    goto/16 :goto_81

    .line 525
    .end local v14    # "sIx":I
    .restart local v3    # "cc":I
    .restart local v5    # "d":I
    .restart local v6    # "dArr":[B
    .restart local v8    # "eLen":I
    .restart local v11    # "len":I
    .restart local v15    # "sIx":I
    .restart local v17    # "sepCnt":I
    :cond_10c
    if-ge v5, v11, :cond_141

    .line 527
    const/4 v9, 0x0

    .line 528
    .restart local v9    # "i":I
    const/4 v10, 0x0

    .local v10, "j":I
    :goto_110
    sub-int v18, v7, v12

    move/from16 v0, v18

    if-gt v15, v0, :cond_12e

    .line 529
    sget-object v18, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v14, v15, 0x1

    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v19

    aget v18, v18, v19

    mul-int/lit8 v19, v10, 0x6

    rsub-int/lit8 v19, v19, 0x12

    shl-int v18, v18, v19

    or-int v9, v9, v18

    .line 528
    add-int/lit8 v10, v10, 0x1

    move v15, v14

    .end local v14    # "sIx":I
    .restart local v15    # "sIx":I
    goto :goto_110

    .line 531
    :cond_12e
    const/16 v13, 0x10

    .local v13, "r":I
    :goto_130
    if-ge v5, v11, :cond_141

    .line 532
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "d":I
    .restart local v4    # "d":I
    shr-int v18, v9, v13

    move/from16 v0, v18

    int-to-byte v0, v0

    move/from16 v18, v0

    aput-byte v18, v6, v5

    .line 531
    add-int/lit8 v13, v13, -0x8

    move v5, v4

    .end local v4    # "d":I
    .restart local v5    # "d":I
    goto :goto_130

    .end local v9    # "i":I
    .end local v10    # "j":I
    .end local v13    # "r":I
    :cond_141
    move v4, v5

    .end local v5    # "d":I
    .restart local v4    # "d":I
    move v14, v15

    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    goto/16 :goto_c

    .end local v14    # "sIx":I
    .restart local v9    # "i":I
    .restart local v15    # "sIx":I
    :cond_145
    move v14, v15

    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    goto :goto_fb
.end method

.method public static decodeBase64(Ljava/lang/String;II)[B
    .registers 23
    .param p0, "chars"    # Ljava/lang/String;
    .param p1, "offset"    # I
    .param p2, "charsLen"    # I

    .prologue
    .line 417
    if-nez p2, :cond_9

    .line 418
    const/16 v17, 0x0

    move/from16 v0, v17

    new-array v2, v0, [B

    .line 467
    :goto_8
    return-object v2

    .line 421
    :cond_9
    move/from16 v14, p1

    .local v14, "sIx":I
    add-int v17, p1, p2

    add-int/lit8 v7, v17, -0x1

    .line 424
    .local v7, "eIx":I
    :goto_f
    if-ge v14, v7, :cond_20

    sget-object v17, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v18

    aget v17, v17, v18

    if-gez v17, :cond_20

    .line 425
    add-int/lit8 v14, v14, 0x1

    goto :goto_f

    .line 428
    :cond_20
    :goto_20
    if-lez v7, :cond_31

    sget-object v17, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v18

    aget v17, v17, v18

    if-gez v17, :cond_31

    .line 429
    add-int/lit8 v7, v7, -0x1

    goto :goto_20

    .line 432
    :cond_31
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v17

    const/16 v18, 0x3d

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_f4

    add-int/lit8 v17, v7, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v17

    const/16 v18, 0x3d

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_f1

    const/4 v12, 0x2

    .line 433
    .local v12, "pad":I
    :goto_52
    sub-int v17, v7, v14

    add-int/lit8 v3, v17, 0x1

    .line 434
    .local v3, "cCnt":I
    const/16 v17, 0x4c

    move/from16 v0, p2

    move/from16 v1, v17

    if-le v0, v1, :cond_fb

    const/16 v17, 0x4c

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v17

    const/16 v18, 0xd

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_f7

    div-int/lit8 v17, v3, 0x4e

    :goto_72
    shl-int/lit8 v16, v17, 0x1

    .line 436
    .local v16, "sepCnt":I
    :goto_74
    sub-int v17, v3, v16

    mul-int/lit8 v17, v17, 0x6

    shr-int/lit8 v17, v17, 0x3

    sub-int v11, v17, v12

    .line 437
    .local v11, "len":I
    new-array v2, v11, [B

    .line 440
    .local v2, "bytes":[B
    const/4 v5, 0x0

    .line 441
    .local v5, "d":I
    const/4 v4, 0x0

    .local v4, "cc":I
    div-int/lit8 v17, v11, 0x3

    mul-int/lit8 v8, v17, 0x3

    .local v8, "eLen":I
    move v6, v5

    .end local v5    # "d":I
    .local v6, "d":I
    move v15, v14

    .end local v14    # "sIx":I
    .local v15, "sIx":I
    :goto_86
    if-ge v6, v8, :cond_ff

    .line 443
    sget-object v17, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v14, v15, 0x1

    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v18

    aget v17, v17, v18

    shl-int/lit8 v17, v17, 0x12

    sget-object v18, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v15, v14, 0x1

    .end local v14    # "sIx":I
    .restart local v15    # "sIx":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v19

    aget v18, v18, v19

    shl-int/lit8 v18, v18, 0xc

    or-int v17, v17, v18

    sget-object v18, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v14, v15, 0x1

    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v19

    aget v18, v18, v19

    shl-int/lit8 v18, v18, 0x6

    or-int v17, v17, v18

    sget-object v18, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v15, v14, 0x1

    .end local v14    # "sIx":I
    .restart local v15    # "sIx":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v19

    aget v18, v18, v19

    or-int v9, v17, v18

    .line 446
    .local v9, "i":I
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "d":I
    .restart local v5    # "d":I
    shr-int/lit8 v17, v9, 0x10

    move/from16 v0, v17

    int-to-byte v0, v0

    move/from16 v17, v0

    aput-byte v17, v2, v6

    .line 447
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "d":I
    .restart local v6    # "d":I
    shr-int/lit8 v17, v9, 0x8

    move/from16 v0, v17

    int-to-byte v0, v0

    move/from16 v17, v0

    aput-byte v17, v2, v5

    .line 448
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "d":I
    .restart local v5    # "d":I
    int-to-byte v0, v9

    move/from16 v17, v0

    aput-byte v17, v2, v6

    .line 451
    if-lez v16, :cond_138

    add-int/lit8 v4, v4, 0x1

    const/16 v17, 0x13

    move/from16 v0, v17

    if-ne v4, v0, :cond_138

    .line 452
    add-int/lit8 v14, v15, 0x2

    .line 453
    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    const/4 v4, 0x0

    :goto_ee
    move v6, v5

    .end local v5    # "d":I
    .restart local v6    # "d":I
    move v15, v14

    .line 455
    .end local v14    # "sIx":I
    .restart local v15    # "sIx":I
    goto :goto_86

    .line 432
    .end local v2    # "bytes":[B
    .end local v3    # "cCnt":I
    .end local v4    # "cc":I
    .end local v6    # "d":I
    .end local v8    # "eLen":I
    .end local v9    # "i":I
    .end local v11    # "len":I
    .end local v12    # "pad":I
    .end local v15    # "sIx":I
    .end local v16    # "sepCnt":I
    .restart local v14    # "sIx":I
    :cond_f1
    const/4 v12, 0x1

    goto/16 :goto_52

    :cond_f4
    const/4 v12, 0x0

    goto/16 :goto_52

    .line 434
    .restart local v3    # "cCnt":I
    .restart local v12    # "pad":I
    :cond_f7
    const/16 v17, 0x0

    goto/16 :goto_72

    :cond_fb
    const/16 v16, 0x0

    goto/16 :goto_74

    .line 457
    .end local v14    # "sIx":I
    .restart local v2    # "bytes":[B
    .restart local v4    # "cc":I
    .restart local v6    # "d":I
    .restart local v8    # "eLen":I
    .restart local v11    # "len":I
    .restart local v15    # "sIx":I
    .restart local v16    # "sepCnt":I
    :cond_ff
    if-ge v6, v11, :cond_134

    .line 459
    const/4 v9, 0x0

    .line 460
    .restart local v9    # "i":I
    const/4 v10, 0x0

    .local v10, "j":I
    :goto_103
    sub-int v17, v7, v12

    move/from16 v0, v17

    if-gt v15, v0, :cond_121

    .line 461
    sget-object v17, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v14, v15, 0x1

    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v18

    aget v17, v17, v18

    mul-int/lit8 v18, v10, 0x6

    rsub-int/lit8 v18, v18, 0x12

    shl-int v17, v17, v18

    or-int v9, v9, v17

    .line 460
    add-int/lit8 v10, v10, 0x1

    move v15, v14

    .end local v14    # "sIx":I
    .restart local v15    # "sIx":I
    goto :goto_103

    .line 463
    :cond_121
    const/16 v13, 0x10

    .local v13, "r":I
    :goto_123
    if-ge v6, v11, :cond_134

    .line 464
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "d":I
    .restart local v5    # "d":I
    shr-int v17, v9, v13

    move/from16 v0, v17

    int-to-byte v0, v0

    move/from16 v17, v0

    aput-byte v17, v2, v6

    .line 463
    add-int/lit8 v13, v13, -0x8

    move v6, v5

    .end local v5    # "d":I
    .restart local v6    # "d":I
    goto :goto_123

    .end local v9    # "i":I
    .end local v10    # "j":I
    .end local v13    # "r":I
    :cond_134
    move v5, v6

    .end local v6    # "d":I
    .restart local v5    # "d":I
    move v14, v15

    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    goto/16 :goto_8

    .end local v14    # "sIx":I
    .restart local v9    # "i":I
    .restart local v15    # "sIx":I
    :cond_138
    move v14, v15

    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    goto :goto_ee
.end method

.method public static decodeBase64([CII)[B
    .registers 23
    .param p0, "chars"    # [C
    .param p1, "offset"    # I
    .param p2, "charsLen"    # I

    .prologue
    .line 362
    if-nez p2, :cond_9

    .line 363
    const/16 v17, 0x0

    move/from16 v0, v17

    new-array v2, v0, [B

    .line 412
    :goto_8
    return-object v2

    .line 366
    :cond_9
    move/from16 v14, p1

    .local v14, "sIx":I
    add-int v17, p1, p2

    add-int/lit8 v7, v17, -0x1

    .line 369
    .local v7, "eIx":I
    :goto_f
    if-ge v14, v7, :cond_1c

    sget-object v17, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    aget-char v18, p0, v14

    aget v17, v17, v18

    if-gez v17, :cond_1c

    .line 370
    add-int/lit8 v14, v14, 0x1

    goto :goto_f

    .line 373
    :cond_1c
    :goto_1c
    if-lez v7, :cond_29

    sget-object v17, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    aget-char v18, p0, v7

    aget v17, v17, v18

    if-gez v17, :cond_29

    .line 374
    add-int/lit8 v7, v7, -0x1

    goto :goto_1c

    .line 377
    :cond_29
    aget-char v17, p0, v7

    const/16 v18, 0x3d

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_cc

    add-int/lit8 v17, v7, -0x1

    aget-char v17, p0, v17

    const/16 v18, 0x3d

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_c9

    const/4 v12, 0x2

    .line 378
    .local v12, "pad":I
    :goto_40
    sub-int v17, v7, v14

    add-int/lit8 v3, v17, 0x1

    .line 379
    .local v3, "cCnt":I
    const/16 v17, 0x4c

    move/from16 v0, p2

    move/from16 v1, v17

    if-le v0, v1, :cond_d2

    const/16 v17, 0x4c

    aget-char v17, p0, v17

    const/16 v18, 0xd

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_cf

    div-int/lit8 v17, v3, 0x4e

    :goto_5a
    shl-int/lit8 v16, v17, 0x1

    .line 381
    .local v16, "sepCnt":I
    :goto_5c
    sub-int v17, v3, v16

    mul-int/lit8 v17, v17, 0x6

    shr-int/lit8 v17, v17, 0x3

    sub-int v11, v17, v12

    .line 382
    .local v11, "len":I
    new-array v2, v11, [B

    .line 385
    .local v2, "bytes":[B
    const/4 v5, 0x0

    .line 386
    .local v5, "d":I
    const/4 v4, 0x0

    .local v4, "cc":I
    div-int/lit8 v17, v11, 0x3

    mul-int/lit8 v8, v17, 0x3

    .local v8, "eLen":I
    move v6, v5

    .end local v5    # "d":I
    .local v6, "d":I
    move v15, v14

    .end local v14    # "sIx":I
    .local v15, "sIx":I
    :goto_6e
    if-ge v6, v8, :cond_d5

    .line 388
    sget-object v17, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v14, v15, 0x1

    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    aget-char v18, p0, v15

    aget v17, v17, v18

    shl-int/lit8 v17, v17, 0x12

    sget-object v18, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v15, v14, 0x1

    .end local v14    # "sIx":I
    .restart local v15    # "sIx":I
    aget-char v19, p0, v14

    aget v18, v18, v19

    shl-int/lit8 v18, v18, 0xc

    or-int v17, v17, v18

    sget-object v18, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v14, v15, 0x1

    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    aget-char v19, p0, v15

    aget v18, v18, v19

    shl-int/lit8 v18, v18, 0x6

    or-int v17, v17, v18

    sget-object v18, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v15, v14, 0x1

    .end local v14    # "sIx":I
    .restart local v15    # "sIx":I
    aget-char v19, p0, v14

    aget v18, v18, v19

    or-int v9, v17, v18

    .line 391
    .local v9, "i":I
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "d":I
    .restart local v5    # "d":I
    shr-int/lit8 v17, v9, 0x10

    move/from16 v0, v17

    int-to-byte v0, v0

    move/from16 v17, v0

    aput-byte v17, v2, v6

    .line 392
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "d":I
    .restart local v6    # "d":I
    shr-int/lit8 v17, v9, 0x8

    move/from16 v0, v17

    int-to-byte v0, v0

    move/from16 v17, v0

    aput-byte v17, v2, v5

    .line 393
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "d":I
    .restart local v5    # "d":I
    int-to-byte v0, v9

    move/from16 v17, v0

    aput-byte v17, v2, v6

    .line 396
    if-lez v16, :cond_10a

    add-int/lit8 v4, v4, 0x1

    const/16 v17, 0x13

    move/from16 v0, v17

    if-ne v4, v0, :cond_10a

    .line 397
    add-int/lit8 v14, v15, 0x2

    .line 398
    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    const/4 v4, 0x0

    :goto_c6
    move v6, v5

    .end local v5    # "d":I
    .restart local v6    # "d":I
    move v15, v14

    .line 400
    .end local v14    # "sIx":I
    .restart local v15    # "sIx":I
    goto :goto_6e

    .line 377
    .end local v2    # "bytes":[B
    .end local v3    # "cCnt":I
    .end local v4    # "cc":I
    .end local v6    # "d":I
    .end local v8    # "eLen":I
    .end local v9    # "i":I
    .end local v11    # "len":I
    .end local v12    # "pad":I
    .end local v15    # "sIx":I
    .end local v16    # "sepCnt":I
    .restart local v14    # "sIx":I
    :cond_c9
    const/4 v12, 0x1

    goto/16 :goto_40

    :cond_cc
    const/4 v12, 0x0

    goto/16 :goto_40

    .line 379
    .restart local v3    # "cCnt":I
    .restart local v12    # "pad":I
    :cond_cf
    const/16 v17, 0x0

    goto :goto_5a

    :cond_d2
    const/16 v16, 0x0

    goto :goto_5c

    .line 402
    .end local v14    # "sIx":I
    .restart local v2    # "bytes":[B
    .restart local v4    # "cc":I
    .restart local v6    # "d":I
    .restart local v8    # "eLen":I
    .restart local v11    # "len":I
    .restart local v15    # "sIx":I
    .restart local v16    # "sepCnt":I
    :cond_d5
    if-ge v6, v11, :cond_106

    .line 404
    const/4 v9, 0x0

    .line 405
    .restart local v9    # "i":I
    const/4 v10, 0x0

    .local v10, "j":I
    :goto_d9
    sub-int v17, v7, v12

    move/from16 v0, v17

    if-gt v15, v0, :cond_f3

    .line 406
    sget-object v17, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v14, v15, 0x1

    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    aget-char v18, p0, v15

    aget v17, v17, v18

    mul-int/lit8 v18, v10, 0x6

    rsub-int/lit8 v18, v18, 0x12

    shl-int v17, v17, v18

    or-int v9, v9, v17

    .line 405
    add-int/lit8 v10, v10, 0x1

    move v15, v14

    .end local v14    # "sIx":I
    .restart local v15    # "sIx":I
    goto :goto_d9

    .line 408
    :cond_f3
    const/16 v13, 0x10

    .local v13, "r":I
    :goto_f5
    if-ge v6, v11, :cond_106

    .line 409
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "d":I
    .restart local v5    # "d":I
    shr-int v17, v9, v13

    move/from16 v0, v17

    int-to-byte v0, v0

    move/from16 v17, v0

    aput-byte v17, v2, v6

    .line 408
    add-int/lit8 v13, v13, -0x8

    move v6, v5

    .end local v5    # "d":I
    .restart local v6    # "d":I
    goto :goto_f5

    .end local v9    # "i":I
    .end local v10    # "j":I
    .end local v13    # "r":I
    :cond_106
    move v5, v6

    .end local v6    # "d":I
    .restart local v5    # "d":I
    move v14, v15

    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    goto/16 :goto_8

    .end local v14    # "sIx":I
    .restart local v9    # "i":I
    .restart local v15    # "sIx":I
    :cond_10a
    move v14, v15

    .end local v15    # "sIx":I
    .restart local v14    # "sIx":I
    goto :goto_c6
.end method

.method public static decodeUTF8([BII[C)I
    .registers 18
    .param p0, "sa"    # [B
    .param p1, "sp"    # I
    .param p2, "len"    # I
    .param p3, "da"    # [C

    .prologue
    .line 599
    add-int v9, p1, p2

    .line 600
    .local v9, "sl":I
    const/4 v7, 0x0

    .line 601
    .local v7, "dp":I
    move-object/from16 v0, p3

    array-length v12, v0

    move/from16 v0, p2

    invoke-static {v0, v12}, Ljava/lang/Math;->min(II)I

    move-result v6

    .local v6, "dlASCII":I
    move v8, v7

    .end local v7    # "dp":I
    .local v8, "dp":I
    move v10, p1

    .line 604
    .end local p1    # "sp":I
    .local v10, "sp":I
    :goto_e
    if-ge v8, v6, :cond_2b

    aget-byte v12, p0, v10

    if-ltz v12, :cond_2b

    .line 605
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "dp":I
    .restart local v7    # "dp":I
    add-int/lit8 p1, v10, 0x1

    .end local v10    # "sp":I
    .restart local p1    # "sp":I
    aget-byte v12, p0, v10

    int-to-char v12, v12

    aput-char v12, p3, v8

    move v8, v7

    .end local v7    # "dp":I
    .restart local v8    # "dp":I
    move v10, p1

    .end local p1    # "sp":I
    .restart local v10    # "sp":I
    goto :goto_e

    .line 619
    .local v1, "b1":I
    .local v2, "b2":I
    :cond_20
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "dp":I
    .restart local v7    # "dp":I
    shl-int/lit8 v12, v1, 0x6

    xor-int/2addr v12, v2

    xor-int/lit16 v12, v12, 0xf80

    int-to-char v12, v12

    aput-char v12, p3, v8

    move v8, v7

    .line 607
    .end local v1    # "b1":I
    .end local v2    # "b2":I
    .end local v7    # "dp":I
    .restart local v8    # "dp":I
    :cond_2b
    :goto_2b
    if-ge v10, v9, :cond_f1

    .line 608
    add-int/lit8 p1, v10, 0x1

    .end local v10    # "sp":I
    .restart local p1    # "sp":I
    aget-byte v1, p0, v10

    .line 609
    .restart local v1    # "b1":I
    if-ltz v1, :cond_3b

    .line 611
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "dp":I
    .restart local v7    # "dp":I
    int-to-char v12, v1

    aput-char v12, p3, v8

    move v8, v7

    .end local v7    # "dp":I
    .restart local v8    # "dp":I
    move v10, p1

    .line 680
    .end local p1    # "sp":I
    .restart local v10    # "sp":I
    goto :goto_2b

    .line 612
    .end local v10    # "sp":I
    .restart local p1    # "sp":I
    :cond_3b
    shr-int/lit8 v12, v1, 0x5

    const/4 v13, -0x2

    if-ne v12, v13, :cond_55

    and-int/lit8 v12, v1, 0x1e

    if-eqz v12, :cond_55

    .line 614
    if-ge p1, v9, :cond_53

    .line 615
    add-int/lit8 v10, p1, 0x1

    .end local p1    # "sp":I
    .restart local v10    # "sp":I
    aget-byte v2, p0, p1

    .line 616
    .restart local v2    # "b2":I
    and-int/lit16 v12, v2, 0xc0

    const/16 v13, 0x80

    if-eq v12, v13, :cond_20

    .line 617
    const/4 v8, -0x1

    move p1, v10

    .line 681
    .end local v1    # "b1":I
    .end local v2    # "b2":I
    .end local v8    # "dp":I
    .end local v10    # "sp":I
    .restart local p1    # "sp":I
    :goto_52
    return v8

    .line 625
    .restart local v1    # "b1":I
    .restart local v8    # "dp":I
    :cond_53
    const/4 v8, -0x1

    goto :goto_52

    .line 626
    :cond_55
    shr-int/lit8 v12, v1, 0x4

    const/4 v13, -0x2

    if-ne v12, v13, :cond_9a

    .line 628
    add-int/lit8 v12, p1, 0x1

    if-ge v12, v9, :cond_98

    .line 629
    add-int/lit8 v10, p1, 0x1

    .end local p1    # "sp":I
    .restart local v10    # "sp":I
    aget-byte v2, p0, p1

    .line 630
    .restart local v2    # "b2":I
    add-int/lit8 p1, v10, 0x1

    .end local v10    # "sp":I
    .restart local p1    # "sp":I
    aget-byte v3, p0, v10

    .line 631
    .local v3, "b3":I
    const/16 v12, -0x20

    if-ne v1, v12, :cond_70

    and-int/lit16 v12, v2, 0xe0

    const/16 v13, 0x80

    if-eq v12, v13, :cond_7c

    :cond_70
    and-int/lit16 v12, v2, 0xc0

    const/16 v13, 0x80

    if-ne v12, v13, :cond_7c

    and-int/lit16 v12, v3, 0xc0

    const/16 v13, 0x80

    if-eq v12, v13, :cond_7e

    .line 634
    :cond_7c
    const/4 v8, -0x1

    goto :goto_52

    .line 636
    :cond_7e
    shl-int/lit8 v12, v1, 0xc

    shl-int/lit8 v13, v2, 0x6

    xor-int/2addr v12, v13

    const v13, -0x1e080

    xor-int/2addr v13, v3

    xor-int/2addr v12, v13

    int-to-char v5, v12

    .line 642
    .local v5, "c":C
    invoke-static {v5}, Ljava/lang/Character;->isSurrogate(C)Z

    move-result v12

    if-eqz v12, :cond_91

    .line 643
    const/4 v8, -0x1

    goto :goto_52

    .line 645
    :cond_91
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "dp":I
    .restart local v7    # "dp":I
    aput-char v5, p3, v8

    move v8, v7

    .end local v7    # "dp":I
    .restart local v8    # "dp":I
    move v10, p1

    .line 648
    .end local p1    # "sp":I
    .restart local v10    # "sp":I
    goto :goto_2b

    .line 650
    .end local v2    # "b2":I
    .end local v3    # "b3":I
    .end local v5    # "c":C
    .end local v10    # "sp":I
    .restart local p1    # "sp":I
    :cond_98
    const/4 v8, -0x1

    goto :goto_52

    .line 651
    :cond_9a
    shr-int/lit8 v12, v1, 0x3

    const/4 v13, -0x2

    if-ne v12, v13, :cond_ee

    .line 653
    add-int/lit8 v12, p1, 0x2

    if-ge v12, v9, :cond_eb

    .line 654
    add-int/lit8 v10, p1, 0x1

    .end local p1    # "sp":I
    .restart local v10    # "sp":I
    aget-byte v2, p0, p1

    .line 655
    .restart local v2    # "b2":I
    add-int/lit8 p1, v10, 0x1

    .end local v10    # "sp":I
    .restart local p1    # "sp":I
    aget-byte v3, p0, v10

    .line 656
    .restart local v3    # "b3":I
    add-int/lit8 v10, p1, 0x1

    .end local p1    # "sp":I
    .restart local v10    # "sp":I
    aget-byte v4, p0, p1

    .line 657
    .local v4, "b4":I
    shl-int/lit8 v12, v1, 0x12

    shl-int/lit8 v13, v2, 0xc

    xor-int/2addr v12, v13

    shl-int/lit8 v13, v3, 0x6

    xor-int/2addr v12, v13

    const v13, 0x381f80

    xor-int/2addr v13, v4

    xor-int v11, v12, v13

    .line 665
    .local v11, "uc":I
    and-int/lit16 v12, v2, 0xc0

    const/16 v13, 0x80

    if-ne v12, v13, :cond_d5

    and-int/lit16 v12, v3, 0xc0

    const/16 v13, 0x80

    if-ne v12, v13, :cond_d5

    and-int/lit16 v12, v4, 0xc0

    const/16 v13, 0x80

    if-ne v12, v13, :cond_d5

    .line 668
    invoke-static {v11}, Ljava/lang/Character;->isSupplementaryCodePoint(I)Z

    move-result v12

    if-nez v12, :cond_d9

    .line 669
    :cond_d5
    const/4 v8, -0x1

    move p1, v10

    .end local v10    # "sp":I
    .restart local p1    # "sp":I
    goto/16 :goto_52

    .line 671
    .end local p1    # "sp":I
    .restart local v10    # "sp":I
    :cond_d9
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "dp":I
    .restart local v7    # "dp":I
    invoke-static {v11}, Ljava/lang/Character;->highSurrogate(I)C

    move-result v12

    aput-char v12, p3, v8

    .line 672
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "dp":I
    .restart local v8    # "dp":I
    invoke-static {v11}, Ljava/lang/Character;->lowSurrogate(I)C

    move-result v12

    aput-char v12, p3, v7

    goto/16 :goto_2b

    .line 676
    .end local v2    # "b2":I
    .end local v3    # "b3":I
    .end local v4    # "b4":I
    .end local v10    # "sp":I
    .end local v11    # "uc":I
    .restart local p1    # "sp":I
    :cond_eb
    const/4 v8, -0x1

    goto/16 :goto_52

    .line 678
    :cond_ee
    const/4 v8, -0x1

    goto/16 :goto_52

    .end local v1    # "b1":I
    .end local p1    # "sp":I
    .restart local v10    # "sp":I
    :cond_f1
    move p1, v10

    .line 681
    .end local v10    # "sp":I
    .restart local p1    # "sp":I
    goto/16 :goto_52
.end method

.method public static encodeUTF8([CII[B)I
    .registers 18
    .param p0, "sa"    # [C
    .param p1, "sp"    # I
    .param p2, "len"    # I
    .param p3, "da"    # [B

    .prologue
    .line 539
    add-int v7, p1, p2

    .line 540
    .local v7, "sl":I
    const/4 v4, 0x0

    .line 541
    .local v4, "dp":I
    move-object/from16 v0, p3

    array-length v10, v0

    move/from16 v0, p2

    invoke-static {v0, v10}, Ljava/lang/Math;->min(II)I

    move-result v10

    add-int v3, v4, v10

    .local v3, "dlASCII":I
    move v5, v4

    .end local v4    # "dp":I
    .local v5, "dp":I
    move v8, p1

    .line 544
    .end local p1    # "sp":I
    .local v8, "sp":I
    :goto_10
    if-ge v5, v3, :cond_24

    aget-char v10, p0, v8

    const/16 v11, 0x80

    if-ge v10, v11, :cond_24

    .line 545
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "dp":I
    .restart local v4    # "dp":I
    add-int/lit8 p1, v8, 0x1

    .end local v8    # "sp":I
    .restart local p1    # "sp":I
    aget-char v10, p0, v8

    int-to-byte v10, v10

    aput-byte v10, p3, v5

    move v5, v4

    .end local v4    # "dp":I
    .restart local v5    # "dp":I
    move v8, p1

    .end local p1    # "sp":I
    .restart local v8    # "sp":I
    goto :goto_10

    .line 548
    :cond_24
    :goto_24
    if-ge v8, v7, :cond_ee

    .line 549
    add-int/lit8 p1, v8, 0x1

    .end local v8    # "sp":I
    .restart local p1    # "sp":I
    aget-char v1, p0, v8

    .line 550
    .local v1, "c":C
    const/16 v10, 0x80

    if-ge v1, v10, :cond_36

    .line 552
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "dp":I
    .restart local v4    # "dp":I
    int-to-byte v10, v1

    aput-byte v10, p3, v5

    :goto_33
    move v5, v4

    .end local v4    # "dp":I
    .restart local v5    # "dp":I
    move v8, p1

    .line 594
    .end local p1    # "sp":I
    .restart local v8    # "sp":I
    goto :goto_24

    .line 553
    .end local v8    # "sp":I
    .restart local p1    # "sp":I
    :cond_36
    const/16 v10, 0x800

    if-ge v1, v10, :cond_4e

    .line 555
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "dp":I
    .restart local v4    # "dp":I
    shr-int/lit8 v10, v1, 0x6

    or-int/lit16 v10, v10, 0xc0

    int-to-byte v10, v10

    aput-byte v10, p3, v5

    .line 556
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dp":I
    .restart local v5    # "dp":I
    and-int/lit8 v10, v1, 0x3f

    or-int/lit16 v10, v10, 0x80

    int-to-byte v10, v10

    aput-byte v10, p3, v4

    move v4, v5

    .end local v5    # "dp":I
    .restart local v4    # "dp":I
    goto :goto_33

    .line 557
    .end local v4    # "dp":I
    .restart local v5    # "dp":I
    :cond_4e
    const v10, 0xd800

    if-lt v1, v10, :cond_cf

    const v10, 0xe000

    if-ge v1, v10, :cond_cf

    .line 559
    add-int/lit8 v6, p1, -0x1

    .line 560
    .local v6, "ip":I
    invoke-static {v1}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v10

    if-eqz v10, :cond_8c

    .line 561
    sub-int v10, v7, v6

    const/4 v11, 0x2

    if-ge v10, v11, :cond_6f

    .line 562
    const/4 v9, -0x1

    .line 579
    .local v9, "uc":I
    :goto_66
    if-gez v9, :cond_a2

    .line 580
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "dp":I
    .restart local v4    # "dp":I
    const/16 v10, 0x3f

    aput-byte v10, p3, v5

    goto :goto_33

    .line 564
    .end local v4    # "dp":I
    .end local v9    # "uc":I
    .restart local v5    # "dp":I
    :cond_6f
    add-int/lit8 v10, v6, 0x1

    aget-char v2, p0, v10

    .line 565
    .local v2, "d":C
    invoke-static {v2}, Ljava/lang/Character;->isLowSurrogate(C)Z

    move-result v10

    if-eqz v10, :cond_7e

    .line 566
    invoke-static {v1, v2}, Ljava/lang/Character;->toCodePoint(CC)I

    move-result v9

    .restart local v9    # "uc":I
    goto :goto_66

    .line 568
    .end local v9    # "uc":I
    :cond_7e
    new-instance v10, Lcom/alibaba/fastjson/JSONException;

    const-string v11, "encodeUTF8 error"

    new-instance v12, Ljava/nio/charset/MalformedInputException;

    const/4 v13, 0x1

    invoke-direct {v12, v13}, Ljava/nio/charset/MalformedInputException;-><init>(I)V

    invoke-direct {v10, v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 572
    .end local v2    # "d":C
    :cond_8c
    invoke-static {v1}, Ljava/lang/Character;->isLowSurrogate(C)Z

    move-result v10

    if-eqz v10, :cond_a0

    .line 573
    new-instance v10, Lcom/alibaba/fastjson/JSONException;

    const-string v11, "encodeUTF8 error"

    new-instance v12, Ljava/nio/charset/MalformedInputException;

    const/4 v13, 0x1

    invoke-direct {v12, v13}, Ljava/nio/charset/MalformedInputException;-><init>(I)V

    invoke-direct {v10, v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 575
    :cond_a0
    move v9, v1

    .restart local v9    # "uc":I
    goto :goto_66

    .line 582
    :cond_a2
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "dp":I
    .restart local v4    # "dp":I
    shr-int/lit8 v10, v9, 0x12

    or-int/lit16 v10, v10, 0xf0

    int-to-byte v10, v10

    aput-byte v10, p3, v5

    .line 583
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dp":I
    .restart local v5    # "dp":I
    shr-int/lit8 v10, v9, 0xc

    and-int/lit8 v10, v10, 0x3f

    or-int/lit16 v10, v10, 0x80

    int-to-byte v10, v10

    aput-byte v10, p3, v4

    .line 584
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "dp":I
    .restart local v4    # "dp":I
    shr-int/lit8 v10, v9, 0x6

    and-int/lit8 v10, v10, 0x3f

    or-int/lit16 v10, v10, 0x80

    int-to-byte v10, v10

    aput-byte v10, p3, v5

    .line 585
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dp":I
    .restart local v5    # "dp":I
    and-int/lit8 v10, v9, 0x3f

    or-int/lit16 v10, v10, 0x80

    int-to-byte v10, v10

    aput-byte v10, p3, v4

    .line 586
    add-int/lit8 p1, p1, 0x1

    move v4, v5

    .end local v5    # "dp":I
    .restart local v4    # "dp":I
    goto/16 :goto_33

    .line 590
    .end local v4    # "dp":I
    .end local v6    # "ip":I
    .end local v9    # "uc":I
    .restart local v5    # "dp":I
    :cond_cf
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "dp":I
    .restart local v4    # "dp":I
    shr-int/lit8 v10, v1, 0xc

    or-int/lit16 v10, v10, 0xe0

    int-to-byte v10, v10

    aput-byte v10, p3, v5

    .line 591
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dp":I
    .restart local v5    # "dp":I
    shr-int/lit8 v10, v1, 0x6

    and-int/lit8 v10, v10, 0x3f

    or-int/lit16 v10, v10, 0x80

    int-to-byte v10, v10

    aput-byte v10, p3, v4

    .line 592
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "dp":I
    .restart local v4    # "dp":I
    and-int/lit8 v10, v1, 0x3f

    or-int/lit16 v10, v10, 0x80

    int-to-byte v10, v10

    aput-byte v10, p3, v5

    goto/16 :goto_33

    .line 595
    .end local v1    # "c":C
    .end local v4    # "dp":I
    .end local p1    # "sp":I
    .restart local v5    # "dp":I
    .restart local v8    # "sp":I
    :cond_ee
    return v5
.end method

.method public static firstIdentifier(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 333
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->firstIdentifierFlags:[Z

    array-length v0, v0

    if-ge p0, v0, :cond_d

    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->firstIdentifierFlags:[Z

    aget-boolean v0, v0, p0

    if-eqz v0, :cond_d

    const/4 v0, 0x1

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public static getChars(BI[C)V
    .registers 10
    .param p0, "b"    # B
    .param p1, "index"    # I
    .param p2, "buf"    # [C

    .prologue
    .line 259
    move v1, p0

    .line 261
    .local v1, "i":I
    move v0, p1

    .line 262
    .local v0, "charPos":I
    const/4 v4, 0x0

    .line 264
    .local v4, "sign":C
    if-gez v1, :cond_8

    .line 265
    const/16 v4, 0x2d

    .line 266
    neg-int v1, v1

    .line 272
    :cond_8
    const v5, 0xcccd

    mul-int/2addr v5, v1

    ushr-int/lit8 v2, v5, 0x13

    .line 273
    .local v2, "q":I
    shl-int/lit8 v5, v2, 0x3

    shl-int/lit8 v6, v2, 0x1

    add-int/2addr v5, v6

    sub-int v3, v1, v5

    .line 274
    .local v3, "r":I
    add-int/lit8 v0, v0, -0x1

    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->digits:[C

    aget-char v5, v5, v3

    aput-char v5, p2, v0

    .line 275
    move v1, v2

    .line 276
    if-nez v1, :cond_8

    .line 278
    if-eqz v4, :cond_26

    .line 279
    add-int/lit8 v0, v0, -0x1

    aput-char v4, p2, v0

    .line 281
    :cond_26
    return-void
.end method

.method public static getChars(II[C)V
    .registers 9
    .param p0, "i"    # I
    .param p1, "index"    # I
    .param p2, "buf"    # [C

    .prologue
    .line 226
    move v0, p1

    .line 227
    .local v0, "charPos":I
    const/4 v3, 0x0

    .line 229
    .local v3, "sign":C
    if-gez p0, :cond_7

    .line 230
    const/16 v3, 0x2d

    .line 231
    neg-int p0, p0

    .line 235
    :cond_7
    :goto_7
    const/high16 v4, 0x10000

    if-lt p0, v4, :cond_29

    .line 236
    div-int/lit8 v1, p0, 0x64

    .line 238
    .local v1, "q":I
    shl-int/lit8 v4, v1, 0x6

    shl-int/lit8 v5, v1, 0x5

    add-int/2addr v4, v5

    shl-int/lit8 v5, v1, 0x2

    add-int/2addr v4, v5

    sub-int v2, p0, v4

    .line 239
    .local v2, "r":I
    move p0, v1

    .line 240
    add-int/lit8 v0, v0, -0x1

    sget-object v4, Lcom/alibaba/fastjson/util/IOUtils;->DigitOnes:[C

    aget-char v4, v4, v2

    aput-char v4, p2, v0

    .line 241
    add-int/lit8 v0, v0, -0x1

    sget-object v4, Lcom/alibaba/fastjson/util/IOUtils;->DigitTens:[C

    aget-char v4, v4, v2

    aput-char v4, p2, v0

    goto :goto_7

    .line 247
    .end local v1    # "q":I
    .end local v2    # "r":I
    :cond_29
    const v4, 0xcccd

    mul-int/2addr v4, p0

    ushr-int/lit8 v1, v4, 0x13

    .line 248
    .restart local v1    # "q":I
    shl-int/lit8 v4, v1, 0x3

    shl-int/lit8 v5, v1, 0x1

    add-int/2addr v4, v5

    sub-int v2, p0, v4

    .line 249
    .restart local v2    # "r":I
    add-int/lit8 v0, v0, -0x1

    sget-object v4, Lcom/alibaba/fastjson/util/IOUtils;->digits:[C

    aget-char v4, v4, v2

    aput-char v4, p2, v0

    .line 250
    move p0, v1

    .line 251
    if-nez p0, :cond_29

    .line 253
    if-eqz v3, :cond_47

    .line 254
    add-int/lit8 v0, v0, -0x1

    aput-char v3, p2, v0

    .line 256
    :cond_47
    return-void
.end method

.method public static getChars(JI[C)V
    .registers 15
    .param p0, "i"    # J
    .param p2, "index"    # I
    .param p3, "buf"    # [C

    .prologue
    .line 175
    move v0, p2

    .line 176
    .local v0, "charPos":I
    const/4 v6, 0x0

    .line 178
    .local v6, "sign":C
    const-wide/16 v7, 0x0

    cmp-long v7, p0, v7

    if-gez v7, :cond_b

    .line 179
    const/16 v6, 0x2d

    .line 180
    neg-long p0, p0

    .line 184
    :cond_b
    :goto_b
    const-wide/32 v7, 0x7fffffff

    cmp-long v7, p0, v7

    if-lez v7, :cond_36

    .line 185
    const-wide/16 v7, 0x64

    div-long v2, p0, v7

    .line 187
    .local v2, "q":J
    const/4 v7, 0x6

    shl-long v7, v2, v7

    const/4 v9, 0x5

    shl-long v9, v2, v9

    add-long/2addr v7, v9

    const/4 v9, 0x2

    shl-long v9, v2, v9

    add-long/2addr v7, v9

    sub-long v7, p0, v7

    long-to-int v5, v7

    .line 188
    .local v5, "r":I
    move-wide p0, v2

    .line 189
    add-int/lit8 v0, v0, -0x1

    sget-object v7, Lcom/alibaba/fastjson/util/IOUtils;->DigitOnes:[C

    aget-char v7, v7, v5

    aput-char v7, p3, v0

    .line 190
    add-int/lit8 v0, v0, -0x1

    sget-object v7, Lcom/alibaba/fastjson/util/IOUtils;->DigitTens:[C

    aget-char v7, v7, v5

    aput-char v7, p3, v0

    goto :goto_b

    .line 195
    .end local v2    # "q":J
    .end local v5    # "r":I
    :cond_36
    long-to-int v1, p0

    .line 196
    .local v1, "i2":I
    :goto_37
    const/high16 v7, 0x10000

    if-lt v1, v7, :cond_59

    .line 197
    div-int/lit8 v4, v1, 0x64

    .line 199
    .local v4, "q2":I
    shl-int/lit8 v7, v4, 0x6

    shl-int/lit8 v8, v4, 0x5

    add-int/2addr v7, v8

    shl-int/lit8 v8, v4, 0x2

    add-int/2addr v7, v8

    sub-int v5, v1, v7

    .line 200
    .restart local v5    # "r":I
    move v1, v4

    .line 201
    add-int/lit8 v0, v0, -0x1

    sget-object v7, Lcom/alibaba/fastjson/util/IOUtils;->DigitOnes:[C

    aget-char v7, v7, v5

    aput-char v7, p3, v0

    .line 202
    add-int/lit8 v0, v0, -0x1

    sget-object v7, Lcom/alibaba/fastjson/util/IOUtils;->DigitTens:[C

    aget-char v7, v7, v5

    aput-char v7, p3, v0

    goto :goto_37

    .line 208
    .end local v4    # "q2":I
    .end local v5    # "r":I
    :cond_59
    const v7, 0xcccd

    mul-int/2addr v7, v1

    ushr-int/lit8 v4, v7, 0x13

    .line 209
    .restart local v4    # "q2":I
    shl-int/lit8 v7, v4, 0x3

    shl-int/lit8 v8, v4, 0x1

    add-int/2addr v7, v8

    sub-int v5, v1, v7

    .line 210
    .restart local v5    # "r":I
    add-int/lit8 v0, v0, -0x1

    sget-object v7, Lcom/alibaba/fastjson/util/IOUtils;->digits:[C

    aget-char v7, v7, v5

    aput-char v7, p3, v0

    .line 211
    move v1, v4

    .line 212
    if-nez v1, :cond_59

    .line 214
    if-eqz v6, :cond_77

    .line 215
    add-int/lit8 v0, v0, -0x1

    aput-char v6, p3, v0

    .line 217
    :cond_77
    return-void
.end method

.method public static isIdent(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 337
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->identifierFlags:[Z

    array-length v0, v0

    if-ge p0, v0, :cond_d

    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->identifierFlags:[Z

    aget-boolean v0, v0, p0

    if-eqz v0, :cond_d

    const/4 v0, 0x1

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public static stringSize(I)I
    .registers 3
    .param p0, "x"    # I

    .prologue
    .line 305
    const/4 v0, 0x0

    .line 306
    .local v0, "i":I
    :goto_1
    sget-object v1, Lcom/alibaba/fastjson/util/IOUtils;->sizeTable:[I

    aget v1, v1, v0

    if-gt p0, v1, :cond_a

    .line 307
    add-int/lit8 v1, v0, 0x1

    return v1

    .line 305
    :cond_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static stringSize(J)I
    .registers 8
    .param p0, "x"    # J

    .prologue
    const/16 v3, 0x13

    .line 164
    const-wide/16 v1, 0xa

    .line 165
    .local v1, "p":J
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_5
    if-ge v0, v3, :cond_12

    .line 166
    cmp-long v4, p0, v1

    if-gez v4, :cond_c

    .line 169
    .end local v0    # "i":I
    :goto_b
    return v0

    .line 167
    .restart local v0    # "i":I
    :cond_c
    const-wide/16 v4, 0xa

    mul-long/2addr v1, v4

    .line 165
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_12
    move v0, v3

    .line 169
    goto :goto_b
.end method
