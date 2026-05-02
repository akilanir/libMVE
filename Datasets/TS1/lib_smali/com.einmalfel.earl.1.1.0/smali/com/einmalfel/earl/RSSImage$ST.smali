.class final enum Lcom/einmalfel/earl/RSSImage$ST;
.super Ljava/lang/Enum;
.source "RSSImage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/einmalfel/earl/RSSImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ST"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/einmalfel/earl/RSSImage$ST;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/einmalfel/earl/RSSImage$ST;

.field public static final enum description:Lcom/einmalfel/earl/RSSImage$ST;

.field public static final enum height:Lcom/einmalfel/earl/RSSImage$ST;

.field public static final enum link:Lcom/einmalfel/earl/RSSImage$ST;

.field public static final enum title:Lcom/einmalfel/earl/RSSImage$ST;

.field public static final enum url:Lcom/einmalfel/earl/RSSImage$ST;

.field public static final enum width:Lcom/einmalfel/earl/RSSImage$ST;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 19
    new-instance v0, Lcom/einmalfel/earl/RSSImage$ST;

    const-string v1, "title"

    invoke-direct {v0, v1, v3}, Lcom/einmalfel/earl/RSSImage$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSImage$ST;->title:Lcom/einmalfel/earl/RSSImage$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSImage$ST;

    const-string v1, "description"

    invoke-direct {v0, v1, v4}, Lcom/einmalfel/earl/RSSImage$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSImage$ST;->description:Lcom/einmalfel/earl/RSSImage$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSImage$ST;

    const-string v1, "link"

    invoke-direct {v0, v1, v5}, Lcom/einmalfel/earl/RSSImage$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSImage$ST;->link:Lcom/einmalfel/earl/RSSImage$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSImage$ST;

    const-string v1, "url"

    invoke-direct {v0, v1, v6}, Lcom/einmalfel/earl/RSSImage$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSImage$ST;->url:Lcom/einmalfel/earl/RSSImage$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSImage$ST;

    const-string v1, "width"

    invoke-direct {v0, v1, v7}, Lcom/einmalfel/earl/RSSImage$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSImage$ST;->width:Lcom/einmalfel/earl/RSSImage$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSImage$ST;

    const-string v1, "height"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/einmalfel/earl/RSSImage$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSImage$ST;->height:Lcom/einmalfel/earl/RSSImage$ST;

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/einmalfel/earl/RSSImage$ST;

    sget-object v1, Lcom/einmalfel/earl/RSSImage$ST;->title:Lcom/einmalfel/earl/RSSImage$ST;

    aput-object v1, v0, v3

    sget-object v1, Lcom/einmalfel/earl/RSSImage$ST;->description:Lcom/einmalfel/earl/RSSImage$ST;

    aput-object v1, v0, v4

    sget-object v1, Lcom/einmalfel/earl/RSSImage$ST;->link:Lcom/einmalfel/earl/RSSImage$ST;

    aput-object v1, v0, v5

    sget-object v1, Lcom/einmalfel/earl/RSSImage$ST;->url:Lcom/einmalfel/earl/RSSImage$ST;

    aput-object v1, v0, v6

    sget-object v1, Lcom/einmalfel/earl/RSSImage$ST;->width:Lcom/einmalfel/earl/RSSImage$ST;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/einmalfel/earl/RSSImage$ST;->height:Lcom/einmalfel/earl/RSSImage$ST;

    aput-object v2, v0, v1

    sput-object v0, Lcom/einmalfel/earl/RSSImage$ST;->$VALUES:[Lcom/einmalfel/earl/RSSImage$ST;

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
    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/einmalfel/earl/RSSImage$ST;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 19
    const-class v0, Lcom/einmalfel/earl/RSSImage$ST;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/RSSImage$ST;

    return-object v0
.end method

.method public static values()[Lcom/einmalfel/earl/RSSImage$ST;
    .registers 1

    .prologue
    .line 19
    sget-object v0, Lcom/einmalfel/earl/RSSImage$ST;->$VALUES:[Lcom/einmalfel/earl/RSSImage$ST;

    invoke-virtual {v0}, [Lcom/einmalfel/earl/RSSImage$ST;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/einmalfel/earl/RSSImage$ST;

    return-object v0
.end method
