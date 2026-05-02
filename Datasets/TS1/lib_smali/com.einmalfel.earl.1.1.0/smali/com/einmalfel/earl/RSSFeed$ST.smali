.class final enum Lcom/einmalfel/earl/RSSFeed$ST;
.super Ljava/lang/Enum;
.source "RSSFeed.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/einmalfel/earl/RSSFeed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ST"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/einmalfel/earl/RSSFeed$ST;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/einmalfel/earl/RSSFeed$ST;

.field public static final enum copyright:Lcom/einmalfel/earl/RSSFeed$ST;

.field public static final enum description:Lcom/einmalfel/earl/RSSFeed$ST;

.field public static final enum docs:Lcom/einmalfel/earl/RSSFeed$ST;

.field public static final enum generator:Lcom/einmalfel/earl/RSSFeed$ST;

.field public static final enum language:Lcom/einmalfel/earl/RSSFeed$ST;

.field public static final enum lastBuildDate:Lcom/einmalfel/earl/RSSFeed$ST;

.field public static final enum link:Lcom/einmalfel/earl/RSSFeed$ST;

.field public static final enum managingEditor:Lcom/einmalfel/earl/RSSFeed$ST;

.field public static final enum pubDate:Lcom/einmalfel/earl/RSSFeed$ST;

.field public static final enum rating:Lcom/einmalfel/earl/RSSFeed$ST;

.field public static final enum title:Lcom/einmalfel/earl/RSSFeed$ST;

.field public static final enum ttl:Lcom/einmalfel/earl/RSSFeed$ST;

.field public static final enum webMaster:Lcom/einmalfel/earl/RSSFeed$ST;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 25
    new-instance v0, Lcom/einmalfel/earl/RSSFeed$ST;

    const-string v1, "title"

    invoke-direct {v0, v1, v3}, Lcom/einmalfel/earl/RSSFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSFeed$ST;->title:Lcom/einmalfel/earl/RSSFeed$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSFeed$ST;

    const-string v1, "link"

    invoke-direct {v0, v1, v4}, Lcom/einmalfel/earl/RSSFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSFeed$ST;->link:Lcom/einmalfel/earl/RSSFeed$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSFeed$ST;

    const-string v1, "description"

    invoke-direct {v0, v1, v5}, Lcom/einmalfel/earl/RSSFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSFeed$ST;->description:Lcom/einmalfel/earl/RSSFeed$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSFeed$ST;

    const-string v1, "language"

    invoke-direct {v0, v1, v6}, Lcom/einmalfel/earl/RSSFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSFeed$ST;->language:Lcom/einmalfel/earl/RSSFeed$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSFeed$ST;

    const-string v1, "copyright"

    invoke-direct {v0, v1, v7}, Lcom/einmalfel/earl/RSSFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSFeed$ST;->copyright:Lcom/einmalfel/earl/RSSFeed$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSFeed$ST;

    const-string v1, "managingEditor"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/einmalfel/earl/RSSFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSFeed$ST;->managingEditor:Lcom/einmalfel/earl/RSSFeed$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSFeed$ST;

    const-string v1, "webMaster"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/einmalfel/earl/RSSFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSFeed$ST;->webMaster:Lcom/einmalfel/earl/RSSFeed$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSFeed$ST;

    const-string v1, "pubDate"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/einmalfel/earl/RSSFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSFeed$ST;->pubDate:Lcom/einmalfel/earl/RSSFeed$ST;

    .line 26
    new-instance v0, Lcom/einmalfel/earl/RSSFeed$ST;

    const-string v1, "lastBuildDate"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/einmalfel/earl/RSSFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSFeed$ST;->lastBuildDate:Lcom/einmalfel/earl/RSSFeed$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSFeed$ST;

    const-string v1, "generator"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/einmalfel/earl/RSSFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSFeed$ST;->generator:Lcom/einmalfel/earl/RSSFeed$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSFeed$ST;

    const-string v1, "docs"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/einmalfel/earl/RSSFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSFeed$ST;->docs:Lcom/einmalfel/earl/RSSFeed$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSFeed$ST;

    const-string v1, "ttl"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/einmalfel/earl/RSSFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSFeed$ST;->ttl:Lcom/einmalfel/earl/RSSFeed$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSFeed$ST;

    const-string v1, "rating"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/einmalfel/earl/RSSFeed$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSFeed$ST;->rating:Lcom/einmalfel/earl/RSSFeed$ST;

    .line 24
    const/16 v0, 0xd

    new-array v0, v0, [Lcom/einmalfel/earl/RSSFeed$ST;

    sget-object v1, Lcom/einmalfel/earl/RSSFeed$ST;->title:Lcom/einmalfel/earl/RSSFeed$ST;

    aput-object v1, v0, v3

    sget-object v1, Lcom/einmalfel/earl/RSSFeed$ST;->link:Lcom/einmalfel/earl/RSSFeed$ST;

    aput-object v1, v0, v4

    sget-object v1, Lcom/einmalfel/earl/RSSFeed$ST;->description:Lcom/einmalfel/earl/RSSFeed$ST;

    aput-object v1, v0, v5

    sget-object v1, Lcom/einmalfel/earl/RSSFeed$ST;->language:Lcom/einmalfel/earl/RSSFeed$ST;

    aput-object v1, v0, v6

    sget-object v1, Lcom/einmalfel/earl/RSSFeed$ST;->copyright:Lcom/einmalfel/earl/RSSFeed$ST;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/einmalfel/earl/RSSFeed$ST;->managingEditor:Lcom/einmalfel/earl/RSSFeed$ST;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/einmalfel/earl/RSSFeed$ST;->webMaster:Lcom/einmalfel/earl/RSSFeed$ST;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/einmalfel/earl/RSSFeed$ST;->pubDate:Lcom/einmalfel/earl/RSSFeed$ST;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/einmalfel/earl/RSSFeed$ST;->lastBuildDate:Lcom/einmalfel/earl/RSSFeed$ST;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/einmalfel/earl/RSSFeed$ST;->generator:Lcom/einmalfel/earl/RSSFeed$ST;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/einmalfel/earl/RSSFeed$ST;->docs:Lcom/einmalfel/earl/RSSFeed$ST;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/einmalfel/earl/RSSFeed$ST;->ttl:Lcom/einmalfel/earl/RSSFeed$ST;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/einmalfel/earl/RSSFeed$ST;->rating:Lcom/einmalfel/earl/RSSFeed$ST;

    aput-object v2, v0, v1

    sput-object v0, Lcom/einmalfel/earl/RSSFeed$ST;->$VALUES:[Lcom/einmalfel/earl/RSSFeed$ST;

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
    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/einmalfel/earl/RSSFeed$ST;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 24
    const-class v0, Lcom/einmalfel/earl/RSSFeed$ST;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/RSSFeed$ST;

    return-object v0
.end method

.method public static values()[Lcom/einmalfel/earl/RSSFeed$ST;
    .registers 1

    .prologue
    .line 24
    sget-object v0, Lcom/einmalfel/earl/RSSFeed$ST;->$VALUES:[Lcom/einmalfel/earl/RSSFeed$ST;

    invoke-virtual {v0}, [Lcom/einmalfel/earl/RSSFeed$ST;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/einmalfel/earl/RSSFeed$ST;

    return-object v0
.end method
