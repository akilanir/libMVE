.class public final enum Lcom/drew/imaging/jpeg/JpegSegmentType;
.super Ljava/lang/Enum;
.source "JpegSegmentType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/drew/imaging/jpeg/JpegSegmentType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum APP0:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum APP1:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum APP2:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum APP3:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum APP4:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum APP5:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum APP6:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum APP7:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum APP8:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum APP9:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum APPA:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum APPB:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum APPC:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum APPD:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum APPE:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum APPF:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum COM:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum DHT:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum DQT:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum SOF0:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum SOF1:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum SOF10:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum SOF11:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum SOF13:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum SOF14:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum SOF15:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum SOF2:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum SOF3:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum SOF5:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum SOF6:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum SOF7:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum SOF8:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum SOF9:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final enum SOI:Lcom/drew/imaging/jpeg/JpegSegmentType;

.field public static final canContainMetadataTypes:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/drew/imaging/jpeg/JpegSegmentType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final byteValue:B

.field public final canContainMetadata:Z


# direct methods
.method static constructor <clinit>()V
    .registers 14

    .prologue
    const/4 v13, 0x4

    const/4 v12, 0x3

    const/4 v11, 0x2

    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 42
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "APP0"

    const/16 v7, -0x20

    invoke-direct {v5, v6, v10, v7, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP0:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 45
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "APP1"

    const/16 v7, -0x1f

    invoke-direct {v5, v6, v9, v7, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP1:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 48
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "APP2"

    const/16 v7, -0x1e

    invoke-direct {v5, v6, v11, v7, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP2:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 51
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "APP3"

    const/16 v7, -0x1d

    invoke-direct {v5, v6, v12, v7, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP3:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 54
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "APP4"

    const/16 v7, -0x1c

    invoke-direct {v5, v6, v13, v7, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP4:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 57
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "APP5"

    const/4 v7, 0x5

    const/16 v8, -0x1b

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP5:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 60
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "APP6"

    const/4 v7, 0x6

    const/16 v8, -0x1a

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP6:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 63
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "APP7"

    const/4 v7, 0x7

    const/16 v8, -0x19

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP7:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 66
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "APP8"

    const/16 v7, 0x8

    const/16 v8, -0x18

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP8:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 69
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "APP9"

    const/16 v7, 0x9

    const/16 v8, -0x17

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP9:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 72
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "APPA"

    const/16 v7, 0xa

    const/16 v8, -0x16

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->APPA:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 75
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "APPB"

    const/16 v7, 0xb

    const/16 v8, -0x15

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->APPB:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 78
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "APPC"

    const/16 v7, 0xc

    const/16 v8, -0x14

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->APPC:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 81
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "APPD"

    const/16 v7, 0xd

    const/16 v8, -0x13

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->APPD:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 84
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "APPE"

    const/16 v7, 0xe

    const/16 v8, -0x12

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->APPE:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 87
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "APPF"

    const/16 v7, 0xf

    const/16 v8, -0x11

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->APPF:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 90
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "SOI"

    const/16 v7, 0x10

    const/16 v8, -0x28

    invoke-direct {v5, v6, v7, v8, v10}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOI:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 93
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "DQT"

    const/16 v7, 0x11

    const/16 v8, -0x25

    invoke-direct {v5, v6, v7, v8, v10}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->DQT:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 96
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "DHT"

    const/16 v7, 0x12

    const/16 v8, -0x3c

    invoke-direct {v5, v6, v7, v8, v10}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->DHT:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 99
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "SOF0"

    const/16 v7, 0x13

    const/16 v8, -0x40

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF0:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 102
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "SOF1"

    const/16 v7, 0x14

    const/16 v8, -0x3f

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF1:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 105
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "SOF2"

    const/16 v7, 0x15

    const/16 v8, -0x3e

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF2:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 108
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "SOF3"

    const/16 v7, 0x16

    const/16 v8, -0x3d

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF3:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 114
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "SOF5"

    const/16 v7, 0x17

    const/16 v8, -0x3b

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF5:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 117
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "SOF6"

    const/16 v7, 0x18

    const/16 v8, -0x3a

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF6:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 120
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "SOF7"

    const/16 v7, 0x19

    const/16 v8, -0x39

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF7:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 123
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "SOF8"

    const/16 v7, 0x1a

    const/16 v8, -0x38

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF8:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 126
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "SOF9"

    const/16 v7, 0x1b

    const/16 v8, -0x37

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF9:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 129
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "SOF10"

    const/16 v7, 0x1c

    const/16 v8, -0x36

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF10:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 132
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "SOF11"

    const/16 v7, 0x1d

    const/16 v8, -0x35

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF11:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 138
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "SOF13"

    const/16 v7, 0x1e

    const/16 v8, -0x33

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF13:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 141
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "SOF14"

    const/16 v7, 0x1f

    const/16 v8, -0x32

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF14:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 144
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "SOF15"

    const/16 v7, 0x20

    const/16 v8, -0x31

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF15:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 147
    new-instance v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    const-string v6, "COM"

    const/16 v7, 0x21

    const/4 v8, -0x2

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/drew/imaging/jpeg/JpegSegmentType;-><init>(Ljava/lang/String;IBZ)V

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->COM:Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 39
    const/16 v5, 0x22

    new-array v5, v5, [Lcom/drew/imaging/jpeg/JpegSegmentType;

    sget-object v6, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP0:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v6, v5, v10

    sget-object v6, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP1:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v6, v5, v9

    sget-object v6, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP2:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v6, v5, v11

    sget-object v6, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP3:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v6, v5, v12

    sget-object v6, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP4:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v6, v5, v13

    const/4 v6, 0x5

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP5:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/4 v6, 0x6

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP6:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/4 v6, 0x7

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP7:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x8

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP8:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x9

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP9:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0xa

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->APPA:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0xb

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->APPB:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0xc

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->APPC:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0xd

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->APPD:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0xe

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->APPE:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0xf

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->APPF:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x10

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOI:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x11

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->DQT:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x12

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->DHT:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x13

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF0:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x14

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF1:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x15

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF2:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x16

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF3:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x17

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF5:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x18

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF6:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x19

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF7:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x1a

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF8:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x1b

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF9:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x1c

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF10:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x1d

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF11:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x1e

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF13:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x1f

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF14:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x20

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->SOF15:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    const/16 v6, 0x21

    sget-object v7, Lcom/drew/imaging/jpeg/JpegSegmentType;->COM:Lcom/drew/imaging/jpeg/JpegSegmentType;

    aput-object v7, v5, v6

    sput-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->$VALUES:[Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 152
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 153
    .local v4, "segmentTypes":Ljava/util/List;, "Ljava/util/List<Lcom/drew/imaging/jpeg/JpegSegmentType;>;"
    const-class v5, Lcom/drew/imaging/jpeg/JpegSegmentType;

    invoke-virtual {v5}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/drew/imaging/jpeg/JpegSegmentType;

    .local v0, "arr$":[Lcom/drew/imaging/jpeg/JpegSegmentType;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_285
    if-ge v1, v2, :cond_293

    aget-object v3, v0, v1

    .line 154
    .local v3, "segmentType":Lcom/drew/imaging/jpeg/JpegSegmentType;
    iget-boolean v5, v3, Lcom/drew/imaging/jpeg/JpegSegmentType;->canContainMetadata:Z

    if-eqz v5, :cond_290

    .line 155
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    :cond_290
    add-int/lit8 v1, v1, 0x1

    goto :goto_285

    .line 158
    .end local v3    # "segmentType":Lcom/drew/imaging/jpeg/JpegSegmentType;
    :cond_293
    sput-object v4, Lcom/drew/imaging/jpeg/JpegSegmentType;->canContainMetadataTypes:Ljava/util/Collection;

    .line 159
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IBZ)V
    .registers 5
    .param p3, "byteValue"    # B
    .param p4, "canContainMetadata"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(BZ)V"
        }
    .end annotation

    .prologue
    .line 165
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 166
    iput-byte p3, p0, Lcom/drew/imaging/jpeg/JpegSegmentType;->byteValue:B

    .line 167
    iput-boolean p4, p0, Lcom/drew/imaging/jpeg/JpegSegmentType;->canContainMetadata:Z

    .line 168
    return-void
.end method

.method public static fromByte(B)Lcom/drew/imaging/jpeg/JpegSegmentType;
    .registers 6
    .param p0, "segmentTypeByte"    # B
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 173
    const-class v4, Lcom/drew/imaging/jpeg/JpegSegmentType;

    invoke-virtual {v4}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/drew/imaging/jpeg/JpegSegmentType;

    .local v0, "arr$":[Lcom/drew/imaging/jpeg/JpegSegmentType;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_a
    if-ge v1, v2, :cond_16

    aget-object v3, v0, v1

    .line 174
    .local v3, "segmentType":Lcom/drew/imaging/jpeg/JpegSegmentType;
    iget-byte v4, v3, Lcom/drew/imaging/jpeg/JpegSegmentType;->byteValue:B

    if-ne v4, p0, :cond_13

    .line 177
    .end local v3    # "segmentType":Lcom/drew/imaging/jpeg/JpegSegmentType;
    :goto_12
    return-object v3

    .line 173
    .restart local v3    # "segmentType":Lcom/drew/imaging/jpeg/JpegSegmentType;
    :cond_13
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 177
    .end local v3    # "segmentType":Lcom/drew/imaging/jpeg/JpegSegmentType;
    :cond_16
    const/4 v3, 0x0

    goto :goto_12
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/drew/imaging/jpeg/JpegSegmentType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 39
    const-class v0, Lcom/drew/imaging/jpeg/JpegSegmentType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/drew/imaging/jpeg/JpegSegmentType;

    return-object v0
.end method

.method public static values()[Lcom/drew/imaging/jpeg/JpegSegmentType;
    .registers 1

    .prologue
    .line 39
    sget-object v0, Lcom/drew/imaging/jpeg/JpegSegmentType;->$VALUES:[Lcom/drew/imaging/jpeg/JpegSegmentType;

    invoke-virtual {v0}, [Lcom/drew/imaging/jpeg/JpegSegmentType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/drew/imaging/jpeg/JpegSegmentType;

    return-object v0
.end method
