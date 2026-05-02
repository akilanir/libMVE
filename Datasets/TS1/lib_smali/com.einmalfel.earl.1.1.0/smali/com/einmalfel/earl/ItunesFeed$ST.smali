.class final enum Lcom/einmalfel/earl/ItunesFeed$ST;
.super Ljava/lang/Enum;
.source "ItunesFeed.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/einmalfel/earl/ItunesFeed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ST"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/einmalfel/earl/ItunesFeed$ST;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/einmalfel/earl/ItunesFeed$ST;

.field public static final enum author:Lcom/einmalfel/earl/ItunesFeed$ST;

.field public static final enum block:Lcom/einmalfel/earl/ItunesFeed$ST;

.field public static final enum complete:Lcom/einmalfel/earl/ItunesFeed$ST;

.field public static final enum explicit:Lcom/einmalfel/earl/ItunesFeed$ST;

.field public static final enum subtitle:Lcom/einmalfel/earl/ItunesFeed$ST;

.field public static final enum summary:Lcom/einmalfel/earl/ItunesFeed$ST;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 21
    new-instance v0, Lcom/einmalfel/earl/ItunesFeed$ST;

    const-string v1, "author"

    invoke-direct {v0, v1, v3}, Lcom/einmalfel/earl/ItunesFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/ItunesFeed$ST;->author:Lcom/einmalfel/earl/ItunesFeed$ST;

    new-instance v0, Lcom/einmalfel/earl/ItunesFeed$ST;

    const-string v1, "block"

    invoke-direct {v0, v1, v4}, Lcom/einmalfel/earl/ItunesFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/ItunesFeed$ST;->block:Lcom/einmalfel/earl/ItunesFeed$ST;

    new-instance v0, Lcom/einmalfel/earl/ItunesFeed$ST;

    const-string v1, "explicit"

    invoke-direct {v0, v1, v5}, Lcom/einmalfel/earl/ItunesFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/ItunesFeed$ST;->explicit:Lcom/einmalfel/earl/ItunesFeed$ST;

    new-instance v0, Lcom/einmalfel/earl/ItunesFeed$ST;

    const-string v1, "complete"

    invoke-direct {v0, v1, v6}, Lcom/einmalfel/earl/ItunesFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/ItunesFeed$ST;->complete:Lcom/einmalfel/earl/ItunesFeed$ST;

    new-instance v0, Lcom/einmalfel/earl/ItunesFeed$ST;

    const-string v1, "subtitle"

    invoke-direct {v0, v1, v7}, Lcom/einmalfel/earl/ItunesFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/ItunesFeed$ST;->subtitle:Lcom/einmalfel/earl/ItunesFeed$ST;

    new-instance v0, Lcom/einmalfel/earl/ItunesFeed$ST;

    const-string v1, "summary"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/einmalfel/earl/ItunesFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/ItunesFeed$ST;->summary:Lcom/einmalfel/earl/ItunesFeed$ST;

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/einmalfel/earl/ItunesFeed$ST;

    sget-object v1, Lcom/einmalfel/earl/ItunesFeed$ST;->author:Lcom/einmalfel/earl/ItunesFeed$ST;

    aput-object v1, v0, v3

    sget-object v1, Lcom/einmalfel/earl/ItunesFeed$ST;->block:Lcom/einmalfel/earl/ItunesFeed$ST;

    aput-object v1, v0, v4

    sget-object v1, Lcom/einmalfel/earl/ItunesFeed$ST;->explicit:Lcom/einmalfel/earl/ItunesFeed$ST;

    aput-object v1, v0, v5

    sget-object v1, Lcom/einmalfel/earl/ItunesFeed$ST;->complete:Lcom/einmalfel/earl/ItunesFeed$ST;

    aput-object v1, v0, v6

    sget-object v1, Lcom/einmalfel/earl/ItunesFeed$ST;->subtitle:Lcom/einmalfel/earl/ItunesFeed$ST;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/einmalfel/earl/ItunesFeed$ST;->summary:Lcom/einmalfel/earl/ItunesFeed$ST;

    aput-object v2, v0, v1

    sput-object v0, Lcom/einmalfel/earl/ItunesFeed$ST;->$VALUES:[Lcom/einmalfel/earl/ItunesFeed$ST;

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
    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/einmalfel/earl/ItunesFeed$ST;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 21
    const-class v0, Lcom/einmalfel/earl/ItunesFeed$ST;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/ItunesFeed$ST;

    return-object v0
.end method

.method public static values()[Lcom/einmalfel/earl/ItunesFeed$ST;
    .registers 1

    .prologue
    .line 21
    sget-object v0, Lcom/einmalfel/earl/ItunesFeed$ST;->$VALUES:[Lcom/einmalfel/earl/ItunesFeed$ST;

    invoke-virtual {v0}, [Lcom/einmalfel/earl/ItunesFeed$ST;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/einmalfel/earl/ItunesFeed$ST;

    return-object v0
.end method
