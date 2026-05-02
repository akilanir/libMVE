.class public Lorg/ligi/axt/adapters/LinkWithDescriptionAndTitle;
.super Lorg/ligi/axt/adapters/LinkWithDescription;
.source "LinkWithDescriptionAndTitle.java"


# instance fields
.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "_url"    # Ljava/lang/String;
    .param p2, "_description"    # Ljava/lang/String;
    .param p3, "title"    # Ljava/lang/String;

    .prologue
    .line 8
    invoke-direct {p0, p1, p2}, Lorg/ligi/axt/adapters/LinkWithDescription;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    invoke-virtual {p0, p3}, Lorg/ligi/axt/adapters/LinkWithDescriptionAndTitle;->setTitle(Ljava/lang/String;)V

    .line 10
    return-void
.end method


# virtual methods
.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 13
    iget-object v0, p0, Lorg/ligi/axt/adapters/LinkWithDescriptionAndTitle;->title:Ljava/lang/String;

    return-object v0
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 17
    iput-object p1, p0, Lorg/ligi/axt/adapters/LinkWithDescriptionAndTitle;->title:Ljava/lang/String;

    .line 18
    return-void
.end method
