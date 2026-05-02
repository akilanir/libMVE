.class public final enum Lnl/siegmann/epublib/domain/ManifestItemProperties;
.super Ljava/lang/Enum;
.source "ManifestItemProperties.java"

# interfaces
.implements Lnl/siegmann/epublib/domain/ManifestProperties;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lnl/siegmann/epublib/domain/ManifestItemProperties;",
        ">;",
        "Lnl/siegmann/epublib/domain/ManifestProperties;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lnl/siegmann/epublib/domain/ManifestItemProperties;

.field public static final enum COVER_IMAGE:Lnl/siegmann/epublib/domain/ManifestItemProperties;

.field public static final enum MATHML:Lnl/siegmann/epublib/domain/ManifestItemProperties;

.field public static final enum NAV:Lnl/siegmann/epublib/domain/ManifestItemProperties;

.field public static final enum REMOTE_RESOURCES:Lnl/siegmann/epublib/domain/ManifestItemProperties;

.field public static final enum SCRIPTED:Lnl/siegmann/epublib/domain/ManifestItemProperties;

.field public static final enum SVG:Lnl/siegmann/epublib/domain/ManifestItemProperties;

.field public static final enum SWITCH:Lnl/siegmann/epublib/domain/ManifestItemProperties;


# instance fields
.field private name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 4
    new-instance v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;

    const-string v1, "COVER_IMAGE"

    const-string v2, "cover-image"

    invoke-direct {v0, v1, v4, v2}, Lnl/siegmann/epublib/domain/ManifestItemProperties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;->COVER_IMAGE:Lnl/siegmann/epublib/domain/ManifestItemProperties;

    .line 5
    new-instance v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;

    const-string v1, "MATHML"

    const-string v2, "mathml"

    invoke-direct {v0, v1, v5, v2}, Lnl/siegmann/epublib/domain/ManifestItemProperties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;->MATHML:Lnl/siegmann/epublib/domain/ManifestItemProperties;

    .line 6
    new-instance v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;

    const-string v1, "NAV"

    const-string v2, "nav"

    invoke-direct {v0, v1, v6, v2}, Lnl/siegmann/epublib/domain/ManifestItemProperties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;->NAV:Lnl/siegmann/epublib/domain/ManifestItemProperties;

    .line 7
    new-instance v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;

    const-string v1, "REMOTE_RESOURCES"

    const-string v2, "remote-resources"

    invoke-direct {v0, v1, v7, v2}, Lnl/siegmann/epublib/domain/ManifestItemProperties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;->REMOTE_RESOURCES:Lnl/siegmann/epublib/domain/ManifestItemProperties;

    .line 8
    new-instance v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;

    const-string v1, "SCRIPTED"

    const-string v2, "scripted"

    invoke-direct {v0, v1, v8, v2}, Lnl/siegmann/epublib/domain/ManifestItemProperties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;->SCRIPTED:Lnl/siegmann/epublib/domain/ManifestItemProperties;

    .line 9
    new-instance v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;

    const-string v1, "SVG"

    const/4 v2, 0x5

    const-string v3, "svg"

    invoke-direct {v0, v1, v2, v3}, Lnl/siegmann/epublib/domain/ManifestItemProperties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;->SVG:Lnl/siegmann/epublib/domain/ManifestItemProperties;

    .line 10
    new-instance v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;

    const-string v1, "SWITCH"

    const/4 v2, 0x6

    const-string v3, "switch"

    invoke-direct {v0, v1, v2, v3}, Lnl/siegmann/epublib/domain/ManifestItemProperties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;->SWITCH:Lnl/siegmann/epublib/domain/ManifestItemProperties;

    .line 3
    const/4 v0, 0x7

    new-array v0, v0, [Lnl/siegmann/epublib/domain/ManifestItemProperties;

    sget-object v1, Lnl/siegmann/epublib/domain/ManifestItemProperties;->COVER_IMAGE:Lnl/siegmann/epublib/domain/ManifestItemProperties;

    aput-object v1, v0, v4

    sget-object v1, Lnl/siegmann/epublib/domain/ManifestItemProperties;->MATHML:Lnl/siegmann/epublib/domain/ManifestItemProperties;

    aput-object v1, v0, v5

    sget-object v1, Lnl/siegmann/epublib/domain/ManifestItemProperties;->NAV:Lnl/siegmann/epublib/domain/ManifestItemProperties;

    aput-object v1, v0, v6

    sget-object v1, Lnl/siegmann/epublib/domain/ManifestItemProperties;->REMOTE_RESOURCES:Lnl/siegmann/epublib/domain/ManifestItemProperties;

    aput-object v1, v0, v7

    sget-object v1, Lnl/siegmann/epublib/domain/ManifestItemProperties;->SCRIPTED:Lnl/siegmann/epublib/domain/ManifestItemProperties;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lnl/siegmann/epublib/domain/ManifestItemProperties;->SVG:Lnl/siegmann/epublib/domain/ManifestItemProperties;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lnl/siegmann/epublib/domain/ManifestItemProperties;->SWITCH:Lnl/siegmann/epublib/domain/ManifestItemProperties;

    aput-object v2, v0, v1

    sput-object v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;->$VALUES:[Lnl/siegmann/epublib/domain/ManifestItemProperties;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4
    .param p3, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 14
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 15
    iput-object p3, p0, Lnl/siegmann/epublib/domain/ManifestItemProperties;->name:Ljava/lang/String;

    .line 16
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnl/siegmann/epublib/domain/ManifestItemProperties;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 3
    const-class v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;

    return-object v0
.end method

.method public static values()[Lnl/siegmann/epublib/domain/ManifestItemProperties;
    .registers 1

    .prologue
    .line 3
    sget-object v0, Lnl/siegmann/epublib/domain/ManifestItemProperties;->$VALUES:[Lnl/siegmann/epublib/domain/ManifestItemProperties;

    invoke-virtual {v0}, [Lnl/siegmann/epublib/domain/ManifestItemProperties;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnl/siegmann/epublib/domain/ManifestItemProperties;

    return-object v0
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 19
    iget-object v0, p0, Lnl/siegmann/epublib/domain/ManifestItemProperties;->name:Ljava/lang/String;

    return-object v0
.end method
