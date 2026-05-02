.class public final enum Ltk/elevenk/olapi/data/EbookType;
.super Ljava/lang/Enum;
.source "EbookType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Ltk/elevenk/olapi/data/EbookType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Ltk/elevenk/olapi/data/EbookType;

.field public static final enum DJVU:Ltk/elevenk/olapi/data/EbookType;

.field public static final enum EPUB:Ltk/elevenk/olapi/data/EbookType;

.field public static final enum PDF:Ltk/elevenk/olapi/data/EbookType;

.field public static final enum TXT:Ltk/elevenk/olapi/data/EbookType;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 27
    new-instance v0, Ltk/elevenk/olapi/data/EbookType;

    const-string v1, "EPUB"

    invoke-direct {v0, v1, v2}, Ltk/elevenk/olapi/data/EbookType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ltk/elevenk/olapi/data/EbookType;->EPUB:Ltk/elevenk/olapi/data/EbookType;

    .line 28
    new-instance v0, Ltk/elevenk/olapi/data/EbookType;

    const-string v1, "PDF"

    invoke-direct {v0, v1, v3}, Ltk/elevenk/olapi/data/EbookType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ltk/elevenk/olapi/data/EbookType;->PDF:Ltk/elevenk/olapi/data/EbookType;

    .line 29
    new-instance v0, Ltk/elevenk/olapi/data/EbookType;

    const-string v1, "DJVU"

    invoke-direct {v0, v1, v4}, Ltk/elevenk/olapi/data/EbookType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ltk/elevenk/olapi/data/EbookType;->DJVU:Ltk/elevenk/olapi/data/EbookType;

    .line 30
    new-instance v0, Ltk/elevenk/olapi/data/EbookType;

    const-string v1, "TXT"

    invoke-direct {v0, v1, v5}, Ltk/elevenk/olapi/data/EbookType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ltk/elevenk/olapi/data/EbookType;->TXT:Ltk/elevenk/olapi/data/EbookType;

    .line 26
    const/4 v0, 0x4

    new-array v0, v0, [Ltk/elevenk/olapi/data/EbookType;

    sget-object v1, Ltk/elevenk/olapi/data/EbookType;->EPUB:Ltk/elevenk/olapi/data/EbookType;

    aput-object v1, v0, v2

    sget-object v1, Ltk/elevenk/olapi/data/EbookType;->PDF:Ltk/elevenk/olapi/data/EbookType;

    aput-object v1, v0, v3

    sget-object v1, Ltk/elevenk/olapi/data/EbookType;->DJVU:Ltk/elevenk/olapi/data/EbookType;

    aput-object v1, v0, v4

    sget-object v1, Ltk/elevenk/olapi/data/EbookType;->TXT:Ltk/elevenk/olapi/data/EbookType;

    aput-object v1, v0, v5

    sput-object v0, Ltk/elevenk/olapi/data/EbookType;->$VALUES:[Ltk/elevenk/olapi/data/EbookType;

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

.method public static valueOf(Ljava/lang/String;)Ltk/elevenk/olapi/data/EbookType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 26
    const-class v0, Ltk/elevenk/olapi/data/EbookType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Ltk/elevenk/olapi/data/EbookType;

    return-object v0
.end method

.method public static values()[Ltk/elevenk/olapi/data/EbookType;
    .registers 1

    .prologue
    .line 26
    sget-object v0, Ltk/elevenk/olapi/data/EbookType;->$VALUES:[Ltk/elevenk/olapi/data/EbookType;

    invoke-virtual {v0}, [Ltk/elevenk/olapi/data/EbookType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ltk/elevenk/olapi/data/EbookType;

    return-object v0
.end method
