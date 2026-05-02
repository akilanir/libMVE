.class public Lrx/android/events/OnTextChangeEvent;
.super Ljava/lang/Object;
.source "OnTextChangeEvent.java"


# instance fields
.field public final text:Ljava/lang/CharSequence;

.field public final view:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .registers 4
    .param p1, "view"    # Landroid/widget/TextView;

    .prologue
    .line 24
    new-instance v0, Landroid/text/SpannableString;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    invoke-direct {p0, p1, v0}, Lrx/android/events/OnTextChangeEvent;-><init>(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "view"    # Landroid/widget/TextView;
    .param p2, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lrx/android/events/OnTextChangeEvent;->view:Landroid/widget/TextView;

    .line 29
    iput-object p2, p0, Lrx/android/events/OnTextChangeEvent;->text:Ljava/lang/CharSequence;

    .line 30
    return-void
.end method
