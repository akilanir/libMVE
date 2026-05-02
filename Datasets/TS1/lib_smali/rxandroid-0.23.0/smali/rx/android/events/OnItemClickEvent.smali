.class public Lrx/android/events/OnItemClickEvent;
.super Ljava/lang/Object;
.source "OnItemClickEvent.java"


# instance fields
.field public final id:J

.field public final parent:Landroid/widget/AdapterView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/AdapterView",
            "<*>;"
        }
    .end annotation
.end field

.field public final position:I

.field public final view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6
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
    .line 26
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lrx/android/events/OnItemClickEvent;->parent:Landroid/widget/AdapterView;

    .line 28
    iput-object p2, p0, Lrx/android/events/OnItemClickEvent;->view:Landroid/view/View;

    .line 29
    iput p3, p0, Lrx/android/events/OnItemClickEvent;->position:I

    .line 30
    iput-wide p4, p0, Lrx/android/events/OnItemClickEvent;->id:J

    .line 31
    return-void
.end method
