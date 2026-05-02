.class public Lcom/alibaba/fastjson/asm/Type;
.super Ljava/lang/Object;
.source "Type.java"


# static fields
.field public static final BOOLEAN_TYPE:Lcom/alibaba/fastjson/asm/Type;

.field public static final BYTE_TYPE:Lcom/alibaba/fastjson/asm/Type;

.field public static final CHAR_TYPE:Lcom/alibaba/fastjson/asm/Type;

.field public static final DOUBLE_TYPE:Lcom/alibaba/fastjson/asm/Type;

.field public static final FLOAT_TYPE:Lcom/alibaba/fastjson/asm/Type;

.field public static final INT_TYPE:Lcom/alibaba/fastjson/asm/Type;

.field public static final LONG_TYPE:Lcom/alibaba/fastjson/asm/Type;

.field public static final SHORT_TYPE:Lcom/alibaba/fastjson/asm/Type;

.field public static final VOID_TYPE:Lcom/alibaba/fastjson/asm/Type;


# instance fields
.field private final buf:[C

.field private final len:I

.field private final off:I

.field protected final sort:I


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 42
    new-instance v0, Lcom/alibaba/fastjson/asm/Type;

    const/4 v1, 0x0

    const/high16 v2, 0x56050000

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/alibaba/fastjson/asm/Type;-><init>(I[CII)V

    sput-object v0, Lcom/alibaba/fastjson/asm/Type;->VOID_TYPE:Lcom/alibaba/fastjson/asm/Type;

    .line 47
    new-instance v0, Lcom/alibaba/fastjson/asm/Type;

    const v1, 0x5a000501

    invoke-direct {v0, v3, v4, v1, v3}, Lcom/alibaba/fastjson/asm/Type;-><init>(I[CII)V

    sput-object v0, Lcom/alibaba/fastjson/asm/Type;->BOOLEAN_TYPE:Lcom/alibaba/fastjson/asm/Type;

    .line 52
    new-instance v0, Lcom/alibaba/fastjson/asm/Type;

    const/4 v1, 0x2

    const v2, 0x43000601

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/alibaba/fastjson/asm/Type;-><init>(I[CII)V

    sput-object v0, Lcom/alibaba/fastjson/asm/Type;->CHAR_TYPE:Lcom/alibaba/fastjson/asm/Type;

    .line 57
    new-instance v0, Lcom/alibaba/fastjson/asm/Type;

    const/4 v1, 0x3

    const v2, 0x42000501

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/alibaba/fastjson/asm/Type;-><init>(I[CII)V

    sput-object v0, Lcom/alibaba/fastjson/asm/Type;->BYTE_TYPE:Lcom/alibaba/fastjson/asm/Type;

    .line 62
    new-instance v0, Lcom/alibaba/fastjson/asm/Type;

    const/4 v1, 0x4

    const v2, 0x53000701

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/alibaba/fastjson/asm/Type;-><init>(I[CII)V

    sput-object v0, Lcom/alibaba/fastjson/asm/Type;->SHORT_TYPE:Lcom/alibaba/fastjson/asm/Type;

    .line 67
    new-instance v0, Lcom/alibaba/fastjson/asm/Type;

    const/4 v1, 0x5

    const v2, 0x49000001

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/alibaba/fastjson/asm/Type;-><init>(I[CII)V

    sput-object v0, Lcom/alibaba/fastjson/asm/Type;->INT_TYPE:Lcom/alibaba/fastjson/asm/Type;

    .line 72
    new-instance v0, Lcom/alibaba/fastjson/asm/Type;

    const/4 v1, 0x6

    const v2, 0x46020201

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/alibaba/fastjson/asm/Type;-><init>(I[CII)V

    sput-object v0, Lcom/alibaba/fastjson/asm/Type;->FLOAT_TYPE:Lcom/alibaba/fastjson/asm/Type;

    .line 77
    new-instance v0, Lcom/alibaba/fastjson/asm/Type;

    const/4 v1, 0x7

    const v2, 0x4a010102    # 2113600.5f

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/alibaba/fastjson/asm/Type;-><init>(I[CII)V

    sput-object v0, Lcom/alibaba/fastjson/asm/Type;->LONG_TYPE:Lcom/alibaba/fastjson/asm/Type;

    .line 82
    new-instance v0, Lcom/alibaba/fastjson/asm/Type;

    const/16 v1, 0x8

    const v2, 0x44030302

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/alibaba/fastjson/asm/Type;-><init>(I[CII)V

    sput-object v0, Lcom/alibaba/fastjson/asm/Type;->DOUBLE_TYPE:Lcom/alibaba/fastjson/asm/Type;

    return-void
.end method

.method private constructor <init>(I[CII)V
    .registers 5
    .param p1, "sort"    # I
    .param p2, "buf"    # [C
    .param p3, "off"    # I
    .param p4, "len"    # I

    .prologue
    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    iput p1, p0, Lcom/alibaba/fastjson/asm/Type;->sort:I

    .line 116
    iput-object p2, p0, Lcom/alibaba/fastjson/asm/Type;->buf:[C

    .line 117
    iput p3, p0, Lcom/alibaba/fastjson/asm/Type;->off:I

    .line 118
    iput p4, p0, Lcom/alibaba/fastjson/asm/Type;->len:I

    .line 119
    return-void
.end method

.method public static getArgumentsAndReturnSizes(Ljava/lang/String;)I
    .registers 9
    .param p0, "desc"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x4a

    const/16 v6, 0x44

    .line 132
    const/4 v3, 0x1

    .line 133
    .local v3, "n":I
    const/4 v0, 0x1

    .line 135
    .local v0, "c":I
    :goto_6
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "c":I
    .local v1, "c":I
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 136
    .local v2, "car":C
    const/16 v4, 0x29

    if-ne v2, v4, :cond_25

    .line 137
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 138
    shl-int/lit8 v5, v3, 0x2

    const/16 v4, 0x56

    if-ne v2, v4, :cond_1d

    const/4 v4, 0x0

    :goto_1b
    or-int/2addr v4, v5

    return v4

    :cond_1d
    if-eq v2, v6, :cond_21

    if-ne v2, v7, :cond_23

    :cond_21
    const/4 v4, 0x2

    goto :goto_1b

    :cond_23
    const/4 v4, 0x1

    goto :goto_1b

    .line 139
    :cond_25
    const/16 v4, 0x4c

    if-ne v2, v4, :cond_3a

    move v0, v1

    .line 140
    .end local v1    # "c":I
    .restart local v0    # "c":I
    :goto_2a
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "c":I
    .restart local v1    # "c":I
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x3b

    if-eq v4, v5, :cond_36

    move v0, v1

    .end local v1    # "c":I
    .restart local v0    # "c":I
    goto :goto_2a

    .line 142
    .end local v0    # "c":I
    .restart local v1    # "c":I
    :cond_36
    add-int/lit8 v3, v3, 0x1

    move v0, v1

    .end local v1    # "c":I
    .restart local v0    # "c":I
    goto :goto_6

    .line 150
    .end local v0    # "c":I
    .restart local v1    # "c":I
    :cond_3a
    if-eq v2, v6, :cond_3e

    if-ne v2, v7, :cond_42

    .line 151
    :cond_3e
    add-int/lit8 v3, v3, 0x2

    move v0, v1

    .end local v1    # "c":I
    .restart local v0    # "c":I
    goto :goto_6

    .line 153
    .end local v0    # "c":I
    .restart local v1    # "c":I
    :cond_42
    add-int/lit8 v3, v3, 0x1

    move v0, v1

    .end local v1    # "c":I
    .restart local v0    # "c":I
    goto :goto_6
.end method

.method public static getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;
    .registers 3
    .param p0, "typeDescriptor"    # Ljava/lang/String;

    .prologue
    .line 128
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/alibaba/fastjson/asm/Type;->getType([CI)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v0

    return-object v0
.end method

.method private static getType([CI)Lcom/alibaba/fastjson/asm/Type;
    .registers 7
    .param p0, "buf"    # [C
    .param p1, "off"    # I

    .prologue
    const/16 v3, 0x3b

    .line 167
    aget-char v1, p0, p1

    sparse-switch v1, :sswitch_data_62

    .line 200
    const/4 v0, 0x1

    .line 201
    .local v0, "len":I
    :goto_8
    add-int v1, p1, v0

    aget-char v1, p0, v1

    if-eq v1, v3, :cond_55

    .line 202
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 169
    .end local v0    # "len":I
    :sswitch_11
    sget-object v1, Lcom/alibaba/fastjson/asm/Type;->VOID_TYPE:Lcom/alibaba/fastjson/asm/Type;

    .line 204
    :goto_13
    return-object v1

    .line 171
    :sswitch_14
    sget-object v1, Lcom/alibaba/fastjson/asm/Type;->BOOLEAN_TYPE:Lcom/alibaba/fastjson/asm/Type;

    goto :goto_13

    .line 173
    :sswitch_17
    sget-object v1, Lcom/alibaba/fastjson/asm/Type;->CHAR_TYPE:Lcom/alibaba/fastjson/asm/Type;

    goto :goto_13

    .line 175
    :sswitch_1a
    sget-object v1, Lcom/alibaba/fastjson/asm/Type;->BYTE_TYPE:Lcom/alibaba/fastjson/asm/Type;

    goto :goto_13

    .line 177
    :sswitch_1d
    sget-object v1, Lcom/alibaba/fastjson/asm/Type;->SHORT_TYPE:Lcom/alibaba/fastjson/asm/Type;

    goto :goto_13

    .line 179
    :sswitch_20
    sget-object v1, Lcom/alibaba/fastjson/asm/Type;->INT_TYPE:Lcom/alibaba/fastjson/asm/Type;

    goto :goto_13

    .line 181
    :sswitch_23
    sget-object v1, Lcom/alibaba/fastjson/asm/Type;->FLOAT_TYPE:Lcom/alibaba/fastjson/asm/Type;

    goto :goto_13

    .line 183
    :sswitch_26
    sget-object v1, Lcom/alibaba/fastjson/asm/Type;->LONG_TYPE:Lcom/alibaba/fastjson/asm/Type;

    goto :goto_13

    .line 185
    :sswitch_29
    sget-object v1, Lcom/alibaba/fastjson/asm/Type;->DOUBLE_TYPE:Lcom/alibaba/fastjson/asm/Type;

    goto :goto_13

    .line 187
    :sswitch_2c
    const/4 v0, 0x1

    .line 188
    .restart local v0    # "len":I
    :goto_2d
    add-int v1, p1, v0

    aget-char v1, p0, v1

    const/16 v2, 0x5b

    if-ne v1, v2, :cond_38

    .line 189
    add-int/lit8 v0, v0, 0x1

    goto :goto_2d

    .line 191
    :cond_38
    add-int v1, p1, v0

    aget-char v1, p0, v1

    const/16 v2, 0x4c

    if-ne v1, v2, :cond_4b

    .line 192
    add-int/lit8 v0, v0, 0x1

    .line 193
    :goto_42
    add-int v1, p1, v0

    aget-char v1, p0, v1

    if-eq v1, v3, :cond_4b

    .line 194
    add-int/lit8 v0, v0, 0x1

    goto :goto_42

    .line 197
    :cond_4b
    new-instance v1, Lcom/alibaba/fastjson/asm/Type;

    const/16 v2, 0x9

    add-int/lit8 v3, v0, 0x1

    invoke-direct {v1, v2, p0, p1, v3}, Lcom/alibaba/fastjson/asm/Type;-><init>(I[CII)V

    goto :goto_13

    .line 204
    :cond_55
    new-instance v1, Lcom/alibaba/fastjson/asm/Type;

    const/16 v2, 0xa

    add-int/lit8 v3, p1, 0x1

    add-int/lit8 v4, v0, -0x1

    invoke-direct {v1, v2, p0, v3, v4}, Lcom/alibaba/fastjson/asm/Type;-><init>(I[CII)V

    goto :goto_13

    .line 167
    nop

    :sswitch_data_62
    .sparse-switch
        0x42 -> :sswitch_1a
        0x43 -> :sswitch_17
        0x44 -> :sswitch_29
        0x46 -> :sswitch_23
        0x49 -> :sswitch_20
        0x4a -> :sswitch_26
        0x53 -> :sswitch_1d
        0x56 -> :sswitch_11
        0x5a -> :sswitch_14
        0x5b -> :sswitch_2c
    .end sparse-switch
.end method


# virtual methods
.method getDescriptor()Ljava/lang/String;
    .registers 5

    .prologue
    .line 222
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/alibaba/fastjson/asm/Type;->buf:[C

    iget v2, p0, Lcom/alibaba/fastjson/asm/Type;->off:I

    iget v3, p0, Lcom/alibaba/fastjson/asm/Type;->len:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method public getInternalName()Ljava/lang/String;
    .registers 5

    .prologue
    .line 209
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/alibaba/fastjson/asm/Type;->buf:[C

    iget v2, p0, Lcom/alibaba/fastjson/asm/Type;->off:I

    iget v3, p0, Lcom/alibaba/fastjson/asm/Type;->len:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method
