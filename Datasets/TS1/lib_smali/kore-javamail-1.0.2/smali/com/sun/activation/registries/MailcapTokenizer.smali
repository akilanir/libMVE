.class public Lcom/sun/activation/registries/MailcapTokenizer;
.super Ljava/lang/Object;
.source "MailcapTokenizer.java"


# static fields
.field public static final EOI_TOKEN:I = 0x5

.field public static final EQUALS_TOKEN:I = 0x3d

.field public static final SEMICOLON_TOKEN:I = 0x3b

.field public static final SLASH_TOKEN:I = 0x2f

.field public static final START_TOKEN:I = 0x1

.field public static final STRING_TOKEN:I = 0x2

.field public static final UNKNOWN_TOKEN:I


# instance fields
.field private autoquoteChar:C

.field private currentToken:I

.field private currentTokenValue:Ljava/lang/String;

.field private data:Ljava/lang/String;

.field private dataIndex:I

.field private dataLength:I

.field private isAutoquoting:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "inputString"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->data:Ljava/lang/String;

    .line 51
    iput v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    .line 52
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataLength:I

    .line 54
    const/4 v0, 0x1

    iput v0, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentToken:I

    .line 55
    const-string v0, ""

    iput-object v0, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentTokenValue:Ljava/lang/String;

    .line 57
    iput-boolean v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->isAutoquoting:Z

    .line 58
    const/16 v0, 0x3b

    iput-char v0, p0, Lcom/sun/activation/registries/MailcapTokenizer;->autoquoteChar:C

    .line 59
    return-void
.end method

