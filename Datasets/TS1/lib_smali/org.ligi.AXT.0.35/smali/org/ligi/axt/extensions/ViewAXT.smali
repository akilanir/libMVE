.class public Lorg/ligi/axt/extensions/ViewAXT;
.super Ljava/lang/Object;
.source "ViewAXT.java"


# instance fields
.field private final view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lorg/ligi/axt/extensions/ViewAXT;->view:Landroid/view/View;

    .line 18
    return-void
.end method

.method static synthetic access$000(Lorg/ligi/axt/extensions/ViewAXT;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lorg/ligi/axt/extensions/ViewAXT;

    .prologue
    .line 12
    iget-object v0, p0, Lorg/ligi/axt/extensions/ViewAXT;->view:Landroid/view/View;

    return-object v0
.end method


# virtual methods
.method public findById(I)Landroid/view/View;
    .registers 3
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .prologue
    .line 21
    iget-object v0, p0, Lorg/ligi/axt/extensions/ViewAXT;->view:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public hideKeyBoard()V
    .registers 4

    .prologue
    .line 25
    iget-object v1, p0, Lorg/ligi/axt/extensions/ViewAXT;->view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 26
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    if-eqz v0, :cond_1b

    .line 27
    iget-object v1, p0, Lorg/ligi/axt/extensions/ViewAXT;->view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 31
    :goto_1a
    return-void

    .line 29
    :cond_1b
    const-string v1, "ViewAXT"

    const-string v2, "could not hide Keyboard as INPUT_METHOD_SERVICE is not available"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1a
.end method

.method public onFirstGlobalLayout(Ljava/lang/Runnable;)V
    .registers 4
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 71
    iget-object v0, p0, Lorg/ligi/axt/extensions/ViewAXT;->view:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lorg/ligi/axt/extensions/ViewAXT$2;

    invoke-direct {v1, p0, p1}, Lorg/ligi/axt/extensions/ViewAXT$2;-><init>(Lorg/ligi/axt/extensions/ViewAXT;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 86
    return-void
.end method

.method public setVisibility(Z)V
    .registers 3
    .param p1, "visible"    # Z

    .prologue
    .line 46
    const/16 v0, 0x8

    invoke-virtual {p0, p1, v0}, Lorg/ligi/axt/extensions/ViewAXT;->setVisibility(ZI)V

    .line 47
    return-void
.end method

.method public setVisibility(ZI)V
    .registers 5
    .param p1, "visible"    # Z
    .param p2, "hiddenVisibility"    # I

    .prologue
    .line 53
    if-eqz p1, :cond_9

    .line 54
    iget-object v0, p0, Lorg/ligi/axt/extensions/ViewAXT;->view:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 58
    :goto_8
    return-void

    .line 56
    :cond_9
    iget-object v0, p0, Lorg/ligi/axt/extensions/ViewAXT;->view:Landroid/view/View;

    invoke-virtual {v0, p2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_8
.end method

.method public showKeyboard()V
    .registers 4

    .prologue
    .line 34
    iget-object v1, p0, Lorg/ligi/axt/extensions/ViewAXT;->view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 35
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    if-eqz v0, :cond_17

    .line 36
    iget-object v1, p0, Lorg/ligi/axt/extensions/ViewAXT;->view:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 40
    :goto_16
    return-void

    .line 38
    :cond_17
    const-string v1, "ViewAXT"

    const-string v2, "could not show Keyboard as INPUT_METHOD_SERVICE is not available"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_16
.end method

.method public startIntentOnClick(Landroid/content/Intent;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 61
    iget-object v0, p0, Lorg/ligi/axt/extensions/ViewAXT;->view:Landroid/view/View;

    new-instance v1, Lorg/ligi/axt/extensions/ViewAXT$1;

    invoke-direct {v1, p0, p1}, Lorg/ligi/axt/extensions/ViewAXT$1;-><init>(Lorg/ligi/axt/extensions/ViewAXT;Landroid/content/Intent;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    return-void
.end method
