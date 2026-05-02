.class Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;
.super Ljava/lang/Object;
.source "OperatorAdapterViewOnItemClick.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/android/operators/OperatorAdapterViewOnItemClick;
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
            "Landroid/widget/AdapterView$OnItemClickListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;->listeners:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lrx/android/operators/OperatorAdapterViewOnItemClick$1;)V
    .registers 2
    .param p1, "x0"    # Lrx/android/operators/OperatorAdapterViewOnItemClick$1;

    .prologue
    .line 64
    invoke-direct {p0}, Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public addOnClickListener(Landroid/widget/AdapterView$OnItemClickListener;)Z
    .registers 3
    .param p1, "listener"    # Landroid/widget/AdapterView$OnItemClickListener;

    .prologue
    .line 68
    iget-object v0, p0, Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 13
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 77
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;->listeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/AdapterView$OnItemClickListener;

    .local v0, "listener":Landroid/widget/AdapterView$OnItemClickListener;
    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    .line 78
    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    goto :goto_6

    .line 80
    .end local v0    # "listener":Landroid/widget/AdapterView$OnItemClickListener;
    :cond_1a
    return-void
.end method

.method public removeOnClickListener(Landroid/widget/AdapterView$OnItemClickListener;)Z
    .registers 3
    .param p1, "listener"    # Landroid/widget/AdapterView$OnItemClickListener;

    .prologue
    .line 72
    iget-object v0, p0, Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
