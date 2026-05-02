.class public final enum Lcom/drew/imaging/FileType;
.super Ljava/lang/Enum;
.source "FileType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/drew/imaging/FileType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/drew/imaging/FileType;

.field public static final enum Arw:Lcom/drew/imaging/FileType;

.field public static final enum Bmp:Lcom/drew/imaging/FileType;

.field public static final enum Cr2:Lcom/drew/imaging/FileType;

.field public static final enum Crw:Lcom/drew/imaging/FileType;

.field public static final enum Gif:Lcom/drew/imaging/FileType;

.field public static final enum Ico:Lcom/drew/imaging/FileType;

.field public static final enum Jpeg:Lcom/drew/imaging/FileType;

.field public static final enum Nef:Lcom/drew/imaging/FileType;

.field public static final enum Orf:Lcom/drew/imaging/FileType;

.field public static final enum Pcx:Lcom/drew/imaging/FileType;

.field public static final enum Png:Lcom/drew/imaging/FileType;

.field public static final enum Psd:Lcom/drew/imaging/FileType;

.field public static final enum Raf:Lcom/drew/imaging/FileType;

.field public static final enum Riff:Lcom/drew/imaging/FileType;

.field public static final enum Rw2:Lcom/drew/imaging/FileType;

.field public static final enum Tiff:Lcom/drew/imaging/FileType;

.field public static final enum Unknown:Lcom/drew/imaging/FileType;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 28
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Unknown"

    invoke-direct {v0, v1, v3}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Unknown:Lcom/drew/imaging/FileType;

    .line 29
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Jpeg"

    invoke-direct {v0, v1, v4}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Jpeg:Lcom/drew/imaging/FileType;

    .line 30
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Tiff"

    invoke-direct {v0, v1, v5}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Tiff:Lcom/drew/imaging/FileType;

    .line 31
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Psd"

    invoke-direct {v0, v1, v6}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Psd:Lcom/drew/imaging/FileType;

    .line 32
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Png"

    invoke-direct {v0, v1, v7}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Png:Lcom/drew/imaging/FileType;

    .line 33
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Bmp"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Bmp:Lcom/drew/imaging/FileType;

    .line 34
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Gif"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Gif:Lcom/drew/imaging/FileType;

    .line 35
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Ico"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Ico:Lcom/drew/imaging/FileType;

    .line 36
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Pcx"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Pcx:Lcom/drew/imaging/FileType;

    .line 37
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Riff"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Riff:Lcom/drew/imaging/FileType;

    .line 40
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Arw"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Arw:Lcom/drew/imaging/FileType;

    .line 42
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Crw"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Crw:Lcom/drew/imaging/FileType;

    .line 44
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Cr2"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Cr2:Lcom/drew/imaging/FileType;

    .line 46
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Nef"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Nef:Lcom/drew/imaging/FileType;

    .line 48
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Orf"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Orf:Lcom/drew/imaging/FileType;

    .line 50
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Raf"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Raf:Lcom/drew/imaging/FileType;

    .line 52
    new-instance v0, Lcom/drew/imaging/FileType;

    const-string v1, "Rw2"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lcom/drew/imaging/FileType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/drew/imaging/FileType;->Rw2:Lcom/drew/imaging/FileType;

    .line 26
    const/16 v0, 0x11

    new-array v0, v0, [Lcom/drew/imaging/FileType;

    sget-object v1, Lcom/drew/imaging/FileType;->Unknown:Lcom/drew/imaging/FileType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/drew/imaging/FileType;->Jpeg:Lcom/drew/imaging/FileType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/drew/imaging/FileType;->Tiff:Lcom/drew/imaging/FileType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/drew/imaging/FileType;->Psd:Lcom/drew/imaging/FileType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/drew/imaging/FileType;->Png:Lcom/drew/imaging/FileType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/drew/imaging/FileType;->Bmp:Lcom/drew/imaging/FileType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/drew/imaging/FileType;->Gif:Lcom/drew/imaging/FileType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/drew/imaging/FileType;->Ico:Lcom/drew/imaging/FileType;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/drew/imaging/FileType;->Pcx:Lcom/drew/imaging/FileType;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/drew/imaging/FileType;->Riff:Lcom/drew/imaging/FileType;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/drew/imaging/FileType;->Arw:Lcom/drew/imaging/FileType;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/drew/imaging/FileType;->Crw:Lcom/drew/imaging/FileType;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/drew/imaging/FileType;->Cr2:Lcom/drew/imaging/FileType;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/drew/imaging/FileType;->Nef:Lcom/drew/imaging/FileType;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/drew/imaging/FileType;->Orf:Lcom/drew/imaging/FileType;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/drew/imaging/FileType;->Raf:Lcom/drew/imaging/FileType;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lcom/drew/imaging/FileType;->Rw2:Lcom/drew/imaging/FileType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/drew/imaging/FileType;->$VALUES:[Lcom/drew/imaging/FileType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/drew/imaging/FileType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 26
    const-class v0, Lcom/drew/imaging/FileType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/drew/imaging/FileType;

    return-object v0
.end method

.method public static values()[Lcom/drew/imaging/FileType;
    .registers 1

    .prologue
    .line 26
    sget-object v0, Lcom/drew/imaging/FileType;->$VALUES:[Lcom/drew/imaging/FileType;

    invoke-virtual {v0}, [Lcom/drew/imaging/FileType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/drew/imaging/FileType;

    return-object v0
.end method
