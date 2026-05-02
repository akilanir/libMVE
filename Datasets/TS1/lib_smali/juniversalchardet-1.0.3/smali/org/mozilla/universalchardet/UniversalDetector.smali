.class public Lorg/mozilla/universalchardet/UniversalDetector;
.super Ljava/lang/Object;
.source "UniversalDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/universalchardet/UniversalDetector$InputState;
    }
.end annotation


# static fields
.field public static final MINIMUM_THRESHOLD:F = 0.2f

.field public static final SHORTCUT_THRESHOLD:F = 0.95f


# instance fields
.field private detectedCharset:Ljava/lang/String;

.field private done:Z

.field private escCharsetProber:Lorg/mozilla/universalchardet/prober/CharsetProber;

.field private gotData:Z

.field private inputState:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

.field private lastChar:B

.field private listener:Lorg/mozilla/universalchardet/CharsetListener;

.field private probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

.field private start:Z


# direct methods
.method public constructor <init>(Lorg/mozilla/universalchardet/CharsetListener;)V
    .registers 5
    .param p1, "listener"    # Lorg/mozilla/universalchardet/CharsetListener;

    .prologue
    const/4 v2, 0x0

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    iput-object p1, p0, Lorg/mozilla/universalchardet/UniversalDetector;->listener:Lorg/mozilla/universalchardet/CharsetListener;

    .line 94
    iput-object v2, p0, Lorg/mozilla/universalchardet/UniversalDetector;->escCharsetProber:Lorg/mozilla/universalchardet/prober/CharsetProber;

    .line 95
    const/4 v1, 0x3

    new-array v1, v1, [Lorg/mozilla/universalchardet/prober/CharsetProber;

    iput-object v1, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    .line 96
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    iget-object v1, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    array-length v1, v1

    if-ge v0, v1, :cond_1a

    .line 97
    iget-object v1, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    aput-object v2, v1, v0

    .line 96
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 100
    :cond_1a
    invoke-virtual {p0}, Lorg/mozilla/universalchardet/UniversalDetector;->reset()V

    .line 101
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 8
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 301
    array-length v4, p0

    const/4 v5, 0x1

    if-eq v4, v5, :cond_d

    .line 302
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "USAGE: java UniversalDetector filename"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 323
    :goto_c
    return-void

    .line 306
    :cond_d
    new-instance v1, Lorg/mozilla/universalchardet/UniversalDetector;

    new-instance v4, Lorg/mozilla/universalchardet/UniversalDetector$1;

    invoke-direct {v4}, Lorg/mozilla/universalchardet/UniversalDetector$1;-><init>()V

    invoke-direct {v1, v4}, Lorg/mozilla/universalchardet/UniversalDetector;-><init>(Lorg/mozilla/universalchardet/CharsetListener;)V

    .line 315
    .local v1, "detector":Lorg/mozilla/universalchardet/UniversalDetector;
    const/16 v4, 0x1000

    new-array v0, v4, [B

    .line 316
    .local v0, "buf":[B
    new-instance v2, Ljava/io/FileInputStream;

    aget-object v4, p0, v6

    invoke-direct {v2, v4}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 319
    .local v2, "fis":Ljava/io/FileInputStream;
    :goto_22
    invoke-virtual {v2, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    .local v3, "nread":I
    if-lez v3, :cond_32

    invoke-virtual {v1}, Lorg/mozilla/universalchardet/UniversalDetector;->isDone()Z

    move-result v4

    if-nez v4, :cond_32

    .line 320
    invoke-virtual {v1, v0, v6, v3}, Lorg/mozilla/universalchardet/UniversalDetector;->handleData([BII)V

    goto :goto_22

    .line 322
    :cond_32
    invoke-virtual {v1}, Lorg/mozilla/universalchardet/UniversalDetector;->dataEnd()V

    goto :goto_c
.end method


# virtual methods
.method public dataEnd()V
    .registers 7

    .prologue
    .line 237
    iget-boolean v4, p0, Lorg/mozilla/universalchardet/UniversalDetector;->gotData:Z

    if-nez v4, :cond_5

    .line 273
    :cond_4
    :goto_4
    return-void

    .line 241
    :cond_5
    iget-object v4, p0, Lorg/mozilla/universalchardet/UniversalDetector;->detectedCharset:Ljava/lang/String;

    if-eqz v4, :cond_18

    .line 242
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/mozilla/universalchardet/UniversalDetector;->done:Z

    .line 243
    iget-object v4, p0, Lorg/mozilla/universalchardet/UniversalDetector;->listener:Lorg/mozilla/universalchardet/CharsetListener;

    if-eqz v4, :cond_4

    .line 244
    iget-object v4, p0, Lorg/mozilla/universalchardet/UniversalDetector;->listener:Lorg/mozilla/universalchardet/CharsetListener;

    iget-object v5, p0, Lorg/mozilla/universalchardet/UniversalDetector;->detectedCharset:Ljava/lang/String;

    invoke-interface {v4, v5}, Lorg/mozilla/universalchardet/CharsetListener;->report(Ljava/lang/String;)V

    goto :goto_4

    .line 249
    :cond_18
    iget-object v4, p0, Lorg/mozilla/universalchardet/UniversalDetector;->inputState:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    sget-object v5, Lorg/mozilla/universalchardet/UniversalDetector$InputState;->HIGHBYTE:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    if-ne v4, v5, :cond_54

    .line 251
    const/4 v2, 0x0

    .line 252
    .local v2, "maxProberConfidence":F
    const/4 v1, 0x0

    .line 254
    .local v1, "maxProber":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    iget-object v4, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    array-length v4, v4

    if-ge v0, v4, :cond_37

    .line 255
    iget-object v4, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    aget-object v4, v4, v0

    invoke-virtual {v4}, Lorg/mozilla/universalchardet/prober/CharsetProber;->getConfidence()F

    move-result v3

    .line 256
    .local v3, "proberConfidence":F
    cmpl-float v4, v3, v2

    if-lez v4, :cond_34

    .line 257
    move v2, v3

    .line 258
    move v1, v0

    .line 254
    :cond_34
    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    .line 262
    .end local v3    # "proberConfidence":F
    :cond_37
    const v4, 0x3e4ccccd    # 0.2f

    cmpl-float v4, v2, v4

    if-lez v4, :cond_4

    .line 263
    iget-object v4, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    aget-object v4, v4, v1

    invoke-virtual {v4}, Lorg/mozilla/universalchardet/prober/CharsetProber;->getCharSetName()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/mozilla/universalchardet/UniversalDetector;->detectedCharset:Ljava/lang/String;

    .line 264
    iget-object v4, p0, Lorg/mozilla/universalchardet/UniversalDetector;->listener:Lorg/mozilla/universalchardet/CharsetListener;

    if-eqz v4, :cond_4

    .line 265
    iget-object v4, p0, Lorg/mozilla/universalchardet/UniversalDetector;->listener:Lorg/mozilla/universalchardet/CharsetListener;

    iget-object v5, p0, Lorg/mozilla/universalchardet/UniversalDetector;->detectedCharset:Ljava/lang/String;

    invoke-interface {v4, v5}, Lorg/mozilla/universalchardet/CharsetListener;->report(Ljava/lang/String;)V

    goto :goto_4

    .line 268
    .end local v0    # "i":I
    .end local v1    # "maxProber":I
    .end local v2    # "maxProberConfidence":F
    :cond_54
    iget-object v4, p0, Lorg/mozilla/universalchardet/UniversalDetector;->inputState:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    sget-object v5, Lorg/mozilla/universalchardet/UniversalDetector$InputState;->ESC_ASCII:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    if-ne v4, v5, :cond_4

    goto :goto_4
.end method

.method public getDetectedCharset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Lorg/mozilla/universalchardet/UniversalDetector;->detectedCharset:Ljava/lang/String;

    return-object v0
.end method

.method public getListener()Lorg/mozilla/universalchardet/CharsetListener;
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lorg/mozilla/universalchardet/UniversalDetector;->listener:Lorg/mozilla/universalchardet/CharsetListener;

    return-object v0
.end method

.method public handleData([BII)V
    .registers 15
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 129
    iget-boolean v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->done:Z

    if-eqz v8, :cond_5

    .line 233
    :cond_4
    :goto_4
    return-void

    .line 133
    :cond_5
    if-lez p3, :cond_a

    .line 134
    const/4 v8, 0x1

    iput-boolean v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->gotData:Z

    .line 137
    :cond_a
    iget-boolean v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->start:Z

    if-eqz v8, :cond_8c

    .line 138
    const/4 v8, 0x0

    iput-boolean v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->start:Z

    .line 139
    const/4 v8, 0x3

    if-le p3, v8, :cond_8c

    .line 140
    aget-byte v8, p1, p2

    and-int/lit16 v0, v8, 0xff

    .line 141
    .local v0, "b1":I
    add-int/lit8 v8, p2, 0x1

    aget-byte v8, p1, v8

    and-int/lit16 v1, v8, 0xff

    .line 142
    .local v1, "b2":I
    add-int/lit8 v8, p2, 0x2

    aget-byte v8, p1, v8

    and-int/lit16 v2, v8, 0xff

    .line 143
    .local v2, "b3":I
    add-int/lit8 v8, p2, 0x3

    aget-byte v8, p1, v8

    and-int/lit16 v3, v8, 0xff

    .line 145
    .local v3, "b4":I
    sparse-switch v0, :sswitch_data_154

    .line 174
    :cond_2d
    :goto_2d
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->detectedCharset:Ljava/lang/String;

    if-eqz v8, :cond_8c

    .line 175
    const/4 v8, 0x1

    iput-boolean v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->done:Z

    goto :goto_4

    .line 147
    :sswitch_35
    const/16 v8, 0xbb

    if-ne v1, v8, :cond_2d

    const/16 v8, 0xbf

    if-ne v2, v8, :cond_2d

    .line 148
    sget-object v8, Lorg/mozilla/universalchardet/Constants;->CHARSET_UTF_8:Ljava/lang/String;

    iput-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->detectedCharset:Ljava/lang/String;

    goto :goto_2d

    .line 152
    :sswitch_42
    const/16 v8, 0xff

    if-ne v1, v8, :cond_4f

    if-nez v2, :cond_4f

    if-nez v3, :cond_4f

    .line 153
    sget-object v8, Lorg/mozilla/universalchardet/Constants;->CHARSET_X_ISO_10646_UCS_4_3412:Ljava/lang/String;

    iput-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->detectedCharset:Ljava/lang/String;

    goto :goto_2d

    .line 154
    :cond_4f
    const/16 v8, 0xff

    if-ne v1, v8, :cond_2d

    .line 155
    sget-object v8, Lorg/mozilla/universalchardet/Constants;->CHARSET_UTF_16BE:Ljava/lang/String;

    iput-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->detectedCharset:Ljava/lang/String;

    goto :goto_2d

    .line 159
    :sswitch_58
    if-nez v1, :cond_67

    const/16 v8, 0xfe

    if-ne v2, v8, :cond_67

    const/16 v8, 0xff

    if-ne v3, v8, :cond_67

    .line 160
    sget-object v8, Lorg/mozilla/universalchardet/Constants;->CHARSET_UTF_32BE:Ljava/lang/String;

    iput-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->detectedCharset:Ljava/lang/String;

    goto :goto_2d

    .line 161
    :cond_67
    if-nez v1, :cond_2d

    const/16 v8, 0xff

    if-ne v2, v8, :cond_2d

    const/16 v8, 0xfe

    if-ne v3, v8, :cond_2d

    .line 162
    sget-object v8, Lorg/mozilla/universalchardet/Constants;->CHARSET_X_ISO_10646_UCS_4_2143:Ljava/lang/String;

    iput-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->detectedCharset:Ljava/lang/String;

    goto :goto_2d

    .line 166
    :sswitch_76
    const/16 v8, 0xfe

    if-ne v1, v8, :cond_83

    if-nez v2, :cond_83

    if-nez v3, :cond_83

    .line 167
    sget-object v8, Lorg/mozilla/universalchardet/Constants;->CHARSET_UTF_32LE:Ljava/lang/String;

    iput-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->detectedCharset:Ljava/lang/String;

    goto :goto_2d

    .line 168
    :cond_83
    const/16 v8, 0xfe

    if-ne v1, v8, :cond_2d

    .line 169
    sget-object v8, Lorg/mozilla/universalchardet/Constants;->CHARSET_UTF_16LE:Ljava/lang/String;

    iput-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->detectedCharset:Ljava/lang/String;

    goto :goto_2d

    .line 181
    .end local v0    # "b1":I
    .end local v1    # "b2":I
    .end local v2    # "b3":I
    .end local v3    # "b4":I
    :cond_8c
    add-int v6, p2, p3

    .line 182
    .local v6, "maxPos":I
    move v5, p2

    .local v5, "i":I
    :goto_8f
    if-ge v5, v6, :cond_101

    .line 183
    aget-byte v8, p1, v5

    and-int/lit16 v4, v8, 0xff

    .line 184
    .local v4, "c":I
    and-int/lit16 v8, v4, 0x80

    if-eqz v8, :cond_e4

    const/16 v8, 0xa0

    if-eq v4, v8, :cond_e4

    .line 185
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->inputState:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    sget-object v9, Lorg/mozilla/universalchardet/UniversalDetector$InputState;->HIGHBYTE:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    if-eq v8, v9, :cond_e1

    .line 186
    sget-object v8, Lorg/mozilla/universalchardet/UniversalDetector$InputState;->HIGHBYTE:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    iput-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->inputState:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    .line 188
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->escCharsetProber:Lorg/mozilla/universalchardet/prober/CharsetProber;

    if-eqz v8, :cond_ae

    .line 189
    const/4 v8, 0x0

    iput-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->escCharsetProber:Lorg/mozilla/universalchardet/prober/CharsetProber;

    .line 192
    :cond_ae
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    const/4 v9, 0x0

    aget-object v8, v8, v9

    if-nez v8, :cond_bf

    .line 193
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    const/4 v9, 0x0

    new-instance v10, Lorg/mozilla/universalchardet/prober/MBCSGroupProber;

    invoke-direct {v10}, Lorg/mozilla/universalchardet/prober/MBCSGroupProber;-><init>()V

    aput-object v10, v8, v9

    .line 195
    :cond_bf
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    const/4 v9, 0x1

    aget-object v8, v8, v9

    if-nez v8, :cond_d0

    .line 196
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    const/4 v9, 0x1

    new-instance v10, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;

    invoke-direct {v10}, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;-><init>()V

    aput-object v10, v8, v9

    .line 198
    :cond_d0
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    const/4 v9, 0x2

    aget-object v8, v8, v9

    if-nez v8, :cond_e1

    .line 199
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    const/4 v9, 0x2

    new-instance v10, Lorg/mozilla/universalchardet/prober/Latin1Prober;

    invoke-direct {v10}, Lorg/mozilla/universalchardet/prober/Latin1Prober;-><init>()V

    aput-object v10, v8, v9

    .line 182
    :cond_e1
    :goto_e1
    add-int/lit8 v5, v5, 0x1

    goto :goto_8f

    .line 203
    :cond_e4
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->inputState:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    sget-object v9, Lorg/mozilla/universalchardet/UniversalDetector$InputState;->PURE_ASCII:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    if-ne v8, v9, :cond_fc

    const/16 v8, 0x1b

    if-eq v4, v8, :cond_f8

    const/16 v8, 0x7b

    if-ne v4, v8, :cond_fc

    iget-byte v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->lastChar:B

    const/16 v9, 0x7e

    if-ne v8, v9, :cond_fc

    .line 205
    :cond_f8
    sget-object v8, Lorg/mozilla/universalchardet/UniversalDetector$InputState;->ESC_ASCII:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    iput-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->inputState:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    .line 207
    :cond_fc
    aget-byte v8, p1, v5

    iput-byte v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->lastChar:B

    goto :goto_e1

    .line 212
    .end local v4    # "c":I
    :cond_101
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->inputState:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    sget-object v9, Lorg/mozilla/universalchardet/UniversalDetector$InputState;->ESC_ASCII:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    if-ne v8, v9, :cond_129

    .line 213
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->escCharsetProber:Lorg/mozilla/universalchardet/prober/CharsetProber;

    if-nez v8, :cond_112

    .line 214
    new-instance v8, Lorg/mozilla/universalchardet/prober/EscCharsetProber;

    invoke-direct {v8}, Lorg/mozilla/universalchardet/prober/EscCharsetProber;-><init>()V

    iput-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->escCharsetProber:Lorg/mozilla/universalchardet/prober/CharsetProber;

    .line 216
    :cond_112
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->escCharsetProber:Lorg/mozilla/universalchardet/prober/CharsetProber;

    invoke-virtual {v8, p1, p2, p3}, Lorg/mozilla/universalchardet/prober/CharsetProber;->handleData([BII)Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    move-result-object v7

    .line 217
    .local v7, "st":Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    sget-object v8, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->FOUND_IT:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    if-ne v7, v8, :cond_4

    .line 218
    const/4 v8, 0x1

    iput-boolean v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->done:Z

    .line 219
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->escCharsetProber:Lorg/mozilla/universalchardet/prober/CharsetProber;

    invoke-virtual {v8}, Lorg/mozilla/universalchardet/prober/CharsetProber;->getCharSetName()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->detectedCharset:Ljava/lang/String;

    goto/16 :goto_4

    .line 221
    .end local v7    # "st":Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    :cond_129
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->inputState:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    sget-object v9, Lorg/mozilla/universalchardet/UniversalDetector$InputState;->HIGHBYTE:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    if-ne v8, v9, :cond_4

    .line 222
    const/4 v5, 0x0

    :goto_130
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    array-length v8, v8

    if-ge v5, v8, :cond_4

    .line 223
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    aget-object v8, v8, v5

    invoke-virtual {v8, p1, p2, p3}, Lorg/mozilla/universalchardet/prober/CharsetProber;->handleData([BII)Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    move-result-object v7

    .line 224
    .restart local v7    # "st":Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    sget-object v8, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->FOUND_IT:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    if-ne v7, v8, :cond_150

    .line 225
    const/4 v8, 0x1

    iput-boolean v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->done:Z

    .line 226
    iget-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    aget-object v8, v8, v5

    invoke-virtual {v8}, Lorg/mozilla/universalchardet/prober/CharsetProber;->getCharSetName()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lorg/mozilla/universalchardet/UniversalDetector;->detectedCharset:Ljava/lang/String;

    goto/16 :goto_4

    .line 222
    :cond_150
    add-int/lit8 v5, v5, 0x1

    goto :goto_130

    .line 145
    nop

    :sswitch_data_154
    .sparse-switch
        0x0 -> :sswitch_58
        0xef -> :sswitch_35
        0xfe -> :sswitch_42
        0xff -> :sswitch_76
    .end sparse-switch
.end method

.method public isDone()Z
    .registers 2

    .prologue
    .line 105
    iget-boolean v0, p0, Lorg/mozilla/universalchardet/UniversalDetector;->done:Z

    return v0
.end method

.method public reset()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 277
    iput-boolean v2, p0, Lorg/mozilla/universalchardet/UniversalDetector;->done:Z

    .line 278
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/mozilla/universalchardet/UniversalDetector;->start:Z

    .line 279
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/mozilla/universalchardet/UniversalDetector;->detectedCharset:Ljava/lang/String;

    .line 280
    iput-boolean v2, p0, Lorg/mozilla/universalchardet/UniversalDetector;->gotData:Z

    .line 281
    sget-object v1, Lorg/mozilla/universalchardet/UniversalDetector$InputState;->PURE_ASCII:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    iput-object v1, p0, Lorg/mozilla/universalchardet/UniversalDetector;->inputState:Lorg/mozilla/universalchardet/UniversalDetector$InputState;

    .line 282
    iput-byte v2, p0, Lorg/mozilla/universalchardet/UniversalDetector;->lastChar:B

    .line 284
    iget-object v1, p0, Lorg/mozilla/universalchardet/UniversalDetector;->escCharsetProber:Lorg/mozilla/universalchardet/prober/CharsetProber;

    if-eqz v1, :cond_1a

    .line 285
    iget-object v1, p0, Lorg/mozilla/universalchardet/UniversalDetector;->escCharsetProber:Lorg/mozilla/universalchardet/prober/CharsetProber;

    invoke-virtual {v1}, Lorg/mozilla/universalchardet/prober/CharsetProber;->reset()V

    .line 288
    :cond_1a
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1b
    iget-object v1, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    array-length v1, v1

    if-ge v0, v1, :cond_30

    .line 289
    iget-object v1, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    aget-object v1, v1, v0

    if-eqz v1, :cond_2d

    .line 290
    iget-object v1, p0, Lorg/mozilla/universalchardet/UniversalDetector;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lorg/mozilla/universalchardet/prober/CharsetProber;->reset()V

    .line 288
    :cond_2d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 293
    :cond_30
    return-void
.end method

.method public setListener(Lorg/mozilla/universalchardet/CharsetListener;)V
    .registers 2
    .param p1, "listener"    # Lorg/mozilla/universalchardet/CharsetListener;

    .prologue
    .line 119
    iput-object p1, p0, Lorg/mozilla/universalchardet/UniversalDetector;->listener:Lorg/mozilla/universalchardet/CharsetListener;

    .line 120
    return-void
.end method
