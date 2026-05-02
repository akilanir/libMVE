.class public Lcom/mikepenz/iconics/view/IconicsTextView;
.super Landroid/widget/TextView;
.source "IconicsTextView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    return-void
.end method


# virtual methods
.method public setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .registers 5
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "type"    # Landroid/widget/TextView$BufferType;

    .prologue
    .line 41
    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsTextView;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_1f

    .line 42
    new-instance v0, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;

    invoke-direct {v0}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mikepenz/iconics/view/IconicsTextView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->ctx(Landroid/content/Context;)Lcom/mikepenz/iconics/Iconics$IconicsBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mikepenz/iconics/Iconics$IconicsBuilder;->on(Ljava/lang/CharSequence;)Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/iconics/Iconics$IconicsBuilderString;->build()Landroid/text/Spanned;

    move-result-object v0

    invoke-super {p0, v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 46
    :goto_1e
    return-void

    .line 44
    :cond_1f
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    goto :goto_1e
.end method
