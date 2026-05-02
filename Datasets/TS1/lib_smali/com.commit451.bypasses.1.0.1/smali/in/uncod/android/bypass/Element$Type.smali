.class public final enum Lin/uncod/android/bypass/Element$Type;
.super Ljava/lang/Enum;
.source "Element.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lin/uncod/android/bypass/Element;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lin/uncod/android/bypass/Element$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lin/uncod/android/bypass/Element$Type;

.field public static final enum AUTOLINK:Lin/uncod/android/bypass/Element$Type;

.field public static final enum BLOCK_CODE:Lin/uncod/android/bypass/Element$Type;

.field public static final enum BLOCK_HTML:Lin/uncod/android/bypass/Element$Type;

.field public static final enum BLOCK_QUOTE:Lin/uncod/android/bypass/Element$Type;

.field public static final enum CODE_SPAN:Lin/uncod/android/bypass/Element$Type;

.field public static final enum DOUBLE_EMPHASIS:Lin/uncod/android/bypass/Element$Type;

.field public static final enum EMPHASIS:Lin/uncod/android/bypass/Element$Type;

.field public static final enum HEADER:Lin/uncod/android/bypass/Element$Type;

.field public static final enum HRULE:Lin/uncod/android/bypass/Element$Type;

.field public static final enum IMAGE:Lin/uncod/android/bypass/Element$Type;

.field public static final enum LINEBREAK:Lin/uncod/android/bypass/Element$Type;

.field public static final enum LINK:Lin/uncod/android/bypass/Element$Type;

.field public static final enum LIST:Lin/uncod/android/bypass/Element$Type;

.field public static final enum LIST_ITEM:Lin/uncod/android/bypass/Element$Type;

.field public static final enum PARAGRAPH:Lin/uncod/android/bypass/Element$Type;

.field public static final enum RAW_HTML_TAG:Lin/uncod/android/bypass/Element$Type;

.field public static final enum STRIKETHROUGH:Lin/uncod/android/bypass/Element$Type;

.field public static final enum TABLE:Lin/uncod/android/bypass/Element$Type;

.field public static final enum TABLE_CELL:Lin/uncod/android/bypass/Element$Type;

.field public static final enum TABLE_ROW:Lin/uncod/android/bypass/Element$Type;

.field public static final enum TEXT:Lin/uncod/android/bypass/Element$Type;

.field public static final enum TRIPLE_EMPHASIS:Lin/uncod/android/bypass/Element$Type;

