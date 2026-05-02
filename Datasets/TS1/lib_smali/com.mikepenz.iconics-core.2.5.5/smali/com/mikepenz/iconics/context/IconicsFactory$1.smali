.class Lcom/mikepenz/iconics/context/IconicsFactory$1;
.super Ljava/lang/Object;
.source "IconicsFactory.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/iconics/context/IconicsFactory;->onViewCreatedInternal(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/iconics/context/IconicsFactory;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/mikepenz/iconics/context/IconicsFactory;Landroid/content/Context;)V
    .registers 3
    .param p1, "this$0"    # Lcom/mikepenz/iconics/context/IconicsFactory;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/mikepenz/iconics/context/IconicsFactory$1;->this$0:Lcom/mikepenz/iconics/context/IconicsFactory;

    iput-object p2, p0, Lcom/mikepenz/iconics/context/IconicsFactory$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 3
    .param p1, "editable"    # Landroid/text/Editable;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/mikepenz/iconics/context/IconicsFactory$1;->val$context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/mikepenz/iconics/Iconics;->styleEditable(Landroid/content/Context;Landroid/text/Editable;)V

    .line 76
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .prologue
    .line 66
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .prologue
    .line 71
    return-void
.end method
