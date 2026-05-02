.class public Lcom/drew/imaging/tiff/TiffDataFormat;
.super Ljava/lang/Object;
.source "TiffDataFormat.java"


# static fields
.field public static final CODE_DOUBLE:I = 0xc

.field public static final CODE_INT16_S:I = 0x8

.field public static final CODE_INT16_U:I = 0x3

.field public static final CODE_INT32_S:I = 0x9

.field public static final CODE_INT32_U:I = 0x4

.field public static final CODE_INT8_S:I = 0x6

.field public static final CODE_INT8_U:I = 0x1

.field public static final CODE_RATIONAL_S:I = 0xa

.field public static final CODE_RATIONAL_U:I = 0x5

.field public static final CODE_SINGLE:I = 0xb

.field public static final CODE_STRING:I = 0x2

.field public static final CODE_UNDEFINED:I = 0x7

.field public static final DOUBLE:Lcom/drew/imaging/tiff/TiffDataFormat;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field public static final INT16_S:Lcom/drew/imaging/tiff/TiffDataFormat;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field public static final INT16_U:Lcom/drew/imaging/tiff/TiffDataFormat;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field public static final INT32_S:Lcom/drew/imaging/tiff/TiffDataFormat;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field public static final INT32_U:Lcom/drew/imaging/tiff/TiffDataFormat;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field public static final INT8_S:Lcom/drew/imaging/tiff/TiffDataFormat;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field public static final INT8_U:Lcom/drew/imaging/tiff/TiffDataFormat;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field public static final RATIONAL_S:Lcom/drew/imaging/tiff/TiffDataFormat;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field public static final RATIONAL_U:Lcom/drew/imaging/tiff/TiffDataFormat;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field public static final SINGLE:Lcom/drew/imaging/tiff/TiffDataFormat;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field public static final STRING:Lcom/drew/imaging/tiff/TiffDataFormat;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field public static final UNDEFINED:Lcom/drew/imaging/tiff/TiffDataFormat;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private final _componentSizeBytes:I

.field private final _name:Ljava/lang/String;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field private final _tiffFormatCode:I


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x2

    const/16 v5, 0x8

    const/4 v4, 0x4

    const/4 v3, 0x1

    .line 46
    new-instance v0, Lcom/drew/imaging/tiff/TiffDataFormat;

    const-string v1, "BYTE"

    invoke-direct {v0, v1, v3, v3}, Lcom/drew/imaging/tiff/TiffDataFormat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->INT8_U:Lcom/drew/imaging/tiff/TiffDataFormat;

    .line 47
    new-instance v0, Lcom/drew/imaging/tiff/TiffDataFormat;

    const-string v1, "STRING"

    invoke-direct {v0, v1, v6, v3}, Lcom/drew/imaging/tiff/TiffDataFormat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->STRING:Lcom/drew/imaging/tiff/TiffDataFormat;

    .line 48
    new-instance v0, Lcom/drew/imaging/tiff/TiffDataFormat;

    const-string v1, "USHORT"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2, v6}, Lcom/drew/imaging/tiff/TiffDataFormat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->INT16_U:Lcom/drew/imaging/tiff/TiffDataFormat;

    .line 49
    new-instance v0, Lcom/drew/imaging/tiff/TiffDataFormat;

    const-string v1, "ULONG"

    invoke-direct {v0, v1, v4, v4}, Lcom/drew/imaging/tiff/TiffDataFormat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->INT32_U:Lcom/drew/imaging/tiff/TiffDataFormat;

    .line 50
    new-instance v0, Lcom/drew/imaging/tiff/TiffDataFormat;

    const-string v1, "URATIONAL"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2, v5}, Lcom/drew/imaging/tiff/TiffDataFormat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->RATIONAL_U:Lcom/drew/imaging/tiff/TiffDataFormat;

    .line 51
    new-instance v0, Lcom/drew/imaging/tiff/TiffDataFormat;

    const-string v1, "SBYTE"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2, v3}, Lcom/drew/imaging/tiff/TiffDataFormat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->INT8_S:Lcom/drew/imaging/tiff/TiffDataFormat;

    .line 52
    new-instance v0, Lcom/drew/imaging/tiff/TiffDataFormat;

    const-string v1, "UNDEFINED"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2, v3}, Lcom/drew/imaging/tiff/TiffDataFormat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->UNDEFINED:Lcom/drew/imaging/tiff/TiffDataFormat;

    .line 53
    new-instance v0, Lcom/drew/imaging/tiff/TiffDataFormat;

    const-string v1, "SSHORT"

    invoke-direct {v0, v1, v5, v6}, Lcom/drew/imaging/tiff/TiffDataFormat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->INT16_S:Lcom/drew/imaging/tiff/TiffDataFormat;

    .line 54
    new-instance v0, Lcom/drew/imaging/tiff/TiffDataFormat;

    const-string v1, "SLONG"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2, v4}, Lcom/drew/imaging/tiff/TiffDataFormat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->INT32_S:Lcom/drew/imaging/tiff/TiffDataFormat;

    .line 55
    new-instance v0, Lcom/drew/imaging/tiff/TiffDataFormat;

    const-string v1, "SRATIONAL"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2, v5}, Lcom/drew/imaging/tiff/TiffDataFormat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->RATIONAL_S:Lcom/drew/imaging/tiff/TiffDataFormat;

    .line 56
    new-instance v0, Lcom/drew/imaging/tiff/TiffDataFormat;

    const-string v1, "SINGLE"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2, v4}, Lcom/drew/imaging/tiff/TiffDataFormat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->SINGLE:Lcom/drew/imaging/tiff/TiffDataFormat;

    .line 57
    new-instance v0, Lcom/drew/imaging/tiff/TiffDataFormat;

    const-string v1, "DOUBLE"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2, v5}, Lcom/drew/imaging/tiff/TiffDataFormat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->DOUBLE:Lcom/drew/imaging/tiff/TiffDataFormat;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "tiffFormatCode"    # I
    .param p3, "componentSizeBytes"    # I

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput-object p1, p0, Lcom/drew/imaging/tiff/TiffDataFormat;->_name:Ljava/lang/String;

    .line 87
    iput p2, p0, Lcom/drew/imaging/tiff/TiffDataFormat;->_tiffFormatCode:I

    .line 88
    iput p3, p0, Lcom/drew/imaging/tiff/TiffDataFormat;->_componentSizeBytes:I

    .line 89
    return-void
