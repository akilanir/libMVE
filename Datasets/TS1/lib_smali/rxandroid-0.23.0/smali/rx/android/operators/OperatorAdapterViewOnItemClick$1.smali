.class Lrx/android/operators/OperatorAdapterViewOnItemClick$1;
.super Ljava/lang/Object;
.source "OperatorAdapterViewOnItemClick.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/android/operators/OperatorAdapterViewOnItemClick;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrx/android/operators/OperatorAdapterViewOnItemClick;

.field final synthetic val$observer:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/android/operators/OperatorAdapterViewOnItemClick;Lrx/Subscriber;)V
    .registers 3

    .prologue
    .line 46
    iput-object p1, p0, Lrx/android/operators/OperatorAdapterViewOnItemClick$1;->this$0:Lrx/android/operators/OperatorAdapterViewOnItemClick;

    iput-object p2, p0, Lrx/android/operators/OperatorAdapterViewOnItemClick$1;->val$observer:Lrx/Subscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
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
    .line 49
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v6, p0, Lrx/android/operators/OperatorAdapterViewOnItemClick$1;->val$observer:Lrx/Subscriber;

    new-instance v0, Lrx/android/events/OnItemClickEvent;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-direct/range {v0 .. v5}, Lrx/android/events/OnItemClickEvent;-><init>(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    invoke-virtual {v6, v0}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 50
    return-void
.end method