.method private static fixEscapeSequences(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "inputString"    # Ljava/lang/String;

    .prologue
    .line 272
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 273
    .local v3, "inputLength":I
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 274
    .local v0, "buffer":Ljava/lang/StringBuffer;
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->ensureCapacity(I)V

    .line 276
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_d
    if-ge v2, v3, :cond_31

    .line 277
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 278
    .local v1, "currentChar":C
    const/16 v5, 0x5c

    if-eq v1, v5, :cond_1d

    .line 279
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 276
    :goto_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 281
    :cond_1d
    add-int/lit8 v5, v3, -0x1

    if-ge v2, v5, :cond_2d

    .line 282
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 283
    .local v4, "nextChar":C
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 286
    add-int/lit8 v2, v2, 0x1

    .line 287
    goto :goto_1a

    .line 288
    .end local v4    # "nextChar":C
    :cond_2d
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1a

    .line 293
    .end local v1    # "currentChar":C
    :cond_31
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static isAutoquoteSpecialChar(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 247
    const/4 v0, 0x0

    .line 249
    .local v0, "lAnswer":Z
    packed-switch p0, :pswitch_data_8

    .line 256
    :goto_4
    :pswitch_4
    return v0

    .line 252
    :pswitch_5
    const/4 v0, 0x1

    goto :goto_4

    .line 249
    nop

    :pswitch_data_8
    .packed-switch 0x3b
        :pswitch_5
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public static isControlChar(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 260
    invoke-static {p0}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v0

    return v0
.end method

.method public static isSpecialChar(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 221
    const/4 v0, 0x0

    .line 223
    .local v0, "lAnswer":Z
    sparse-switch p0, :sswitch_data_8

    .line 243
    :goto_4
    return v0

    .line 239
    :sswitch_5
    const/4 v0, 0x1

    goto :goto_4

    .line 223
    nop

    :sswitch_data_8
    .sparse-switch
        0x22 -> :sswitch_5
        0x28 -> :sswitch_5
        0x29 -> :sswitch_5
        0x2c -> :sswitch_5
        0x2f -> :sswitch_5
        0x3a -> :sswitch_5
        0x3b -> :sswitch_5
        0x3c -> :sswitch_5
        0x3d -> :sswitch_5
        0x3e -> :sswitch_5
        0x3f -> :sswitch_5
        0x40 -> :sswitch_5
        0x5b -> :sswitch_5
        0x5c -> :sswitch_5
        0x5d -> :sswitch_5
    .end sparse-switch
.end method

.method public static isStringTokenChar(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 268
    invoke-static {p0}, Lcom/sun/activation/registries/MailcapTokenizer;->isSpecialChar(C)Z

    move-result v0

    if-nez v0, :cond_14

    invoke-static {p0}, Lcom/sun/activation/registries/MailcapTokenizer;->isControlChar(C)Z

    move-result v0

    if-nez v0, :cond_14

    invoke-static {p0}, Lcom/sun/activation/registries/MailcapTokenizer;->isWhiteSpaceChar(C)Z

    move-result v0

    if-nez v0, :cond_14

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public static isWhiteSpaceChar(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 264
    invoke-static {p0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v0

    return v0
.end method

.method public static nameForToken(I)Ljava/lang/String;
    .registers 2
    .param p0, "token"    # I

    .prologue
    .line 95
    const-string v0, "really unknown"

    .line 97
    .local v0, "name":Ljava/lang/String;
    sparse-switch p0, :sswitch_data_1c

    .line 121
    :goto_5
    return-object v0

    .line 99
    :sswitch_6
    const-string v0, "unknown"

    .line 100
    goto :goto_5

    .line 102
    :sswitch_9
    const-string v0, "start"

    .line 103
    goto :goto_5

    .line 105
    :sswitch_c
    const-string v0, "string"

    .line 106
    goto :goto_5

    .line 108
    :sswitch_f
    const-string v0, "EOI"

    .line 109
    goto :goto_5

    .line 111
    :sswitch_12
    const-string v0, "\'/\'"

    .line 112
    goto :goto_5

    .line 114
    :sswitch_15
    const-string v0, "\';\'"

    .line 115
    goto :goto_5

    .line 117
    :sswitch_18
    const-string v0, "\'=\'"

    goto :goto_5

    .line 97
    nop

    :sswitch_data_1c
    .sparse-switch
        0x0 -> :sswitch_6
        0x1 -> :sswitch_9
        0x2 -> :sswitch_c
        0x5 -> :sswitch_f
        0x2f -> :sswitch_12
        0x3b -> :sswitch_15
        0x3d -> :sswitch_18
    .end sparse-switch
.end method

.method private processAutoquoteToken()V
    .registers 6

    .prologue
    .line 202
    iget v2, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    .line 205
    .local v2, "initialIndex":I
    const/4 v1, 0x0

    .line 206
    .local v1, "foundTerminator":Z
    :goto_3
    iget v3, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    iget v4, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataLength:I

    if-ge v3, v4, :cond_20

    if-nez v1, :cond_20

    .line 207
    iget-object v3, p0, Lcom/sun/activation/registries/MailcapTokenizer;->data:Ljava/lang/String;

    iget v4, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 208
    .local v0, "c":C
    iget-char v3, p0, Lcom/sun/activation/registries/MailcapTokenizer;->autoquoteChar:C

    if-eq v0, v3, :cond_1e

    .line 209
    iget v3, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    goto :goto_3

    .line 211
    :cond_1e
    const/4 v1, 0x1

    goto :goto_3

    .line 215
    .end local v0    # "c":C
    :cond_20
    const/4 v3, 0x2

    iput v3, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentToken:I

    .line 216
    iget-object v3, p0, Lcom/sun/activation/registries/MailcapTokenizer;->data:Ljava/lang/String;

    iget v4, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    .line 217
    invoke-virtual {v3, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/sun/activation/registries/MailcapTokenizer;->fixEscapeSequences(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentTokenValue:Ljava/lang/String;

    .line 218
    return-void
.end method

.method private processStringToken()V
    .registers 4

    .prologue
    .line 188
    iget v0, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    .line 191
    .local v0, "initialIndex":I
    :goto_2
    iget v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    iget v2, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataLength:I

    if-ge v1, v2, :cond_1d

    iget-object v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->data:Ljava/lang/String;

    iget v2, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    .line 192
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Lcom/sun/activation/registries/MailcapTokenizer;->isStringTokenChar(C)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 193
    iget v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    goto :goto_2

    .line 196
    :cond_1d
    const/4 v1, 0x2

    iput v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentToken:I

    .line 197
    iget-object v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->data:Ljava/lang/String;

    iget v2, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentTokenValue:Ljava/lang/String;

    .line 198
    return-void
.end method


# virtual methods
.method public getCurrentToken()I
    .registers 2

    .prologue
    .line 88
    iget v0, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentToken:I

    return v0
.end method

.method public getCurrentTokenValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentTokenValue:Ljava/lang/String;

    return-object v0
.end method

.method public nextToken()I
    .registers 9

    .prologue
    const/4 v7, 0x0

    const/16 v6, 0x3d

    const/16 v5, 0x3b

    const/4 v4, 0x5

    const/4 v3, 0x0

    .line 139
    iget v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    iget v2, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataLength:I

    if-ge v1, v2, :cond_b1

    .line 141
    :goto_d
    iget v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    iget v2, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataLength:I

    if-ge v1, v2, :cond_28

    iget-object v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->data:Ljava/lang/String;

    iget v2, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    .line 142
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Lcom/sun/activation/registries/MailcapTokenizer;->isWhiteSpaceChar(C)Z

    move-result v1

    if-eqz v1, :cond_28

    .line 143
    iget v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    goto :goto_d

    .line 146
    :cond_28
    iget v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    iget v2, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataLength:I

    if-ge v1, v2, :cond_ac

    .line 148
    iget-object v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->data:Ljava/lang/String;

    iget v2, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 149
    .local v0, "c":C
    iget-boolean v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->isAutoquoting:Z

    if-eqz v1, :cond_72

    .line 150
    invoke-static {v0}, Lcom/sun/activation/registries/MailcapTokenizer;->isAutoquoteSpecialChar(C)Z

    move-result v1

    if-nez v1, :cond_46

    .line 151
    invoke-direct {p0}, Lcom/sun/activation/registries/MailcapTokenizer;->processAutoquoteToken()V

    .line 183
    .end local v0    # "c":C
    :goto_43
    iget v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentToken:I

    return v1

    .line 152
    .restart local v0    # "c":C
    :cond_46
    if-eq v0, v5, :cond_4a

    if-ne v0, v6, :cond_5e

    .line 153
    :cond_4a
    iput v0, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentToken:I

    .line 154
    new-instance v1, Ljava/lang/Character;

    invoke-direct {v1, v0}, Ljava/lang/Character;-><init>(C)V

    invoke-virtual {v1}, Ljava/lang/Character;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentTokenValue:Ljava/lang/String;

    .line 155
    iget v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    goto :goto_43

    .line 157
    :cond_5e
    iput v3, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentToken:I

    .line 158
    new-instance v1, Ljava/lang/Character;

    invoke-direct {v1, v0}, Ljava/lang/Character;-><init>(C)V

    invoke-virtual {v1}, Ljava/lang/Character;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentTokenValue:Ljava/lang/String;

    .line 159
    iget v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    goto :goto_43

    .line 162
    :cond_72
    invoke-static {v0}, Lcom/sun/activation/registries/MailcapTokenizer;->isStringTokenChar(C)Z

    move-result v1

    if-eqz v1, :cond_7c

    .line 163
    invoke-direct {p0}, Lcom/sun/activation/registries/MailcapTokenizer;->processStringToken()V

    goto :goto_43

    .line 164
    :cond_7c
    const/16 v1, 0x2f

    if-eq v0, v1, :cond_84

    if-eq v0, v5, :cond_84

    if-ne v0, v6, :cond_98

    .line 165
    :cond_84
    iput v0, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentToken:I

    .line 166
    new-instance v1, Ljava/lang/Character;

    invoke-direct {v1, v0}, Ljava/lang/Character;-><init>(C)V

    invoke-virtual {v1}, Ljava/lang/Character;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentTokenValue:Ljava/lang/String;

    .line 167
    iget v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    goto :goto_43

    .line 169
    :cond_98
    iput v3, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentToken:I

    .line 170
    new-instance v1, Ljava/lang/Character;

    invoke-direct {v1, v0}, Ljava/lang/Character;-><init>(C)V

    invoke-virtual {v1}, Ljava/lang/Character;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentTokenValue:Ljava/lang/String;

    .line 171
    iget v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->dataIndex:I

    goto :goto_43

    .line 175
    .end local v0    # "c":C
    :cond_ac
    iput v4, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentToken:I

    .line 176
    iput-object v7, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentTokenValue:Ljava/lang/String;

    goto :goto_43

    .line 179
    :cond_b1
    iput v4, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentToken:I

    .line 180
    iput-object v7, p0, Lcom/sun/activation/registries/MailcapTokenizer;->currentTokenValue:Ljava/lang/String;

    goto :goto_43
.end method

.method public setAutoquoteChar(C)V
    .registers 2
    .param p1, "value"    # C

    .prologue
    .line 79
    iput-char p1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->autoquoteChar:C

    .line 80
    return-void
.end method

.method public setIsAutoquoting(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 72
    iput-boolean p1, p0, Lcom/sun/activation/registries/MailcapTokenizer;->isAutoquoting:Z

    .line 73
    return-void
.end method