.end method

.method public static fromTiffFormatCode(I)Lcom/drew/imaging/tiff/TiffDataFormat;
    .registers 2
    .param p0, "tiffFormatCode"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 67
    packed-switch p0, :pswitch_data_2a

    .line 81
    const/4 v0, 0x0

    :goto_4
    return-object v0

    .line 68
    :pswitch_5
    sget-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->INT8_U:Lcom/drew/imaging/tiff/TiffDataFormat;

    goto :goto_4

    .line 69
    :pswitch_8
    sget-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->STRING:Lcom/drew/imaging/tiff/TiffDataFormat;

    goto :goto_4

    .line 70
    :pswitch_b
    sget-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->INT16_U:Lcom/drew/imaging/tiff/TiffDataFormat;

    goto :goto_4

    .line 71
    :pswitch_e
    sget-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->INT32_U:Lcom/drew/imaging/tiff/TiffDataFormat;

    goto :goto_4

    .line 72
    :pswitch_11
    sget-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->RATIONAL_U:Lcom/drew/imaging/tiff/TiffDataFormat;

    goto :goto_4

    .line 73
    :pswitch_14
    sget-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->INT8_S:Lcom/drew/imaging/tiff/TiffDataFormat;

    goto :goto_4

    .line 74
    :pswitch_17
    sget-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->UNDEFINED:Lcom/drew/imaging/tiff/TiffDataFormat;

    goto :goto_4

    .line 75
    :pswitch_1a
    sget-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->INT16_S:Lcom/drew/imaging/tiff/TiffDataFormat;

    goto :goto_4

    .line 76
    :pswitch_1d
    sget-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->INT32_S:Lcom/drew/imaging/tiff/TiffDataFormat;

    goto :goto_4

    .line 77
    :pswitch_20
    sget-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->RATIONAL_S:Lcom/drew/imaging/tiff/TiffDataFormat;

    goto :goto_4

    .line 78
    :pswitch_23
    sget-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->SINGLE:Lcom/drew/imaging/tiff/TiffDataFormat;

    goto :goto_4

    .line 79
    :pswitch_26
    sget-object v0, Lcom/drew/imaging/tiff/TiffDataFormat;->DOUBLE:Lcom/drew/imaging/tiff/TiffDataFormat;

    goto :goto_4

    .line 67
    nop

    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_5
        :pswitch_8
        :pswitch_b
        :pswitch_e
        :pswitch_11
        :pswitch_14
        :pswitch_17
        :pswitch_1a
        :pswitch_1d
        :pswitch_20
        :pswitch_23
        :pswitch_26
    .end packed-switch
.end method


# virtual methods
.method public getComponentSizeBytes()I
    .registers 2

    .prologue
    .line 93
    iget v0, p0, Lcom/drew/imaging/tiff/TiffDataFormat;->_componentSizeBytes:I

    return v0
.end method

.method public getTiffFormatCode()I
    .registers 2

    .prologue
    .line 98
    iget v0, p0, Lcom/drew/imaging/tiff/TiffDataFormat;->_tiffFormatCode:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 105
    iget-object v0, p0, Lcom/drew/imaging/tiff/TiffDataFormat;->_name:Ljava/lang/String;

    return-object v0
.end method
