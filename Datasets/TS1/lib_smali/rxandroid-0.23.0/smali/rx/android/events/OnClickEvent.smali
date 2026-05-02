.class public Lrx/android/events/OnClickEvent;
.super Ljava/lang/Object;
.source "OnClickEvent.java"


# instance fields
.field public final view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lrx/android/events/OnClickEvent;->view:Landroid/view/View;

    .line 23
    return-void
.end method
