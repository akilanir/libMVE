.class Lrx/android/operators/OperatorViewClick$CachedListeners;
.super Ljava/lang/Object;
.source "OperatorViewClick.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/android/operators/OperatorViewClick;
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
            "Landroid/view/View;",
            "Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 86
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lrx/android/operators/OperatorViewClick$CachedListeners;->sCachedListeners:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFromViewOrCreate(Landroid/view/View;)Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;
    .registers 4
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 89
    sget-object v2, Lrx/android/operators/OperatorViewClick$CachedListeners;->sCachedListeners:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;

    .line 91
    .local v0, "cached":Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;
    if-eqz v0, :cond_b

    .line 100
    .end local v0    # "cached":Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;
    :goto_a
    return-object v0

    .line 95
    .restart local v0    # "cached":Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;
    :cond_b
    new-instance v1, Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;-><init>(Lrx/android/operators/OperatorViewClick$1;)V

    .line 97
    .local v1, "listener":Lrx/android/operators/OperatorViewClick$CompositeOnClickListener;
    sget-object v2, Lrx/android/operators/OperatorViewClick$CachedListeners;->sCachedListeners:Ljava/util/Map;

    invoke-interface {v2, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    invoke-virtual {p0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move-object v0, v1

    .line 100
    goto :goto_a
.end method
