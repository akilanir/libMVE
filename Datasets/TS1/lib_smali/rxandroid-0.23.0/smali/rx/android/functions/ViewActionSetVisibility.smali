.class public Lrx/android/functions/ViewActionSetVisibility;
.super Lrx/android/functions/ViewAction1;
.source "ViewActionSetVisibility.java"


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


# instance fields
.field private final visibilityOnFalse:I


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 23
    const/16 v0, 0x8

    invoke-direct {p0, p1, v0}, Lrx/android/functions/ViewActionSetVisibility;-><init>(Landroid/view/View;I)V

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/view/View;I)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "visibilityOnFalse"    # I

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lrx/android/functions/ViewAction1;-><init>(Landroid/view/View;)V

    .line 28
    const/16 v0, 0x8

    if-eq p2, v0, :cond_25

    const/4 v0, 0x4

    if-eq p2, v0, :cond_25

    if-eqz p2, :cond_25

    .line 31
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not a valid visibility value. See android.view.View VISIBLE, GONE, and INVISIBLE"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 34
    :cond_25
    iput p2, p0, Lrx/android/functions/ViewActionSetVisibility;->visibilityOnFalse:I

    .line 35
    return-void
.end method


# virtual methods
.method public call(Landroid/view/View;Ljava/lang/Boolean;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "aBoolean"    # Ljava/lang/Boolean;

    .prologue
    .line 39
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_b

    const/4 v0, 0x0

    .line 40
    .local v0, "visibility":I
    :goto_7
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 41
    return-void

    .line 39
    .end local v0    # "visibility":I
    :cond_b
    iget v0, p0, Lrx/android/functions/ViewActionSetVisibility;->visibilityOnFalse:I

    goto :goto_7
.end method

.method public bridge synthetic call(Landroid/view/View;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Landroid/view/View;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 18
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lrx/android/functions/ViewActionSetVisibility;->call(Landroid/view/View;Ljava/lang/Boolean;)V

    return-void
.end method
