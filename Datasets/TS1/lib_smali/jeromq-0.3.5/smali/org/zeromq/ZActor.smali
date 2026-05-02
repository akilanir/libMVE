.class public Lorg/zeromq/ZActor;
.super Lorg/zeromq/ZStar;
.source "ZActor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/zeromq/ZActor$Double;,
        Lorg/zeromq/ZActor$ActorFortune;,
        Lorg/zeromq/ZActor$Duo;,
        Lorg/zeromq/ZActor$SimpleActor;,
        Lorg/zeromq/ZActor$Actor;
    }
.end annotation


# direct methods
.method public varargs constructor <init>(Lorg/zeromq/ZActor$Actor;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 10
    .param p1, "actor"    # Lorg/zeromq/ZActor$Actor;
    .param p2, "motdelafin"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 434
    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/zeromq/ZActor;-><init>(Lorg/zeromq/ZContext;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZActor$Actor;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 435
    return-void
.end method

.method public varargs constructor <init>(Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZActor$Actor;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 11
    .param p1, "selector"    # Lorg/zeromq/ZAgent$SelectorCreator;
    .param p2, "actor"    # Lorg/zeromq/ZActor$Actor;
    .param p3, "motdelafin"    # Ljava/lang/String;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 449
    const/4 v1, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/zeromq/ZActor;-><init>(Lorg/zeromq/ZContext;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZActor$Actor;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 450
    return-void
.end method

.method public constructor <init>(Lorg/zeromq/ZContext;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZActor$Actor;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 12
    .param p1, "context"    # Lorg/zeromq/ZContext;
    .param p2, "selector"    # Lorg/zeromq/ZAgent$SelectorCreator;
    .param p3, "actor"    # Lorg/zeromq/ZActor$Actor;
    .param p4, "motdelafin"    # Ljava/lang/String;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 470
    new-instance v3, Lorg/zeromq/ZActor$ActorFortune;

    invoke-direct {v3, p3}, Lorg/zeromq/ZActor$ActorFortune;-><init>(Lorg/zeromq/ZActor$Actor;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lorg/zeromq/ZStar;-><init>(Lorg/zeromq/ZContext;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZStar$Fortune;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 471
    return-void
.end method
