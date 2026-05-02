.class public final Lrx/android/functions/ViewActions;
.super Ljava/lang/Object;
.source "ViewActions.java"


# direct methods
.method private constructor <init>()V
    .registers 3

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No instances!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static setActivated(Landroid/view/View;)Lrx/functions/Action1;
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Lrx/functions/Action1",
            "<-",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    new-instance v0, Lrx/android/functions/ViewActionSetActivated;

    invoke-direct {v0, p0}, Lrx/android/functions/ViewActionSetActivated;-><init>(Landroid/view/View;)V

    return-object v0
.end method

.method public static setClickable(Landroid/view/View;)Lrx/functions/Action1;
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Lrx/functions/Action1",
            "<-",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    new-instance v0, Lrx/android/functions/ViewActionSetClickable;

    invoke-direct {v0, p0}, Lrx/android/functions/ViewActionSetClickable;-><init>(Landroid/view/View;)V

    return-object v0
.end method

.method public static setEnabled(Landroid/view/View;)Lrx/functions/Action1;
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Lrx/functions/Action1",
            "<-",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 38
    new-instance v0, Lrx/android/functions/ViewActionSetEnabled;

    invoke-direct {v0, p0}, Lrx/android/functions/ViewActionSetEnabled;-><init>(Landroid/view/View;)V

    return-object v0
.end method

.method public static setFocusable(Landroid/view/View;)Lrx/functions/Action1;
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Lrx/functions/Action1",
            "<-",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 74
    new-instance v0, Lrx/android/functions/ViewActionSetFocusable;

    invoke-direct {v0, p0}, Lrx/android/functions/ViewActionSetFocusable;-><init>(Landroid/view/View;)V

    return-object v0
.end method

.method public static setSelected(Landroid/view/View;)Lrx/functions/Action1;
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Lrx/functions/Action1",
            "<-",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 86
    new-instance v0, Lrx/android/functions/ViewActionSetSelected;

    invoke-direct {v0, p0}, Lrx/android/functions/ViewActionSetSelected;-><init>(Landroid/view/View;)V

    return-object v0
.end method

.method public static setVisibility(Landroid/view/View;)Lrx/functions/Action1;
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Lrx/functions/Action1",
            "<-",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 98
    new-instance v0, Lrx/android/functions/ViewActionSetVisibility;

    invoke-direct {v0, p0}, Lrx/android/functions/ViewActionSetVisibility;-><init>(Landroid/view/View;)V

    return-object v0
.end method

.method public static setVisibility(Landroid/view/View;I)Lrx/functions/Action1;
    .registers 3
    .param p0, "view"    # Landroid/view/View;
    .param p1, "visibilityOnFalse"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "I)",
            "Lrx/functions/Action1",
            "<-",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 113
    new-instance v0, Lrx/android/functions/ViewActionSetVisibility;

    invoke-direct {v0, p0, p1}, Lrx/android/functions/ViewActionSetVisibility;-><init>(Landroid/view/View;I)V

    return-object v0
.end method