.field private static final TypeValues:[Lin/uncod/android/bypass/Element$Type;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 14
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "BLOCK_CODE"

    invoke-direct {v0, v1, v4, v4}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->BLOCK_CODE:Lin/uncod/android/bypass/Element$Type;

    .line 15
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "BLOCK_QUOTE"

    invoke-direct {v0, v1, v5, v5}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->BLOCK_QUOTE:Lin/uncod/android/bypass/Element$Type;

    .line 16
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "BLOCK_HTML"

    invoke-direct {v0, v1, v6, v6}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->BLOCK_HTML:Lin/uncod/android/bypass/Element$Type;

    .line 17
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "HEADER"

    invoke-direct {v0, v1, v7, v7}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->HEADER:Lin/uncod/android/bypass/Element$Type;

    .line 18
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "HRULE"

    invoke-direct {v0, v1, v8, v8}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->HRULE:Lin/uncod/android/bypass/Element$Type;

    .line 19
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "LIST"

    const/4 v2, 0x5

    const/4 v3, 0x5

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->LIST:Lin/uncod/android/bypass/Element$Type;

    .line 20
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "LIST_ITEM"

    const/4 v2, 0x6

    const/4 v3, 0x6

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->LIST_ITEM:Lin/uncod/android/bypass/Element$Type;

    .line 21
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "PARAGRAPH"

    const/4 v2, 0x7

    const/4 v3, 0x7

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->PARAGRAPH:Lin/uncod/android/bypass/Element$Type;

    .line 22
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "TABLE"

    const/16 v2, 0x8

    const/16 v3, 0x8

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->TABLE:Lin/uncod/android/bypass/Element$Type;

    .line 23
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "TABLE_CELL"

    const/16 v2, 0x9

    const/16 v3, 0x9

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->TABLE_CELL:Lin/uncod/android/bypass/Element$Type;

    .line 24
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "TABLE_ROW"

    const/16 v2, 0xa

    const/16 v3, 0xa

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->TABLE_ROW:Lin/uncod/android/bypass/Element$Type;

    .line 28
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "AUTOLINK"

    const/16 v2, 0xb

    const/16 v3, 0x10b

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->AUTOLINK:Lin/uncod/android/bypass/Element$Type;

    .line 29
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "CODE_SPAN"

    const/16 v2, 0xc

    const/16 v3, 0x10c

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->CODE_SPAN:Lin/uncod/android/bypass/Element$Type;

    .line 30
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "DOUBLE_EMPHASIS"

    const/16 v2, 0xd

    const/16 v3, 0x10d

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->DOUBLE_EMPHASIS:Lin/uncod/android/bypass/Element$Type;

    .line 31
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "EMPHASIS"

    const/16 v2, 0xe

    const/16 v3, 0x10e

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->EMPHASIS:Lin/uncod/android/bypass/Element$Type;

    .line 32
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "IMAGE"

    const/16 v2, 0xf

    const/16 v3, 0x10f

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->IMAGE:Lin/uncod/android/bypass/Element$Type;

    .line 33
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "LINEBREAK"

    const/16 v2, 0x10

    const/16 v3, 0x110

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->LINEBREAK:Lin/uncod/android/bypass/Element$Type;

    .line 34
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "LINK"

    const/16 v2, 0x11

    const/16 v3, 0x111

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->LINK:Lin/uncod/android/bypass/Element$Type;

    .line 35
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "RAW_HTML_TAG"

    const/16 v2, 0x12

    const/16 v3, 0x112

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->RAW_HTML_TAG:Lin/uncod/android/bypass/Element$Type;

    .line 36
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "TRIPLE_EMPHASIS"

    const/16 v2, 0x13

    const/16 v3, 0x113

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->TRIPLE_EMPHASIS:Lin/uncod/android/bypass/Element$Type;

    .line 37
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "TEXT"

    const/16 v2, 0x14

    const/16 v3, 0x114

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->TEXT:Lin/uncod/android/bypass/Element$Type;

    .line 38
    new-instance v0, Lin/uncod/android/bypass/Element$Type;

    const-string v1, "STRIKETHROUGH"

    const/16 v2, 0x15

    const/16 v3, 0x115

    invoke-direct {v0, v1, v2, v3}, Lin/uncod/android/bypass/Element$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->STRIKETHROUGH:Lin/uncod/android/bypass/Element$Type;

    .line 10
    const/16 v0, 0x16

    new-array v0, v0, [Lin/uncod/android/bypass/Element$Type;

    sget-object v1, Lin/uncod/android/bypass/Element$Type;->BLOCK_CODE:Lin/uncod/android/bypass/Element$Type;

    aput-object v1, v0, v4

    sget-object v1, Lin/uncod/android/bypass/Element$Type;->BLOCK_QUOTE:Lin/uncod/android/bypass/Element$Type;

    aput-object v1, v0, v5

    sget-object v1, Lin/uncod/android/bypass/Element$Type;->BLOCK_HTML:Lin/uncod/android/bypass/Element$Type;

    aput-object v1, v0, v6

    sget-object v1, Lin/uncod/android/bypass/Element$Type;->HEADER:Lin/uncod/android/bypass/Element$Type;

    aput-object v1, v0, v7

    sget-object v1, Lin/uncod/android/bypass/Element$Type;->HRULE:Lin/uncod/android/bypass/Element$Type;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->LIST:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->LIST_ITEM:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->PARAGRAPH:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->TABLE:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->TABLE_CELL:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->TABLE_ROW:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->AUTOLINK:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->CODE_SPAN:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->DOUBLE_EMPHASIS:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->EMPHASIS:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->IMAGE:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->LINEBREAK:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->LINK:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->RAW_HTML_TAG:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->TRIPLE_EMPHASIS:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x14

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->TEXT:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x15

    sget-object v2, Lin/uncod/android/bypass/Element$Type;->STRIKETHROUGH:Lin/uncod/android/bypass/Element$Type;

    aput-object v2, v0, v1

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->$VALUES:[Lin/uncod/android/bypass/Element$Type;

    .line 46
    invoke-static {}, Lin/uncod/android/bypass/Element$Type;->values()[Lin/uncod/android/bypass/Element$Type;

    move-result-object v0

    sput-object v0, Lin/uncod/android/bypass/Element$Type;->TypeValues:[Lin/uncod/android/bypass/Element$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p3, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 43
    iput p3, p0, Lin/uncod/android/bypass/Element$Type;->value:I

    .line 44
    return-void
.end method

.method static synthetic access$000(Lin/uncod/android/bypass/Element$Type;)I
    .registers 2
    .param p0, "x0"    # Lin/uncod/android/bypass/Element$Type;

    .prologue
    .line 10
    iget v0, p0, Lin/uncod/android/bypass/Element$Type;->value:I

    return v0
.end method

.method public static fromInteger(I)Lin/uncod/android/bypass/Element$Type;
    .registers 6
    .param p0, "x"    # I

    .prologue
    .line 48
    sget-object v2, Lin/uncod/android/bypass/Element$Type;->TypeValues:[Lin/uncod/android/bypass/Element$Type;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_4
    if-ge v1, v3, :cond_10

    aget-object v0, v2, v1

    .line 49
    .local v0, "type":Lin/uncod/android/bypass/Element$Type;
    iget v4, v0, Lin/uncod/android/bypass/Element$Type;->value:I

    if-ne v4, p0, :cond_d

    .line 53
    .end local v0    # "type":Lin/uncod/android/bypass/Element$Type;
    :goto_c
    return-object v0

    .line 48
    .restart local v0    # "type":Lin/uncod/android/bypass/Element$Type;
    :cond_d
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 53
    .end local v0    # "type":Lin/uncod/android/bypass/Element$Type;
    :cond_10
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public static valueOf(Ljava/lang/String;)Lin/uncod/android/bypass/Element$Type;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 10
    const-class v0, Lin/uncod/android/bypass/Element$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lin/uncod/android/bypass/Element$Type;

    return-object v0
.end method

.method public static values()[Lin/uncod/android/bypass/Element$Type;
    .registers 1

    .prologue
    .line 10
    sget-object v0, Lin/uncod/android/bypass/Element$Type;->$VALUES:[Lin/uncod/android/bypass/Element$Type;

    invoke-virtual {v0}, [Lin/uncod/android/bypass/Element$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lin/uncod/android/bypass/Element$Type;

    return-object v0
.end method
