.class public final enum Lnl/siegmann/epublib/domain/ManifestItemRefProperties;
.super Ljava/lang/Enum;
.source "ManifestItemRefProperties.java"

# interfaces
.implements Lnl/siegmann/epublib/domain/ManifestProperties;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lnl/siegmann/epublib/domain/ManifestItemRefProperties;",
        ">;",
        "Lnl/siegmann/epublib/domain/ManifestProperties;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lnl/siegmann/epublib/domain/ManifestItemRefProperties;

.field public static final enum PAGE_SPREAD_LEFT:Lnl/siegmann/epublib/domain/ManifestItemRefProperties;

.field public static final enum PAGE_SPREAD_RIGHT:Lnl/siegmann/epublib/domain/ManifestItemRefProperties;


# instance fields
.field private name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 4
    new-instance v0, Lnl/siegmann/epublib/domain/ManifestItemRefProperties;

    const-string v1, "PAGE_SPREAD_LEFT"

    const-string v2, "page-spread-left"

    invoke-direct {v0, v1, v3, v2}, Lnl/siegmann/epublib/domain/ManifestItemRefProperties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnl/siegmann/epublib/domain/ManifestItemRefProperties;->PAGE_SPREAD_LEFT:Lnl/siegmann/epublib/domain/ManifestItemRefProperties;

    .line 5
    new-instance v0, Lnl/siegmann/epublib/domain/ManifestItemRefProperties;

    const-string v1, "PAGE_SPREAD_RIGHT"

    const-string v2, "page-spread-right"

    invoke-direct {v0, v1, v4, v2}, Lnl/siegmann/epublib/domain/ManifestItemRefProperties;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnl/siegmann/epublib/domain/ManifestItemRefProperties;->PAGE_SPREAD_RIGHT:Lnl/siegmann/epublib/domain/ManifestItemRefProperties;

    .line 3
    const/4 v0, 0x2

    new-array v0, v0, [Lnl/siegmann/epublib/domain/ManifestItemRefProperties;

    sget-object v1, Lnl/siegmann/epublib/domain/ManifestItemRefProperties;->PAGE_SPREAD_LEFT:Lnl/siegmann/epublib/domain/ManifestItemRefProperties;

    aput-object v1, v0, v3

    sget-object v1, Lnl/siegmann/epublib/domain/ManifestItemRefProperties;->PAGE_SPREAD_RIGHT:Lnl/siegmann/epublib/domain/ManifestItemRefProperties;

    aput-object v1, v0, v4

    sput-object v0, Lnl/siegmann/epublib/domain/ManifestItemRefProperties;->$VALUES:[Lnl/siegmann/epublib/domain/ManifestItemRefProperties;

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
    .line 9
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 10
    iput-object p3, p0, Lnl/siegmann/epublib/domain/ManifestItemRefProperties;->name:Ljava/lang/String;

    .line 11
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnl/siegmann/epublib/domain/ManifestItemRefProperties;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 3
    const-class v0, Lnl/siegmann/epublib/domain/ManifestItemRefProperties;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/domain/ManifestItemRefProperties;

    return-object v0
.end method

.method public static values()[Lnl/siegmann/epublib/domain/ManifestItemRefProperties;
    .registers 1

    .prologue
    .line 3
    sget-object v0, Lnl/siegmann/epublib/domain/ManifestItemRefProperties;->$VALUES:[Lnl/siegmann/epublib/domain/ManifestItemRefProperties;

    invoke-virtual {v0}, [Lnl/siegmann/epublib/domain/ManifestItemRefProperties;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnl/siegmann/epublib/domain/ManifestItemRefProperties;

    return-object v0
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 14
    iget-object v0, p0, Lnl/siegmann/epublib/domain/ManifestItemRefProperties;->name:Ljava/lang/String;

    return-object v0
.end method
