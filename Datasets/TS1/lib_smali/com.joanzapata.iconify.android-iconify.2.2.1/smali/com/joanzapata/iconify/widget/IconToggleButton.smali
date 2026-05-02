.class public Lcom/joanzapata/iconify/widget/IconToggleButton;
.super Landroid/widget/ToggleButton;
.source "IconToggleButton.java"

# interfaces
.implements Lcom/joanzapata/iconify/internal/HasOnViewAttachListener;


# instance fields
.field private delegate:Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Landroid/widget/ToggleButton;-><init>(Landroid/content/Context;)V

    .line 25
    invoke-direct {p0}, Lcom/joanzapata/iconify/widget/IconToggleButton;->init()V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 19
    invoke-direct {p0, p1, p2}, Landroid/widget/ToggleButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    invoke-direct {p0}, Lcom/joanzapata/iconify/widget/IconToggleButton;->init()V

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ToggleButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    invoke-direct {p0}, Lcom/joanzapata/iconify/widget/IconToggleButton;->init()V

    .line 16
    return-void
.end method

.method private init()V
    .registers 2

    .prologue
    .line 29
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/joanzapata/iconify/widget/IconToggleButton;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 30
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 45
    invoke-super {p0}, Landroid/widget/ToggleButton;->onAttachedToWindow()V

    .line 46
    iget-object v0, p0, Lcom/joanzapata/iconify/widget/IconToggleButton;->delegate:Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;

    invoke-virtual {v0}, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;->onAttachedToWindow()V

    .line 47
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 51
    invoke-super {p0}, Landroid/widget/ToggleButton;->onDetachedFromWindow()V

    .line 52
    iget-object v0, p0, Lcom/joanzapata/iconify/widget/IconToggleButton;->delegate:Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;

    invoke-virtual {v0}, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;->onDetachedFromWindow()V

    .line 53
    return-void
.end method

.method public setOnViewAttachListener(Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/joanzapata/iconify/widget/IconToggleButton;->delegate:Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;

    if-nez v0, :cond_b

    new-instance v0, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;

    invoke-direct {v0, p0}, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;-><init>(Landroid/widget/TextView;)V

    iput-object v0, p0, Lcom/joanzapata/iconify/widget/IconToggleButton;->delegate:Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;

    .line 40
    :cond_b
    iget-object v0, p0, Lcom/joanzapata/iconify/widget/IconToggleButton;->delegate:Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;

    invoke-virtual {v0, p1}, Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$HasOnViewAttachListenerDelegate;->setOnViewAttachListener(Lcom/joanzapata/iconify/internal/HasOnViewAttachListener$OnViewAttachListener;)V

    .line 41
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .registers 5
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "type"    # Landroid/widget/TextView$BufferType;

    .prologue
    .line 34
    invoke-virtual {p0}, Lcom/joanzapata/iconify/widget/IconToggleButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1, p0}, Lcom/joanzapata/iconify/Iconify;->compute(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/widget/TextView;)Ljava/lang/CharSequence;

    move-result-object v0

    sget-object v1, Landroid/widget/TextView$BufferType;->NORMAL:Landroid/widget/TextView$BufferType;

    invoke-super {p0, v0, v1}, Landroid/widget/ToggleButton;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 35
    return-void
.end method
