.class public Lorg/zeromq/ZStar$SimpleSet;
.super Ljava/lang/Object;
.source "ZStar.java"

# interfaces
.implements Lorg/zeromq/ZStar$Set;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZStar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimpleSet"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 532
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createDefaultName(Ljava/lang/String;I)Ljava/lang/String;
    .registers 5
    .param p0, "format"    # Ljava/lang/String;
    .param p1, "id"    # I

    .prologue
    .line 551
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public fire()Z
    .registers 2

    .prologue
    .line 537
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    return v0
.end method

.method public lights(Ljava/lang/String;I)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "id"    # I

    .prologue
    .line 543
    if-nez p1, :cond_8

    .line 544
    const-string v0, "Star-%d"

    invoke-static {v0, p2}, Lorg/zeromq/ZStar$SimpleSet;->createDefaultName(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    .line 546
    :cond_8
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 547
    return-void
.end method
