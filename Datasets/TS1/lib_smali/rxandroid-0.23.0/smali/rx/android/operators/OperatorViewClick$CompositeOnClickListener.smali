.class Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;
.super Ljava/lang/Object;
.source "OperatorViewClick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/android/operators/OperatorViewClick;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CompositeOnClickListener"
.end annotation


# instance fields
.field private final listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/View$OnClickListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;->listeners:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lrx/android/operators/OperatorViewClick$1;)V
    .registers 2
    .param p1, "x0"    # Lrx/android/operators/OperatorViewClick$1;

    .prologue
    .line 66
    invoke-direct {p0}, Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public addOnClickListener(Landroid/view/View$OnClickListener;)Z
    .registers 3
    .param p1, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 70
    iget-object v0, p0, Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 79
    iget-object v2, p0, Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View$OnClickListener;

    .line 80
    .local v1, "listener":Landroid/view/View$OnClickListener;
    invoke-interface {v1, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    goto :goto_6

    .line 82
    .end local v1    # "listener":Landroid/view/View$OnClickListener;
    :cond_16
    return-void
.end method

.method public removeOnClickListener(Landroid/view/View$OnClickListener;)Z
    .registers 3
    .param p1, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 74
    iget-object v0, p0, Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
