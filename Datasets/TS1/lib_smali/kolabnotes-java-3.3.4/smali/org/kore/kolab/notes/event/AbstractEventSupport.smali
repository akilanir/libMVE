.class public Lorg/kore/kolab/notes/event/AbstractEventSupport;
.super Ljava/lang/Object;
.source "AbstractEventSupport.java"

# interfaces
.implements Lorg/kore/kolab/notes/event/EventSupport;


# instance fields
.field private final listener:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/kore/kolab/notes/event/EventListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/event/AbstractEventSupport;->listener:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public varargs addListener([Lorg/kore/kolab/notes/event/EventListener;)V
    .registers 4
    .param p1, "listener"    # [Lorg/kore/kolab/notes/event/EventListener;

    .prologue
    .line 34
    iget-object v0, p0, Lorg/kore/kolab/notes/event/AbstractEventSupport;->listener:Ljava/util/List;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 35
    return-void
.end method

.method public firePropertyChange(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 13
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "type"    # Lorg/kore/kolab/notes/event/EventListener$Type;
    .param p3, "propertyName"    # Ljava/lang/String;
    .param p4, "oldValue"    # Ljava/lang/Object;
    .param p5, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 39
    iget-object v1, p0, Lorg/kore/kolab/notes/event/AbstractEventSupport;->listener:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_6
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/event/EventListener;

    .local v0, "list":Lorg/kore/kolab/notes/event/EventListener;
    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 40
    invoke-interface/range {v0 .. v5}, Lorg/kore/kolab/notes/event/EventListener;->propertyChanged(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_6

    .line 42
    .end local v0    # "list":Lorg/kore/kolab/notes/event/EventListener;
    :cond_1b
    return-void
.end method

.method public getEventListener()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/kore/kolab/notes/event/EventListener;",
            ">;"
        }
    .end annotation

    .prologue
    .line 45
    iget-object v0, p0, Lorg/kore/kolab/notes/event/AbstractEventSupport;->listener:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
