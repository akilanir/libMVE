.class Lrx/android/operators/OperatorAdapterViewOnItemClick$CachedListeners;
.super Ljava/lang/Object;
.source "OperatorAdapterViewOnItemClick.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/android/operators/OperatorAdapterViewOnItemClick;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CachedListeners"
.end annotation


# static fields
.field private static final sCachedListeners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 84
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lrx/android/operators/OperatorAdapterViewOnItemClick$CachedListeners;->sCachedListeners:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFromViewOrCreate(Landroid/widget/AdapterView;)Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)",
            "Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;"
        }
    .end annotation

    .prologue
    .line 87
    .local p0, "view":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    sget-object v2, Lrx/android/operators/OperatorAdapterViewOnItemClick$CachedListeners;->sCachedListeners:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;

    .line 89
    .local v0, "cached":Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;
    if-eqz v0, :cond_b

    .line 98
    .end local v0    # "cached":Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;
    :goto_a
    return-object v0

    .line 93
    .restart local v0    # "cached":Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;
    :cond_b
    new-instance v1, Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;-><init>(Lrx/android/operators/OperatorAdapterViewOnItemClick$1;)V

    .line 95
    .local v1, "listener":Lrx/android/operators/OperatorAdapterViewOnItemClick$CompositeOnClickListener;
    sget-object v2, Lrx/android/operators/OperatorAdapterViewOnItemClick$CachedListeners;->sCachedListeners:Ljava/util/Map;

    invoke-interface {v2, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    invoke-virtual {p0, v1}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    move-object v0, v1

    .line 98
    goto :goto_a
.end method
