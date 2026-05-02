.class public Lrx/android/functions/ViewActionSetClickable;
.super Lrx/android/functions/ViewAction1;
.source "ViewActionSetClickable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/android/functions/ViewAction1",
        "<",
        "Landroid/view/View;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lrx/android/functions/ViewAction1;-><init>(Landroid/view/View;)V

    .line 22
    return-void
.end method


# virtual methods
.method public call(Landroid/view/View;Ljava/lang/Boolean;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "aBoolean"    # Ljava/lang/Boolean;

    .prologue
    .line 26
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 27
    return-void
.end method

.method public bridge synthetic call(Landroid/view/View;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Landroid/view/View;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 18
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lrx/android/functions/ViewActionSetClickable;->call(Landroid/view/View;Ljava/lang/Boolean;)V

    return-void
.end method
