.class public Lorg/ligi/axt/adapters/LinkWithDescription;
.super Ljava/lang/Object;
.source "LinkWithDescription.java"


# instance fields
.field private description:Ljava/lang/String;

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "_url"    # Ljava/lang/String;
    .param p2, "_description"    # Ljava/lang/String;

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput-object p1, p0, Lorg/ligi/axt/adapters/LinkWithDescription;->url:Ljava/lang/String;

    .line 9
    iput-object p2, p0, Lorg/ligi/axt/adapters/LinkWithDescription;->description:Ljava/lang/String;

    .line 10
    return-void
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 17
    iget-object v0, p0, Lorg/ligi/axt/adapters/LinkWithDescription;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 13
    iget-object v0, p0, Lorg/ligi/axt/adapters/LinkWithDescription;->url:Ljava/lang/String;

    return-object v0
.end method
