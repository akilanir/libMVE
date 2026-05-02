.class public Lcom/mikepenz/materialdrawer/util/KeyboardUtil;
.super Ljava/lang/Object;
.source "KeyboardUtil.java"


# instance fields
.field private contentView:Landroid/view/View;

.field private decorView:Landroid/view/View;

.field private initialDpDiff:F

.field onGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Landroid/view/View;)V
    .registers 5
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "contentView"    # Landroid/view/View;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->initialDpDiff:F

    .line 63
    new-instance v0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil$1;

    invoke-direct {v0, p0}, Lcom/mikepenz/materialdrawer/util/KeyboardUtil$1;-><init>(Lcom/mikepenz/materialdrawer/util/KeyboardUtil;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->onGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 40
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->decorView:Landroid/view/View;

    .line 41
    iput-object p2, p0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->contentView:Landroid/view/View;

    .line 44
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_2b

    .line 45
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->decorView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->onGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 47
    :cond_2b
    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/materialdrawer/util/KeyboardUtil;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->decorView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mikepenz/materialdrawer/util/KeyboardUtil;)F
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    .prologue
    .line 34
    iget v0, p0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->initialDpDiff:F

    return v0
.end method

.method static synthetic access$102(Lcom/mikepenz/materialdrawer/util/KeyboardUtil;F)F
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/util/KeyboardUtil;
    .param p1, "x1"    # F

    .prologue
    .line 34
    iput p1, p0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->initialDpDiff:F

    return p1
.end method

.method static synthetic access$200(Lcom/mikepenz/materialdrawer/util/KeyboardUtil;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/util/KeyboardUtil;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->contentView:Landroid/view/View;

    return-object v0
.end method

.method public static hideKeyboard(Landroid/app/Activity;)V
    .registers 4
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 102
    if-eqz p0, :cond_1c

    invoke-virtual {p0}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1c

    .line 103
    const-string v1, "input_method"

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 104
    .local v0, "inputMethodManager":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {p0}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 106
    .end local v0    # "inputMethodManager":Landroid/view/inputmethod/InputMethodManager;
    :cond_1c
    return-void
.end method


# virtual methods
.method public disable()V
    .registers 3

    .prologue
    .line 56
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_11

    .line 57
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->decorView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->onGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 59
    :cond_11
    return-void
.end method

.method public enable()V
    .registers 3

    .prologue
    .line 50
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_11

    .line 51
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->decorView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/util/KeyboardUtil;->onGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 53
    :cond_11
    return-void
.end method
