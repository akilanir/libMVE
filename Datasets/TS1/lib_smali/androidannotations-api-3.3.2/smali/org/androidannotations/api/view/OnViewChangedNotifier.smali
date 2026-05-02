.class public Lorg/androidannotations/api/view/OnViewChangedNotifier;
.super Ljava/lang/Object;
.source "OnViewChangedNotifier.java"


# static fields
.field private static currentNotifier:Lorg/androidannotations/api/view/OnViewChangedNotifier;


# instance fields
.field private final listeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/androidannotations/api/view/OnViewChangedListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lorg/androidannotations/api/view/OnViewChangedNotifier;->listeners:Ljava/util/Set;

    return-void
.end method

.method public static registerOnViewChangedListener(Lorg/androidannotations/api/view/OnViewChangedListener;)V
    .registers 2
    .param p0, "listener"    # Lorg/androidannotations/api/view/OnViewChangedListener;

    .prologue
    .line 32
    sget-object v0, Lorg/androidannotations/api/view/OnViewChangedNotifier;->currentNotifier:Lorg/androidannotations/api/view/OnViewChangedNotifier;

    if-eqz v0, :cond_b

    .line 33
    sget-object v0, Lorg/androidannotations/api/view/OnViewChangedNotifier;->currentNotifier:Lorg/androidannotations/api/view/OnViewChangedNotifier;

    iget-object v0, v0, Lorg/androidannotations/api/view/OnViewChangedNotifier;->listeners:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 35
    :cond_b
    return-void
.end method

.method public static replaceNotifier(Lorg/androidannotations/api/view/OnViewChangedNotifier;)Lorg/androidannotations/api/view/OnViewChangedNotifier;
    .registers 2
    .param p0, "notifier"    # Lorg/androidannotations/api/view/OnViewChangedNotifier;

    .prologue
    .line 26
    sget-object v0, Lorg/androidannotations/api/view/OnViewChangedNotifier;->currentNotifier:Lorg/androidannotations/api/view/OnViewChangedNotifier;

    .line 27
    .local v0, "previousNotifier":Lorg/androidannotations/api/view/OnViewChangedNotifier;
    sput-object p0, Lorg/androidannotations/api/view/OnViewChangedNotifier;->currentNotifier:Lorg/androidannotations/api/view/OnViewChangedNotifier;

    .line 28
    return-object v0
.end method


# virtual methods
.method public notifyViewChanged(Lorg/androidannotations/api/view/HasViews;)V
    .registers 5
    .param p1, "hasViews"    # Lorg/androidannotations/api/view/HasViews;

    .prologue
    .line 40
    iget-object v1, p0, Lorg/androidannotations/api/view/OnViewChangedNotifier;->listeners:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/androidannotations/api/view/OnViewChangedListener;

    .line 41
    .local v0, "listener":Lorg/androidannotations/api/view/OnViewChangedListener;
    invoke-interface {v0, p1}, Lorg/androidannotations/api/view/OnViewChangedListener;->onViewChanged(Lorg/androidannotations/api/view/HasViews;)V

    goto :goto_6

    .line 43
    .end local v0    # "listener":Lorg/androidannotations/api/view/OnViewChangedListener;
    :cond_16
    return-void
.end method
